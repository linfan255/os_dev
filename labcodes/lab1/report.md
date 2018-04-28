# lab1 实验报告
## 习题1
* [问题1：操作系统镜像文件ucore.img是如何一步一步生成的？]

生成步骤及其繁琐。不想一一列出，一来感觉没必要，二来其实只需知道怎么去查看生成的过程即可，所以在这里给出解决的方法。
首先命令make V=会详细列出实际执行的Makefile中的命令。将其重定向到一个文件中，然后查找ucore.img。即可知道是如何生成ucore。
在里面可以看到根据kernel和bootblock来生成ucore.img。然后用相同的方式查看kernel和bootblock是如何生成的。。。如此一步一步递归查找下去即可。

* [问题2：一个被系统认为符合规范的硬盘主引导扇区的特征是什么？]

有如下三种特征

  1. 大小为512字节
  2. 倒数第一个字节是0xaa
  3. 倒数第二个字节是0x55

## 习题2
* [为了熟悉qemu个gdb进行工作，进行如下的练习]

  1. 从CPU加电后执行的第一条指令开始，单步跟踪BIOS的执行。
  2. 在初始化位置0x7c00设置实地址断点,测试断点正常。
  3. 在初始化位置0x7c00设置实地址断点,测试断点正常。
  4. 自己找一个bootloader或内核中的代码位置，设置断点并进行测试。
	
	此题较为简单，根据gdbinit里面的内容，make debug即可。

## 习题3
* [分析bootloader进入保护模式的过程，需要了解如下：]
  1. 为何开启A20,以及如何开启A20
  2. 如何初始化GDT表
  3. 如何使能进入保护模式
  
### 为何开启A20,以及如何开启A20
  
  A20的存在实际上是历史遗留问题，在最开始的时候（8086/8088）中只有20根地址线，因此只能寻址2^20即1M的大小。但是在8086/8088中的寄存器只有16位，如何让16位的寄存器寻址1M的空间？解决方法是使用“基地址：地址偏移量”的形式来表示，即让一个寄存器左移4位，加上另外一个表示地址偏移量的寄存器，以此来表示地址，这样可以表示的最大地址就是“0x0ffff0 : 0xffff”，即0x0ffff0 + 0xffff = 0x10ffef。但显然这个值已经大于1MB了，而整个空间最多也只有1MB，为了使得在访问地址大于1MB时不产生地址越界的异常，规定超过1MB的地址从0开始重新寻址（回卷）。
  
  随着技术发展，到了80286时代，地址线发展成为24根。可访问的地址空间为2^24，远远多于0x10ffef。但是为了向下兼容，依旧规定在实模式下访问超过1MB的内容要回卷。但是在80286中0x10ffef这个地址显然是不越界的。为了解决这种兼容性问题，专门用键盘控制器多余的一根地址线来控制第21个bit（从0开始数是第20个），这就是A20。当A20禁止时，第21个bit被禁用，此时访问0x100000到0x10ffef会回卷。当A20开启时，就可以实际访问0x100000到0x10ffef这块地址了。
  
  以上的全都是针对实模式下，当进入保护模式后，A20的开启与否依旧有影响。A20开启的时候，第20位bit可以为1也可以是0。当A20禁止时，只能为0,这意味这在80286下，永远只能访问奇数兆的内存。所以进入保护模式后，A20依旧要开启。
  
  理论上讲，我们只要操作8042芯片的输出端口（64h）的bit 1，就可以控制A20 Gate，但实际上，当你准备向8042的输入缓冲区里写数据时，可能里面还有其它数据没有处理，所以，我们要首先禁止键盘操作，同时等待数据缓冲区中没有数据以后，才能真正地去操作8042打开或者关闭A20 Gate。操作步骤如下
  
  1. 等待8042 Input buffer为空；
  2. 发送Write 8042 Output Port （P2）命令到8042 Input buffer；
  3. 等待8042 Input buffer为空；
  4. 将8042 Output Port（P2）得到字节的第2位置1，然后写入8042 Input buffer；
  
  相关的代码如下
  
```
seta20.1:
    inb $0x64, %al                                  # Wait for not busy(8042 input buffer empty).
    testb $0x2, %al
    jnz seta20.1

    movb $0xd1, %al                                 # 0xd1 -> port 0x64
    outb %al, $0x64                                 # 0xd1 means: write data to 8042's P2 port

seta20.2:
    inb $0x64, %al                                  # Wait for not busy(8042 input buffer empty).
    testb $0x2, %al
    jnz seta20.2

    movb $0xdf, %al                                 # 0xdf -> port 0x60
    outb %al, $0x60                                 # 0xdf = 11011111, means set P2's A20 bit(the 1 bit) to 1
```
  
### 如何初始化GDT表
  gdt表的地址保存在寄存器gdtr当中，可以利用lgdt来加载gdt表的地址到寄存器当中。即可完成了GDT的初始化

  ```
  lgdt gdtdesc
  ```

### 如何使能进入保护模式
  cr0寄存器当中的pe位是控制是否进入保护模式，将该位使能即可。
  
  ```
  movl %cr0, %eax
  orl $CR0_PE_ON, %eax
  movl %eax, %cr0
  ```
  
  然后设置一些段寄存器
  
  ```
  movw $PROT_MODE_DSEG, %ax                       # Our data segment selector
  movw %ax, %ds                                   # -> DS: Data Segment
  movw %ax, %es                                   # -> ES: Extra Segment
  movw %ax, %fs                                   # -> FS
  movw %ax, %gs                                   # -> GS
  movw %ax, %ss                                   # -> SS: Stack Segment
  ```
  
  最后设置ebp esp堆栈寄存器，进入bootmain
  
  ```
  movl $0x0, %ebp
  movl $start, %esp
  ```
  
## 练习4：分析bootloader加载ELF格式的OS的过程。

通过阅读bootmain.c，了解bootloader如何加载ELF文件。通过分析源代码和通过qemu来运行并调试bootloader&OS

### bootloader如何读取硬盘扇区的？
  一般来讲，读取硬盘扇区主要分为以下几个步骤：
  
  1. 等待磁盘准备就绪，相关代码：
  
  ```
  /* waitdisk - wait for disk ready */
  static void
  waitdisk(void) {
      while ((inb(0x1F7) & 0xC0) != 0x40)
          /* do nothing */;
  }
  ```
  其中0x1f7端口是状态和命令寄存器，如果不是忙状态就从0x1f0读数据
  
  2. 发出读取硬盘扇区的命令
  
  ```
  outb(0x1F2, 1);                         // count = 1
  outb(0x1F3, secno & 0xFF);
  outb(0x1F4, (secno >> 8) & 0xFF);
  outb(0x1F5, (secno >> 16) & 0xFF);
  outb(0x1F6, ((secno >> 24) & 0xF) | 0xE0);
  outb(0x1F7, 0x20);                      // cmd 0x20 - read sectors
  ```
  
  其中0x1f2到0x1f6都是设置要读多少个扇区，最后向0x1f7端口发送0x20，表明进行读操作。
  
  3. 等待磁盘准备就绪，同1.
  
  4. 把磁盘数据读到指定的内存
  
  ```
  insl(0x1F0, dst, SECTSIZE / 4);
  
  static inline void
  insl(uint32_t port, void *addr, int cnt) {
      asm volatile (
              "cld;"
              "repne; insl;"
              : "=D" (addr), "=c" (cnt)
              : "d" (port), "0" (addr), "1" (cnt)
              : "memory", "cc");
  }
  ```
  
  注意到第三个参数不是长度，而是读取的次数。insl一次读入四个字节，所以要除以4。
  
### bootloader是如何加载ELF格式的OS？
  
  可以分为以下几个步骤：
  
  - 首先从磁盘上将elf header读到地址0x10000处。
  - 找出第一段program header的地址。
  - 遍历每个program header，从program header中解析出p_va / p_memsz / p_offset。
  - 将从p_offset开始的p_memsz个字节读到p_va处。
  
## 练习5：实现函数调用堆栈跟踪函数 

  见kern/debug/kdebug.c

