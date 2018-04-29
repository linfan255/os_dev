
bin/kernel：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 20 fd 10 00       	mov    $0x10fd20,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 ea 10 00 	movl   $0x10ea16,(%esp)
  100027:	e8 49 32 00 00       	call   103275 <memset>

    cons_init();                // init the console
  10002c:	e8 3f 15 00 00       	call   101570 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 00 34 10 00 	movl   $0x103400,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 1c 34 10 00 	movl   $0x10341c,(%esp)
  100046:	e8 c7 02 00 00       	call   100312 <cprintf>

    print_kerninfo();
  10004b:	e8 f6 07 00 00       	call   100846 <print_kerninfo>

    grade_backtrace();
  100050:	e8 86 00 00 00       	call   1000db <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 61 28 00 00       	call   1028bb <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 54 16 00 00       	call   1016b3 <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 a6 17 00 00       	call   10180a <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 fa 0c 00 00       	call   100d63 <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 b3 15 00 00       	call   101621 <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  10006e:	eb fe                	jmp    10006e <kern_init+0x6e>

00100070 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100070:	55                   	push   %ebp
  100071:	89 e5                	mov    %esp,%ebp
  100073:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  100076:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  10007d:	00 
  10007e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100085:	00 
  100086:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10008d:	e8 03 0c 00 00       	call   100c95 <mon_backtrace>
}
  100092:	c9                   	leave  
  100093:	c3                   	ret    

00100094 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100094:	55                   	push   %ebp
  100095:	89 e5                	mov    %esp,%ebp
  100097:	53                   	push   %ebx
  100098:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  10009b:	8d 5d 0c             	lea    0xc(%ebp),%ebx
  10009e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1000a1:	8d 55 08             	lea    0x8(%ebp),%edx
  1000a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1000a7:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  1000ab:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  1000af:	89 54 24 04          	mov    %edx,0x4(%esp)
  1000b3:	89 04 24             	mov    %eax,(%esp)
  1000b6:	e8 b5 ff ff ff       	call   100070 <grade_backtrace2>
}
  1000bb:	83 c4 14             	add    $0x14,%esp
  1000be:	5b                   	pop    %ebx
  1000bf:	5d                   	pop    %ebp
  1000c0:	c3                   	ret    

001000c1 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c1:	55                   	push   %ebp
  1000c2:	89 e5                	mov    %esp,%ebp
  1000c4:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000c7:	8b 45 10             	mov    0x10(%ebp),%eax
  1000ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d1:	89 04 24             	mov    %eax,(%esp)
  1000d4:	e8 bb ff ff ff       	call   100094 <grade_backtrace1>
}
  1000d9:	c9                   	leave  
  1000da:	c3                   	ret    

001000db <grade_backtrace>:

void
grade_backtrace(void) {
  1000db:	55                   	push   %ebp
  1000dc:	89 e5                	mov    %esp,%ebp
  1000de:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e1:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000e6:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000ed:	ff 
  1000ee:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000f2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1000f9:	e8 c3 ff ff ff       	call   1000c1 <grade_backtrace0>
}
  1000fe:	c9                   	leave  
  1000ff:	c3                   	ret    

00100100 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100100:	55                   	push   %ebp
  100101:	89 e5                	mov    %esp,%ebp
  100103:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  100106:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100109:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  10010c:	8c 45 f2             	mov    %es,-0xe(%ebp)
  10010f:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100112:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100116:	0f b7 c0             	movzwl %ax,%eax
  100119:	83 e0 03             	and    $0x3,%eax
  10011c:	89 c2                	mov    %eax,%edx
  10011e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100123:	89 54 24 08          	mov    %edx,0x8(%esp)
  100127:	89 44 24 04          	mov    %eax,0x4(%esp)
  10012b:	c7 04 24 21 34 10 00 	movl   $0x103421,(%esp)
  100132:	e8 db 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  100137:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10013b:	0f b7 d0             	movzwl %ax,%edx
  10013e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100143:	89 54 24 08          	mov    %edx,0x8(%esp)
  100147:	89 44 24 04          	mov    %eax,0x4(%esp)
  10014b:	c7 04 24 2f 34 10 00 	movl   $0x10342f,(%esp)
  100152:	e8 bb 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  100157:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10015b:	0f b7 d0             	movzwl %ax,%edx
  10015e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100163:	89 54 24 08          	mov    %edx,0x8(%esp)
  100167:	89 44 24 04          	mov    %eax,0x4(%esp)
  10016b:	c7 04 24 3d 34 10 00 	movl   $0x10343d,(%esp)
  100172:	e8 9b 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  100177:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10017b:	0f b7 d0             	movzwl %ax,%edx
  10017e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100183:	89 54 24 08          	mov    %edx,0x8(%esp)
  100187:	89 44 24 04          	mov    %eax,0x4(%esp)
  10018b:	c7 04 24 4b 34 10 00 	movl   $0x10344b,(%esp)
  100192:	e8 7b 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  100197:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  10019b:	0f b7 d0             	movzwl %ax,%edx
  10019e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001a3:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001a7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001ab:	c7 04 24 59 34 10 00 	movl   $0x103459,(%esp)
  1001b2:	e8 5b 01 00 00       	call   100312 <cprintf>
    round ++;
  1001b7:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001bc:	83 c0 01             	add    $0x1,%eax
  1001bf:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001c4:	c9                   	leave  
  1001c5:	c3                   	ret    

001001c6 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001c6:	55                   	push   %ebp
  1001c7:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001c9:	5d                   	pop    %ebp
  1001ca:	c3                   	ret    

001001cb <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001cb:	55                   	push   %ebp
  1001cc:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001ce:	5d                   	pop    %ebp
  1001cf:	c3                   	ret    

001001d0 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001d0:	55                   	push   %ebp
  1001d1:	89 e5                	mov    %esp,%ebp
  1001d3:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001d6:	e8 25 ff ff ff       	call   100100 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001db:	c7 04 24 68 34 10 00 	movl   $0x103468,(%esp)
  1001e2:	e8 2b 01 00 00       	call   100312 <cprintf>
    lab1_switch_to_user();
  1001e7:	e8 da ff ff ff       	call   1001c6 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001ec:	e8 0f ff ff ff       	call   100100 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001f1:	c7 04 24 88 34 10 00 	movl   $0x103488,(%esp)
  1001f8:	e8 15 01 00 00       	call   100312 <cprintf>
    lab1_switch_to_kernel();
  1001fd:	e8 c9 ff ff ff       	call   1001cb <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100202:	e8 f9 fe ff ff       	call   100100 <lab1_print_cur_status>
}
  100207:	c9                   	leave  
  100208:	c3                   	ret    

00100209 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100209:	55                   	push   %ebp
  10020a:	89 e5                	mov    %esp,%ebp
  10020c:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  10020f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100213:	74 13                	je     100228 <readline+0x1f>
        cprintf("%s", prompt);
  100215:	8b 45 08             	mov    0x8(%ebp),%eax
  100218:	89 44 24 04          	mov    %eax,0x4(%esp)
  10021c:	c7 04 24 a7 34 10 00 	movl   $0x1034a7,(%esp)
  100223:	e8 ea 00 00 00       	call   100312 <cprintf>
    }
    int i = 0, c;
  100228:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  10022f:	e8 66 01 00 00       	call   10039a <getchar>
  100234:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100237:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10023b:	79 07                	jns    100244 <readline+0x3b>
            return NULL;
  10023d:	b8 00 00 00 00       	mov    $0x0,%eax
  100242:	eb 79                	jmp    1002bd <readline+0xb4>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100244:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100248:	7e 28                	jle    100272 <readline+0x69>
  10024a:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100251:	7f 1f                	jg     100272 <readline+0x69>
            cputchar(c);
  100253:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100256:	89 04 24             	mov    %eax,(%esp)
  100259:	e8 da 00 00 00       	call   100338 <cputchar>
            buf[i ++] = c;
  10025e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100261:	8d 50 01             	lea    0x1(%eax),%edx
  100264:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100267:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10026a:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  100270:	eb 46                	jmp    1002b8 <readline+0xaf>
        }
        else if (c == '\b' && i > 0) {
  100272:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  100276:	75 17                	jne    10028f <readline+0x86>
  100278:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10027c:	7e 11                	jle    10028f <readline+0x86>
            cputchar(c);
  10027e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100281:	89 04 24             	mov    %eax,(%esp)
  100284:	e8 af 00 00 00       	call   100338 <cputchar>
            i --;
  100289:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  10028d:	eb 29                	jmp    1002b8 <readline+0xaf>
        }
        else if (c == '\n' || c == '\r') {
  10028f:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100293:	74 06                	je     10029b <readline+0x92>
  100295:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  100299:	75 1d                	jne    1002b8 <readline+0xaf>
            cputchar(c);
  10029b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10029e:	89 04 24             	mov    %eax,(%esp)
  1002a1:	e8 92 00 00 00       	call   100338 <cputchar>
            buf[i] = '\0';
  1002a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1002a9:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1002ae:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1002b1:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1002b6:	eb 05                	jmp    1002bd <readline+0xb4>
        }
    }
  1002b8:	e9 72 ff ff ff       	jmp    10022f <readline+0x26>
}
  1002bd:	c9                   	leave  
  1002be:	c3                   	ret    

001002bf <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002bf:	55                   	push   %ebp
  1002c0:	89 e5                	mov    %esp,%ebp
  1002c2:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1002c8:	89 04 24             	mov    %eax,(%esp)
  1002cb:	e8 cc 12 00 00       	call   10159c <cons_putc>
    (*cnt) ++;
  1002d0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002d3:	8b 00                	mov    (%eax),%eax
  1002d5:	8d 50 01             	lea    0x1(%eax),%edx
  1002d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002db:	89 10                	mov    %edx,(%eax)
}
  1002dd:	c9                   	leave  
  1002de:	c3                   	ret    

001002df <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002df:	55                   	push   %ebp
  1002e0:	89 e5                	mov    %esp,%ebp
  1002e2:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  1002ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002ef:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1002f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1002f6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1002fa:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1002fd:	89 44 24 04          	mov    %eax,0x4(%esp)
  100301:	c7 04 24 bf 02 10 00 	movl   $0x1002bf,(%esp)
  100308:	e8 81 27 00 00       	call   102a8e <vprintfmt>
    return cnt;
  10030d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100310:	c9                   	leave  
  100311:	c3                   	ret    

00100312 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100312:	55                   	push   %ebp
  100313:	89 e5                	mov    %esp,%ebp
  100315:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100318:	8d 45 0c             	lea    0xc(%ebp),%eax
  10031b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  10031e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100321:	89 44 24 04          	mov    %eax,0x4(%esp)
  100325:	8b 45 08             	mov    0x8(%ebp),%eax
  100328:	89 04 24             	mov    %eax,(%esp)
  10032b:	e8 af ff ff ff       	call   1002df <vcprintf>
  100330:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  100333:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100336:	c9                   	leave  
  100337:	c3                   	ret    

00100338 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100338:	55                   	push   %ebp
  100339:	89 e5                	mov    %esp,%ebp
  10033b:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  10033e:	8b 45 08             	mov    0x8(%ebp),%eax
  100341:	89 04 24             	mov    %eax,(%esp)
  100344:	e8 53 12 00 00       	call   10159c <cons_putc>
}
  100349:	c9                   	leave  
  10034a:	c3                   	ret    

0010034b <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  10034b:	55                   	push   %ebp
  10034c:	89 e5                	mov    %esp,%ebp
  10034e:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100351:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  100358:	eb 13                	jmp    10036d <cputs+0x22>
        cputch(c, &cnt);
  10035a:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  10035e:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100361:	89 54 24 04          	mov    %edx,0x4(%esp)
  100365:	89 04 24             	mov    %eax,(%esp)
  100368:	e8 52 ff ff ff       	call   1002bf <cputch>
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  10036d:	8b 45 08             	mov    0x8(%ebp),%eax
  100370:	8d 50 01             	lea    0x1(%eax),%edx
  100373:	89 55 08             	mov    %edx,0x8(%ebp)
  100376:	0f b6 00             	movzbl (%eax),%eax
  100379:	88 45 f7             	mov    %al,-0x9(%ebp)
  10037c:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  100380:	75 d8                	jne    10035a <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  100382:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100385:	89 44 24 04          	mov    %eax,0x4(%esp)
  100389:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  100390:	e8 2a ff ff ff       	call   1002bf <cputch>
    return cnt;
  100395:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  100398:	c9                   	leave  
  100399:	c3                   	ret    

0010039a <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  10039a:	55                   	push   %ebp
  10039b:	89 e5                	mov    %esp,%ebp
  10039d:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1003a0:	e8 20 12 00 00       	call   1015c5 <cons_getc>
  1003a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003a8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003ac:	74 f2                	je     1003a0 <getchar+0x6>
        /* do nothing */;
    return c;
  1003ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1003b1:	c9                   	leave  
  1003b2:	c3                   	ret    

001003b3 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1003b3:	55                   	push   %ebp
  1003b4:	89 e5                	mov    %esp,%ebp
  1003b6:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1003b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003bc:	8b 00                	mov    (%eax),%eax
  1003be:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1003c1:	8b 45 10             	mov    0x10(%ebp),%eax
  1003c4:	8b 00                	mov    (%eax),%eax
  1003c6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1003c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1003d0:	e9 d2 00 00 00       	jmp    1004a7 <stab_binsearch+0xf4>
        int true_m = (l + r) / 2, m = true_m;
  1003d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1003d8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1003db:	01 d0                	add    %edx,%eax
  1003dd:	89 c2                	mov    %eax,%edx
  1003df:	c1 ea 1f             	shr    $0x1f,%edx
  1003e2:	01 d0                	add    %edx,%eax
  1003e4:	d1 f8                	sar    %eax
  1003e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1003e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1003ec:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003ef:	eb 04                	jmp    1003f5 <stab_binsearch+0x42>
            m --;
  1003f1:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003f8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1003fb:	7c 1f                	jl     10041c <stab_binsearch+0x69>
  1003fd:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100400:	89 d0                	mov    %edx,%eax
  100402:	01 c0                	add    %eax,%eax
  100404:	01 d0                	add    %edx,%eax
  100406:	c1 e0 02             	shl    $0x2,%eax
  100409:	89 c2                	mov    %eax,%edx
  10040b:	8b 45 08             	mov    0x8(%ebp),%eax
  10040e:	01 d0                	add    %edx,%eax
  100410:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100414:	0f b6 c0             	movzbl %al,%eax
  100417:	3b 45 14             	cmp    0x14(%ebp),%eax
  10041a:	75 d5                	jne    1003f1 <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  10041c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10041f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100422:	7d 0b                	jge    10042f <stab_binsearch+0x7c>
            l = true_m + 1;
  100424:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100427:	83 c0 01             	add    $0x1,%eax
  10042a:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  10042d:	eb 78                	jmp    1004a7 <stab_binsearch+0xf4>
        }

        // actual binary search
        any_matches = 1;
  10042f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100436:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100439:	89 d0                	mov    %edx,%eax
  10043b:	01 c0                	add    %eax,%eax
  10043d:	01 d0                	add    %edx,%eax
  10043f:	c1 e0 02             	shl    $0x2,%eax
  100442:	89 c2                	mov    %eax,%edx
  100444:	8b 45 08             	mov    0x8(%ebp),%eax
  100447:	01 d0                	add    %edx,%eax
  100449:	8b 40 08             	mov    0x8(%eax),%eax
  10044c:	3b 45 18             	cmp    0x18(%ebp),%eax
  10044f:	73 13                	jae    100464 <stab_binsearch+0xb1>
            *region_left = m;
  100451:	8b 45 0c             	mov    0xc(%ebp),%eax
  100454:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100457:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100459:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10045c:	83 c0 01             	add    $0x1,%eax
  10045f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100462:	eb 43                	jmp    1004a7 <stab_binsearch+0xf4>
        } else if (stabs[m].n_value > addr) {
  100464:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100467:	89 d0                	mov    %edx,%eax
  100469:	01 c0                	add    %eax,%eax
  10046b:	01 d0                	add    %edx,%eax
  10046d:	c1 e0 02             	shl    $0x2,%eax
  100470:	89 c2                	mov    %eax,%edx
  100472:	8b 45 08             	mov    0x8(%ebp),%eax
  100475:	01 d0                	add    %edx,%eax
  100477:	8b 40 08             	mov    0x8(%eax),%eax
  10047a:	3b 45 18             	cmp    0x18(%ebp),%eax
  10047d:	76 16                	jbe    100495 <stab_binsearch+0xe2>
            *region_right = m - 1;
  10047f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100482:	8d 50 ff             	lea    -0x1(%eax),%edx
  100485:	8b 45 10             	mov    0x10(%ebp),%eax
  100488:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  10048a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10048d:	83 e8 01             	sub    $0x1,%eax
  100490:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100493:	eb 12                	jmp    1004a7 <stab_binsearch+0xf4>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  100495:	8b 45 0c             	mov    0xc(%ebp),%eax
  100498:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10049b:	89 10                	mov    %edx,(%eax)
            l = m;
  10049d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004a0:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1004a3:	83 45 18 01          	addl   $0x1,0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  1004a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1004aa:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1004ad:	0f 8e 22 ff ff ff    	jle    1003d5 <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  1004b3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004b7:	75 0f                	jne    1004c8 <stab_binsearch+0x115>
        *region_right = *region_left - 1;
  1004b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004bc:	8b 00                	mov    (%eax),%eax
  1004be:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004c1:	8b 45 10             	mov    0x10(%ebp),%eax
  1004c4:	89 10                	mov    %edx,(%eax)
  1004c6:	eb 3f                	jmp    100507 <stab_binsearch+0x154>
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  1004c8:	8b 45 10             	mov    0x10(%ebp),%eax
  1004cb:	8b 00                	mov    (%eax),%eax
  1004cd:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1004d0:	eb 04                	jmp    1004d6 <stab_binsearch+0x123>
  1004d2:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  1004d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004d9:	8b 00                	mov    (%eax),%eax
  1004db:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004de:	7d 1f                	jge    1004ff <stab_binsearch+0x14c>
  1004e0:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004e3:	89 d0                	mov    %edx,%eax
  1004e5:	01 c0                	add    %eax,%eax
  1004e7:	01 d0                	add    %edx,%eax
  1004e9:	c1 e0 02             	shl    $0x2,%eax
  1004ec:	89 c2                	mov    %eax,%edx
  1004ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1004f1:	01 d0                	add    %edx,%eax
  1004f3:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004f7:	0f b6 c0             	movzbl %al,%eax
  1004fa:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004fd:	75 d3                	jne    1004d2 <stab_binsearch+0x11f>
            /* do nothing */;
        *region_left = l;
  1004ff:	8b 45 0c             	mov    0xc(%ebp),%eax
  100502:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100505:	89 10                	mov    %edx,(%eax)
    }
}
  100507:	c9                   	leave  
  100508:	c3                   	ret    

00100509 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  100509:	55                   	push   %ebp
  10050a:	89 e5                	mov    %esp,%ebp
  10050c:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  10050f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100512:	c7 00 ac 34 10 00    	movl   $0x1034ac,(%eax)
    info->eip_line = 0;
  100518:	8b 45 0c             	mov    0xc(%ebp),%eax
  10051b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100522:	8b 45 0c             	mov    0xc(%ebp),%eax
  100525:	c7 40 08 ac 34 10 00 	movl   $0x1034ac,0x8(%eax)
    info->eip_fn_namelen = 9;
  10052c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10052f:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  100536:	8b 45 0c             	mov    0xc(%ebp),%eax
  100539:	8b 55 08             	mov    0x8(%ebp),%edx
  10053c:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  10053f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100542:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100549:	c7 45 f4 0c 3d 10 00 	movl   $0x103d0c,-0xc(%ebp)
    stab_end = __STAB_END__;
  100550:	c7 45 f0 34 b4 10 00 	movl   $0x10b434,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100557:	c7 45 ec 35 b4 10 00 	movl   $0x10b435,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  10055e:	c7 45 e8 45 d4 10 00 	movl   $0x10d445,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100565:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100568:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10056b:	76 0d                	jbe    10057a <debuginfo_eip+0x71>
  10056d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100570:	83 e8 01             	sub    $0x1,%eax
  100573:	0f b6 00             	movzbl (%eax),%eax
  100576:	84 c0                	test   %al,%al
  100578:	74 0a                	je     100584 <debuginfo_eip+0x7b>
        return -1;
  10057a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10057f:	e9 c0 02 00 00       	jmp    100844 <debuginfo_eip+0x33b>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100584:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10058b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10058e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100591:	29 c2                	sub    %eax,%edx
  100593:	89 d0                	mov    %edx,%eax
  100595:	c1 f8 02             	sar    $0x2,%eax
  100598:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  10059e:	83 e8 01             	sub    $0x1,%eax
  1005a1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1005a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1005a7:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005ab:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1005b2:	00 
  1005b3:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1005b6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005ba:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1005bd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1005c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005c4:	89 04 24             	mov    %eax,(%esp)
  1005c7:	e8 e7 fd ff ff       	call   1003b3 <stab_binsearch>
    if (lfile == 0)
  1005cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005cf:	85 c0                	test   %eax,%eax
  1005d1:	75 0a                	jne    1005dd <debuginfo_eip+0xd4>
        return -1;
  1005d3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005d8:	e9 67 02 00 00       	jmp    100844 <debuginfo_eip+0x33b>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1005dd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005e0:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1005e3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1005e6:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1005e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1005ec:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005f0:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1005f7:	00 
  1005f8:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1005fb:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005ff:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100602:	89 44 24 04          	mov    %eax,0x4(%esp)
  100606:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100609:	89 04 24             	mov    %eax,(%esp)
  10060c:	e8 a2 fd ff ff       	call   1003b3 <stab_binsearch>

    if (lfun <= rfun) {
  100611:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100614:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100617:	39 c2                	cmp    %eax,%edx
  100619:	7f 7c                	jg     100697 <debuginfo_eip+0x18e>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10061b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10061e:	89 c2                	mov    %eax,%edx
  100620:	89 d0                	mov    %edx,%eax
  100622:	01 c0                	add    %eax,%eax
  100624:	01 d0                	add    %edx,%eax
  100626:	c1 e0 02             	shl    $0x2,%eax
  100629:	89 c2                	mov    %eax,%edx
  10062b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10062e:	01 d0                	add    %edx,%eax
  100630:	8b 10                	mov    (%eax),%edx
  100632:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100635:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100638:	29 c1                	sub    %eax,%ecx
  10063a:	89 c8                	mov    %ecx,%eax
  10063c:	39 c2                	cmp    %eax,%edx
  10063e:	73 22                	jae    100662 <debuginfo_eip+0x159>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100640:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100643:	89 c2                	mov    %eax,%edx
  100645:	89 d0                	mov    %edx,%eax
  100647:	01 c0                	add    %eax,%eax
  100649:	01 d0                	add    %edx,%eax
  10064b:	c1 e0 02             	shl    $0x2,%eax
  10064e:	89 c2                	mov    %eax,%edx
  100650:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100653:	01 d0                	add    %edx,%eax
  100655:	8b 10                	mov    (%eax),%edx
  100657:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10065a:	01 c2                	add    %eax,%edx
  10065c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10065f:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100662:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100665:	89 c2                	mov    %eax,%edx
  100667:	89 d0                	mov    %edx,%eax
  100669:	01 c0                	add    %eax,%eax
  10066b:	01 d0                	add    %edx,%eax
  10066d:	c1 e0 02             	shl    $0x2,%eax
  100670:	89 c2                	mov    %eax,%edx
  100672:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100675:	01 d0                	add    %edx,%eax
  100677:	8b 50 08             	mov    0x8(%eax),%edx
  10067a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10067d:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100680:	8b 45 0c             	mov    0xc(%ebp),%eax
  100683:	8b 40 10             	mov    0x10(%eax),%eax
  100686:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100689:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10068c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10068f:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100692:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100695:	eb 15                	jmp    1006ac <debuginfo_eip+0x1a3>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  100697:	8b 45 0c             	mov    0xc(%ebp),%eax
  10069a:	8b 55 08             	mov    0x8(%ebp),%edx
  10069d:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1006a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006a3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1006a6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006a9:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1006ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006af:	8b 40 08             	mov    0x8(%eax),%eax
  1006b2:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1006b9:	00 
  1006ba:	89 04 24             	mov    %eax,(%esp)
  1006bd:	e8 27 2a 00 00       	call   1030e9 <strfind>
  1006c2:	89 c2                	mov    %eax,%edx
  1006c4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006c7:	8b 40 08             	mov    0x8(%eax),%eax
  1006ca:	29 c2                	sub    %eax,%edx
  1006cc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006cf:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1006d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1006d5:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006d9:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1006e0:	00 
  1006e1:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1006e4:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006e8:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1006eb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006f2:	89 04 24             	mov    %eax,(%esp)
  1006f5:	e8 b9 fc ff ff       	call   1003b3 <stab_binsearch>
    if (lline <= rline) {
  1006fa:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1006fd:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100700:	39 c2                	cmp    %eax,%edx
  100702:	7f 24                	jg     100728 <debuginfo_eip+0x21f>
        info->eip_line = stabs[rline].n_desc;
  100704:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100707:	89 c2                	mov    %eax,%edx
  100709:	89 d0                	mov    %edx,%eax
  10070b:	01 c0                	add    %eax,%eax
  10070d:	01 d0                	add    %edx,%eax
  10070f:	c1 e0 02             	shl    $0x2,%eax
  100712:	89 c2                	mov    %eax,%edx
  100714:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100717:	01 d0                	add    %edx,%eax
  100719:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  10071d:	0f b7 d0             	movzwl %ax,%edx
  100720:	8b 45 0c             	mov    0xc(%ebp),%eax
  100723:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100726:	eb 13                	jmp    10073b <debuginfo_eip+0x232>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  100728:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10072d:	e9 12 01 00 00       	jmp    100844 <debuginfo_eip+0x33b>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100732:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100735:	83 e8 01             	sub    $0x1,%eax
  100738:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  10073b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10073e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100741:	39 c2                	cmp    %eax,%edx
  100743:	7c 56                	jl     10079b <debuginfo_eip+0x292>
           && stabs[lline].n_type != N_SOL
  100745:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100748:	89 c2                	mov    %eax,%edx
  10074a:	89 d0                	mov    %edx,%eax
  10074c:	01 c0                	add    %eax,%eax
  10074e:	01 d0                	add    %edx,%eax
  100750:	c1 e0 02             	shl    $0x2,%eax
  100753:	89 c2                	mov    %eax,%edx
  100755:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100758:	01 d0                	add    %edx,%eax
  10075a:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10075e:	3c 84                	cmp    $0x84,%al
  100760:	74 39                	je     10079b <debuginfo_eip+0x292>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100762:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100765:	89 c2                	mov    %eax,%edx
  100767:	89 d0                	mov    %edx,%eax
  100769:	01 c0                	add    %eax,%eax
  10076b:	01 d0                	add    %edx,%eax
  10076d:	c1 e0 02             	shl    $0x2,%eax
  100770:	89 c2                	mov    %eax,%edx
  100772:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100775:	01 d0                	add    %edx,%eax
  100777:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10077b:	3c 64                	cmp    $0x64,%al
  10077d:	75 b3                	jne    100732 <debuginfo_eip+0x229>
  10077f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100782:	89 c2                	mov    %eax,%edx
  100784:	89 d0                	mov    %edx,%eax
  100786:	01 c0                	add    %eax,%eax
  100788:	01 d0                	add    %edx,%eax
  10078a:	c1 e0 02             	shl    $0x2,%eax
  10078d:	89 c2                	mov    %eax,%edx
  10078f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100792:	01 d0                	add    %edx,%eax
  100794:	8b 40 08             	mov    0x8(%eax),%eax
  100797:	85 c0                	test   %eax,%eax
  100799:	74 97                	je     100732 <debuginfo_eip+0x229>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10079b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10079e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007a1:	39 c2                	cmp    %eax,%edx
  1007a3:	7c 46                	jl     1007eb <debuginfo_eip+0x2e2>
  1007a5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007a8:	89 c2                	mov    %eax,%edx
  1007aa:	89 d0                	mov    %edx,%eax
  1007ac:	01 c0                	add    %eax,%eax
  1007ae:	01 d0                	add    %edx,%eax
  1007b0:	c1 e0 02             	shl    $0x2,%eax
  1007b3:	89 c2                	mov    %eax,%edx
  1007b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007b8:	01 d0                	add    %edx,%eax
  1007ba:	8b 10                	mov    (%eax),%edx
  1007bc:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1007bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007c2:	29 c1                	sub    %eax,%ecx
  1007c4:	89 c8                	mov    %ecx,%eax
  1007c6:	39 c2                	cmp    %eax,%edx
  1007c8:	73 21                	jae    1007eb <debuginfo_eip+0x2e2>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1007ca:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007cd:	89 c2                	mov    %eax,%edx
  1007cf:	89 d0                	mov    %edx,%eax
  1007d1:	01 c0                	add    %eax,%eax
  1007d3:	01 d0                	add    %edx,%eax
  1007d5:	c1 e0 02             	shl    $0x2,%eax
  1007d8:	89 c2                	mov    %eax,%edx
  1007da:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007dd:	01 d0                	add    %edx,%eax
  1007df:	8b 10                	mov    (%eax),%edx
  1007e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007e4:	01 c2                	add    %eax,%edx
  1007e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007e9:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1007eb:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1007ee:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007f1:	39 c2                	cmp    %eax,%edx
  1007f3:	7d 4a                	jge    10083f <debuginfo_eip+0x336>
        for (lline = lfun + 1;
  1007f5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007f8:	83 c0 01             	add    $0x1,%eax
  1007fb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1007fe:	eb 18                	jmp    100818 <debuginfo_eip+0x30f>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100800:	8b 45 0c             	mov    0xc(%ebp),%eax
  100803:	8b 40 14             	mov    0x14(%eax),%eax
  100806:	8d 50 01             	lea    0x1(%eax),%edx
  100809:	8b 45 0c             	mov    0xc(%ebp),%eax
  10080c:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  10080f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100812:	83 c0 01             	add    $0x1,%eax
  100815:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100818:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10081b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  10081e:	39 c2                	cmp    %eax,%edx
  100820:	7d 1d                	jge    10083f <debuginfo_eip+0x336>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100822:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100825:	89 c2                	mov    %eax,%edx
  100827:	89 d0                	mov    %edx,%eax
  100829:	01 c0                	add    %eax,%eax
  10082b:	01 d0                	add    %edx,%eax
  10082d:	c1 e0 02             	shl    $0x2,%eax
  100830:	89 c2                	mov    %eax,%edx
  100832:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100835:	01 d0                	add    %edx,%eax
  100837:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10083b:	3c a0                	cmp    $0xa0,%al
  10083d:	74 c1                	je     100800 <debuginfo_eip+0x2f7>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  10083f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100844:	c9                   	leave  
  100845:	c3                   	ret    

00100846 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100846:	55                   	push   %ebp
  100847:	89 e5                	mov    %esp,%ebp
  100849:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  10084c:	c7 04 24 b6 34 10 00 	movl   $0x1034b6,(%esp)
  100853:	e8 ba fa ff ff       	call   100312 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100858:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10085f:	00 
  100860:	c7 04 24 cf 34 10 00 	movl   $0x1034cf,(%esp)
  100867:	e8 a6 fa ff ff       	call   100312 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  10086c:	c7 44 24 04 fe 33 10 	movl   $0x1033fe,0x4(%esp)
  100873:	00 
  100874:	c7 04 24 e7 34 10 00 	movl   $0x1034e7,(%esp)
  10087b:	e8 92 fa ff ff       	call   100312 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100880:	c7 44 24 04 16 ea 10 	movl   $0x10ea16,0x4(%esp)
  100887:	00 
  100888:	c7 04 24 ff 34 10 00 	movl   $0x1034ff,(%esp)
  10088f:	e8 7e fa ff ff       	call   100312 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100894:	c7 44 24 04 20 fd 10 	movl   $0x10fd20,0x4(%esp)
  10089b:	00 
  10089c:	c7 04 24 17 35 10 00 	movl   $0x103517,(%esp)
  1008a3:	e8 6a fa ff ff       	call   100312 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  1008a8:	b8 20 fd 10 00       	mov    $0x10fd20,%eax
  1008ad:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008b3:	b8 00 00 10 00       	mov    $0x100000,%eax
  1008b8:	29 c2                	sub    %eax,%edx
  1008ba:	89 d0                	mov    %edx,%eax
  1008bc:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008c2:	85 c0                	test   %eax,%eax
  1008c4:	0f 48 c2             	cmovs  %edx,%eax
  1008c7:	c1 f8 0a             	sar    $0xa,%eax
  1008ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008ce:	c7 04 24 30 35 10 00 	movl   $0x103530,(%esp)
  1008d5:	e8 38 fa ff ff       	call   100312 <cprintf>
}
  1008da:	c9                   	leave  
  1008db:	c3                   	ret    

001008dc <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1008dc:	55                   	push   %ebp
  1008dd:	89 e5                	mov    %esp,%ebp
  1008df:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1008e5:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1008e8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1008ef:	89 04 24             	mov    %eax,(%esp)
  1008f2:	e8 12 fc ff ff       	call   100509 <debuginfo_eip>
  1008f7:	85 c0                	test   %eax,%eax
  1008f9:	74 15                	je     100910 <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1008fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1008fe:	89 44 24 04          	mov    %eax,0x4(%esp)
  100902:	c7 04 24 5a 35 10 00 	movl   $0x10355a,(%esp)
  100909:	e8 04 fa ff ff       	call   100312 <cprintf>
  10090e:	eb 6d                	jmp    10097d <print_debuginfo+0xa1>
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100910:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100917:	eb 1c                	jmp    100935 <print_debuginfo+0x59>
            fnname[j] = info.eip_fn_name[j];
  100919:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10091c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10091f:	01 d0                	add    %edx,%eax
  100921:	0f b6 00             	movzbl (%eax),%eax
  100924:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  10092a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10092d:	01 ca                	add    %ecx,%edx
  10092f:	88 02                	mov    %al,(%edx)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100931:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100935:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100938:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  10093b:	7f dc                	jg     100919 <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  10093d:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100943:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100946:	01 d0                	add    %edx,%eax
  100948:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  10094b:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  10094e:	8b 55 08             	mov    0x8(%ebp),%edx
  100951:	89 d1                	mov    %edx,%ecx
  100953:	29 c1                	sub    %eax,%ecx
  100955:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100958:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10095b:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  10095f:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100965:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100969:	89 54 24 08          	mov    %edx,0x8(%esp)
  10096d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100971:	c7 04 24 76 35 10 00 	movl   $0x103576,(%esp)
  100978:	e8 95 f9 ff ff       	call   100312 <cprintf>
                fnname, eip - info.eip_fn_addr);
    }
}
  10097d:	c9                   	leave  
  10097e:	c3                   	ret    

0010097f <read_eip>:

static __noinline uint32_t
read_eip(void) {
  10097f:	55                   	push   %ebp
  100980:	89 e5                	mov    %esp,%ebp
  100982:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100985:	8b 45 04             	mov    0x4(%ebp),%eax
  100988:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  10098b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10098e:	c9                   	leave  
  10098f:	c3                   	ret    

00100990 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100990:	55                   	push   %ebp
  100991:	89 e5                	mov    %esp,%ebp
  100993:	83 ec 48             	sub    $0x48,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100996:	89 e8                	mov    %ebp,%eax
  100998:	89 45 d8             	mov    %eax,-0x28(%ebp)
    return ebp;
  10099b:	8b 45 d8             	mov    -0x28(%ebp),%eax
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
    int depth;
    uint32_t ebp = read_ebp();
  10099e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    uint32_t eip = read_eip();
  1009a1:	e8 d9 ff ff ff       	call   10097f <read_eip>
  1009a6:	89 45 ec             	mov    %eax,-0x14(%ebp)

    for (depth = 0; ebp != 0 && depth < STACKFRAME_DEPTH; ++depth) {
  1009a9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1009b0:	e9 93 00 00 00       	jmp    100a48 <print_stackframe+0xb8>
        cprintf("ebp:0x%x eip:0x%x", ebp, eip);
  1009b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1009b8:	89 44 24 08          	mov    %eax,0x8(%esp)
  1009bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009bf:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009c3:	c7 04 24 88 35 10 00 	movl   $0x103588,(%esp)
  1009ca:	e8 43 f9 ff ff       	call   100312 <cprintf>

        uint32_t arg1 = *((uint32_t *)ebp + 2);
  1009cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009d2:	83 c0 08             	add    $0x8,%eax
  1009d5:	8b 00                	mov    (%eax),%eax
  1009d7:	89 45 e8             	mov    %eax,-0x18(%ebp)
        uint32_t arg2 = *((uint32_t *)ebp + 3);
  1009da:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009dd:	83 c0 0c             	add    $0xc,%eax
  1009e0:	8b 00                	mov    (%eax),%eax
  1009e2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        uint32_t arg3 = *((uint32_t *)ebp + 4);
  1009e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009e8:	83 c0 10             	add    $0x10,%eax
  1009eb:	8b 00                	mov    (%eax),%eax
  1009ed:	89 45 e0             	mov    %eax,-0x20(%ebp)
        uint32_t arg4 = *((uint32_t *)ebp + 5);
  1009f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009f3:	83 c0 14             	add    $0x14,%eax
  1009f6:	8b 00                	mov    (%eax),%eax
  1009f8:	89 45 dc             	mov    %eax,-0x24(%ebp)
        cprintf(" arg1:0x%x arg2:0x%x arg3:0x%x arg4:0x%x\n", arg1, arg2, arg3, arg4);
  1009fb:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1009fe:	89 44 24 10          	mov    %eax,0x10(%esp)
  100a02:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100a05:	89 44 24 0c          	mov    %eax,0xc(%esp)
  100a09:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100a0c:	89 44 24 08          	mov    %eax,0x8(%esp)
  100a10:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a13:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a17:	c7 04 24 9c 35 10 00 	movl   $0x10359c,(%esp)
  100a1e:	e8 ef f8 ff ff       	call   100312 <cprintf>

        // because eip point to the "next" instruction
        print_debuginfo(eip - 1);
  100a23:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100a26:	83 e8 01             	sub    $0x1,%eax
  100a29:	89 04 24             	mov    %eax,(%esp)
  100a2c:	e8 ab fe ff ff       	call   1008dc <print_debuginfo>

        eip = *((uint32_t *)ebp + 1);
  100a31:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a34:	83 c0 04             	add    $0x4,%eax
  100a37:	8b 00                	mov    (%eax),%eax
  100a39:	89 45 ec             	mov    %eax,-0x14(%ebp)
        ebp = *((uint32_t *)ebp);
  100a3c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a3f:	8b 00                	mov    (%eax),%eax
  100a41:	89 45 f0             	mov    %eax,-0x10(%ebp)
      */
    int depth;
    uint32_t ebp = read_ebp();
    uint32_t eip = read_eip();

    for (depth = 0; ebp != 0 && depth < STACKFRAME_DEPTH; ++depth) {
  100a44:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100a48:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100a4c:	74 0a                	je     100a58 <print_stackframe+0xc8>
  100a4e:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
  100a52:	0f 8e 5d ff ff ff    	jle    1009b5 <print_stackframe+0x25>
        print_debuginfo(eip - 1);

        eip = *((uint32_t *)ebp + 1);
        ebp = *((uint32_t *)ebp);
    }
}
  100a58:	c9                   	leave  
  100a59:	c3                   	ret    

00100a5a <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100a5a:	55                   	push   %ebp
  100a5b:	89 e5                	mov    %esp,%ebp
  100a5d:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100a60:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a67:	eb 0c                	jmp    100a75 <parse+0x1b>
            *buf ++ = '\0';
  100a69:	8b 45 08             	mov    0x8(%ebp),%eax
  100a6c:	8d 50 01             	lea    0x1(%eax),%edx
  100a6f:	89 55 08             	mov    %edx,0x8(%ebp)
  100a72:	c6 00 00             	movb   $0x0,(%eax)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a75:	8b 45 08             	mov    0x8(%ebp),%eax
  100a78:	0f b6 00             	movzbl (%eax),%eax
  100a7b:	84 c0                	test   %al,%al
  100a7d:	74 1d                	je     100a9c <parse+0x42>
  100a7f:	8b 45 08             	mov    0x8(%ebp),%eax
  100a82:	0f b6 00             	movzbl (%eax),%eax
  100a85:	0f be c0             	movsbl %al,%eax
  100a88:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a8c:	c7 04 24 48 36 10 00 	movl   $0x103648,(%esp)
  100a93:	e8 1e 26 00 00       	call   1030b6 <strchr>
  100a98:	85 c0                	test   %eax,%eax
  100a9a:	75 cd                	jne    100a69 <parse+0xf>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100a9c:	8b 45 08             	mov    0x8(%ebp),%eax
  100a9f:	0f b6 00             	movzbl (%eax),%eax
  100aa2:	84 c0                	test   %al,%al
  100aa4:	75 02                	jne    100aa8 <parse+0x4e>
            break;
  100aa6:	eb 67                	jmp    100b0f <parse+0xb5>
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100aa8:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100aac:	75 14                	jne    100ac2 <parse+0x68>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100aae:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100ab5:	00 
  100ab6:	c7 04 24 4d 36 10 00 	movl   $0x10364d,(%esp)
  100abd:	e8 50 f8 ff ff       	call   100312 <cprintf>
        }
        argv[argc ++] = buf;
  100ac2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ac5:	8d 50 01             	lea    0x1(%eax),%edx
  100ac8:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100acb:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100ad2:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ad5:	01 c2                	add    %eax,%edx
  100ad7:	8b 45 08             	mov    0x8(%ebp),%eax
  100ada:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100adc:	eb 04                	jmp    100ae2 <parse+0x88>
            buf ++;
  100ade:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ae2:	8b 45 08             	mov    0x8(%ebp),%eax
  100ae5:	0f b6 00             	movzbl (%eax),%eax
  100ae8:	84 c0                	test   %al,%al
  100aea:	74 1d                	je     100b09 <parse+0xaf>
  100aec:	8b 45 08             	mov    0x8(%ebp),%eax
  100aef:	0f b6 00             	movzbl (%eax),%eax
  100af2:	0f be c0             	movsbl %al,%eax
  100af5:	89 44 24 04          	mov    %eax,0x4(%esp)
  100af9:	c7 04 24 48 36 10 00 	movl   $0x103648,(%esp)
  100b00:	e8 b1 25 00 00       	call   1030b6 <strchr>
  100b05:	85 c0                	test   %eax,%eax
  100b07:	74 d5                	je     100ade <parse+0x84>
            buf ++;
        }
    }
  100b09:	90                   	nop
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b0a:	e9 66 ff ff ff       	jmp    100a75 <parse+0x1b>
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
    return argc;
  100b0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100b12:	c9                   	leave  
  100b13:	c3                   	ret    

00100b14 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100b14:	55                   	push   %ebp
  100b15:	89 e5                	mov    %esp,%ebp
  100b17:	83 ec 68             	sub    $0x68,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100b1a:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b1d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b21:	8b 45 08             	mov    0x8(%ebp),%eax
  100b24:	89 04 24             	mov    %eax,(%esp)
  100b27:	e8 2e ff ff ff       	call   100a5a <parse>
  100b2c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100b2f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100b33:	75 0a                	jne    100b3f <runcmd+0x2b>
        return 0;
  100b35:	b8 00 00 00 00       	mov    $0x0,%eax
  100b3a:	e9 85 00 00 00       	jmp    100bc4 <runcmd+0xb0>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b3f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b46:	eb 5c                	jmp    100ba4 <runcmd+0x90>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100b48:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100b4b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b4e:	89 d0                	mov    %edx,%eax
  100b50:	01 c0                	add    %eax,%eax
  100b52:	01 d0                	add    %edx,%eax
  100b54:	c1 e0 02             	shl    $0x2,%eax
  100b57:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b5c:	8b 00                	mov    (%eax),%eax
  100b5e:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100b62:	89 04 24             	mov    %eax,(%esp)
  100b65:	e8 ad 24 00 00       	call   103017 <strcmp>
  100b6a:	85 c0                	test   %eax,%eax
  100b6c:	75 32                	jne    100ba0 <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100b6e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b71:	89 d0                	mov    %edx,%eax
  100b73:	01 c0                	add    %eax,%eax
  100b75:	01 d0                	add    %edx,%eax
  100b77:	c1 e0 02             	shl    $0x2,%eax
  100b7a:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b7f:	8b 40 08             	mov    0x8(%eax),%eax
  100b82:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100b85:	8d 4a ff             	lea    -0x1(%edx),%ecx
  100b88:	8b 55 0c             	mov    0xc(%ebp),%edx
  100b8b:	89 54 24 08          	mov    %edx,0x8(%esp)
  100b8f:	8d 55 b0             	lea    -0x50(%ebp),%edx
  100b92:	83 c2 04             	add    $0x4,%edx
  100b95:	89 54 24 04          	mov    %edx,0x4(%esp)
  100b99:	89 0c 24             	mov    %ecx,(%esp)
  100b9c:	ff d0                	call   *%eax
  100b9e:	eb 24                	jmp    100bc4 <runcmd+0xb0>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100ba0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100ba4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ba7:	83 f8 02             	cmp    $0x2,%eax
  100baa:	76 9c                	jbe    100b48 <runcmd+0x34>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100bac:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100baf:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bb3:	c7 04 24 6b 36 10 00 	movl   $0x10366b,(%esp)
  100bba:	e8 53 f7 ff ff       	call   100312 <cprintf>
    return 0;
  100bbf:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100bc4:	c9                   	leave  
  100bc5:	c3                   	ret    

00100bc6 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100bc6:	55                   	push   %ebp
  100bc7:	89 e5                	mov    %esp,%ebp
  100bc9:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100bcc:	c7 04 24 84 36 10 00 	movl   $0x103684,(%esp)
  100bd3:	e8 3a f7 ff ff       	call   100312 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100bd8:	c7 04 24 ac 36 10 00 	movl   $0x1036ac,(%esp)
  100bdf:	e8 2e f7 ff ff       	call   100312 <cprintf>

    if (tf != NULL) {
  100be4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100be8:	74 0b                	je     100bf5 <kmonitor+0x2f>
        print_trapframe(tf);
  100bea:	8b 45 08             	mov    0x8(%ebp),%eax
  100bed:	89 04 24             	mov    %eax,(%esp)
  100bf0:	e8 4d 0d 00 00       	call   101942 <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100bf5:	c7 04 24 d1 36 10 00 	movl   $0x1036d1,(%esp)
  100bfc:	e8 08 f6 ff ff       	call   100209 <readline>
  100c01:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100c04:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100c08:	74 18                	je     100c22 <kmonitor+0x5c>
            if (runcmd(buf, tf) < 0) {
  100c0a:	8b 45 08             	mov    0x8(%ebp),%eax
  100c0d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c11:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c14:	89 04 24             	mov    %eax,(%esp)
  100c17:	e8 f8 fe ff ff       	call   100b14 <runcmd>
  100c1c:	85 c0                	test   %eax,%eax
  100c1e:	79 02                	jns    100c22 <kmonitor+0x5c>
                break;
  100c20:	eb 02                	jmp    100c24 <kmonitor+0x5e>
            }
        }
    }
  100c22:	eb d1                	jmp    100bf5 <kmonitor+0x2f>
}
  100c24:	c9                   	leave  
  100c25:	c3                   	ret    

00100c26 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100c26:	55                   	push   %ebp
  100c27:	89 e5                	mov    %esp,%ebp
  100c29:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c2c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c33:	eb 3f                	jmp    100c74 <mon_help+0x4e>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100c35:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c38:	89 d0                	mov    %edx,%eax
  100c3a:	01 c0                	add    %eax,%eax
  100c3c:	01 d0                	add    %edx,%eax
  100c3e:	c1 e0 02             	shl    $0x2,%eax
  100c41:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c46:	8b 48 04             	mov    0x4(%eax),%ecx
  100c49:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c4c:	89 d0                	mov    %edx,%eax
  100c4e:	01 c0                	add    %eax,%eax
  100c50:	01 d0                	add    %edx,%eax
  100c52:	c1 e0 02             	shl    $0x2,%eax
  100c55:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c5a:	8b 00                	mov    (%eax),%eax
  100c5c:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c60:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c64:	c7 04 24 d5 36 10 00 	movl   $0x1036d5,(%esp)
  100c6b:	e8 a2 f6 ff ff       	call   100312 <cprintf>

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c70:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c74:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c77:	83 f8 02             	cmp    $0x2,%eax
  100c7a:	76 b9                	jbe    100c35 <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100c7c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c81:	c9                   	leave  
  100c82:	c3                   	ret    

00100c83 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100c83:	55                   	push   %ebp
  100c84:	89 e5                	mov    %esp,%ebp
  100c86:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100c89:	e8 b8 fb ff ff       	call   100846 <print_kerninfo>
    return 0;
  100c8e:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c93:	c9                   	leave  
  100c94:	c3                   	ret    

00100c95 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100c95:	55                   	push   %ebp
  100c96:	89 e5                	mov    %esp,%ebp
  100c98:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100c9b:	e8 f0 fc ff ff       	call   100990 <print_stackframe>
    return 0;
  100ca0:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100ca5:	c9                   	leave  
  100ca6:	c3                   	ret    

00100ca7 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100ca7:	55                   	push   %ebp
  100ca8:	89 e5                	mov    %esp,%ebp
  100caa:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  100cad:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  100cb2:	85 c0                	test   %eax,%eax
  100cb4:	74 02                	je     100cb8 <__panic+0x11>
        goto panic_dead;
  100cb6:	eb 48                	jmp    100d00 <__panic+0x59>
    }
    is_panic = 1;
  100cb8:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  100cbf:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100cc2:	8d 45 14             	lea    0x14(%ebp),%eax
  100cc5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100cc8:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ccb:	89 44 24 08          	mov    %eax,0x8(%esp)
  100ccf:	8b 45 08             	mov    0x8(%ebp),%eax
  100cd2:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cd6:	c7 04 24 de 36 10 00 	movl   $0x1036de,(%esp)
  100cdd:	e8 30 f6 ff ff       	call   100312 <cprintf>
    vcprintf(fmt, ap);
  100ce2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ce5:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ce9:	8b 45 10             	mov    0x10(%ebp),%eax
  100cec:	89 04 24             	mov    %eax,(%esp)
  100cef:	e8 eb f5 ff ff       	call   1002df <vcprintf>
    cprintf("\n");
  100cf4:	c7 04 24 fa 36 10 00 	movl   $0x1036fa,(%esp)
  100cfb:	e8 12 f6 ff ff       	call   100312 <cprintf>
    va_end(ap);

panic_dead:
    intr_disable();
  100d00:	e8 22 09 00 00       	call   101627 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100d05:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100d0c:	e8 b5 fe ff ff       	call   100bc6 <kmonitor>
    }
  100d11:	eb f2                	jmp    100d05 <__panic+0x5e>

00100d13 <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100d13:	55                   	push   %ebp
  100d14:	89 e5                	mov    %esp,%ebp
  100d16:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100d19:	8d 45 14             	lea    0x14(%ebp),%eax
  100d1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100d1f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d22:	89 44 24 08          	mov    %eax,0x8(%esp)
  100d26:	8b 45 08             	mov    0x8(%ebp),%eax
  100d29:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d2d:	c7 04 24 fc 36 10 00 	movl   $0x1036fc,(%esp)
  100d34:	e8 d9 f5 ff ff       	call   100312 <cprintf>
    vcprintf(fmt, ap);
  100d39:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d3c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d40:	8b 45 10             	mov    0x10(%ebp),%eax
  100d43:	89 04 24             	mov    %eax,(%esp)
  100d46:	e8 94 f5 ff ff       	call   1002df <vcprintf>
    cprintf("\n");
  100d4b:	c7 04 24 fa 36 10 00 	movl   $0x1036fa,(%esp)
  100d52:	e8 bb f5 ff ff       	call   100312 <cprintf>
    va_end(ap);
}
  100d57:	c9                   	leave  
  100d58:	c3                   	ret    

00100d59 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100d59:	55                   	push   %ebp
  100d5a:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100d5c:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100d61:	5d                   	pop    %ebp
  100d62:	c3                   	ret    

00100d63 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d63:	55                   	push   %ebp
  100d64:	89 e5                	mov    %esp,%ebp
  100d66:	83 ec 28             	sub    $0x28,%esp
  100d69:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d6f:	c6 45 f5 34          	movb   $0x34,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d73:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100d77:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d7b:	ee                   	out    %al,(%dx)
  100d7c:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d82:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100d86:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d8a:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d8e:	ee                   	out    %al,(%dx)
  100d8f:	66 c7 45 ee 40 00    	movw   $0x40,-0x12(%ebp)
  100d95:	c6 45 ed 2e          	movb   $0x2e,-0x13(%ebp)
  100d99:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100d9d:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100da1:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100da2:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100da9:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100dac:	c7 04 24 1a 37 10 00 	movl   $0x10371a,(%esp)
  100db3:	e8 5a f5 ff ff       	call   100312 <cprintf>
    pic_enable(IRQ_TIMER);
  100db8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100dbf:	e8 c1 08 00 00       	call   101685 <pic_enable>
}
  100dc4:	c9                   	leave  
  100dc5:	c3                   	ret    

00100dc6 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100dc6:	55                   	push   %ebp
  100dc7:	89 e5                	mov    %esp,%ebp
  100dc9:	83 ec 10             	sub    $0x10,%esp
  100dcc:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dd2:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100dd6:	89 c2                	mov    %eax,%edx
  100dd8:	ec                   	in     (%dx),%al
  100dd9:	88 45 fd             	mov    %al,-0x3(%ebp)
  100ddc:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100de2:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100de6:	89 c2                	mov    %eax,%edx
  100de8:	ec                   	in     (%dx),%al
  100de9:	88 45 f9             	mov    %al,-0x7(%ebp)
  100dec:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100df2:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100df6:	89 c2                	mov    %eax,%edx
  100df8:	ec                   	in     (%dx),%al
  100df9:	88 45 f5             	mov    %al,-0xb(%ebp)
  100dfc:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
  100e02:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e06:	89 c2                	mov    %eax,%edx
  100e08:	ec                   	in     (%dx),%al
  100e09:	88 45 f1             	mov    %al,-0xf(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e0c:	c9                   	leave  
  100e0d:	c3                   	ret    

00100e0e <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100e0e:	55                   	push   %ebp
  100e0f:	89 e5                	mov    %esp,%ebp
  100e11:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e14:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e1b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e1e:	0f b7 00             	movzwl (%eax),%eax
  100e21:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e25:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e28:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e2d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e30:	0f b7 00             	movzwl (%eax),%eax
  100e33:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100e37:	74 12                	je     100e4b <cga_init+0x3d>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e39:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e40:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e47:	b4 03 
  100e49:	eb 13                	jmp    100e5e <cga_init+0x50>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e4b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e4e:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e52:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e55:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e5c:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e5e:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e65:	0f b7 c0             	movzwl %ax,%eax
  100e68:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  100e6c:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e70:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100e74:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100e78:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100e79:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e80:	83 c0 01             	add    $0x1,%eax
  100e83:	0f b7 c0             	movzwl %ax,%eax
  100e86:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e8a:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100e8e:	89 c2                	mov    %eax,%edx
  100e90:	ec                   	in     (%dx),%al
  100e91:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100e94:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100e98:	0f b6 c0             	movzbl %al,%eax
  100e9b:	c1 e0 08             	shl    $0x8,%eax
  100e9e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100ea1:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ea8:	0f b7 c0             	movzwl %ax,%eax
  100eab:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  100eaf:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100eb3:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100eb7:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100ebb:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100ebc:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ec3:	83 c0 01             	add    $0x1,%eax
  100ec6:	0f b7 c0             	movzwl %ax,%eax
  100ec9:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ecd:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  100ed1:	89 c2                	mov    %eax,%edx
  100ed3:	ec                   	in     (%dx),%al
  100ed4:	88 45 e5             	mov    %al,-0x1b(%ebp)
    return data;
  100ed7:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100edb:	0f b6 c0             	movzbl %al,%eax
  100ede:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100ee1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ee4:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100ee9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100eec:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100ef2:	c9                   	leave  
  100ef3:	c3                   	ret    

00100ef4 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100ef4:	55                   	push   %ebp
  100ef5:	89 e5                	mov    %esp,%ebp
  100ef7:	83 ec 48             	sub    $0x48,%esp
  100efa:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100f00:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f04:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100f08:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100f0c:	ee                   	out    %al,(%dx)
  100f0d:	66 c7 45 f2 fb 03    	movw   $0x3fb,-0xe(%ebp)
  100f13:	c6 45 f1 80          	movb   $0x80,-0xf(%ebp)
  100f17:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f1b:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f1f:	ee                   	out    %al,(%dx)
  100f20:	66 c7 45 ee f8 03    	movw   $0x3f8,-0x12(%ebp)
  100f26:	c6 45 ed 0c          	movb   $0xc,-0x13(%ebp)
  100f2a:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f2e:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f32:	ee                   	out    %al,(%dx)
  100f33:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f39:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
  100f3d:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f41:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f45:	ee                   	out    %al,(%dx)
  100f46:	66 c7 45 e6 fb 03    	movw   $0x3fb,-0x1a(%ebp)
  100f4c:	c6 45 e5 03          	movb   $0x3,-0x1b(%ebp)
  100f50:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f54:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f58:	ee                   	out    %al,(%dx)
  100f59:	66 c7 45 e2 fc 03    	movw   $0x3fc,-0x1e(%ebp)
  100f5f:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
  100f63:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f67:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f6b:	ee                   	out    %al,(%dx)
  100f6c:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f72:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
  100f76:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f7a:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f7e:	ee                   	out    %al,(%dx)
  100f7f:	66 c7 45 da fd 03    	movw   $0x3fd,-0x26(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f85:	0f b7 45 da          	movzwl -0x26(%ebp),%eax
  100f89:	89 c2                	mov    %eax,%edx
  100f8b:	ec                   	in     (%dx),%al
  100f8c:	88 45 d9             	mov    %al,-0x27(%ebp)
    return data;
  100f8f:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f93:	3c ff                	cmp    $0xff,%al
  100f95:	0f 95 c0             	setne  %al
  100f98:	0f b6 c0             	movzbl %al,%eax
  100f9b:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100fa0:	66 c7 45 d6 fa 03    	movw   $0x3fa,-0x2a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fa6:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
  100faa:	89 c2                	mov    %eax,%edx
  100fac:	ec                   	in     (%dx),%al
  100fad:	88 45 d5             	mov    %al,-0x2b(%ebp)
  100fb0:	66 c7 45 d2 f8 03    	movw   $0x3f8,-0x2e(%ebp)
  100fb6:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
  100fba:	89 c2                	mov    %eax,%edx
  100fbc:	ec                   	in     (%dx),%al
  100fbd:	88 45 d1             	mov    %al,-0x2f(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100fc0:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100fc5:	85 c0                	test   %eax,%eax
  100fc7:	74 0c                	je     100fd5 <serial_init+0xe1>
        pic_enable(IRQ_COM1);
  100fc9:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100fd0:	e8 b0 06 00 00       	call   101685 <pic_enable>
    }
}
  100fd5:	c9                   	leave  
  100fd6:	c3                   	ret    

00100fd7 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fd7:	55                   	push   %ebp
  100fd8:	89 e5                	mov    %esp,%ebp
  100fda:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fdd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100fe4:	eb 09                	jmp    100fef <lpt_putc_sub+0x18>
        delay();
  100fe6:	e8 db fd ff ff       	call   100dc6 <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100feb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100fef:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  100ff5:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100ff9:	89 c2                	mov    %eax,%edx
  100ffb:	ec                   	in     (%dx),%al
  100ffc:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  100fff:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101003:	84 c0                	test   %al,%al
  101005:	78 09                	js     101010 <lpt_putc_sub+0x39>
  101007:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10100e:	7e d6                	jle    100fe6 <lpt_putc_sub+0xf>
        delay();
    }
    outb(LPTPORT + 0, c);
  101010:	8b 45 08             	mov    0x8(%ebp),%eax
  101013:	0f b6 c0             	movzbl %al,%eax
  101016:	66 c7 45 f6 78 03    	movw   $0x378,-0xa(%ebp)
  10101c:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10101f:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101023:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101027:	ee                   	out    %al,(%dx)
  101028:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  10102e:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  101032:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101036:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10103a:	ee                   	out    %al,(%dx)
  10103b:	66 c7 45 ee 7a 03    	movw   $0x37a,-0x12(%ebp)
  101041:	c6 45 ed 08          	movb   $0x8,-0x13(%ebp)
  101045:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101049:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10104d:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  10104e:	c9                   	leave  
  10104f:	c3                   	ret    

00101050 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  101050:	55                   	push   %ebp
  101051:	89 e5                	mov    %esp,%ebp
  101053:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101056:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10105a:	74 0d                	je     101069 <lpt_putc+0x19>
        lpt_putc_sub(c);
  10105c:	8b 45 08             	mov    0x8(%ebp),%eax
  10105f:	89 04 24             	mov    %eax,(%esp)
  101062:	e8 70 ff ff ff       	call   100fd7 <lpt_putc_sub>
  101067:	eb 24                	jmp    10108d <lpt_putc+0x3d>
    }
    else {
        lpt_putc_sub('\b');
  101069:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101070:	e8 62 ff ff ff       	call   100fd7 <lpt_putc_sub>
        lpt_putc_sub(' ');
  101075:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10107c:	e8 56 ff ff ff       	call   100fd7 <lpt_putc_sub>
        lpt_putc_sub('\b');
  101081:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101088:	e8 4a ff ff ff       	call   100fd7 <lpt_putc_sub>
    }
}
  10108d:	c9                   	leave  
  10108e:	c3                   	ret    

0010108f <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  10108f:	55                   	push   %ebp
  101090:	89 e5                	mov    %esp,%ebp
  101092:	53                   	push   %ebx
  101093:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  101096:	8b 45 08             	mov    0x8(%ebp),%eax
  101099:	b0 00                	mov    $0x0,%al
  10109b:	85 c0                	test   %eax,%eax
  10109d:	75 07                	jne    1010a6 <cga_putc+0x17>
        c |= 0x0700;
  10109f:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  1010a6:	8b 45 08             	mov    0x8(%ebp),%eax
  1010a9:	0f b6 c0             	movzbl %al,%eax
  1010ac:	83 f8 0a             	cmp    $0xa,%eax
  1010af:	74 4c                	je     1010fd <cga_putc+0x6e>
  1010b1:	83 f8 0d             	cmp    $0xd,%eax
  1010b4:	74 57                	je     10110d <cga_putc+0x7e>
  1010b6:	83 f8 08             	cmp    $0x8,%eax
  1010b9:	0f 85 88 00 00 00    	jne    101147 <cga_putc+0xb8>
    case '\b':
        if (crt_pos > 0) {
  1010bf:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010c6:	66 85 c0             	test   %ax,%ax
  1010c9:	74 30                	je     1010fb <cga_putc+0x6c>
            crt_pos --;
  1010cb:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010d2:	83 e8 01             	sub    $0x1,%eax
  1010d5:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010db:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010e0:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  1010e7:	0f b7 d2             	movzwl %dx,%edx
  1010ea:	01 d2                	add    %edx,%edx
  1010ec:	01 c2                	add    %eax,%edx
  1010ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1010f1:	b0 00                	mov    $0x0,%al
  1010f3:	83 c8 20             	or     $0x20,%eax
  1010f6:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  1010f9:	eb 72                	jmp    10116d <cga_putc+0xde>
  1010fb:	eb 70                	jmp    10116d <cga_putc+0xde>
    case '\n':
        crt_pos += CRT_COLS;
  1010fd:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101104:	83 c0 50             	add    $0x50,%eax
  101107:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  10110d:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  101114:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  10111b:	0f b7 c1             	movzwl %cx,%eax
  10111e:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  101124:	c1 e8 10             	shr    $0x10,%eax
  101127:	89 c2                	mov    %eax,%edx
  101129:	66 c1 ea 06          	shr    $0x6,%dx
  10112d:	89 d0                	mov    %edx,%eax
  10112f:	c1 e0 02             	shl    $0x2,%eax
  101132:	01 d0                	add    %edx,%eax
  101134:	c1 e0 04             	shl    $0x4,%eax
  101137:	29 c1                	sub    %eax,%ecx
  101139:	89 ca                	mov    %ecx,%edx
  10113b:	89 d8                	mov    %ebx,%eax
  10113d:	29 d0                	sub    %edx,%eax
  10113f:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  101145:	eb 26                	jmp    10116d <cga_putc+0xde>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  101147:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  10114d:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101154:	8d 50 01             	lea    0x1(%eax),%edx
  101157:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  10115e:	0f b7 c0             	movzwl %ax,%eax
  101161:	01 c0                	add    %eax,%eax
  101163:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  101166:	8b 45 08             	mov    0x8(%ebp),%eax
  101169:	66 89 02             	mov    %ax,(%edx)
        break;
  10116c:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  10116d:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101174:	66 3d cf 07          	cmp    $0x7cf,%ax
  101178:	76 5b                	jbe    1011d5 <cga_putc+0x146>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  10117a:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10117f:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101185:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10118a:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  101191:	00 
  101192:	89 54 24 04          	mov    %edx,0x4(%esp)
  101196:	89 04 24             	mov    %eax,(%esp)
  101199:	e8 16 21 00 00       	call   1032b4 <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10119e:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1011a5:	eb 15                	jmp    1011bc <cga_putc+0x12d>
            crt_buf[i] = 0x0700 | ' ';
  1011a7:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011ac:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1011af:	01 d2                	add    %edx,%edx
  1011b1:	01 d0                	add    %edx,%eax
  1011b3:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011b8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1011bc:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1011c3:	7e e2                	jle    1011a7 <cga_putc+0x118>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  1011c5:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011cc:	83 e8 50             	sub    $0x50,%eax
  1011cf:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011d5:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011dc:	0f b7 c0             	movzwl %ax,%eax
  1011df:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  1011e3:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
  1011e7:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1011eb:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1011ef:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  1011f0:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011f7:	66 c1 e8 08          	shr    $0x8,%ax
  1011fb:	0f b6 c0             	movzbl %al,%eax
  1011fe:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101205:	83 c2 01             	add    $0x1,%edx
  101208:	0f b7 d2             	movzwl %dx,%edx
  10120b:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
  10120f:	88 45 ed             	mov    %al,-0x13(%ebp)
  101212:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101216:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10121a:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  10121b:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  101222:	0f b7 c0             	movzwl %ax,%eax
  101225:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  101229:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
  10122d:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101231:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101235:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  101236:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10123d:	0f b6 c0             	movzbl %al,%eax
  101240:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101247:	83 c2 01             	add    $0x1,%edx
  10124a:	0f b7 d2             	movzwl %dx,%edx
  10124d:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
  101251:	88 45 e5             	mov    %al,-0x1b(%ebp)
  101254:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101258:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10125c:	ee                   	out    %al,(%dx)
}
  10125d:	83 c4 34             	add    $0x34,%esp
  101260:	5b                   	pop    %ebx
  101261:	5d                   	pop    %ebp
  101262:	c3                   	ret    

00101263 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101263:	55                   	push   %ebp
  101264:	89 e5                	mov    %esp,%ebp
  101266:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101269:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101270:	eb 09                	jmp    10127b <serial_putc_sub+0x18>
        delay();
  101272:	e8 4f fb ff ff       	call   100dc6 <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101277:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10127b:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101281:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101285:	89 c2                	mov    %eax,%edx
  101287:	ec                   	in     (%dx),%al
  101288:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10128b:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10128f:	0f b6 c0             	movzbl %al,%eax
  101292:	83 e0 20             	and    $0x20,%eax
  101295:	85 c0                	test   %eax,%eax
  101297:	75 09                	jne    1012a2 <serial_putc_sub+0x3f>
  101299:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  1012a0:	7e d0                	jle    101272 <serial_putc_sub+0xf>
        delay();
    }
    outb(COM1 + COM_TX, c);
  1012a2:	8b 45 08             	mov    0x8(%ebp),%eax
  1012a5:	0f b6 c0             	movzbl %al,%eax
  1012a8:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  1012ae:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012b1:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1012b5:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1012b9:	ee                   	out    %al,(%dx)
}
  1012ba:	c9                   	leave  
  1012bb:	c3                   	ret    

001012bc <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1012bc:	55                   	push   %ebp
  1012bd:	89 e5                	mov    %esp,%ebp
  1012bf:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1012c2:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1012c6:	74 0d                	je     1012d5 <serial_putc+0x19>
        serial_putc_sub(c);
  1012c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1012cb:	89 04 24             	mov    %eax,(%esp)
  1012ce:	e8 90 ff ff ff       	call   101263 <serial_putc_sub>
  1012d3:	eb 24                	jmp    1012f9 <serial_putc+0x3d>
    }
    else {
        serial_putc_sub('\b');
  1012d5:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012dc:	e8 82 ff ff ff       	call   101263 <serial_putc_sub>
        serial_putc_sub(' ');
  1012e1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1012e8:	e8 76 ff ff ff       	call   101263 <serial_putc_sub>
        serial_putc_sub('\b');
  1012ed:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012f4:	e8 6a ff ff ff       	call   101263 <serial_putc_sub>
    }
}
  1012f9:	c9                   	leave  
  1012fa:	c3                   	ret    

001012fb <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1012fb:	55                   	push   %ebp
  1012fc:	89 e5                	mov    %esp,%ebp
  1012fe:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  101301:	eb 33                	jmp    101336 <cons_intr+0x3b>
        if (c != 0) {
  101303:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  101307:	74 2d                	je     101336 <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  101309:	a1 84 f0 10 00       	mov    0x10f084,%eax
  10130e:	8d 50 01             	lea    0x1(%eax),%edx
  101311:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  101317:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10131a:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  101320:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101325:	3d 00 02 00 00       	cmp    $0x200,%eax
  10132a:	75 0a                	jne    101336 <cons_intr+0x3b>
                cons.wpos = 0;
  10132c:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  101333:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  101336:	8b 45 08             	mov    0x8(%ebp),%eax
  101339:	ff d0                	call   *%eax
  10133b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10133e:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  101342:	75 bf                	jne    101303 <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  101344:	c9                   	leave  
  101345:	c3                   	ret    

00101346 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  101346:	55                   	push   %ebp
  101347:	89 e5                	mov    %esp,%ebp
  101349:	83 ec 10             	sub    $0x10,%esp
  10134c:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101352:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101356:	89 c2                	mov    %eax,%edx
  101358:	ec                   	in     (%dx),%al
  101359:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10135c:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101360:	0f b6 c0             	movzbl %al,%eax
  101363:	83 e0 01             	and    $0x1,%eax
  101366:	85 c0                	test   %eax,%eax
  101368:	75 07                	jne    101371 <serial_proc_data+0x2b>
        return -1;
  10136a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10136f:	eb 2a                	jmp    10139b <serial_proc_data+0x55>
  101371:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101377:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10137b:	89 c2                	mov    %eax,%edx
  10137d:	ec                   	in     (%dx),%al
  10137e:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101381:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  101385:	0f b6 c0             	movzbl %al,%eax
  101388:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  10138b:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  10138f:	75 07                	jne    101398 <serial_proc_data+0x52>
        c = '\b';
  101391:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  101398:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10139b:	c9                   	leave  
  10139c:	c3                   	ret    

0010139d <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  10139d:	55                   	push   %ebp
  10139e:	89 e5                	mov    %esp,%ebp
  1013a0:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  1013a3:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1013a8:	85 c0                	test   %eax,%eax
  1013aa:	74 0c                	je     1013b8 <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  1013ac:	c7 04 24 46 13 10 00 	movl   $0x101346,(%esp)
  1013b3:	e8 43 ff ff ff       	call   1012fb <cons_intr>
    }
}
  1013b8:	c9                   	leave  
  1013b9:	c3                   	ret    

001013ba <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  1013ba:	55                   	push   %ebp
  1013bb:	89 e5                	mov    %esp,%ebp
  1013bd:	83 ec 38             	sub    $0x38,%esp
  1013c0:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013c6:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1013ca:	89 c2                	mov    %eax,%edx
  1013cc:	ec                   	in     (%dx),%al
  1013cd:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  1013d0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013d4:	0f b6 c0             	movzbl %al,%eax
  1013d7:	83 e0 01             	and    $0x1,%eax
  1013da:	85 c0                	test   %eax,%eax
  1013dc:	75 0a                	jne    1013e8 <kbd_proc_data+0x2e>
        return -1;
  1013de:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013e3:	e9 59 01 00 00       	jmp    101541 <kbd_proc_data+0x187>
  1013e8:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013ee:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1013f2:	89 c2                	mov    %eax,%edx
  1013f4:	ec                   	in     (%dx),%al
  1013f5:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1013f8:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  1013fc:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1013ff:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  101403:	75 17                	jne    10141c <kbd_proc_data+0x62>
        // E0 escape character
        shift |= E0ESC;
  101405:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10140a:	83 c8 40             	or     $0x40,%eax
  10140d:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101412:	b8 00 00 00 00       	mov    $0x0,%eax
  101417:	e9 25 01 00 00       	jmp    101541 <kbd_proc_data+0x187>
    } else if (data & 0x80) {
  10141c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101420:	84 c0                	test   %al,%al
  101422:	79 47                	jns    10146b <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  101424:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101429:	83 e0 40             	and    $0x40,%eax
  10142c:	85 c0                	test   %eax,%eax
  10142e:	75 09                	jne    101439 <kbd_proc_data+0x7f>
  101430:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101434:	83 e0 7f             	and    $0x7f,%eax
  101437:	eb 04                	jmp    10143d <kbd_proc_data+0x83>
  101439:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10143d:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  101440:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101444:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  10144b:	83 c8 40             	or     $0x40,%eax
  10144e:	0f b6 c0             	movzbl %al,%eax
  101451:	f7 d0                	not    %eax
  101453:	89 c2                	mov    %eax,%edx
  101455:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10145a:	21 d0                	and    %edx,%eax
  10145c:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101461:	b8 00 00 00 00       	mov    $0x0,%eax
  101466:	e9 d6 00 00 00       	jmp    101541 <kbd_proc_data+0x187>
    } else if (shift & E0ESC) {
  10146b:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101470:	83 e0 40             	and    $0x40,%eax
  101473:	85 c0                	test   %eax,%eax
  101475:	74 11                	je     101488 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101477:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  10147b:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101480:	83 e0 bf             	and    $0xffffffbf,%eax
  101483:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  101488:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10148c:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101493:	0f b6 d0             	movzbl %al,%edx
  101496:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10149b:	09 d0                	or     %edx,%eax
  10149d:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  1014a2:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014a6:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  1014ad:	0f b6 d0             	movzbl %al,%edx
  1014b0:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014b5:	31 d0                	xor    %edx,%eax
  1014b7:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  1014bc:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014c1:	83 e0 03             	and    $0x3,%eax
  1014c4:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  1014cb:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014cf:	01 d0                	add    %edx,%eax
  1014d1:	0f b6 00             	movzbl (%eax),%eax
  1014d4:	0f b6 c0             	movzbl %al,%eax
  1014d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014da:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014df:	83 e0 08             	and    $0x8,%eax
  1014e2:	85 c0                	test   %eax,%eax
  1014e4:	74 22                	je     101508 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  1014e6:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1014ea:	7e 0c                	jle    1014f8 <kbd_proc_data+0x13e>
  1014ec:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1014f0:	7f 06                	jg     1014f8 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1014f2:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1014f6:	eb 10                	jmp    101508 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1014f8:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1014fc:	7e 0a                	jle    101508 <kbd_proc_data+0x14e>
  1014fe:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  101502:	7f 04                	jg     101508 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  101504:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  101508:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10150d:	f7 d0                	not    %eax
  10150f:	83 e0 06             	and    $0x6,%eax
  101512:	85 c0                	test   %eax,%eax
  101514:	75 28                	jne    10153e <kbd_proc_data+0x184>
  101516:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  10151d:	75 1f                	jne    10153e <kbd_proc_data+0x184>
        cprintf("Rebooting!\n");
  10151f:	c7 04 24 35 37 10 00 	movl   $0x103735,(%esp)
  101526:	e8 e7 ed ff ff       	call   100312 <cprintf>
  10152b:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  101531:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101535:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  101539:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  10153d:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  10153e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101541:	c9                   	leave  
  101542:	c3                   	ret    

00101543 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101543:	55                   	push   %ebp
  101544:	89 e5                	mov    %esp,%ebp
  101546:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  101549:	c7 04 24 ba 13 10 00 	movl   $0x1013ba,(%esp)
  101550:	e8 a6 fd ff ff       	call   1012fb <cons_intr>
}
  101555:	c9                   	leave  
  101556:	c3                   	ret    

00101557 <kbd_init>:

static void
kbd_init(void) {
  101557:	55                   	push   %ebp
  101558:	89 e5                	mov    %esp,%ebp
  10155a:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  10155d:	e8 e1 ff ff ff       	call   101543 <kbd_intr>
    pic_enable(IRQ_KBD);
  101562:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  101569:	e8 17 01 00 00       	call   101685 <pic_enable>
}
  10156e:	c9                   	leave  
  10156f:	c3                   	ret    

00101570 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101570:	55                   	push   %ebp
  101571:	89 e5                	mov    %esp,%ebp
  101573:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  101576:	e8 93 f8 ff ff       	call   100e0e <cga_init>
    serial_init();
  10157b:	e8 74 f9 ff ff       	call   100ef4 <serial_init>
    kbd_init();
  101580:	e8 d2 ff ff ff       	call   101557 <kbd_init>
    if (!serial_exists) {
  101585:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  10158a:	85 c0                	test   %eax,%eax
  10158c:	75 0c                	jne    10159a <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  10158e:	c7 04 24 41 37 10 00 	movl   $0x103741,(%esp)
  101595:	e8 78 ed ff ff       	call   100312 <cprintf>
    }
}
  10159a:	c9                   	leave  
  10159b:	c3                   	ret    

0010159c <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  10159c:	55                   	push   %ebp
  10159d:	89 e5                	mov    %esp,%ebp
  10159f:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  1015a2:	8b 45 08             	mov    0x8(%ebp),%eax
  1015a5:	89 04 24             	mov    %eax,(%esp)
  1015a8:	e8 a3 fa ff ff       	call   101050 <lpt_putc>
    cga_putc(c);
  1015ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1015b0:	89 04 24             	mov    %eax,(%esp)
  1015b3:	e8 d7 fa ff ff       	call   10108f <cga_putc>
    serial_putc(c);
  1015b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1015bb:	89 04 24             	mov    %eax,(%esp)
  1015be:	e8 f9 fc ff ff       	call   1012bc <serial_putc>
}
  1015c3:	c9                   	leave  
  1015c4:	c3                   	ret    

001015c5 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015c5:	55                   	push   %ebp
  1015c6:	89 e5                	mov    %esp,%ebp
  1015c8:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015cb:	e8 cd fd ff ff       	call   10139d <serial_intr>
    kbd_intr();
  1015d0:	e8 6e ff ff ff       	call   101543 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015d5:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  1015db:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1015e0:	39 c2                	cmp    %eax,%edx
  1015e2:	74 36                	je     10161a <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015e4:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015e9:	8d 50 01             	lea    0x1(%eax),%edx
  1015ec:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  1015f2:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  1015f9:	0f b6 c0             	movzbl %al,%eax
  1015fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1015ff:	a1 80 f0 10 00       	mov    0x10f080,%eax
  101604:	3d 00 02 00 00       	cmp    $0x200,%eax
  101609:	75 0a                	jne    101615 <cons_getc+0x50>
            cons.rpos = 0;
  10160b:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  101612:	00 00 00 
        }
        return c;
  101615:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101618:	eb 05                	jmp    10161f <cons_getc+0x5a>
    }
    return 0;
  10161a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10161f:	c9                   	leave  
  101620:	c3                   	ret    

00101621 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  101621:	55                   	push   %ebp
  101622:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  101624:	fb                   	sti    
    sti();
}
  101625:	5d                   	pop    %ebp
  101626:	c3                   	ret    

00101627 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  101627:	55                   	push   %ebp
  101628:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  10162a:	fa                   	cli    
    cli();
}
  10162b:	5d                   	pop    %ebp
  10162c:	c3                   	ret    

0010162d <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  10162d:	55                   	push   %ebp
  10162e:	89 e5                	mov    %esp,%ebp
  101630:	83 ec 14             	sub    $0x14,%esp
  101633:	8b 45 08             	mov    0x8(%ebp),%eax
  101636:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  10163a:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10163e:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  101644:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  101649:	85 c0                	test   %eax,%eax
  10164b:	74 36                	je     101683 <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  10164d:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101651:	0f b6 c0             	movzbl %al,%eax
  101654:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  10165a:	88 45 fd             	mov    %al,-0x3(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10165d:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101661:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101665:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  101666:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10166a:	66 c1 e8 08          	shr    $0x8,%ax
  10166e:	0f b6 c0             	movzbl %al,%eax
  101671:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  101677:	88 45 f9             	mov    %al,-0x7(%ebp)
  10167a:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10167e:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101682:	ee                   	out    %al,(%dx)
    }
}
  101683:	c9                   	leave  
  101684:	c3                   	ret    

00101685 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101685:	55                   	push   %ebp
  101686:	89 e5                	mov    %esp,%ebp
  101688:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  10168b:	8b 45 08             	mov    0x8(%ebp),%eax
  10168e:	ba 01 00 00 00       	mov    $0x1,%edx
  101693:	89 c1                	mov    %eax,%ecx
  101695:	d3 e2                	shl    %cl,%edx
  101697:	89 d0                	mov    %edx,%eax
  101699:	f7 d0                	not    %eax
  10169b:	89 c2                	mov    %eax,%edx
  10169d:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1016a4:	21 d0                	and    %edx,%eax
  1016a6:	0f b7 c0             	movzwl %ax,%eax
  1016a9:	89 04 24             	mov    %eax,(%esp)
  1016ac:	e8 7c ff ff ff       	call   10162d <pic_setmask>
}
  1016b1:	c9                   	leave  
  1016b2:	c3                   	ret    

001016b3 <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1016b3:	55                   	push   %ebp
  1016b4:	89 e5                	mov    %esp,%ebp
  1016b6:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  1016b9:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  1016c0:	00 00 00 
  1016c3:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  1016c9:	c6 45 fd ff          	movb   $0xff,-0x3(%ebp)
  1016cd:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1016d1:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016d5:	ee                   	out    %al,(%dx)
  1016d6:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  1016dc:	c6 45 f9 ff          	movb   $0xff,-0x7(%ebp)
  1016e0:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1016e4:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016e8:	ee                   	out    %al,(%dx)
  1016e9:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  1016ef:	c6 45 f5 11          	movb   $0x11,-0xb(%ebp)
  1016f3:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1016f7:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1016fb:	ee                   	out    %al,(%dx)
  1016fc:	66 c7 45 f2 21 00    	movw   $0x21,-0xe(%ebp)
  101702:	c6 45 f1 20          	movb   $0x20,-0xf(%ebp)
  101706:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10170a:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10170e:	ee                   	out    %al,(%dx)
  10170f:	66 c7 45 ee 21 00    	movw   $0x21,-0x12(%ebp)
  101715:	c6 45 ed 04          	movb   $0x4,-0x13(%ebp)
  101719:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10171d:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101721:	ee                   	out    %al,(%dx)
  101722:	66 c7 45 ea 21 00    	movw   $0x21,-0x16(%ebp)
  101728:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
  10172c:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101730:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101734:	ee                   	out    %al,(%dx)
  101735:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  10173b:	c6 45 e5 11          	movb   $0x11,-0x1b(%ebp)
  10173f:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101743:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101747:	ee                   	out    %al,(%dx)
  101748:	66 c7 45 e2 a1 00    	movw   $0xa1,-0x1e(%ebp)
  10174e:	c6 45 e1 28          	movb   $0x28,-0x1f(%ebp)
  101752:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101756:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  10175a:	ee                   	out    %al,(%dx)
  10175b:	66 c7 45 de a1 00    	movw   $0xa1,-0x22(%ebp)
  101761:	c6 45 dd 02          	movb   $0x2,-0x23(%ebp)
  101765:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101769:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  10176d:	ee                   	out    %al,(%dx)
  10176e:	66 c7 45 da a1 00    	movw   $0xa1,-0x26(%ebp)
  101774:	c6 45 d9 03          	movb   $0x3,-0x27(%ebp)
  101778:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  10177c:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101780:	ee                   	out    %al,(%dx)
  101781:	66 c7 45 d6 20 00    	movw   $0x20,-0x2a(%ebp)
  101787:	c6 45 d5 68          	movb   $0x68,-0x2b(%ebp)
  10178b:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  10178f:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  101793:	ee                   	out    %al,(%dx)
  101794:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  10179a:	c6 45 d1 0a          	movb   $0xa,-0x2f(%ebp)
  10179e:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  1017a2:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  1017a6:	ee                   	out    %al,(%dx)
  1017a7:	66 c7 45 ce a0 00    	movw   $0xa0,-0x32(%ebp)
  1017ad:	c6 45 cd 68          	movb   $0x68,-0x33(%ebp)
  1017b1:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1017b5:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1017b9:	ee                   	out    %al,(%dx)
  1017ba:	66 c7 45 ca a0 00    	movw   $0xa0,-0x36(%ebp)
  1017c0:	c6 45 c9 0a          	movb   $0xa,-0x37(%ebp)
  1017c4:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1017c8:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1017cc:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017cd:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017d4:	66 83 f8 ff          	cmp    $0xffff,%ax
  1017d8:	74 12                	je     1017ec <pic_init+0x139>
        pic_setmask(irq_mask);
  1017da:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017e1:	0f b7 c0             	movzwl %ax,%eax
  1017e4:	89 04 24             	mov    %eax,(%esp)
  1017e7:	e8 41 fe ff ff       	call   10162d <pic_setmask>
    }
}
  1017ec:	c9                   	leave  
  1017ed:	c3                   	ret    

001017ee <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  1017ee:	55                   	push   %ebp
  1017ef:	89 e5                	mov    %esp,%ebp
  1017f1:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1017f4:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  1017fb:	00 
  1017fc:	c7 04 24 60 37 10 00 	movl   $0x103760,(%esp)
  101803:	e8 0a eb ff ff       	call   100312 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  101808:	c9                   	leave  
  101809:	c3                   	ret    

0010180a <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  10180a:	55                   	push   %ebp
  10180b:	89 e5                	mov    %esp,%ebp
  10180d:	83 ec 10             	sub    $0x10,%esp
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
    extern uintptr_t __vectors[];
    int i;

    for (i = 0; i < 256; ++i) {
  101810:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101817:	e9 c3 00 00 00       	jmp    1018df <idt_init+0xd5>
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
  10181c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10181f:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  101826:	89 c2                	mov    %eax,%edx
  101828:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10182b:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  101832:	00 
  101833:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101836:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  10183d:	00 08 00 
  101840:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101843:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  10184a:	00 
  10184b:	83 e2 e0             	and    $0xffffffe0,%edx
  10184e:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101855:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101858:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  10185f:	00 
  101860:	83 e2 1f             	and    $0x1f,%edx
  101863:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  10186a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10186d:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101874:	00 
  101875:	83 e2 f0             	and    $0xfffffff0,%edx
  101878:	83 ca 0e             	or     $0xe,%edx
  10187b:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101882:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101885:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  10188c:	00 
  10188d:	83 e2 ef             	and    $0xffffffef,%edx
  101890:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101897:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10189a:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018a1:	00 
  1018a2:	83 e2 9f             	and    $0xffffff9f,%edx
  1018a5:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018af:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018b6:	00 
  1018b7:	83 ca 80             	or     $0xffffff80,%edx
  1018ba:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018c4:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  1018cb:	c1 e8 10             	shr    $0x10,%eax
  1018ce:	89 c2                	mov    %eax,%edx
  1018d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018d3:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  1018da:	00 
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
    extern uintptr_t __vectors[];
    int i;

    for (i = 0; i < 256; ++i) {
  1018db:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1018df:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  1018e6:	0f 8e 30 ff ff ff    	jle    10181c <idt_init+0x12>
  1018ec:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    return ebp;
}

static inline void
lidt(struct pseudodesc *pd) {
    asm volatile ("lidt (%0)" :: "r" (pd));
  1018f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1018f6:	0f 01 18             	lidtl  (%eax)
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
    }

    lidt(&idt_pd);
}
  1018f9:	c9                   	leave  
  1018fa:	c3                   	ret    

001018fb <trapname>:

static const char *
trapname(int trapno) {
  1018fb:	55                   	push   %ebp
  1018fc:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  1018fe:	8b 45 08             	mov    0x8(%ebp),%eax
  101901:	83 f8 13             	cmp    $0x13,%eax
  101904:	77 0c                	ja     101912 <trapname+0x17>
        return excnames[trapno];
  101906:	8b 45 08             	mov    0x8(%ebp),%eax
  101909:	8b 04 85 c0 3a 10 00 	mov    0x103ac0(,%eax,4),%eax
  101910:	eb 18                	jmp    10192a <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101912:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101916:	7e 0d                	jle    101925 <trapname+0x2a>
  101918:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  10191c:	7f 07                	jg     101925 <trapname+0x2a>
        return "Hardware Interrupt";
  10191e:	b8 6a 37 10 00       	mov    $0x10376a,%eax
  101923:	eb 05                	jmp    10192a <trapname+0x2f>
    }
    return "(unknown trap)";
  101925:	b8 7d 37 10 00       	mov    $0x10377d,%eax
}
  10192a:	5d                   	pop    %ebp
  10192b:	c3                   	ret    

0010192c <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  10192c:	55                   	push   %ebp
  10192d:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  10192f:	8b 45 08             	mov    0x8(%ebp),%eax
  101932:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101936:	66 83 f8 08          	cmp    $0x8,%ax
  10193a:	0f 94 c0             	sete   %al
  10193d:	0f b6 c0             	movzbl %al,%eax
}
  101940:	5d                   	pop    %ebp
  101941:	c3                   	ret    

00101942 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101942:	55                   	push   %ebp
  101943:	89 e5                	mov    %esp,%ebp
  101945:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  101948:	8b 45 08             	mov    0x8(%ebp),%eax
  10194b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10194f:	c7 04 24 be 37 10 00 	movl   $0x1037be,(%esp)
  101956:	e8 b7 e9 ff ff       	call   100312 <cprintf>
    print_regs(&tf->tf_regs);
  10195b:	8b 45 08             	mov    0x8(%ebp),%eax
  10195e:	89 04 24             	mov    %eax,(%esp)
  101961:	e8 a1 01 00 00       	call   101b07 <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101966:	8b 45 08             	mov    0x8(%ebp),%eax
  101969:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  10196d:	0f b7 c0             	movzwl %ax,%eax
  101970:	89 44 24 04          	mov    %eax,0x4(%esp)
  101974:	c7 04 24 cf 37 10 00 	movl   $0x1037cf,(%esp)
  10197b:	e8 92 e9 ff ff       	call   100312 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101980:	8b 45 08             	mov    0x8(%ebp),%eax
  101983:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101987:	0f b7 c0             	movzwl %ax,%eax
  10198a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10198e:	c7 04 24 e2 37 10 00 	movl   $0x1037e2,(%esp)
  101995:	e8 78 e9 ff ff       	call   100312 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  10199a:	8b 45 08             	mov    0x8(%ebp),%eax
  10199d:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  1019a1:	0f b7 c0             	movzwl %ax,%eax
  1019a4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019a8:	c7 04 24 f5 37 10 00 	movl   $0x1037f5,(%esp)
  1019af:	e8 5e e9 ff ff       	call   100312 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  1019b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1019b7:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  1019bb:	0f b7 c0             	movzwl %ax,%eax
  1019be:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019c2:	c7 04 24 08 38 10 00 	movl   $0x103808,(%esp)
  1019c9:	e8 44 e9 ff ff       	call   100312 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  1019ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1019d1:	8b 40 30             	mov    0x30(%eax),%eax
  1019d4:	89 04 24             	mov    %eax,(%esp)
  1019d7:	e8 1f ff ff ff       	call   1018fb <trapname>
  1019dc:	8b 55 08             	mov    0x8(%ebp),%edx
  1019df:	8b 52 30             	mov    0x30(%edx),%edx
  1019e2:	89 44 24 08          	mov    %eax,0x8(%esp)
  1019e6:	89 54 24 04          	mov    %edx,0x4(%esp)
  1019ea:	c7 04 24 1b 38 10 00 	movl   $0x10381b,(%esp)
  1019f1:	e8 1c e9 ff ff       	call   100312 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  1019f6:	8b 45 08             	mov    0x8(%ebp),%eax
  1019f9:	8b 40 34             	mov    0x34(%eax),%eax
  1019fc:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a00:	c7 04 24 2d 38 10 00 	movl   $0x10382d,(%esp)
  101a07:	e8 06 e9 ff ff       	call   100312 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101a0c:	8b 45 08             	mov    0x8(%ebp),%eax
  101a0f:	8b 40 38             	mov    0x38(%eax),%eax
  101a12:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a16:	c7 04 24 3c 38 10 00 	movl   $0x10383c,(%esp)
  101a1d:	e8 f0 e8 ff ff       	call   100312 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101a22:	8b 45 08             	mov    0x8(%ebp),%eax
  101a25:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101a29:	0f b7 c0             	movzwl %ax,%eax
  101a2c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a30:	c7 04 24 4b 38 10 00 	movl   $0x10384b,(%esp)
  101a37:	e8 d6 e8 ff ff       	call   100312 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101a3c:	8b 45 08             	mov    0x8(%ebp),%eax
  101a3f:	8b 40 40             	mov    0x40(%eax),%eax
  101a42:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a46:	c7 04 24 5e 38 10 00 	movl   $0x10385e,(%esp)
  101a4d:	e8 c0 e8 ff ff       	call   100312 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101a52:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101a59:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101a60:	eb 3e                	jmp    101aa0 <print_trapframe+0x15e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101a62:	8b 45 08             	mov    0x8(%ebp),%eax
  101a65:	8b 50 40             	mov    0x40(%eax),%edx
  101a68:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101a6b:	21 d0                	and    %edx,%eax
  101a6d:	85 c0                	test   %eax,%eax
  101a6f:	74 28                	je     101a99 <print_trapframe+0x157>
  101a71:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a74:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101a7b:	85 c0                	test   %eax,%eax
  101a7d:	74 1a                	je     101a99 <print_trapframe+0x157>
            cprintf("%s,", IA32flags[i]);
  101a7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101a82:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101a89:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a8d:	c7 04 24 6d 38 10 00 	movl   $0x10386d,(%esp)
  101a94:	e8 79 e8 ff ff       	call   100312 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101a99:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101a9d:	d1 65 f0             	shll   -0x10(%ebp)
  101aa0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101aa3:	83 f8 17             	cmp    $0x17,%eax
  101aa6:	76 ba                	jbe    101a62 <print_trapframe+0x120>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101aa8:	8b 45 08             	mov    0x8(%ebp),%eax
  101aab:	8b 40 40             	mov    0x40(%eax),%eax
  101aae:	25 00 30 00 00       	and    $0x3000,%eax
  101ab3:	c1 e8 0c             	shr    $0xc,%eax
  101ab6:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aba:	c7 04 24 71 38 10 00 	movl   $0x103871,(%esp)
  101ac1:	e8 4c e8 ff ff       	call   100312 <cprintf>

    if (!trap_in_kernel(tf)) {
  101ac6:	8b 45 08             	mov    0x8(%ebp),%eax
  101ac9:	89 04 24             	mov    %eax,(%esp)
  101acc:	e8 5b fe ff ff       	call   10192c <trap_in_kernel>
  101ad1:	85 c0                	test   %eax,%eax
  101ad3:	75 30                	jne    101b05 <print_trapframe+0x1c3>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101ad5:	8b 45 08             	mov    0x8(%ebp),%eax
  101ad8:	8b 40 44             	mov    0x44(%eax),%eax
  101adb:	89 44 24 04          	mov    %eax,0x4(%esp)
  101adf:	c7 04 24 7a 38 10 00 	movl   $0x10387a,(%esp)
  101ae6:	e8 27 e8 ff ff       	call   100312 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101aeb:	8b 45 08             	mov    0x8(%ebp),%eax
  101aee:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101af2:	0f b7 c0             	movzwl %ax,%eax
  101af5:	89 44 24 04          	mov    %eax,0x4(%esp)
  101af9:	c7 04 24 89 38 10 00 	movl   $0x103889,(%esp)
  101b00:	e8 0d e8 ff ff       	call   100312 <cprintf>
    }
}
  101b05:	c9                   	leave  
  101b06:	c3                   	ret    

00101b07 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101b07:	55                   	push   %ebp
  101b08:	89 e5                	mov    %esp,%ebp
  101b0a:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101b0d:	8b 45 08             	mov    0x8(%ebp),%eax
  101b10:	8b 00                	mov    (%eax),%eax
  101b12:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b16:	c7 04 24 9c 38 10 00 	movl   $0x10389c,(%esp)
  101b1d:	e8 f0 e7 ff ff       	call   100312 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101b22:	8b 45 08             	mov    0x8(%ebp),%eax
  101b25:	8b 40 04             	mov    0x4(%eax),%eax
  101b28:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b2c:	c7 04 24 ab 38 10 00 	movl   $0x1038ab,(%esp)
  101b33:	e8 da e7 ff ff       	call   100312 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101b38:	8b 45 08             	mov    0x8(%ebp),%eax
  101b3b:	8b 40 08             	mov    0x8(%eax),%eax
  101b3e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b42:	c7 04 24 ba 38 10 00 	movl   $0x1038ba,(%esp)
  101b49:	e8 c4 e7 ff ff       	call   100312 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101b4e:	8b 45 08             	mov    0x8(%ebp),%eax
  101b51:	8b 40 0c             	mov    0xc(%eax),%eax
  101b54:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b58:	c7 04 24 c9 38 10 00 	movl   $0x1038c9,(%esp)
  101b5f:	e8 ae e7 ff ff       	call   100312 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101b64:	8b 45 08             	mov    0x8(%ebp),%eax
  101b67:	8b 40 10             	mov    0x10(%eax),%eax
  101b6a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b6e:	c7 04 24 d8 38 10 00 	movl   $0x1038d8,(%esp)
  101b75:	e8 98 e7 ff ff       	call   100312 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101b7a:	8b 45 08             	mov    0x8(%ebp),%eax
  101b7d:	8b 40 14             	mov    0x14(%eax),%eax
  101b80:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b84:	c7 04 24 e7 38 10 00 	movl   $0x1038e7,(%esp)
  101b8b:	e8 82 e7 ff ff       	call   100312 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101b90:	8b 45 08             	mov    0x8(%ebp),%eax
  101b93:	8b 40 18             	mov    0x18(%eax),%eax
  101b96:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b9a:	c7 04 24 f6 38 10 00 	movl   $0x1038f6,(%esp)
  101ba1:	e8 6c e7 ff ff       	call   100312 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101ba6:	8b 45 08             	mov    0x8(%ebp),%eax
  101ba9:	8b 40 1c             	mov    0x1c(%eax),%eax
  101bac:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bb0:	c7 04 24 05 39 10 00 	movl   $0x103905,(%esp)
  101bb7:	e8 56 e7 ff ff       	call   100312 <cprintf>
}
  101bbc:	c9                   	leave  
  101bbd:	c3                   	ret    

00101bbe <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101bbe:	55                   	push   %ebp
  101bbf:	89 e5                	mov    %esp,%ebp
  101bc1:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101bc4:	8b 45 08             	mov    0x8(%ebp),%eax
  101bc7:	8b 40 30             	mov    0x30(%eax),%eax
  101bca:	83 f8 2f             	cmp    $0x2f,%eax
  101bcd:	77 21                	ja     101bf0 <trap_dispatch+0x32>
  101bcf:	83 f8 2e             	cmp    $0x2e,%eax
  101bd2:	0f 83 04 01 00 00    	jae    101cdc <trap_dispatch+0x11e>
  101bd8:	83 f8 21             	cmp    $0x21,%eax
  101bdb:	0f 84 81 00 00 00    	je     101c62 <trap_dispatch+0xa4>
  101be1:	83 f8 24             	cmp    $0x24,%eax
  101be4:	74 56                	je     101c3c <trap_dispatch+0x7e>
  101be6:	83 f8 20             	cmp    $0x20,%eax
  101be9:	74 16                	je     101c01 <trap_dispatch+0x43>
  101beb:	e9 b4 00 00 00       	jmp    101ca4 <trap_dispatch+0xe6>
  101bf0:	83 e8 78             	sub    $0x78,%eax
  101bf3:	83 f8 01             	cmp    $0x1,%eax
  101bf6:	0f 87 a8 00 00 00    	ja     101ca4 <trap_dispatch+0xe6>
  101bfc:	e9 87 00 00 00       	jmp    101c88 <trap_dispatch+0xca>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        ++ticks;
  101c01:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101c06:	83 c0 01             	add    $0x1,%eax
  101c09:	a3 08 f9 10 00       	mov    %eax,0x10f908
        if (ticks % TICK_NUM == 0) {
  101c0e:	8b 0d 08 f9 10 00    	mov    0x10f908,%ecx
  101c14:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101c19:	89 c8                	mov    %ecx,%eax
  101c1b:	f7 e2                	mul    %edx
  101c1d:	89 d0                	mov    %edx,%eax
  101c1f:	c1 e8 05             	shr    $0x5,%eax
  101c22:	6b c0 64             	imul   $0x64,%eax,%eax
  101c25:	29 c1                	sub    %eax,%ecx
  101c27:	89 c8                	mov    %ecx,%eax
  101c29:	85 c0                	test   %eax,%eax
  101c2b:	75 0a                	jne    101c37 <trap_dispatch+0x79>
            print_ticks();
  101c2d:	e8 bc fb ff ff       	call   1017ee <print_ticks>
        }
        break;
  101c32:	e9 a6 00 00 00       	jmp    101cdd <trap_dispatch+0x11f>
  101c37:	e9 a1 00 00 00       	jmp    101cdd <trap_dispatch+0x11f>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101c3c:	e8 84 f9 ff ff       	call   1015c5 <cons_getc>
  101c41:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101c44:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101c48:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101c4c:	89 54 24 08          	mov    %edx,0x8(%esp)
  101c50:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c54:	c7 04 24 14 39 10 00 	movl   $0x103914,(%esp)
  101c5b:	e8 b2 e6 ff ff       	call   100312 <cprintf>
        break;
  101c60:	eb 7b                	jmp    101cdd <trap_dispatch+0x11f>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101c62:	e8 5e f9 ff ff       	call   1015c5 <cons_getc>
  101c67:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101c6a:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101c6e:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101c72:	89 54 24 08          	mov    %edx,0x8(%esp)
  101c76:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c7a:	c7 04 24 26 39 10 00 	movl   $0x103926,(%esp)
  101c81:	e8 8c e6 ff ff       	call   100312 <cprintf>
        break;
  101c86:	eb 55                	jmp    101cdd <trap_dispatch+0x11f>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101c88:	c7 44 24 08 35 39 10 	movl   $0x103935,0x8(%esp)
  101c8f:	00 
  101c90:	c7 44 24 04 ae 00 00 	movl   $0xae,0x4(%esp)
  101c97:	00 
  101c98:	c7 04 24 45 39 10 00 	movl   $0x103945,(%esp)
  101c9f:	e8 03 f0 ff ff       	call   100ca7 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101ca4:	8b 45 08             	mov    0x8(%ebp),%eax
  101ca7:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101cab:	0f b7 c0             	movzwl %ax,%eax
  101cae:	83 e0 03             	and    $0x3,%eax
  101cb1:	85 c0                	test   %eax,%eax
  101cb3:	75 28                	jne    101cdd <trap_dispatch+0x11f>
            print_trapframe(tf);
  101cb5:	8b 45 08             	mov    0x8(%ebp),%eax
  101cb8:	89 04 24             	mov    %eax,(%esp)
  101cbb:	e8 82 fc ff ff       	call   101942 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101cc0:	c7 44 24 08 56 39 10 	movl   $0x103956,0x8(%esp)
  101cc7:	00 
  101cc8:	c7 44 24 04 b8 00 00 	movl   $0xb8,0x4(%esp)
  101ccf:	00 
  101cd0:	c7 04 24 45 39 10 00 	movl   $0x103945,(%esp)
  101cd7:	e8 cb ef ff ff       	call   100ca7 <__panic>
        panic("T_SWITCH_** ??\n");
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101cdc:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101cdd:	c9                   	leave  
  101cde:	c3                   	ret    

00101cdf <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101cdf:	55                   	push   %ebp
  101ce0:	89 e5                	mov    %esp,%ebp
  101ce2:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101ce5:	8b 45 08             	mov    0x8(%ebp),%eax
  101ce8:	89 04 24             	mov    %eax,(%esp)
  101ceb:	e8 ce fe ff ff       	call   101bbe <trap_dispatch>
}
  101cf0:	c9                   	leave  
  101cf1:	c3                   	ret    

00101cf2 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  101cf2:	1e                   	push   %ds
    pushl %es
  101cf3:	06                   	push   %es
    pushl %fs
  101cf4:	0f a0                	push   %fs
    pushl %gs
  101cf6:	0f a8                	push   %gs
    pushal
  101cf8:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  101cf9:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  101cfe:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  101d00:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  101d02:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  101d03:	e8 d7 ff ff ff       	call   101cdf <trap>

    # pop the pushed stack pointer
    popl %esp
  101d08:	5c                   	pop    %esp

00101d09 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  101d09:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  101d0a:	0f a9                	pop    %gs
    popl %fs
  101d0c:	0f a1                	pop    %fs
    popl %es
  101d0e:	07                   	pop    %es
    popl %ds
  101d0f:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  101d10:	83 c4 08             	add    $0x8,%esp
    iret
  101d13:	cf                   	iret   

00101d14 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101d14:	6a 00                	push   $0x0
  pushl $0
  101d16:	6a 00                	push   $0x0
  jmp __alltraps
  101d18:	e9 d5 ff ff ff       	jmp    101cf2 <__alltraps>

00101d1d <vector1>:
.globl vector1
vector1:
  pushl $0
  101d1d:	6a 00                	push   $0x0
  pushl $1
  101d1f:	6a 01                	push   $0x1
  jmp __alltraps
  101d21:	e9 cc ff ff ff       	jmp    101cf2 <__alltraps>

00101d26 <vector2>:
.globl vector2
vector2:
  pushl $0
  101d26:	6a 00                	push   $0x0
  pushl $2
  101d28:	6a 02                	push   $0x2
  jmp __alltraps
  101d2a:	e9 c3 ff ff ff       	jmp    101cf2 <__alltraps>

00101d2f <vector3>:
.globl vector3
vector3:
  pushl $0
  101d2f:	6a 00                	push   $0x0
  pushl $3
  101d31:	6a 03                	push   $0x3
  jmp __alltraps
  101d33:	e9 ba ff ff ff       	jmp    101cf2 <__alltraps>

00101d38 <vector4>:
.globl vector4
vector4:
  pushl $0
  101d38:	6a 00                	push   $0x0
  pushl $4
  101d3a:	6a 04                	push   $0x4
  jmp __alltraps
  101d3c:	e9 b1 ff ff ff       	jmp    101cf2 <__alltraps>

00101d41 <vector5>:
.globl vector5
vector5:
  pushl $0
  101d41:	6a 00                	push   $0x0
  pushl $5
  101d43:	6a 05                	push   $0x5
  jmp __alltraps
  101d45:	e9 a8 ff ff ff       	jmp    101cf2 <__alltraps>

00101d4a <vector6>:
.globl vector6
vector6:
  pushl $0
  101d4a:	6a 00                	push   $0x0
  pushl $6
  101d4c:	6a 06                	push   $0x6
  jmp __alltraps
  101d4e:	e9 9f ff ff ff       	jmp    101cf2 <__alltraps>

00101d53 <vector7>:
.globl vector7
vector7:
  pushl $0
  101d53:	6a 00                	push   $0x0
  pushl $7
  101d55:	6a 07                	push   $0x7
  jmp __alltraps
  101d57:	e9 96 ff ff ff       	jmp    101cf2 <__alltraps>

00101d5c <vector8>:
.globl vector8
vector8:
  pushl $8
  101d5c:	6a 08                	push   $0x8
  jmp __alltraps
  101d5e:	e9 8f ff ff ff       	jmp    101cf2 <__alltraps>

00101d63 <vector9>:
.globl vector9
vector9:
  pushl $0
  101d63:	6a 00                	push   $0x0
  pushl $9
  101d65:	6a 09                	push   $0x9
  jmp __alltraps
  101d67:	e9 86 ff ff ff       	jmp    101cf2 <__alltraps>

00101d6c <vector10>:
.globl vector10
vector10:
  pushl $10
  101d6c:	6a 0a                	push   $0xa
  jmp __alltraps
  101d6e:	e9 7f ff ff ff       	jmp    101cf2 <__alltraps>

00101d73 <vector11>:
.globl vector11
vector11:
  pushl $11
  101d73:	6a 0b                	push   $0xb
  jmp __alltraps
  101d75:	e9 78 ff ff ff       	jmp    101cf2 <__alltraps>

00101d7a <vector12>:
.globl vector12
vector12:
  pushl $12
  101d7a:	6a 0c                	push   $0xc
  jmp __alltraps
  101d7c:	e9 71 ff ff ff       	jmp    101cf2 <__alltraps>

00101d81 <vector13>:
.globl vector13
vector13:
  pushl $13
  101d81:	6a 0d                	push   $0xd
  jmp __alltraps
  101d83:	e9 6a ff ff ff       	jmp    101cf2 <__alltraps>

00101d88 <vector14>:
.globl vector14
vector14:
  pushl $14
  101d88:	6a 0e                	push   $0xe
  jmp __alltraps
  101d8a:	e9 63 ff ff ff       	jmp    101cf2 <__alltraps>

00101d8f <vector15>:
.globl vector15
vector15:
  pushl $0
  101d8f:	6a 00                	push   $0x0
  pushl $15
  101d91:	6a 0f                	push   $0xf
  jmp __alltraps
  101d93:	e9 5a ff ff ff       	jmp    101cf2 <__alltraps>

00101d98 <vector16>:
.globl vector16
vector16:
  pushl $0
  101d98:	6a 00                	push   $0x0
  pushl $16
  101d9a:	6a 10                	push   $0x10
  jmp __alltraps
  101d9c:	e9 51 ff ff ff       	jmp    101cf2 <__alltraps>

00101da1 <vector17>:
.globl vector17
vector17:
  pushl $17
  101da1:	6a 11                	push   $0x11
  jmp __alltraps
  101da3:	e9 4a ff ff ff       	jmp    101cf2 <__alltraps>

00101da8 <vector18>:
.globl vector18
vector18:
  pushl $0
  101da8:	6a 00                	push   $0x0
  pushl $18
  101daa:	6a 12                	push   $0x12
  jmp __alltraps
  101dac:	e9 41 ff ff ff       	jmp    101cf2 <__alltraps>

00101db1 <vector19>:
.globl vector19
vector19:
  pushl $0
  101db1:	6a 00                	push   $0x0
  pushl $19
  101db3:	6a 13                	push   $0x13
  jmp __alltraps
  101db5:	e9 38 ff ff ff       	jmp    101cf2 <__alltraps>

00101dba <vector20>:
.globl vector20
vector20:
  pushl $0
  101dba:	6a 00                	push   $0x0
  pushl $20
  101dbc:	6a 14                	push   $0x14
  jmp __alltraps
  101dbe:	e9 2f ff ff ff       	jmp    101cf2 <__alltraps>

00101dc3 <vector21>:
.globl vector21
vector21:
  pushl $0
  101dc3:	6a 00                	push   $0x0
  pushl $21
  101dc5:	6a 15                	push   $0x15
  jmp __alltraps
  101dc7:	e9 26 ff ff ff       	jmp    101cf2 <__alltraps>

00101dcc <vector22>:
.globl vector22
vector22:
  pushl $0
  101dcc:	6a 00                	push   $0x0
  pushl $22
  101dce:	6a 16                	push   $0x16
  jmp __alltraps
  101dd0:	e9 1d ff ff ff       	jmp    101cf2 <__alltraps>

00101dd5 <vector23>:
.globl vector23
vector23:
  pushl $0
  101dd5:	6a 00                	push   $0x0
  pushl $23
  101dd7:	6a 17                	push   $0x17
  jmp __alltraps
  101dd9:	e9 14 ff ff ff       	jmp    101cf2 <__alltraps>

00101dde <vector24>:
.globl vector24
vector24:
  pushl $0
  101dde:	6a 00                	push   $0x0
  pushl $24
  101de0:	6a 18                	push   $0x18
  jmp __alltraps
  101de2:	e9 0b ff ff ff       	jmp    101cf2 <__alltraps>

00101de7 <vector25>:
.globl vector25
vector25:
  pushl $0
  101de7:	6a 00                	push   $0x0
  pushl $25
  101de9:	6a 19                	push   $0x19
  jmp __alltraps
  101deb:	e9 02 ff ff ff       	jmp    101cf2 <__alltraps>

00101df0 <vector26>:
.globl vector26
vector26:
  pushl $0
  101df0:	6a 00                	push   $0x0
  pushl $26
  101df2:	6a 1a                	push   $0x1a
  jmp __alltraps
  101df4:	e9 f9 fe ff ff       	jmp    101cf2 <__alltraps>

00101df9 <vector27>:
.globl vector27
vector27:
  pushl $0
  101df9:	6a 00                	push   $0x0
  pushl $27
  101dfb:	6a 1b                	push   $0x1b
  jmp __alltraps
  101dfd:	e9 f0 fe ff ff       	jmp    101cf2 <__alltraps>

00101e02 <vector28>:
.globl vector28
vector28:
  pushl $0
  101e02:	6a 00                	push   $0x0
  pushl $28
  101e04:	6a 1c                	push   $0x1c
  jmp __alltraps
  101e06:	e9 e7 fe ff ff       	jmp    101cf2 <__alltraps>

00101e0b <vector29>:
.globl vector29
vector29:
  pushl $0
  101e0b:	6a 00                	push   $0x0
  pushl $29
  101e0d:	6a 1d                	push   $0x1d
  jmp __alltraps
  101e0f:	e9 de fe ff ff       	jmp    101cf2 <__alltraps>

00101e14 <vector30>:
.globl vector30
vector30:
  pushl $0
  101e14:	6a 00                	push   $0x0
  pushl $30
  101e16:	6a 1e                	push   $0x1e
  jmp __alltraps
  101e18:	e9 d5 fe ff ff       	jmp    101cf2 <__alltraps>

00101e1d <vector31>:
.globl vector31
vector31:
  pushl $0
  101e1d:	6a 00                	push   $0x0
  pushl $31
  101e1f:	6a 1f                	push   $0x1f
  jmp __alltraps
  101e21:	e9 cc fe ff ff       	jmp    101cf2 <__alltraps>

00101e26 <vector32>:
.globl vector32
vector32:
  pushl $0
  101e26:	6a 00                	push   $0x0
  pushl $32
  101e28:	6a 20                	push   $0x20
  jmp __alltraps
  101e2a:	e9 c3 fe ff ff       	jmp    101cf2 <__alltraps>

00101e2f <vector33>:
.globl vector33
vector33:
  pushl $0
  101e2f:	6a 00                	push   $0x0
  pushl $33
  101e31:	6a 21                	push   $0x21
  jmp __alltraps
  101e33:	e9 ba fe ff ff       	jmp    101cf2 <__alltraps>

00101e38 <vector34>:
.globl vector34
vector34:
  pushl $0
  101e38:	6a 00                	push   $0x0
  pushl $34
  101e3a:	6a 22                	push   $0x22
  jmp __alltraps
  101e3c:	e9 b1 fe ff ff       	jmp    101cf2 <__alltraps>

00101e41 <vector35>:
.globl vector35
vector35:
  pushl $0
  101e41:	6a 00                	push   $0x0
  pushl $35
  101e43:	6a 23                	push   $0x23
  jmp __alltraps
  101e45:	e9 a8 fe ff ff       	jmp    101cf2 <__alltraps>

00101e4a <vector36>:
.globl vector36
vector36:
  pushl $0
  101e4a:	6a 00                	push   $0x0
  pushl $36
  101e4c:	6a 24                	push   $0x24
  jmp __alltraps
  101e4e:	e9 9f fe ff ff       	jmp    101cf2 <__alltraps>

00101e53 <vector37>:
.globl vector37
vector37:
  pushl $0
  101e53:	6a 00                	push   $0x0
  pushl $37
  101e55:	6a 25                	push   $0x25
  jmp __alltraps
  101e57:	e9 96 fe ff ff       	jmp    101cf2 <__alltraps>

00101e5c <vector38>:
.globl vector38
vector38:
  pushl $0
  101e5c:	6a 00                	push   $0x0
  pushl $38
  101e5e:	6a 26                	push   $0x26
  jmp __alltraps
  101e60:	e9 8d fe ff ff       	jmp    101cf2 <__alltraps>

00101e65 <vector39>:
.globl vector39
vector39:
  pushl $0
  101e65:	6a 00                	push   $0x0
  pushl $39
  101e67:	6a 27                	push   $0x27
  jmp __alltraps
  101e69:	e9 84 fe ff ff       	jmp    101cf2 <__alltraps>

00101e6e <vector40>:
.globl vector40
vector40:
  pushl $0
  101e6e:	6a 00                	push   $0x0
  pushl $40
  101e70:	6a 28                	push   $0x28
  jmp __alltraps
  101e72:	e9 7b fe ff ff       	jmp    101cf2 <__alltraps>

00101e77 <vector41>:
.globl vector41
vector41:
  pushl $0
  101e77:	6a 00                	push   $0x0
  pushl $41
  101e79:	6a 29                	push   $0x29
  jmp __alltraps
  101e7b:	e9 72 fe ff ff       	jmp    101cf2 <__alltraps>

00101e80 <vector42>:
.globl vector42
vector42:
  pushl $0
  101e80:	6a 00                	push   $0x0
  pushl $42
  101e82:	6a 2a                	push   $0x2a
  jmp __alltraps
  101e84:	e9 69 fe ff ff       	jmp    101cf2 <__alltraps>

00101e89 <vector43>:
.globl vector43
vector43:
  pushl $0
  101e89:	6a 00                	push   $0x0
  pushl $43
  101e8b:	6a 2b                	push   $0x2b
  jmp __alltraps
  101e8d:	e9 60 fe ff ff       	jmp    101cf2 <__alltraps>

00101e92 <vector44>:
.globl vector44
vector44:
  pushl $0
  101e92:	6a 00                	push   $0x0
  pushl $44
  101e94:	6a 2c                	push   $0x2c
  jmp __alltraps
  101e96:	e9 57 fe ff ff       	jmp    101cf2 <__alltraps>

00101e9b <vector45>:
.globl vector45
vector45:
  pushl $0
  101e9b:	6a 00                	push   $0x0
  pushl $45
  101e9d:	6a 2d                	push   $0x2d
  jmp __alltraps
  101e9f:	e9 4e fe ff ff       	jmp    101cf2 <__alltraps>

00101ea4 <vector46>:
.globl vector46
vector46:
  pushl $0
  101ea4:	6a 00                	push   $0x0
  pushl $46
  101ea6:	6a 2e                	push   $0x2e
  jmp __alltraps
  101ea8:	e9 45 fe ff ff       	jmp    101cf2 <__alltraps>

00101ead <vector47>:
.globl vector47
vector47:
  pushl $0
  101ead:	6a 00                	push   $0x0
  pushl $47
  101eaf:	6a 2f                	push   $0x2f
  jmp __alltraps
  101eb1:	e9 3c fe ff ff       	jmp    101cf2 <__alltraps>

00101eb6 <vector48>:
.globl vector48
vector48:
  pushl $0
  101eb6:	6a 00                	push   $0x0
  pushl $48
  101eb8:	6a 30                	push   $0x30
  jmp __alltraps
  101eba:	e9 33 fe ff ff       	jmp    101cf2 <__alltraps>

00101ebf <vector49>:
.globl vector49
vector49:
  pushl $0
  101ebf:	6a 00                	push   $0x0
  pushl $49
  101ec1:	6a 31                	push   $0x31
  jmp __alltraps
  101ec3:	e9 2a fe ff ff       	jmp    101cf2 <__alltraps>

00101ec8 <vector50>:
.globl vector50
vector50:
  pushl $0
  101ec8:	6a 00                	push   $0x0
  pushl $50
  101eca:	6a 32                	push   $0x32
  jmp __alltraps
  101ecc:	e9 21 fe ff ff       	jmp    101cf2 <__alltraps>

00101ed1 <vector51>:
.globl vector51
vector51:
  pushl $0
  101ed1:	6a 00                	push   $0x0
  pushl $51
  101ed3:	6a 33                	push   $0x33
  jmp __alltraps
  101ed5:	e9 18 fe ff ff       	jmp    101cf2 <__alltraps>

00101eda <vector52>:
.globl vector52
vector52:
  pushl $0
  101eda:	6a 00                	push   $0x0
  pushl $52
  101edc:	6a 34                	push   $0x34
  jmp __alltraps
  101ede:	e9 0f fe ff ff       	jmp    101cf2 <__alltraps>

00101ee3 <vector53>:
.globl vector53
vector53:
  pushl $0
  101ee3:	6a 00                	push   $0x0
  pushl $53
  101ee5:	6a 35                	push   $0x35
  jmp __alltraps
  101ee7:	e9 06 fe ff ff       	jmp    101cf2 <__alltraps>

00101eec <vector54>:
.globl vector54
vector54:
  pushl $0
  101eec:	6a 00                	push   $0x0
  pushl $54
  101eee:	6a 36                	push   $0x36
  jmp __alltraps
  101ef0:	e9 fd fd ff ff       	jmp    101cf2 <__alltraps>

00101ef5 <vector55>:
.globl vector55
vector55:
  pushl $0
  101ef5:	6a 00                	push   $0x0
  pushl $55
  101ef7:	6a 37                	push   $0x37
  jmp __alltraps
  101ef9:	e9 f4 fd ff ff       	jmp    101cf2 <__alltraps>

00101efe <vector56>:
.globl vector56
vector56:
  pushl $0
  101efe:	6a 00                	push   $0x0
  pushl $56
  101f00:	6a 38                	push   $0x38
  jmp __alltraps
  101f02:	e9 eb fd ff ff       	jmp    101cf2 <__alltraps>

00101f07 <vector57>:
.globl vector57
vector57:
  pushl $0
  101f07:	6a 00                	push   $0x0
  pushl $57
  101f09:	6a 39                	push   $0x39
  jmp __alltraps
  101f0b:	e9 e2 fd ff ff       	jmp    101cf2 <__alltraps>

00101f10 <vector58>:
.globl vector58
vector58:
  pushl $0
  101f10:	6a 00                	push   $0x0
  pushl $58
  101f12:	6a 3a                	push   $0x3a
  jmp __alltraps
  101f14:	e9 d9 fd ff ff       	jmp    101cf2 <__alltraps>

00101f19 <vector59>:
.globl vector59
vector59:
  pushl $0
  101f19:	6a 00                	push   $0x0
  pushl $59
  101f1b:	6a 3b                	push   $0x3b
  jmp __alltraps
  101f1d:	e9 d0 fd ff ff       	jmp    101cf2 <__alltraps>

00101f22 <vector60>:
.globl vector60
vector60:
  pushl $0
  101f22:	6a 00                	push   $0x0
  pushl $60
  101f24:	6a 3c                	push   $0x3c
  jmp __alltraps
  101f26:	e9 c7 fd ff ff       	jmp    101cf2 <__alltraps>

00101f2b <vector61>:
.globl vector61
vector61:
  pushl $0
  101f2b:	6a 00                	push   $0x0
  pushl $61
  101f2d:	6a 3d                	push   $0x3d
  jmp __alltraps
  101f2f:	e9 be fd ff ff       	jmp    101cf2 <__alltraps>

00101f34 <vector62>:
.globl vector62
vector62:
  pushl $0
  101f34:	6a 00                	push   $0x0
  pushl $62
  101f36:	6a 3e                	push   $0x3e
  jmp __alltraps
  101f38:	e9 b5 fd ff ff       	jmp    101cf2 <__alltraps>

00101f3d <vector63>:
.globl vector63
vector63:
  pushl $0
  101f3d:	6a 00                	push   $0x0
  pushl $63
  101f3f:	6a 3f                	push   $0x3f
  jmp __alltraps
  101f41:	e9 ac fd ff ff       	jmp    101cf2 <__alltraps>

00101f46 <vector64>:
.globl vector64
vector64:
  pushl $0
  101f46:	6a 00                	push   $0x0
  pushl $64
  101f48:	6a 40                	push   $0x40
  jmp __alltraps
  101f4a:	e9 a3 fd ff ff       	jmp    101cf2 <__alltraps>

00101f4f <vector65>:
.globl vector65
vector65:
  pushl $0
  101f4f:	6a 00                	push   $0x0
  pushl $65
  101f51:	6a 41                	push   $0x41
  jmp __alltraps
  101f53:	e9 9a fd ff ff       	jmp    101cf2 <__alltraps>

00101f58 <vector66>:
.globl vector66
vector66:
  pushl $0
  101f58:	6a 00                	push   $0x0
  pushl $66
  101f5a:	6a 42                	push   $0x42
  jmp __alltraps
  101f5c:	e9 91 fd ff ff       	jmp    101cf2 <__alltraps>

00101f61 <vector67>:
.globl vector67
vector67:
  pushl $0
  101f61:	6a 00                	push   $0x0
  pushl $67
  101f63:	6a 43                	push   $0x43
  jmp __alltraps
  101f65:	e9 88 fd ff ff       	jmp    101cf2 <__alltraps>

00101f6a <vector68>:
.globl vector68
vector68:
  pushl $0
  101f6a:	6a 00                	push   $0x0
  pushl $68
  101f6c:	6a 44                	push   $0x44
  jmp __alltraps
  101f6e:	e9 7f fd ff ff       	jmp    101cf2 <__alltraps>

00101f73 <vector69>:
.globl vector69
vector69:
  pushl $0
  101f73:	6a 00                	push   $0x0
  pushl $69
  101f75:	6a 45                	push   $0x45
  jmp __alltraps
  101f77:	e9 76 fd ff ff       	jmp    101cf2 <__alltraps>

00101f7c <vector70>:
.globl vector70
vector70:
  pushl $0
  101f7c:	6a 00                	push   $0x0
  pushl $70
  101f7e:	6a 46                	push   $0x46
  jmp __alltraps
  101f80:	e9 6d fd ff ff       	jmp    101cf2 <__alltraps>

00101f85 <vector71>:
.globl vector71
vector71:
  pushl $0
  101f85:	6a 00                	push   $0x0
  pushl $71
  101f87:	6a 47                	push   $0x47
  jmp __alltraps
  101f89:	e9 64 fd ff ff       	jmp    101cf2 <__alltraps>

00101f8e <vector72>:
.globl vector72
vector72:
  pushl $0
  101f8e:	6a 00                	push   $0x0
  pushl $72
  101f90:	6a 48                	push   $0x48
  jmp __alltraps
  101f92:	e9 5b fd ff ff       	jmp    101cf2 <__alltraps>

00101f97 <vector73>:
.globl vector73
vector73:
  pushl $0
  101f97:	6a 00                	push   $0x0
  pushl $73
  101f99:	6a 49                	push   $0x49
  jmp __alltraps
  101f9b:	e9 52 fd ff ff       	jmp    101cf2 <__alltraps>

00101fa0 <vector74>:
.globl vector74
vector74:
  pushl $0
  101fa0:	6a 00                	push   $0x0
  pushl $74
  101fa2:	6a 4a                	push   $0x4a
  jmp __alltraps
  101fa4:	e9 49 fd ff ff       	jmp    101cf2 <__alltraps>

00101fa9 <vector75>:
.globl vector75
vector75:
  pushl $0
  101fa9:	6a 00                	push   $0x0
  pushl $75
  101fab:	6a 4b                	push   $0x4b
  jmp __alltraps
  101fad:	e9 40 fd ff ff       	jmp    101cf2 <__alltraps>

00101fb2 <vector76>:
.globl vector76
vector76:
  pushl $0
  101fb2:	6a 00                	push   $0x0
  pushl $76
  101fb4:	6a 4c                	push   $0x4c
  jmp __alltraps
  101fb6:	e9 37 fd ff ff       	jmp    101cf2 <__alltraps>

00101fbb <vector77>:
.globl vector77
vector77:
  pushl $0
  101fbb:	6a 00                	push   $0x0
  pushl $77
  101fbd:	6a 4d                	push   $0x4d
  jmp __alltraps
  101fbf:	e9 2e fd ff ff       	jmp    101cf2 <__alltraps>

00101fc4 <vector78>:
.globl vector78
vector78:
  pushl $0
  101fc4:	6a 00                	push   $0x0
  pushl $78
  101fc6:	6a 4e                	push   $0x4e
  jmp __alltraps
  101fc8:	e9 25 fd ff ff       	jmp    101cf2 <__alltraps>

00101fcd <vector79>:
.globl vector79
vector79:
  pushl $0
  101fcd:	6a 00                	push   $0x0
  pushl $79
  101fcf:	6a 4f                	push   $0x4f
  jmp __alltraps
  101fd1:	e9 1c fd ff ff       	jmp    101cf2 <__alltraps>

00101fd6 <vector80>:
.globl vector80
vector80:
  pushl $0
  101fd6:	6a 00                	push   $0x0
  pushl $80
  101fd8:	6a 50                	push   $0x50
  jmp __alltraps
  101fda:	e9 13 fd ff ff       	jmp    101cf2 <__alltraps>

00101fdf <vector81>:
.globl vector81
vector81:
  pushl $0
  101fdf:	6a 00                	push   $0x0
  pushl $81
  101fe1:	6a 51                	push   $0x51
  jmp __alltraps
  101fe3:	e9 0a fd ff ff       	jmp    101cf2 <__alltraps>

00101fe8 <vector82>:
.globl vector82
vector82:
  pushl $0
  101fe8:	6a 00                	push   $0x0
  pushl $82
  101fea:	6a 52                	push   $0x52
  jmp __alltraps
  101fec:	e9 01 fd ff ff       	jmp    101cf2 <__alltraps>

00101ff1 <vector83>:
.globl vector83
vector83:
  pushl $0
  101ff1:	6a 00                	push   $0x0
  pushl $83
  101ff3:	6a 53                	push   $0x53
  jmp __alltraps
  101ff5:	e9 f8 fc ff ff       	jmp    101cf2 <__alltraps>

00101ffa <vector84>:
.globl vector84
vector84:
  pushl $0
  101ffa:	6a 00                	push   $0x0
  pushl $84
  101ffc:	6a 54                	push   $0x54
  jmp __alltraps
  101ffe:	e9 ef fc ff ff       	jmp    101cf2 <__alltraps>

00102003 <vector85>:
.globl vector85
vector85:
  pushl $0
  102003:	6a 00                	push   $0x0
  pushl $85
  102005:	6a 55                	push   $0x55
  jmp __alltraps
  102007:	e9 e6 fc ff ff       	jmp    101cf2 <__alltraps>

0010200c <vector86>:
.globl vector86
vector86:
  pushl $0
  10200c:	6a 00                	push   $0x0
  pushl $86
  10200e:	6a 56                	push   $0x56
  jmp __alltraps
  102010:	e9 dd fc ff ff       	jmp    101cf2 <__alltraps>

00102015 <vector87>:
.globl vector87
vector87:
  pushl $0
  102015:	6a 00                	push   $0x0
  pushl $87
  102017:	6a 57                	push   $0x57
  jmp __alltraps
  102019:	e9 d4 fc ff ff       	jmp    101cf2 <__alltraps>

0010201e <vector88>:
.globl vector88
vector88:
  pushl $0
  10201e:	6a 00                	push   $0x0
  pushl $88
  102020:	6a 58                	push   $0x58
  jmp __alltraps
  102022:	e9 cb fc ff ff       	jmp    101cf2 <__alltraps>

00102027 <vector89>:
.globl vector89
vector89:
  pushl $0
  102027:	6a 00                	push   $0x0
  pushl $89
  102029:	6a 59                	push   $0x59
  jmp __alltraps
  10202b:	e9 c2 fc ff ff       	jmp    101cf2 <__alltraps>

00102030 <vector90>:
.globl vector90
vector90:
  pushl $0
  102030:	6a 00                	push   $0x0
  pushl $90
  102032:	6a 5a                	push   $0x5a
  jmp __alltraps
  102034:	e9 b9 fc ff ff       	jmp    101cf2 <__alltraps>

00102039 <vector91>:
.globl vector91
vector91:
  pushl $0
  102039:	6a 00                	push   $0x0
  pushl $91
  10203b:	6a 5b                	push   $0x5b
  jmp __alltraps
  10203d:	e9 b0 fc ff ff       	jmp    101cf2 <__alltraps>

00102042 <vector92>:
.globl vector92
vector92:
  pushl $0
  102042:	6a 00                	push   $0x0
  pushl $92
  102044:	6a 5c                	push   $0x5c
  jmp __alltraps
  102046:	e9 a7 fc ff ff       	jmp    101cf2 <__alltraps>

0010204b <vector93>:
.globl vector93
vector93:
  pushl $0
  10204b:	6a 00                	push   $0x0
  pushl $93
  10204d:	6a 5d                	push   $0x5d
  jmp __alltraps
  10204f:	e9 9e fc ff ff       	jmp    101cf2 <__alltraps>

00102054 <vector94>:
.globl vector94
vector94:
  pushl $0
  102054:	6a 00                	push   $0x0
  pushl $94
  102056:	6a 5e                	push   $0x5e
  jmp __alltraps
  102058:	e9 95 fc ff ff       	jmp    101cf2 <__alltraps>

0010205d <vector95>:
.globl vector95
vector95:
  pushl $0
  10205d:	6a 00                	push   $0x0
  pushl $95
  10205f:	6a 5f                	push   $0x5f
  jmp __alltraps
  102061:	e9 8c fc ff ff       	jmp    101cf2 <__alltraps>

00102066 <vector96>:
.globl vector96
vector96:
  pushl $0
  102066:	6a 00                	push   $0x0
  pushl $96
  102068:	6a 60                	push   $0x60
  jmp __alltraps
  10206a:	e9 83 fc ff ff       	jmp    101cf2 <__alltraps>

0010206f <vector97>:
.globl vector97
vector97:
  pushl $0
  10206f:	6a 00                	push   $0x0
  pushl $97
  102071:	6a 61                	push   $0x61
  jmp __alltraps
  102073:	e9 7a fc ff ff       	jmp    101cf2 <__alltraps>

00102078 <vector98>:
.globl vector98
vector98:
  pushl $0
  102078:	6a 00                	push   $0x0
  pushl $98
  10207a:	6a 62                	push   $0x62
  jmp __alltraps
  10207c:	e9 71 fc ff ff       	jmp    101cf2 <__alltraps>

00102081 <vector99>:
.globl vector99
vector99:
  pushl $0
  102081:	6a 00                	push   $0x0
  pushl $99
  102083:	6a 63                	push   $0x63
  jmp __alltraps
  102085:	e9 68 fc ff ff       	jmp    101cf2 <__alltraps>

0010208a <vector100>:
.globl vector100
vector100:
  pushl $0
  10208a:	6a 00                	push   $0x0
  pushl $100
  10208c:	6a 64                	push   $0x64
  jmp __alltraps
  10208e:	e9 5f fc ff ff       	jmp    101cf2 <__alltraps>

00102093 <vector101>:
.globl vector101
vector101:
  pushl $0
  102093:	6a 00                	push   $0x0
  pushl $101
  102095:	6a 65                	push   $0x65
  jmp __alltraps
  102097:	e9 56 fc ff ff       	jmp    101cf2 <__alltraps>

0010209c <vector102>:
.globl vector102
vector102:
  pushl $0
  10209c:	6a 00                	push   $0x0
  pushl $102
  10209e:	6a 66                	push   $0x66
  jmp __alltraps
  1020a0:	e9 4d fc ff ff       	jmp    101cf2 <__alltraps>

001020a5 <vector103>:
.globl vector103
vector103:
  pushl $0
  1020a5:	6a 00                	push   $0x0
  pushl $103
  1020a7:	6a 67                	push   $0x67
  jmp __alltraps
  1020a9:	e9 44 fc ff ff       	jmp    101cf2 <__alltraps>

001020ae <vector104>:
.globl vector104
vector104:
  pushl $0
  1020ae:	6a 00                	push   $0x0
  pushl $104
  1020b0:	6a 68                	push   $0x68
  jmp __alltraps
  1020b2:	e9 3b fc ff ff       	jmp    101cf2 <__alltraps>

001020b7 <vector105>:
.globl vector105
vector105:
  pushl $0
  1020b7:	6a 00                	push   $0x0
  pushl $105
  1020b9:	6a 69                	push   $0x69
  jmp __alltraps
  1020bb:	e9 32 fc ff ff       	jmp    101cf2 <__alltraps>

001020c0 <vector106>:
.globl vector106
vector106:
  pushl $0
  1020c0:	6a 00                	push   $0x0
  pushl $106
  1020c2:	6a 6a                	push   $0x6a
  jmp __alltraps
  1020c4:	e9 29 fc ff ff       	jmp    101cf2 <__alltraps>

001020c9 <vector107>:
.globl vector107
vector107:
  pushl $0
  1020c9:	6a 00                	push   $0x0
  pushl $107
  1020cb:	6a 6b                	push   $0x6b
  jmp __alltraps
  1020cd:	e9 20 fc ff ff       	jmp    101cf2 <__alltraps>

001020d2 <vector108>:
.globl vector108
vector108:
  pushl $0
  1020d2:	6a 00                	push   $0x0
  pushl $108
  1020d4:	6a 6c                	push   $0x6c
  jmp __alltraps
  1020d6:	e9 17 fc ff ff       	jmp    101cf2 <__alltraps>

001020db <vector109>:
.globl vector109
vector109:
  pushl $0
  1020db:	6a 00                	push   $0x0
  pushl $109
  1020dd:	6a 6d                	push   $0x6d
  jmp __alltraps
  1020df:	e9 0e fc ff ff       	jmp    101cf2 <__alltraps>

001020e4 <vector110>:
.globl vector110
vector110:
  pushl $0
  1020e4:	6a 00                	push   $0x0
  pushl $110
  1020e6:	6a 6e                	push   $0x6e
  jmp __alltraps
  1020e8:	e9 05 fc ff ff       	jmp    101cf2 <__alltraps>

001020ed <vector111>:
.globl vector111
vector111:
  pushl $0
  1020ed:	6a 00                	push   $0x0
  pushl $111
  1020ef:	6a 6f                	push   $0x6f
  jmp __alltraps
  1020f1:	e9 fc fb ff ff       	jmp    101cf2 <__alltraps>

001020f6 <vector112>:
.globl vector112
vector112:
  pushl $0
  1020f6:	6a 00                	push   $0x0
  pushl $112
  1020f8:	6a 70                	push   $0x70
  jmp __alltraps
  1020fa:	e9 f3 fb ff ff       	jmp    101cf2 <__alltraps>

001020ff <vector113>:
.globl vector113
vector113:
  pushl $0
  1020ff:	6a 00                	push   $0x0
  pushl $113
  102101:	6a 71                	push   $0x71
  jmp __alltraps
  102103:	e9 ea fb ff ff       	jmp    101cf2 <__alltraps>

00102108 <vector114>:
.globl vector114
vector114:
  pushl $0
  102108:	6a 00                	push   $0x0
  pushl $114
  10210a:	6a 72                	push   $0x72
  jmp __alltraps
  10210c:	e9 e1 fb ff ff       	jmp    101cf2 <__alltraps>

00102111 <vector115>:
.globl vector115
vector115:
  pushl $0
  102111:	6a 00                	push   $0x0
  pushl $115
  102113:	6a 73                	push   $0x73
  jmp __alltraps
  102115:	e9 d8 fb ff ff       	jmp    101cf2 <__alltraps>

0010211a <vector116>:
.globl vector116
vector116:
  pushl $0
  10211a:	6a 00                	push   $0x0
  pushl $116
  10211c:	6a 74                	push   $0x74
  jmp __alltraps
  10211e:	e9 cf fb ff ff       	jmp    101cf2 <__alltraps>

00102123 <vector117>:
.globl vector117
vector117:
  pushl $0
  102123:	6a 00                	push   $0x0
  pushl $117
  102125:	6a 75                	push   $0x75
  jmp __alltraps
  102127:	e9 c6 fb ff ff       	jmp    101cf2 <__alltraps>

0010212c <vector118>:
.globl vector118
vector118:
  pushl $0
  10212c:	6a 00                	push   $0x0
  pushl $118
  10212e:	6a 76                	push   $0x76
  jmp __alltraps
  102130:	e9 bd fb ff ff       	jmp    101cf2 <__alltraps>

00102135 <vector119>:
.globl vector119
vector119:
  pushl $0
  102135:	6a 00                	push   $0x0
  pushl $119
  102137:	6a 77                	push   $0x77
  jmp __alltraps
  102139:	e9 b4 fb ff ff       	jmp    101cf2 <__alltraps>

0010213e <vector120>:
.globl vector120
vector120:
  pushl $0
  10213e:	6a 00                	push   $0x0
  pushl $120
  102140:	6a 78                	push   $0x78
  jmp __alltraps
  102142:	e9 ab fb ff ff       	jmp    101cf2 <__alltraps>

00102147 <vector121>:
.globl vector121
vector121:
  pushl $0
  102147:	6a 00                	push   $0x0
  pushl $121
  102149:	6a 79                	push   $0x79
  jmp __alltraps
  10214b:	e9 a2 fb ff ff       	jmp    101cf2 <__alltraps>

00102150 <vector122>:
.globl vector122
vector122:
  pushl $0
  102150:	6a 00                	push   $0x0
  pushl $122
  102152:	6a 7a                	push   $0x7a
  jmp __alltraps
  102154:	e9 99 fb ff ff       	jmp    101cf2 <__alltraps>

00102159 <vector123>:
.globl vector123
vector123:
  pushl $0
  102159:	6a 00                	push   $0x0
  pushl $123
  10215b:	6a 7b                	push   $0x7b
  jmp __alltraps
  10215d:	e9 90 fb ff ff       	jmp    101cf2 <__alltraps>

00102162 <vector124>:
.globl vector124
vector124:
  pushl $0
  102162:	6a 00                	push   $0x0
  pushl $124
  102164:	6a 7c                	push   $0x7c
  jmp __alltraps
  102166:	e9 87 fb ff ff       	jmp    101cf2 <__alltraps>

0010216b <vector125>:
.globl vector125
vector125:
  pushl $0
  10216b:	6a 00                	push   $0x0
  pushl $125
  10216d:	6a 7d                	push   $0x7d
  jmp __alltraps
  10216f:	e9 7e fb ff ff       	jmp    101cf2 <__alltraps>

00102174 <vector126>:
.globl vector126
vector126:
  pushl $0
  102174:	6a 00                	push   $0x0
  pushl $126
  102176:	6a 7e                	push   $0x7e
  jmp __alltraps
  102178:	e9 75 fb ff ff       	jmp    101cf2 <__alltraps>

0010217d <vector127>:
.globl vector127
vector127:
  pushl $0
  10217d:	6a 00                	push   $0x0
  pushl $127
  10217f:	6a 7f                	push   $0x7f
  jmp __alltraps
  102181:	e9 6c fb ff ff       	jmp    101cf2 <__alltraps>

00102186 <vector128>:
.globl vector128
vector128:
  pushl $0
  102186:	6a 00                	push   $0x0
  pushl $128
  102188:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  10218d:	e9 60 fb ff ff       	jmp    101cf2 <__alltraps>

00102192 <vector129>:
.globl vector129
vector129:
  pushl $0
  102192:	6a 00                	push   $0x0
  pushl $129
  102194:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  102199:	e9 54 fb ff ff       	jmp    101cf2 <__alltraps>

0010219e <vector130>:
.globl vector130
vector130:
  pushl $0
  10219e:	6a 00                	push   $0x0
  pushl $130
  1021a0:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  1021a5:	e9 48 fb ff ff       	jmp    101cf2 <__alltraps>

001021aa <vector131>:
.globl vector131
vector131:
  pushl $0
  1021aa:	6a 00                	push   $0x0
  pushl $131
  1021ac:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  1021b1:	e9 3c fb ff ff       	jmp    101cf2 <__alltraps>

001021b6 <vector132>:
.globl vector132
vector132:
  pushl $0
  1021b6:	6a 00                	push   $0x0
  pushl $132
  1021b8:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  1021bd:	e9 30 fb ff ff       	jmp    101cf2 <__alltraps>

001021c2 <vector133>:
.globl vector133
vector133:
  pushl $0
  1021c2:	6a 00                	push   $0x0
  pushl $133
  1021c4:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  1021c9:	e9 24 fb ff ff       	jmp    101cf2 <__alltraps>

001021ce <vector134>:
.globl vector134
vector134:
  pushl $0
  1021ce:	6a 00                	push   $0x0
  pushl $134
  1021d0:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  1021d5:	e9 18 fb ff ff       	jmp    101cf2 <__alltraps>

001021da <vector135>:
.globl vector135
vector135:
  pushl $0
  1021da:	6a 00                	push   $0x0
  pushl $135
  1021dc:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  1021e1:	e9 0c fb ff ff       	jmp    101cf2 <__alltraps>

001021e6 <vector136>:
.globl vector136
vector136:
  pushl $0
  1021e6:	6a 00                	push   $0x0
  pushl $136
  1021e8:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  1021ed:	e9 00 fb ff ff       	jmp    101cf2 <__alltraps>

001021f2 <vector137>:
.globl vector137
vector137:
  pushl $0
  1021f2:	6a 00                	push   $0x0
  pushl $137
  1021f4:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1021f9:	e9 f4 fa ff ff       	jmp    101cf2 <__alltraps>

001021fe <vector138>:
.globl vector138
vector138:
  pushl $0
  1021fe:	6a 00                	push   $0x0
  pushl $138
  102200:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  102205:	e9 e8 fa ff ff       	jmp    101cf2 <__alltraps>

0010220a <vector139>:
.globl vector139
vector139:
  pushl $0
  10220a:	6a 00                	push   $0x0
  pushl $139
  10220c:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  102211:	e9 dc fa ff ff       	jmp    101cf2 <__alltraps>

00102216 <vector140>:
.globl vector140
vector140:
  pushl $0
  102216:	6a 00                	push   $0x0
  pushl $140
  102218:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  10221d:	e9 d0 fa ff ff       	jmp    101cf2 <__alltraps>

00102222 <vector141>:
.globl vector141
vector141:
  pushl $0
  102222:	6a 00                	push   $0x0
  pushl $141
  102224:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  102229:	e9 c4 fa ff ff       	jmp    101cf2 <__alltraps>

0010222e <vector142>:
.globl vector142
vector142:
  pushl $0
  10222e:	6a 00                	push   $0x0
  pushl $142
  102230:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  102235:	e9 b8 fa ff ff       	jmp    101cf2 <__alltraps>

0010223a <vector143>:
.globl vector143
vector143:
  pushl $0
  10223a:	6a 00                	push   $0x0
  pushl $143
  10223c:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  102241:	e9 ac fa ff ff       	jmp    101cf2 <__alltraps>

00102246 <vector144>:
.globl vector144
vector144:
  pushl $0
  102246:	6a 00                	push   $0x0
  pushl $144
  102248:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  10224d:	e9 a0 fa ff ff       	jmp    101cf2 <__alltraps>

00102252 <vector145>:
.globl vector145
vector145:
  pushl $0
  102252:	6a 00                	push   $0x0
  pushl $145
  102254:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  102259:	e9 94 fa ff ff       	jmp    101cf2 <__alltraps>

0010225e <vector146>:
.globl vector146
vector146:
  pushl $0
  10225e:	6a 00                	push   $0x0
  pushl $146
  102260:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102265:	e9 88 fa ff ff       	jmp    101cf2 <__alltraps>

0010226a <vector147>:
.globl vector147
vector147:
  pushl $0
  10226a:	6a 00                	push   $0x0
  pushl $147
  10226c:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102271:	e9 7c fa ff ff       	jmp    101cf2 <__alltraps>

00102276 <vector148>:
.globl vector148
vector148:
  pushl $0
  102276:	6a 00                	push   $0x0
  pushl $148
  102278:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  10227d:	e9 70 fa ff ff       	jmp    101cf2 <__alltraps>

00102282 <vector149>:
.globl vector149
vector149:
  pushl $0
  102282:	6a 00                	push   $0x0
  pushl $149
  102284:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  102289:	e9 64 fa ff ff       	jmp    101cf2 <__alltraps>

0010228e <vector150>:
.globl vector150
vector150:
  pushl $0
  10228e:	6a 00                	push   $0x0
  pushl $150
  102290:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102295:	e9 58 fa ff ff       	jmp    101cf2 <__alltraps>

0010229a <vector151>:
.globl vector151
vector151:
  pushl $0
  10229a:	6a 00                	push   $0x0
  pushl $151
  10229c:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  1022a1:	e9 4c fa ff ff       	jmp    101cf2 <__alltraps>

001022a6 <vector152>:
.globl vector152
vector152:
  pushl $0
  1022a6:	6a 00                	push   $0x0
  pushl $152
  1022a8:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  1022ad:	e9 40 fa ff ff       	jmp    101cf2 <__alltraps>

001022b2 <vector153>:
.globl vector153
vector153:
  pushl $0
  1022b2:	6a 00                	push   $0x0
  pushl $153
  1022b4:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  1022b9:	e9 34 fa ff ff       	jmp    101cf2 <__alltraps>

001022be <vector154>:
.globl vector154
vector154:
  pushl $0
  1022be:	6a 00                	push   $0x0
  pushl $154
  1022c0:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  1022c5:	e9 28 fa ff ff       	jmp    101cf2 <__alltraps>

001022ca <vector155>:
.globl vector155
vector155:
  pushl $0
  1022ca:	6a 00                	push   $0x0
  pushl $155
  1022cc:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  1022d1:	e9 1c fa ff ff       	jmp    101cf2 <__alltraps>

001022d6 <vector156>:
.globl vector156
vector156:
  pushl $0
  1022d6:	6a 00                	push   $0x0
  pushl $156
  1022d8:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  1022dd:	e9 10 fa ff ff       	jmp    101cf2 <__alltraps>

001022e2 <vector157>:
.globl vector157
vector157:
  pushl $0
  1022e2:	6a 00                	push   $0x0
  pushl $157
  1022e4:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  1022e9:	e9 04 fa ff ff       	jmp    101cf2 <__alltraps>

001022ee <vector158>:
.globl vector158
vector158:
  pushl $0
  1022ee:	6a 00                	push   $0x0
  pushl $158
  1022f0:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1022f5:	e9 f8 f9 ff ff       	jmp    101cf2 <__alltraps>

001022fa <vector159>:
.globl vector159
vector159:
  pushl $0
  1022fa:	6a 00                	push   $0x0
  pushl $159
  1022fc:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  102301:	e9 ec f9 ff ff       	jmp    101cf2 <__alltraps>

00102306 <vector160>:
.globl vector160
vector160:
  pushl $0
  102306:	6a 00                	push   $0x0
  pushl $160
  102308:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  10230d:	e9 e0 f9 ff ff       	jmp    101cf2 <__alltraps>

00102312 <vector161>:
.globl vector161
vector161:
  pushl $0
  102312:	6a 00                	push   $0x0
  pushl $161
  102314:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  102319:	e9 d4 f9 ff ff       	jmp    101cf2 <__alltraps>

0010231e <vector162>:
.globl vector162
vector162:
  pushl $0
  10231e:	6a 00                	push   $0x0
  pushl $162
  102320:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  102325:	e9 c8 f9 ff ff       	jmp    101cf2 <__alltraps>

0010232a <vector163>:
.globl vector163
vector163:
  pushl $0
  10232a:	6a 00                	push   $0x0
  pushl $163
  10232c:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  102331:	e9 bc f9 ff ff       	jmp    101cf2 <__alltraps>

00102336 <vector164>:
.globl vector164
vector164:
  pushl $0
  102336:	6a 00                	push   $0x0
  pushl $164
  102338:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  10233d:	e9 b0 f9 ff ff       	jmp    101cf2 <__alltraps>

00102342 <vector165>:
.globl vector165
vector165:
  pushl $0
  102342:	6a 00                	push   $0x0
  pushl $165
  102344:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  102349:	e9 a4 f9 ff ff       	jmp    101cf2 <__alltraps>

0010234e <vector166>:
.globl vector166
vector166:
  pushl $0
  10234e:	6a 00                	push   $0x0
  pushl $166
  102350:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102355:	e9 98 f9 ff ff       	jmp    101cf2 <__alltraps>

0010235a <vector167>:
.globl vector167
vector167:
  pushl $0
  10235a:	6a 00                	push   $0x0
  pushl $167
  10235c:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102361:	e9 8c f9 ff ff       	jmp    101cf2 <__alltraps>

00102366 <vector168>:
.globl vector168
vector168:
  pushl $0
  102366:	6a 00                	push   $0x0
  pushl $168
  102368:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  10236d:	e9 80 f9 ff ff       	jmp    101cf2 <__alltraps>

00102372 <vector169>:
.globl vector169
vector169:
  pushl $0
  102372:	6a 00                	push   $0x0
  pushl $169
  102374:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  102379:	e9 74 f9 ff ff       	jmp    101cf2 <__alltraps>

0010237e <vector170>:
.globl vector170
vector170:
  pushl $0
  10237e:	6a 00                	push   $0x0
  pushl $170
  102380:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102385:	e9 68 f9 ff ff       	jmp    101cf2 <__alltraps>

0010238a <vector171>:
.globl vector171
vector171:
  pushl $0
  10238a:	6a 00                	push   $0x0
  pushl $171
  10238c:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102391:	e9 5c f9 ff ff       	jmp    101cf2 <__alltraps>

00102396 <vector172>:
.globl vector172
vector172:
  pushl $0
  102396:	6a 00                	push   $0x0
  pushl $172
  102398:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  10239d:	e9 50 f9 ff ff       	jmp    101cf2 <__alltraps>

001023a2 <vector173>:
.globl vector173
vector173:
  pushl $0
  1023a2:	6a 00                	push   $0x0
  pushl $173
  1023a4:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  1023a9:	e9 44 f9 ff ff       	jmp    101cf2 <__alltraps>

001023ae <vector174>:
.globl vector174
vector174:
  pushl $0
  1023ae:	6a 00                	push   $0x0
  pushl $174
  1023b0:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  1023b5:	e9 38 f9 ff ff       	jmp    101cf2 <__alltraps>

001023ba <vector175>:
.globl vector175
vector175:
  pushl $0
  1023ba:	6a 00                	push   $0x0
  pushl $175
  1023bc:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  1023c1:	e9 2c f9 ff ff       	jmp    101cf2 <__alltraps>

001023c6 <vector176>:
.globl vector176
vector176:
  pushl $0
  1023c6:	6a 00                	push   $0x0
  pushl $176
  1023c8:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  1023cd:	e9 20 f9 ff ff       	jmp    101cf2 <__alltraps>

001023d2 <vector177>:
.globl vector177
vector177:
  pushl $0
  1023d2:	6a 00                	push   $0x0
  pushl $177
  1023d4:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  1023d9:	e9 14 f9 ff ff       	jmp    101cf2 <__alltraps>

001023de <vector178>:
.globl vector178
vector178:
  pushl $0
  1023de:	6a 00                	push   $0x0
  pushl $178
  1023e0:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  1023e5:	e9 08 f9 ff ff       	jmp    101cf2 <__alltraps>

001023ea <vector179>:
.globl vector179
vector179:
  pushl $0
  1023ea:	6a 00                	push   $0x0
  pushl $179
  1023ec:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  1023f1:	e9 fc f8 ff ff       	jmp    101cf2 <__alltraps>

001023f6 <vector180>:
.globl vector180
vector180:
  pushl $0
  1023f6:	6a 00                	push   $0x0
  pushl $180
  1023f8:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1023fd:	e9 f0 f8 ff ff       	jmp    101cf2 <__alltraps>

00102402 <vector181>:
.globl vector181
vector181:
  pushl $0
  102402:	6a 00                	push   $0x0
  pushl $181
  102404:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  102409:	e9 e4 f8 ff ff       	jmp    101cf2 <__alltraps>

0010240e <vector182>:
.globl vector182
vector182:
  pushl $0
  10240e:	6a 00                	push   $0x0
  pushl $182
  102410:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  102415:	e9 d8 f8 ff ff       	jmp    101cf2 <__alltraps>

0010241a <vector183>:
.globl vector183
vector183:
  pushl $0
  10241a:	6a 00                	push   $0x0
  pushl $183
  10241c:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  102421:	e9 cc f8 ff ff       	jmp    101cf2 <__alltraps>

00102426 <vector184>:
.globl vector184
vector184:
  pushl $0
  102426:	6a 00                	push   $0x0
  pushl $184
  102428:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  10242d:	e9 c0 f8 ff ff       	jmp    101cf2 <__alltraps>

00102432 <vector185>:
.globl vector185
vector185:
  pushl $0
  102432:	6a 00                	push   $0x0
  pushl $185
  102434:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  102439:	e9 b4 f8 ff ff       	jmp    101cf2 <__alltraps>

0010243e <vector186>:
.globl vector186
vector186:
  pushl $0
  10243e:	6a 00                	push   $0x0
  pushl $186
  102440:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  102445:	e9 a8 f8 ff ff       	jmp    101cf2 <__alltraps>

0010244a <vector187>:
.globl vector187
vector187:
  pushl $0
  10244a:	6a 00                	push   $0x0
  pushl $187
  10244c:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102451:	e9 9c f8 ff ff       	jmp    101cf2 <__alltraps>

00102456 <vector188>:
.globl vector188
vector188:
  pushl $0
  102456:	6a 00                	push   $0x0
  pushl $188
  102458:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  10245d:	e9 90 f8 ff ff       	jmp    101cf2 <__alltraps>

00102462 <vector189>:
.globl vector189
vector189:
  pushl $0
  102462:	6a 00                	push   $0x0
  pushl $189
  102464:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  102469:	e9 84 f8 ff ff       	jmp    101cf2 <__alltraps>

0010246e <vector190>:
.globl vector190
vector190:
  pushl $0
  10246e:	6a 00                	push   $0x0
  pushl $190
  102470:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102475:	e9 78 f8 ff ff       	jmp    101cf2 <__alltraps>

0010247a <vector191>:
.globl vector191
vector191:
  pushl $0
  10247a:	6a 00                	push   $0x0
  pushl $191
  10247c:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102481:	e9 6c f8 ff ff       	jmp    101cf2 <__alltraps>

00102486 <vector192>:
.globl vector192
vector192:
  pushl $0
  102486:	6a 00                	push   $0x0
  pushl $192
  102488:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  10248d:	e9 60 f8 ff ff       	jmp    101cf2 <__alltraps>

00102492 <vector193>:
.globl vector193
vector193:
  pushl $0
  102492:	6a 00                	push   $0x0
  pushl $193
  102494:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  102499:	e9 54 f8 ff ff       	jmp    101cf2 <__alltraps>

0010249e <vector194>:
.globl vector194
vector194:
  pushl $0
  10249e:	6a 00                	push   $0x0
  pushl $194
  1024a0:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  1024a5:	e9 48 f8 ff ff       	jmp    101cf2 <__alltraps>

001024aa <vector195>:
.globl vector195
vector195:
  pushl $0
  1024aa:	6a 00                	push   $0x0
  pushl $195
  1024ac:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  1024b1:	e9 3c f8 ff ff       	jmp    101cf2 <__alltraps>

001024b6 <vector196>:
.globl vector196
vector196:
  pushl $0
  1024b6:	6a 00                	push   $0x0
  pushl $196
  1024b8:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  1024bd:	e9 30 f8 ff ff       	jmp    101cf2 <__alltraps>

001024c2 <vector197>:
.globl vector197
vector197:
  pushl $0
  1024c2:	6a 00                	push   $0x0
  pushl $197
  1024c4:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  1024c9:	e9 24 f8 ff ff       	jmp    101cf2 <__alltraps>

001024ce <vector198>:
.globl vector198
vector198:
  pushl $0
  1024ce:	6a 00                	push   $0x0
  pushl $198
  1024d0:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  1024d5:	e9 18 f8 ff ff       	jmp    101cf2 <__alltraps>

001024da <vector199>:
.globl vector199
vector199:
  pushl $0
  1024da:	6a 00                	push   $0x0
  pushl $199
  1024dc:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  1024e1:	e9 0c f8 ff ff       	jmp    101cf2 <__alltraps>

001024e6 <vector200>:
.globl vector200
vector200:
  pushl $0
  1024e6:	6a 00                	push   $0x0
  pushl $200
  1024e8:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  1024ed:	e9 00 f8 ff ff       	jmp    101cf2 <__alltraps>

001024f2 <vector201>:
.globl vector201
vector201:
  pushl $0
  1024f2:	6a 00                	push   $0x0
  pushl $201
  1024f4:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1024f9:	e9 f4 f7 ff ff       	jmp    101cf2 <__alltraps>

001024fe <vector202>:
.globl vector202
vector202:
  pushl $0
  1024fe:	6a 00                	push   $0x0
  pushl $202
  102500:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  102505:	e9 e8 f7 ff ff       	jmp    101cf2 <__alltraps>

0010250a <vector203>:
.globl vector203
vector203:
  pushl $0
  10250a:	6a 00                	push   $0x0
  pushl $203
  10250c:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  102511:	e9 dc f7 ff ff       	jmp    101cf2 <__alltraps>

00102516 <vector204>:
.globl vector204
vector204:
  pushl $0
  102516:	6a 00                	push   $0x0
  pushl $204
  102518:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  10251d:	e9 d0 f7 ff ff       	jmp    101cf2 <__alltraps>

00102522 <vector205>:
.globl vector205
vector205:
  pushl $0
  102522:	6a 00                	push   $0x0
  pushl $205
  102524:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  102529:	e9 c4 f7 ff ff       	jmp    101cf2 <__alltraps>

0010252e <vector206>:
.globl vector206
vector206:
  pushl $0
  10252e:	6a 00                	push   $0x0
  pushl $206
  102530:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  102535:	e9 b8 f7 ff ff       	jmp    101cf2 <__alltraps>

0010253a <vector207>:
.globl vector207
vector207:
  pushl $0
  10253a:	6a 00                	push   $0x0
  pushl $207
  10253c:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  102541:	e9 ac f7 ff ff       	jmp    101cf2 <__alltraps>

00102546 <vector208>:
.globl vector208
vector208:
  pushl $0
  102546:	6a 00                	push   $0x0
  pushl $208
  102548:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  10254d:	e9 a0 f7 ff ff       	jmp    101cf2 <__alltraps>

00102552 <vector209>:
.globl vector209
vector209:
  pushl $0
  102552:	6a 00                	push   $0x0
  pushl $209
  102554:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  102559:	e9 94 f7 ff ff       	jmp    101cf2 <__alltraps>

0010255e <vector210>:
.globl vector210
vector210:
  pushl $0
  10255e:	6a 00                	push   $0x0
  pushl $210
  102560:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102565:	e9 88 f7 ff ff       	jmp    101cf2 <__alltraps>

0010256a <vector211>:
.globl vector211
vector211:
  pushl $0
  10256a:	6a 00                	push   $0x0
  pushl $211
  10256c:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102571:	e9 7c f7 ff ff       	jmp    101cf2 <__alltraps>

00102576 <vector212>:
.globl vector212
vector212:
  pushl $0
  102576:	6a 00                	push   $0x0
  pushl $212
  102578:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  10257d:	e9 70 f7 ff ff       	jmp    101cf2 <__alltraps>

00102582 <vector213>:
.globl vector213
vector213:
  pushl $0
  102582:	6a 00                	push   $0x0
  pushl $213
  102584:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  102589:	e9 64 f7 ff ff       	jmp    101cf2 <__alltraps>

0010258e <vector214>:
.globl vector214
vector214:
  pushl $0
  10258e:	6a 00                	push   $0x0
  pushl $214
  102590:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102595:	e9 58 f7 ff ff       	jmp    101cf2 <__alltraps>

0010259a <vector215>:
.globl vector215
vector215:
  pushl $0
  10259a:	6a 00                	push   $0x0
  pushl $215
  10259c:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  1025a1:	e9 4c f7 ff ff       	jmp    101cf2 <__alltraps>

001025a6 <vector216>:
.globl vector216
vector216:
  pushl $0
  1025a6:	6a 00                	push   $0x0
  pushl $216
  1025a8:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  1025ad:	e9 40 f7 ff ff       	jmp    101cf2 <__alltraps>

001025b2 <vector217>:
.globl vector217
vector217:
  pushl $0
  1025b2:	6a 00                	push   $0x0
  pushl $217
  1025b4:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  1025b9:	e9 34 f7 ff ff       	jmp    101cf2 <__alltraps>

001025be <vector218>:
.globl vector218
vector218:
  pushl $0
  1025be:	6a 00                	push   $0x0
  pushl $218
  1025c0:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  1025c5:	e9 28 f7 ff ff       	jmp    101cf2 <__alltraps>

001025ca <vector219>:
.globl vector219
vector219:
  pushl $0
  1025ca:	6a 00                	push   $0x0
  pushl $219
  1025cc:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  1025d1:	e9 1c f7 ff ff       	jmp    101cf2 <__alltraps>

001025d6 <vector220>:
.globl vector220
vector220:
  pushl $0
  1025d6:	6a 00                	push   $0x0
  pushl $220
  1025d8:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  1025dd:	e9 10 f7 ff ff       	jmp    101cf2 <__alltraps>

001025e2 <vector221>:
.globl vector221
vector221:
  pushl $0
  1025e2:	6a 00                	push   $0x0
  pushl $221
  1025e4:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  1025e9:	e9 04 f7 ff ff       	jmp    101cf2 <__alltraps>

001025ee <vector222>:
.globl vector222
vector222:
  pushl $0
  1025ee:	6a 00                	push   $0x0
  pushl $222
  1025f0:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1025f5:	e9 f8 f6 ff ff       	jmp    101cf2 <__alltraps>

001025fa <vector223>:
.globl vector223
vector223:
  pushl $0
  1025fa:	6a 00                	push   $0x0
  pushl $223
  1025fc:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  102601:	e9 ec f6 ff ff       	jmp    101cf2 <__alltraps>

00102606 <vector224>:
.globl vector224
vector224:
  pushl $0
  102606:	6a 00                	push   $0x0
  pushl $224
  102608:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  10260d:	e9 e0 f6 ff ff       	jmp    101cf2 <__alltraps>

00102612 <vector225>:
.globl vector225
vector225:
  pushl $0
  102612:	6a 00                	push   $0x0
  pushl $225
  102614:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  102619:	e9 d4 f6 ff ff       	jmp    101cf2 <__alltraps>

0010261e <vector226>:
.globl vector226
vector226:
  pushl $0
  10261e:	6a 00                	push   $0x0
  pushl $226
  102620:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  102625:	e9 c8 f6 ff ff       	jmp    101cf2 <__alltraps>

0010262a <vector227>:
.globl vector227
vector227:
  pushl $0
  10262a:	6a 00                	push   $0x0
  pushl $227
  10262c:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  102631:	e9 bc f6 ff ff       	jmp    101cf2 <__alltraps>

00102636 <vector228>:
.globl vector228
vector228:
  pushl $0
  102636:	6a 00                	push   $0x0
  pushl $228
  102638:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  10263d:	e9 b0 f6 ff ff       	jmp    101cf2 <__alltraps>

00102642 <vector229>:
.globl vector229
vector229:
  pushl $0
  102642:	6a 00                	push   $0x0
  pushl $229
  102644:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  102649:	e9 a4 f6 ff ff       	jmp    101cf2 <__alltraps>

0010264e <vector230>:
.globl vector230
vector230:
  pushl $0
  10264e:	6a 00                	push   $0x0
  pushl $230
  102650:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102655:	e9 98 f6 ff ff       	jmp    101cf2 <__alltraps>

0010265a <vector231>:
.globl vector231
vector231:
  pushl $0
  10265a:	6a 00                	push   $0x0
  pushl $231
  10265c:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102661:	e9 8c f6 ff ff       	jmp    101cf2 <__alltraps>

00102666 <vector232>:
.globl vector232
vector232:
  pushl $0
  102666:	6a 00                	push   $0x0
  pushl $232
  102668:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  10266d:	e9 80 f6 ff ff       	jmp    101cf2 <__alltraps>

00102672 <vector233>:
.globl vector233
vector233:
  pushl $0
  102672:	6a 00                	push   $0x0
  pushl $233
  102674:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102679:	e9 74 f6 ff ff       	jmp    101cf2 <__alltraps>

0010267e <vector234>:
.globl vector234
vector234:
  pushl $0
  10267e:	6a 00                	push   $0x0
  pushl $234
  102680:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102685:	e9 68 f6 ff ff       	jmp    101cf2 <__alltraps>

0010268a <vector235>:
.globl vector235
vector235:
  pushl $0
  10268a:	6a 00                	push   $0x0
  pushl $235
  10268c:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102691:	e9 5c f6 ff ff       	jmp    101cf2 <__alltraps>

00102696 <vector236>:
.globl vector236
vector236:
  pushl $0
  102696:	6a 00                	push   $0x0
  pushl $236
  102698:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  10269d:	e9 50 f6 ff ff       	jmp    101cf2 <__alltraps>

001026a2 <vector237>:
.globl vector237
vector237:
  pushl $0
  1026a2:	6a 00                	push   $0x0
  pushl $237
  1026a4:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  1026a9:	e9 44 f6 ff ff       	jmp    101cf2 <__alltraps>

001026ae <vector238>:
.globl vector238
vector238:
  pushl $0
  1026ae:	6a 00                	push   $0x0
  pushl $238
  1026b0:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  1026b5:	e9 38 f6 ff ff       	jmp    101cf2 <__alltraps>

001026ba <vector239>:
.globl vector239
vector239:
  pushl $0
  1026ba:	6a 00                	push   $0x0
  pushl $239
  1026bc:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  1026c1:	e9 2c f6 ff ff       	jmp    101cf2 <__alltraps>

001026c6 <vector240>:
.globl vector240
vector240:
  pushl $0
  1026c6:	6a 00                	push   $0x0
  pushl $240
  1026c8:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  1026cd:	e9 20 f6 ff ff       	jmp    101cf2 <__alltraps>

001026d2 <vector241>:
.globl vector241
vector241:
  pushl $0
  1026d2:	6a 00                	push   $0x0
  pushl $241
  1026d4:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  1026d9:	e9 14 f6 ff ff       	jmp    101cf2 <__alltraps>

001026de <vector242>:
.globl vector242
vector242:
  pushl $0
  1026de:	6a 00                	push   $0x0
  pushl $242
  1026e0:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  1026e5:	e9 08 f6 ff ff       	jmp    101cf2 <__alltraps>

001026ea <vector243>:
.globl vector243
vector243:
  pushl $0
  1026ea:	6a 00                	push   $0x0
  pushl $243
  1026ec:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  1026f1:	e9 fc f5 ff ff       	jmp    101cf2 <__alltraps>

001026f6 <vector244>:
.globl vector244
vector244:
  pushl $0
  1026f6:	6a 00                	push   $0x0
  pushl $244
  1026f8:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1026fd:	e9 f0 f5 ff ff       	jmp    101cf2 <__alltraps>

00102702 <vector245>:
.globl vector245
vector245:
  pushl $0
  102702:	6a 00                	push   $0x0
  pushl $245
  102704:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  102709:	e9 e4 f5 ff ff       	jmp    101cf2 <__alltraps>

0010270e <vector246>:
.globl vector246
vector246:
  pushl $0
  10270e:	6a 00                	push   $0x0
  pushl $246
  102710:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  102715:	e9 d8 f5 ff ff       	jmp    101cf2 <__alltraps>

0010271a <vector247>:
.globl vector247
vector247:
  pushl $0
  10271a:	6a 00                	push   $0x0
  pushl $247
  10271c:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102721:	e9 cc f5 ff ff       	jmp    101cf2 <__alltraps>

00102726 <vector248>:
.globl vector248
vector248:
  pushl $0
  102726:	6a 00                	push   $0x0
  pushl $248
  102728:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  10272d:	e9 c0 f5 ff ff       	jmp    101cf2 <__alltraps>

00102732 <vector249>:
.globl vector249
vector249:
  pushl $0
  102732:	6a 00                	push   $0x0
  pushl $249
  102734:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  102739:	e9 b4 f5 ff ff       	jmp    101cf2 <__alltraps>

0010273e <vector250>:
.globl vector250
vector250:
  pushl $0
  10273e:	6a 00                	push   $0x0
  pushl $250
  102740:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  102745:	e9 a8 f5 ff ff       	jmp    101cf2 <__alltraps>

0010274a <vector251>:
.globl vector251
vector251:
  pushl $0
  10274a:	6a 00                	push   $0x0
  pushl $251
  10274c:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102751:	e9 9c f5 ff ff       	jmp    101cf2 <__alltraps>

00102756 <vector252>:
.globl vector252
vector252:
  pushl $0
  102756:	6a 00                	push   $0x0
  pushl $252
  102758:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  10275d:	e9 90 f5 ff ff       	jmp    101cf2 <__alltraps>

00102762 <vector253>:
.globl vector253
vector253:
  pushl $0
  102762:	6a 00                	push   $0x0
  pushl $253
  102764:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102769:	e9 84 f5 ff ff       	jmp    101cf2 <__alltraps>

0010276e <vector254>:
.globl vector254
vector254:
  pushl $0
  10276e:	6a 00                	push   $0x0
  pushl $254
  102770:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102775:	e9 78 f5 ff ff       	jmp    101cf2 <__alltraps>

0010277a <vector255>:
.globl vector255
vector255:
  pushl $0
  10277a:	6a 00                	push   $0x0
  pushl $255
  10277c:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102781:	e9 6c f5 ff ff       	jmp    101cf2 <__alltraps>

00102786 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102786:	55                   	push   %ebp
  102787:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102789:	8b 45 08             	mov    0x8(%ebp),%eax
  10278c:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  10278f:	b8 23 00 00 00       	mov    $0x23,%eax
  102794:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102796:	b8 23 00 00 00       	mov    $0x23,%eax
  10279b:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  10279d:	b8 10 00 00 00       	mov    $0x10,%eax
  1027a2:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  1027a4:	b8 10 00 00 00       	mov    $0x10,%eax
  1027a9:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  1027ab:	b8 10 00 00 00       	mov    $0x10,%eax
  1027b0:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  1027b2:	ea b9 27 10 00 08 00 	ljmp   $0x8,$0x1027b9
}
  1027b9:	5d                   	pop    %ebp
  1027ba:	c3                   	ret    

001027bb <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  1027bb:	55                   	push   %ebp
  1027bc:	89 e5                	mov    %esp,%ebp
  1027be:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  1027c1:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  1027c6:	05 00 04 00 00       	add    $0x400,%eax
  1027cb:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  1027d0:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  1027d7:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  1027d9:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  1027e0:	68 00 
  1027e2:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1027e7:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  1027ed:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1027f2:	c1 e8 10             	shr    $0x10,%eax
  1027f5:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  1027fa:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102801:	83 e0 f0             	and    $0xfffffff0,%eax
  102804:	83 c8 09             	or     $0x9,%eax
  102807:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  10280c:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102813:	83 c8 10             	or     $0x10,%eax
  102816:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  10281b:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102822:	83 e0 9f             	and    $0xffffff9f,%eax
  102825:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  10282a:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102831:	83 c8 80             	or     $0xffffff80,%eax
  102834:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102839:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102840:	83 e0 f0             	and    $0xfffffff0,%eax
  102843:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102848:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  10284f:	83 e0 ef             	and    $0xffffffef,%eax
  102852:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102857:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  10285e:	83 e0 df             	and    $0xffffffdf,%eax
  102861:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102866:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  10286d:	83 c8 40             	or     $0x40,%eax
  102870:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102875:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  10287c:	83 e0 7f             	and    $0x7f,%eax
  10287f:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102884:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102889:	c1 e8 18             	shr    $0x18,%eax
  10288c:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102891:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102898:	83 e0 ef             	and    $0xffffffef,%eax
  10289b:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  1028a0:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  1028a7:	e8 da fe ff ff       	call   102786 <lgdt>
  1028ac:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  1028b2:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  1028b6:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  1028b9:	c9                   	leave  
  1028ba:	c3                   	ret    

001028bb <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  1028bb:	55                   	push   %ebp
  1028bc:	89 e5                	mov    %esp,%ebp
    gdt_init();
  1028be:	e8 f8 fe ff ff       	call   1027bb <gdt_init>
}
  1028c3:	5d                   	pop    %ebp
  1028c4:	c3                   	ret    

001028c5 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  1028c5:	55                   	push   %ebp
  1028c6:	89 e5                	mov    %esp,%ebp
  1028c8:	83 ec 58             	sub    $0x58,%esp
  1028cb:	8b 45 10             	mov    0x10(%ebp),%eax
  1028ce:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1028d1:	8b 45 14             	mov    0x14(%ebp),%eax
  1028d4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  1028d7:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1028da:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1028dd:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1028e0:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  1028e3:	8b 45 18             	mov    0x18(%ebp),%eax
  1028e6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1028e9:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1028ec:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1028ef:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1028f2:	89 55 f0             	mov    %edx,-0x10(%ebp)
  1028f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1028f8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1028fb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1028ff:	74 1c                	je     10291d <printnum+0x58>
  102901:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102904:	ba 00 00 00 00       	mov    $0x0,%edx
  102909:	f7 75 e4             	divl   -0x1c(%ebp)
  10290c:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10290f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102912:	ba 00 00 00 00       	mov    $0x0,%edx
  102917:	f7 75 e4             	divl   -0x1c(%ebp)
  10291a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10291d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102920:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102923:	f7 75 e4             	divl   -0x1c(%ebp)
  102926:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102929:	89 55 dc             	mov    %edx,-0x24(%ebp)
  10292c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10292f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102932:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102935:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102938:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10293b:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  10293e:	8b 45 18             	mov    0x18(%ebp),%eax
  102941:	ba 00 00 00 00       	mov    $0x0,%edx
  102946:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102949:	77 56                	ja     1029a1 <printnum+0xdc>
  10294b:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  10294e:	72 05                	jb     102955 <printnum+0x90>
  102950:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  102953:	77 4c                	ja     1029a1 <printnum+0xdc>
        printnum(putch, putdat, result, base, width - 1, padc);
  102955:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102958:	8d 50 ff             	lea    -0x1(%eax),%edx
  10295b:	8b 45 20             	mov    0x20(%ebp),%eax
  10295e:	89 44 24 18          	mov    %eax,0x18(%esp)
  102962:	89 54 24 14          	mov    %edx,0x14(%esp)
  102966:	8b 45 18             	mov    0x18(%ebp),%eax
  102969:	89 44 24 10          	mov    %eax,0x10(%esp)
  10296d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102970:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102973:	89 44 24 08          	mov    %eax,0x8(%esp)
  102977:	89 54 24 0c          	mov    %edx,0xc(%esp)
  10297b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10297e:	89 44 24 04          	mov    %eax,0x4(%esp)
  102982:	8b 45 08             	mov    0x8(%ebp),%eax
  102985:	89 04 24             	mov    %eax,(%esp)
  102988:	e8 38 ff ff ff       	call   1028c5 <printnum>
  10298d:	eb 1c                	jmp    1029ab <printnum+0xe6>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  10298f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102992:	89 44 24 04          	mov    %eax,0x4(%esp)
  102996:	8b 45 20             	mov    0x20(%ebp),%eax
  102999:	89 04 24             	mov    %eax,(%esp)
  10299c:	8b 45 08             	mov    0x8(%ebp),%eax
  10299f:	ff d0                	call   *%eax
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  1029a1:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  1029a5:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  1029a9:	7f e4                	jg     10298f <printnum+0xca>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  1029ab:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1029ae:	05 90 3b 10 00       	add    $0x103b90,%eax
  1029b3:	0f b6 00             	movzbl (%eax),%eax
  1029b6:	0f be c0             	movsbl %al,%eax
  1029b9:	8b 55 0c             	mov    0xc(%ebp),%edx
  1029bc:	89 54 24 04          	mov    %edx,0x4(%esp)
  1029c0:	89 04 24             	mov    %eax,(%esp)
  1029c3:	8b 45 08             	mov    0x8(%ebp),%eax
  1029c6:	ff d0                	call   *%eax
}
  1029c8:	c9                   	leave  
  1029c9:	c3                   	ret    

001029ca <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  1029ca:	55                   	push   %ebp
  1029cb:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  1029cd:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  1029d1:	7e 14                	jle    1029e7 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  1029d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1029d6:	8b 00                	mov    (%eax),%eax
  1029d8:	8d 48 08             	lea    0x8(%eax),%ecx
  1029db:	8b 55 08             	mov    0x8(%ebp),%edx
  1029de:	89 0a                	mov    %ecx,(%edx)
  1029e0:	8b 50 04             	mov    0x4(%eax),%edx
  1029e3:	8b 00                	mov    (%eax),%eax
  1029e5:	eb 30                	jmp    102a17 <getuint+0x4d>
    }
    else if (lflag) {
  1029e7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1029eb:	74 16                	je     102a03 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  1029ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1029f0:	8b 00                	mov    (%eax),%eax
  1029f2:	8d 48 04             	lea    0x4(%eax),%ecx
  1029f5:	8b 55 08             	mov    0x8(%ebp),%edx
  1029f8:	89 0a                	mov    %ecx,(%edx)
  1029fa:	8b 00                	mov    (%eax),%eax
  1029fc:	ba 00 00 00 00       	mov    $0x0,%edx
  102a01:	eb 14                	jmp    102a17 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102a03:	8b 45 08             	mov    0x8(%ebp),%eax
  102a06:	8b 00                	mov    (%eax),%eax
  102a08:	8d 48 04             	lea    0x4(%eax),%ecx
  102a0b:	8b 55 08             	mov    0x8(%ebp),%edx
  102a0e:	89 0a                	mov    %ecx,(%edx)
  102a10:	8b 00                	mov    (%eax),%eax
  102a12:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102a17:	5d                   	pop    %ebp
  102a18:	c3                   	ret    

00102a19 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102a19:	55                   	push   %ebp
  102a1a:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102a1c:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102a20:	7e 14                	jle    102a36 <getint+0x1d>
        return va_arg(*ap, long long);
  102a22:	8b 45 08             	mov    0x8(%ebp),%eax
  102a25:	8b 00                	mov    (%eax),%eax
  102a27:	8d 48 08             	lea    0x8(%eax),%ecx
  102a2a:	8b 55 08             	mov    0x8(%ebp),%edx
  102a2d:	89 0a                	mov    %ecx,(%edx)
  102a2f:	8b 50 04             	mov    0x4(%eax),%edx
  102a32:	8b 00                	mov    (%eax),%eax
  102a34:	eb 28                	jmp    102a5e <getint+0x45>
    }
    else if (lflag) {
  102a36:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102a3a:	74 12                	je     102a4e <getint+0x35>
        return va_arg(*ap, long);
  102a3c:	8b 45 08             	mov    0x8(%ebp),%eax
  102a3f:	8b 00                	mov    (%eax),%eax
  102a41:	8d 48 04             	lea    0x4(%eax),%ecx
  102a44:	8b 55 08             	mov    0x8(%ebp),%edx
  102a47:	89 0a                	mov    %ecx,(%edx)
  102a49:	8b 00                	mov    (%eax),%eax
  102a4b:	99                   	cltd   
  102a4c:	eb 10                	jmp    102a5e <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102a4e:	8b 45 08             	mov    0x8(%ebp),%eax
  102a51:	8b 00                	mov    (%eax),%eax
  102a53:	8d 48 04             	lea    0x4(%eax),%ecx
  102a56:	8b 55 08             	mov    0x8(%ebp),%edx
  102a59:	89 0a                	mov    %ecx,(%edx)
  102a5b:	8b 00                	mov    (%eax),%eax
  102a5d:	99                   	cltd   
    }
}
  102a5e:	5d                   	pop    %ebp
  102a5f:	c3                   	ret    

00102a60 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102a60:	55                   	push   %ebp
  102a61:	89 e5                	mov    %esp,%ebp
  102a63:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102a66:	8d 45 14             	lea    0x14(%ebp),%eax
  102a69:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102a6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102a6f:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102a73:	8b 45 10             	mov    0x10(%ebp),%eax
  102a76:	89 44 24 08          	mov    %eax,0x8(%esp)
  102a7a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102a7d:	89 44 24 04          	mov    %eax,0x4(%esp)
  102a81:	8b 45 08             	mov    0x8(%ebp),%eax
  102a84:	89 04 24             	mov    %eax,(%esp)
  102a87:	e8 02 00 00 00       	call   102a8e <vprintfmt>
    va_end(ap);
}
  102a8c:	c9                   	leave  
  102a8d:	c3                   	ret    

00102a8e <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102a8e:	55                   	push   %ebp
  102a8f:	89 e5                	mov    %esp,%ebp
  102a91:	56                   	push   %esi
  102a92:	53                   	push   %ebx
  102a93:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102a96:	eb 18                	jmp    102ab0 <vprintfmt+0x22>
            if (ch == '\0') {
  102a98:	85 db                	test   %ebx,%ebx
  102a9a:	75 05                	jne    102aa1 <vprintfmt+0x13>
                return;
  102a9c:	e9 d1 03 00 00       	jmp    102e72 <vprintfmt+0x3e4>
            }
            putch(ch, putdat);
  102aa1:	8b 45 0c             	mov    0xc(%ebp),%eax
  102aa4:	89 44 24 04          	mov    %eax,0x4(%esp)
  102aa8:	89 1c 24             	mov    %ebx,(%esp)
  102aab:	8b 45 08             	mov    0x8(%ebp),%eax
  102aae:	ff d0                	call   *%eax
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102ab0:	8b 45 10             	mov    0x10(%ebp),%eax
  102ab3:	8d 50 01             	lea    0x1(%eax),%edx
  102ab6:	89 55 10             	mov    %edx,0x10(%ebp)
  102ab9:	0f b6 00             	movzbl (%eax),%eax
  102abc:	0f b6 d8             	movzbl %al,%ebx
  102abf:	83 fb 25             	cmp    $0x25,%ebx
  102ac2:	75 d4                	jne    102a98 <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  102ac4:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102ac8:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102acf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102ad2:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102ad5:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102adc:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102adf:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102ae2:	8b 45 10             	mov    0x10(%ebp),%eax
  102ae5:	8d 50 01             	lea    0x1(%eax),%edx
  102ae8:	89 55 10             	mov    %edx,0x10(%ebp)
  102aeb:	0f b6 00             	movzbl (%eax),%eax
  102aee:	0f b6 d8             	movzbl %al,%ebx
  102af1:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102af4:	83 f8 55             	cmp    $0x55,%eax
  102af7:	0f 87 44 03 00 00    	ja     102e41 <vprintfmt+0x3b3>
  102afd:	8b 04 85 b4 3b 10 00 	mov    0x103bb4(,%eax,4),%eax
  102b04:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102b06:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102b0a:	eb d6                	jmp    102ae2 <vprintfmt+0x54>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102b0c:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102b10:	eb d0                	jmp    102ae2 <vprintfmt+0x54>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102b12:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102b19:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102b1c:	89 d0                	mov    %edx,%eax
  102b1e:	c1 e0 02             	shl    $0x2,%eax
  102b21:	01 d0                	add    %edx,%eax
  102b23:	01 c0                	add    %eax,%eax
  102b25:	01 d8                	add    %ebx,%eax
  102b27:	83 e8 30             	sub    $0x30,%eax
  102b2a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102b2d:	8b 45 10             	mov    0x10(%ebp),%eax
  102b30:	0f b6 00             	movzbl (%eax),%eax
  102b33:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102b36:	83 fb 2f             	cmp    $0x2f,%ebx
  102b39:	7e 0b                	jle    102b46 <vprintfmt+0xb8>
  102b3b:	83 fb 39             	cmp    $0x39,%ebx
  102b3e:	7f 06                	jg     102b46 <vprintfmt+0xb8>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102b40:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  102b44:	eb d3                	jmp    102b19 <vprintfmt+0x8b>
            goto process_precision;
  102b46:	eb 33                	jmp    102b7b <vprintfmt+0xed>

        case '*':
            precision = va_arg(ap, int);
  102b48:	8b 45 14             	mov    0x14(%ebp),%eax
  102b4b:	8d 50 04             	lea    0x4(%eax),%edx
  102b4e:	89 55 14             	mov    %edx,0x14(%ebp)
  102b51:	8b 00                	mov    (%eax),%eax
  102b53:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102b56:	eb 23                	jmp    102b7b <vprintfmt+0xed>

        case '.':
            if (width < 0)
  102b58:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102b5c:	79 0c                	jns    102b6a <vprintfmt+0xdc>
                width = 0;
  102b5e:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102b65:	e9 78 ff ff ff       	jmp    102ae2 <vprintfmt+0x54>
  102b6a:	e9 73 ff ff ff       	jmp    102ae2 <vprintfmt+0x54>

        case '#':
            altflag = 1;
  102b6f:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102b76:	e9 67 ff ff ff       	jmp    102ae2 <vprintfmt+0x54>

        process_precision:
            if (width < 0)
  102b7b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102b7f:	79 12                	jns    102b93 <vprintfmt+0x105>
                width = precision, precision = -1;
  102b81:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102b84:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102b87:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102b8e:	e9 4f ff ff ff       	jmp    102ae2 <vprintfmt+0x54>
  102b93:	e9 4a ff ff ff       	jmp    102ae2 <vprintfmt+0x54>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102b98:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  102b9c:	e9 41 ff ff ff       	jmp    102ae2 <vprintfmt+0x54>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102ba1:	8b 45 14             	mov    0x14(%ebp),%eax
  102ba4:	8d 50 04             	lea    0x4(%eax),%edx
  102ba7:	89 55 14             	mov    %edx,0x14(%ebp)
  102baa:	8b 00                	mov    (%eax),%eax
  102bac:	8b 55 0c             	mov    0xc(%ebp),%edx
  102baf:	89 54 24 04          	mov    %edx,0x4(%esp)
  102bb3:	89 04 24             	mov    %eax,(%esp)
  102bb6:	8b 45 08             	mov    0x8(%ebp),%eax
  102bb9:	ff d0                	call   *%eax
            break;
  102bbb:	e9 ac 02 00 00       	jmp    102e6c <vprintfmt+0x3de>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102bc0:	8b 45 14             	mov    0x14(%ebp),%eax
  102bc3:	8d 50 04             	lea    0x4(%eax),%edx
  102bc6:	89 55 14             	mov    %edx,0x14(%ebp)
  102bc9:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102bcb:	85 db                	test   %ebx,%ebx
  102bcd:	79 02                	jns    102bd1 <vprintfmt+0x143>
                err = -err;
  102bcf:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102bd1:	83 fb 06             	cmp    $0x6,%ebx
  102bd4:	7f 0b                	jg     102be1 <vprintfmt+0x153>
  102bd6:	8b 34 9d 74 3b 10 00 	mov    0x103b74(,%ebx,4),%esi
  102bdd:	85 f6                	test   %esi,%esi
  102bdf:	75 23                	jne    102c04 <vprintfmt+0x176>
                printfmt(putch, putdat, "error %d", err);
  102be1:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102be5:	c7 44 24 08 a1 3b 10 	movl   $0x103ba1,0x8(%esp)
  102bec:	00 
  102bed:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bf0:	89 44 24 04          	mov    %eax,0x4(%esp)
  102bf4:	8b 45 08             	mov    0x8(%ebp),%eax
  102bf7:	89 04 24             	mov    %eax,(%esp)
  102bfa:	e8 61 fe ff ff       	call   102a60 <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102bff:	e9 68 02 00 00       	jmp    102e6c <vprintfmt+0x3de>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  102c04:	89 74 24 0c          	mov    %esi,0xc(%esp)
  102c08:	c7 44 24 08 aa 3b 10 	movl   $0x103baa,0x8(%esp)
  102c0f:	00 
  102c10:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c13:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c17:	8b 45 08             	mov    0x8(%ebp),%eax
  102c1a:	89 04 24             	mov    %eax,(%esp)
  102c1d:	e8 3e fe ff ff       	call   102a60 <printfmt>
            }
            break;
  102c22:	e9 45 02 00 00       	jmp    102e6c <vprintfmt+0x3de>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102c27:	8b 45 14             	mov    0x14(%ebp),%eax
  102c2a:	8d 50 04             	lea    0x4(%eax),%edx
  102c2d:	89 55 14             	mov    %edx,0x14(%ebp)
  102c30:	8b 30                	mov    (%eax),%esi
  102c32:	85 f6                	test   %esi,%esi
  102c34:	75 05                	jne    102c3b <vprintfmt+0x1ad>
                p = "(null)";
  102c36:	be ad 3b 10 00       	mov    $0x103bad,%esi
            }
            if (width > 0 && padc != '-') {
  102c3b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102c3f:	7e 3e                	jle    102c7f <vprintfmt+0x1f1>
  102c41:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102c45:	74 38                	je     102c7f <vprintfmt+0x1f1>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102c47:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  102c4a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102c4d:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c51:	89 34 24             	mov    %esi,(%esp)
  102c54:	e8 15 03 00 00       	call   102f6e <strnlen>
  102c59:	29 c3                	sub    %eax,%ebx
  102c5b:	89 d8                	mov    %ebx,%eax
  102c5d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102c60:	eb 17                	jmp    102c79 <vprintfmt+0x1eb>
                    putch(padc, putdat);
  102c62:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102c66:	8b 55 0c             	mov    0xc(%ebp),%edx
  102c69:	89 54 24 04          	mov    %edx,0x4(%esp)
  102c6d:	89 04 24             	mov    %eax,(%esp)
  102c70:	8b 45 08             	mov    0x8(%ebp),%eax
  102c73:	ff d0                	call   *%eax
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  102c75:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102c79:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102c7d:	7f e3                	jg     102c62 <vprintfmt+0x1d4>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102c7f:	eb 38                	jmp    102cb9 <vprintfmt+0x22b>
                if (altflag && (ch < ' ' || ch > '~')) {
  102c81:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102c85:	74 1f                	je     102ca6 <vprintfmt+0x218>
  102c87:	83 fb 1f             	cmp    $0x1f,%ebx
  102c8a:	7e 05                	jle    102c91 <vprintfmt+0x203>
  102c8c:	83 fb 7e             	cmp    $0x7e,%ebx
  102c8f:	7e 15                	jle    102ca6 <vprintfmt+0x218>
                    putch('?', putdat);
  102c91:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c94:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c98:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  102c9f:	8b 45 08             	mov    0x8(%ebp),%eax
  102ca2:	ff d0                	call   *%eax
  102ca4:	eb 0f                	jmp    102cb5 <vprintfmt+0x227>
                }
                else {
                    putch(ch, putdat);
  102ca6:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ca9:	89 44 24 04          	mov    %eax,0x4(%esp)
  102cad:	89 1c 24             	mov    %ebx,(%esp)
  102cb0:	8b 45 08             	mov    0x8(%ebp),%eax
  102cb3:	ff d0                	call   *%eax
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102cb5:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102cb9:	89 f0                	mov    %esi,%eax
  102cbb:	8d 70 01             	lea    0x1(%eax),%esi
  102cbe:	0f b6 00             	movzbl (%eax),%eax
  102cc1:	0f be d8             	movsbl %al,%ebx
  102cc4:	85 db                	test   %ebx,%ebx
  102cc6:	74 10                	je     102cd8 <vprintfmt+0x24a>
  102cc8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102ccc:	78 b3                	js     102c81 <vprintfmt+0x1f3>
  102cce:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  102cd2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102cd6:	79 a9                	jns    102c81 <vprintfmt+0x1f3>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102cd8:	eb 17                	jmp    102cf1 <vprintfmt+0x263>
                putch(' ', putdat);
  102cda:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cdd:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ce1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  102ce8:	8b 45 08             	mov    0x8(%ebp),%eax
  102ceb:	ff d0                	call   *%eax
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102ced:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102cf1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102cf5:	7f e3                	jg     102cda <vprintfmt+0x24c>
                putch(' ', putdat);
            }
            break;
  102cf7:	e9 70 01 00 00       	jmp    102e6c <vprintfmt+0x3de>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  102cfc:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102cff:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d03:	8d 45 14             	lea    0x14(%ebp),%eax
  102d06:	89 04 24             	mov    %eax,(%esp)
  102d09:	e8 0b fd ff ff       	call   102a19 <getint>
  102d0e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d11:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  102d14:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d17:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102d1a:	85 d2                	test   %edx,%edx
  102d1c:	79 26                	jns    102d44 <vprintfmt+0x2b6>
                putch('-', putdat);
  102d1e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d21:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d25:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  102d2c:	8b 45 08             	mov    0x8(%ebp),%eax
  102d2f:	ff d0                	call   *%eax
                num = -(long long)num;
  102d31:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d34:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102d37:	f7 d8                	neg    %eax
  102d39:	83 d2 00             	adc    $0x0,%edx
  102d3c:	f7 da                	neg    %edx
  102d3e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d41:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  102d44:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102d4b:	e9 a8 00 00 00       	jmp    102df8 <vprintfmt+0x36a>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  102d50:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102d53:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d57:	8d 45 14             	lea    0x14(%ebp),%eax
  102d5a:	89 04 24             	mov    %eax,(%esp)
  102d5d:	e8 68 fc ff ff       	call   1029ca <getuint>
  102d62:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d65:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  102d68:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102d6f:	e9 84 00 00 00       	jmp    102df8 <vprintfmt+0x36a>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  102d74:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102d77:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d7b:	8d 45 14             	lea    0x14(%ebp),%eax
  102d7e:	89 04 24             	mov    %eax,(%esp)
  102d81:	e8 44 fc ff ff       	call   1029ca <getuint>
  102d86:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d89:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  102d8c:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  102d93:	eb 63                	jmp    102df8 <vprintfmt+0x36a>

        // pointer
        case 'p':
            putch('0', putdat);
  102d95:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d98:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d9c:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  102da3:	8b 45 08             	mov    0x8(%ebp),%eax
  102da6:	ff d0                	call   *%eax
            putch('x', putdat);
  102da8:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dab:	89 44 24 04          	mov    %eax,0x4(%esp)
  102daf:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  102db6:	8b 45 08             	mov    0x8(%ebp),%eax
  102db9:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  102dbb:	8b 45 14             	mov    0x14(%ebp),%eax
  102dbe:	8d 50 04             	lea    0x4(%eax),%edx
  102dc1:	89 55 14             	mov    %edx,0x14(%ebp)
  102dc4:	8b 00                	mov    (%eax),%eax
  102dc6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102dc9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  102dd0:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  102dd7:	eb 1f                	jmp    102df8 <vprintfmt+0x36a>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  102dd9:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102ddc:	89 44 24 04          	mov    %eax,0x4(%esp)
  102de0:	8d 45 14             	lea    0x14(%ebp),%eax
  102de3:	89 04 24             	mov    %eax,(%esp)
  102de6:	e8 df fb ff ff       	call   1029ca <getuint>
  102deb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102dee:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  102df1:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  102df8:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  102dfc:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102dff:	89 54 24 18          	mov    %edx,0x18(%esp)
  102e03:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102e06:	89 54 24 14          	mov    %edx,0x14(%esp)
  102e0a:	89 44 24 10          	mov    %eax,0x10(%esp)
  102e0e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e11:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102e14:	89 44 24 08          	mov    %eax,0x8(%esp)
  102e18:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102e1c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e1f:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e23:	8b 45 08             	mov    0x8(%ebp),%eax
  102e26:	89 04 24             	mov    %eax,(%esp)
  102e29:	e8 97 fa ff ff       	call   1028c5 <printnum>
            break;
  102e2e:	eb 3c                	jmp    102e6c <vprintfmt+0x3de>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  102e30:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e33:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e37:	89 1c 24             	mov    %ebx,(%esp)
  102e3a:	8b 45 08             	mov    0x8(%ebp),%eax
  102e3d:	ff d0                	call   *%eax
            break;
  102e3f:	eb 2b                	jmp    102e6c <vprintfmt+0x3de>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  102e41:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e44:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e48:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  102e4f:	8b 45 08             	mov    0x8(%ebp),%eax
  102e52:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  102e54:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102e58:	eb 04                	jmp    102e5e <vprintfmt+0x3d0>
  102e5a:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102e5e:	8b 45 10             	mov    0x10(%ebp),%eax
  102e61:	83 e8 01             	sub    $0x1,%eax
  102e64:	0f b6 00             	movzbl (%eax),%eax
  102e67:	3c 25                	cmp    $0x25,%al
  102e69:	75 ef                	jne    102e5a <vprintfmt+0x3cc>
                /* do nothing */;
            break;
  102e6b:	90                   	nop
        }
    }
  102e6c:	90                   	nop
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102e6d:	e9 3e fc ff ff       	jmp    102ab0 <vprintfmt+0x22>
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  102e72:	83 c4 40             	add    $0x40,%esp
  102e75:	5b                   	pop    %ebx
  102e76:	5e                   	pop    %esi
  102e77:	5d                   	pop    %ebp
  102e78:	c3                   	ret    

00102e79 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  102e79:	55                   	push   %ebp
  102e7a:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  102e7c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e7f:	8b 40 08             	mov    0x8(%eax),%eax
  102e82:	8d 50 01             	lea    0x1(%eax),%edx
  102e85:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e88:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  102e8b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e8e:	8b 10                	mov    (%eax),%edx
  102e90:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e93:	8b 40 04             	mov    0x4(%eax),%eax
  102e96:	39 c2                	cmp    %eax,%edx
  102e98:	73 12                	jae    102eac <sprintputch+0x33>
        *b->buf ++ = ch;
  102e9a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e9d:	8b 00                	mov    (%eax),%eax
  102e9f:	8d 48 01             	lea    0x1(%eax),%ecx
  102ea2:	8b 55 0c             	mov    0xc(%ebp),%edx
  102ea5:	89 0a                	mov    %ecx,(%edx)
  102ea7:	8b 55 08             	mov    0x8(%ebp),%edx
  102eaa:	88 10                	mov    %dl,(%eax)
    }
}
  102eac:	5d                   	pop    %ebp
  102ead:	c3                   	ret    

00102eae <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  102eae:	55                   	push   %ebp
  102eaf:	89 e5                	mov    %esp,%ebp
  102eb1:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  102eb4:	8d 45 14             	lea    0x14(%ebp),%eax
  102eb7:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  102eba:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ebd:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102ec1:	8b 45 10             	mov    0x10(%ebp),%eax
  102ec4:	89 44 24 08          	mov    %eax,0x8(%esp)
  102ec8:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ecb:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ecf:	8b 45 08             	mov    0x8(%ebp),%eax
  102ed2:	89 04 24             	mov    %eax,(%esp)
  102ed5:	e8 08 00 00 00       	call   102ee2 <vsnprintf>
  102eda:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  102edd:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102ee0:	c9                   	leave  
  102ee1:	c3                   	ret    

00102ee2 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  102ee2:	55                   	push   %ebp
  102ee3:	89 e5                	mov    %esp,%ebp
  102ee5:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  102ee8:	8b 45 08             	mov    0x8(%ebp),%eax
  102eeb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102eee:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ef1:	8d 50 ff             	lea    -0x1(%eax),%edx
  102ef4:	8b 45 08             	mov    0x8(%ebp),%eax
  102ef7:	01 d0                	add    %edx,%eax
  102ef9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102efc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  102f03:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102f07:	74 0a                	je     102f13 <vsnprintf+0x31>
  102f09:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102f0c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f0f:	39 c2                	cmp    %eax,%edx
  102f11:	76 07                	jbe    102f1a <vsnprintf+0x38>
        return -E_INVAL;
  102f13:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  102f18:	eb 2a                	jmp    102f44 <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  102f1a:	8b 45 14             	mov    0x14(%ebp),%eax
  102f1d:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102f21:	8b 45 10             	mov    0x10(%ebp),%eax
  102f24:	89 44 24 08          	mov    %eax,0x8(%esp)
  102f28:	8d 45 ec             	lea    -0x14(%ebp),%eax
  102f2b:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f2f:	c7 04 24 79 2e 10 00 	movl   $0x102e79,(%esp)
  102f36:	e8 53 fb ff ff       	call   102a8e <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  102f3b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102f3e:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  102f41:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102f44:	c9                   	leave  
  102f45:	c3                   	ret    

00102f46 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102f46:	55                   	push   %ebp
  102f47:	89 e5                	mov    %esp,%ebp
  102f49:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102f4c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102f53:	eb 04                	jmp    102f59 <strlen+0x13>
        cnt ++;
  102f55:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  102f59:	8b 45 08             	mov    0x8(%ebp),%eax
  102f5c:	8d 50 01             	lea    0x1(%eax),%edx
  102f5f:	89 55 08             	mov    %edx,0x8(%ebp)
  102f62:	0f b6 00             	movzbl (%eax),%eax
  102f65:	84 c0                	test   %al,%al
  102f67:	75 ec                	jne    102f55 <strlen+0xf>
        cnt ++;
    }
    return cnt;
  102f69:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102f6c:	c9                   	leave  
  102f6d:	c3                   	ret    

00102f6e <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102f6e:	55                   	push   %ebp
  102f6f:	89 e5                	mov    %esp,%ebp
  102f71:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102f74:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102f7b:	eb 04                	jmp    102f81 <strnlen+0x13>
        cnt ++;
  102f7d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  102f81:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f84:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102f87:	73 10                	jae    102f99 <strnlen+0x2b>
  102f89:	8b 45 08             	mov    0x8(%ebp),%eax
  102f8c:	8d 50 01             	lea    0x1(%eax),%edx
  102f8f:	89 55 08             	mov    %edx,0x8(%ebp)
  102f92:	0f b6 00             	movzbl (%eax),%eax
  102f95:	84 c0                	test   %al,%al
  102f97:	75 e4                	jne    102f7d <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  102f99:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102f9c:	c9                   	leave  
  102f9d:	c3                   	ret    

00102f9e <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102f9e:	55                   	push   %ebp
  102f9f:	89 e5                	mov    %esp,%ebp
  102fa1:	57                   	push   %edi
  102fa2:	56                   	push   %esi
  102fa3:	83 ec 20             	sub    $0x20,%esp
  102fa6:	8b 45 08             	mov    0x8(%ebp),%eax
  102fa9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102fac:	8b 45 0c             	mov    0xc(%ebp),%eax
  102faf:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102fb2:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102fb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102fb8:	89 d1                	mov    %edx,%ecx
  102fba:	89 c2                	mov    %eax,%edx
  102fbc:	89 ce                	mov    %ecx,%esi
  102fbe:	89 d7                	mov    %edx,%edi
  102fc0:	ac                   	lods   %ds:(%esi),%al
  102fc1:	aa                   	stos   %al,%es:(%edi)
  102fc2:	84 c0                	test   %al,%al
  102fc4:	75 fa                	jne    102fc0 <strcpy+0x22>
  102fc6:	89 fa                	mov    %edi,%edx
  102fc8:	89 f1                	mov    %esi,%ecx
  102fca:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102fcd:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102fd0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102fd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102fd6:	83 c4 20             	add    $0x20,%esp
  102fd9:	5e                   	pop    %esi
  102fda:	5f                   	pop    %edi
  102fdb:	5d                   	pop    %ebp
  102fdc:	c3                   	ret    

00102fdd <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102fdd:	55                   	push   %ebp
  102fde:	89 e5                	mov    %esp,%ebp
  102fe0:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102fe3:	8b 45 08             	mov    0x8(%ebp),%eax
  102fe6:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102fe9:	eb 21                	jmp    10300c <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  102feb:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fee:	0f b6 10             	movzbl (%eax),%edx
  102ff1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ff4:	88 10                	mov    %dl,(%eax)
  102ff6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ff9:	0f b6 00             	movzbl (%eax),%eax
  102ffc:	84 c0                	test   %al,%al
  102ffe:	74 04                	je     103004 <strncpy+0x27>
            src ++;
  103000:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  103004:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  103008:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  10300c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103010:	75 d9                	jne    102feb <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  103012:	8b 45 08             	mov    0x8(%ebp),%eax
}
  103015:	c9                   	leave  
  103016:	c3                   	ret    

00103017 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  103017:	55                   	push   %ebp
  103018:	89 e5                	mov    %esp,%ebp
  10301a:	57                   	push   %edi
  10301b:	56                   	push   %esi
  10301c:	83 ec 20             	sub    $0x20,%esp
  10301f:	8b 45 08             	mov    0x8(%ebp),%eax
  103022:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103025:	8b 45 0c             	mov    0xc(%ebp),%eax
  103028:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  10302b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10302e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103031:	89 d1                	mov    %edx,%ecx
  103033:	89 c2                	mov    %eax,%edx
  103035:	89 ce                	mov    %ecx,%esi
  103037:	89 d7                	mov    %edx,%edi
  103039:	ac                   	lods   %ds:(%esi),%al
  10303a:	ae                   	scas   %es:(%edi),%al
  10303b:	75 08                	jne    103045 <strcmp+0x2e>
  10303d:	84 c0                	test   %al,%al
  10303f:	75 f8                	jne    103039 <strcmp+0x22>
  103041:	31 c0                	xor    %eax,%eax
  103043:	eb 04                	jmp    103049 <strcmp+0x32>
  103045:	19 c0                	sbb    %eax,%eax
  103047:	0c 01                	or     $0x1,%al
  103049:	89 fa                	mov    %edi,%edx
  10304b:	89 f1                	mov    %esi,%ecx
  10304d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103050:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  103053:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  103056:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  103059:	83 c4 20             	add    $0x20,%esp
  10305c:	5e                   	pop    %esi
  10305d:	5f                   	pop    %edi
  10305e:	5d                   	pop    %ebp
  10305f:	c3                   	ret    

00103060 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  103060:	55                   	push   %ebp
  103061:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  103063:	eb 0c                	jmp    103071 <strncmp+0x11>
        n --, s1 ++, s2 ++;
  103065:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103069:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10306d:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  103071:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103075:	74 1a                	je     103091 <strncmp+0x31>
  103077:	8b 45 08             	mov    0x8(%ebp),%eax
  10307a:	0f b6 00             	movzbl (%eax),%eax
  10307d:	84 c0                	test   %al,%al
  10307f:	74 10                	je     103091 <strncmp+0x31>
  103081:	8b 45 08             	mov    0x8(%ebp),%eax
  103084:	0f b6 10             	movzbl (%eax),%edx
  103087:	8b 45 0c             	mov    0xc(%ebp),%eax
  10308a:	0f b6 00             	movzbl (%eax),%eax
  10308d:	38 c2                	cmp    %al,%dl
  10308f:	74 d4                	je     103065 <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  103091:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103095:	74 18                	je     1030af <strncmp+0x4f>
  103097:	8b 45 08             	mov    0x8(%ebp),%eax
  10309a:	0f b6 00             	movzbl (%eax),%eax
  10309d:	0f b6 d0             	movzbl %al,%edx
  1030a0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030a3:	0f b6 00             	movzbl (%eax),%eax
  1030a6:	0f b6 c0             	movzbl %al,%eax
  1030a9:	29 c2                	sub    %eax,%edx
  1030ab:	89 d0                	mov    %edx,%eax
  1030ad:	eb 05                	jmp    1030b4 <strncmp+0x54>
  1030af:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1030b4:	5d                   	pop    %ebp
  1030b5:	c3                   	ret    

001030b6 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  1030b6:	55                   	push   %ebp
  1030b7:	89 e5                	mov    %esp,%ebp
  1030b9:	83 ec 04             	sub    $0x4,%esp
  1030bc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030bf:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  1030c2:	eb 14                	jmp    1030d8 <strchr+0x22>
        if (*s == c) {
  1030c4:	8b 45 08             	mov    0x8(%ebp),%eax
  1030c7:	0f b6 00             	movzbl (%eax),%eax
  1030ca:	3a 45 fc             	cmp    -0x4(%ebp),%al
  1030cd:	75 05                	jne    1030d4 <strchr+0x1e>
            return (char *)s;
  1030cf:	8b 45 08             	mov    0x8(%ebp),%eax
  1030d2:	eb 13                	jmp    1030e7 <strchr+0x31>
        }
        s ++;
  1030d4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  1030d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1030db:	0f b6 00             	movzbl (%eax),%eax
  1030de:	84 c0                	test   %al,%al
  1030e0:	75 e2                	jne    1030c4 <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  1030e2:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1030e7:	c9                   	leave  
  1030e8:	c3                   	ret    

001030e9 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  1030e9:	55                   	push   %ebp
  1030ea:	89 e5                	mov    %esp,%ebp
  1030ec:	83 ec 04             	sub    $0x4,%esp
  1030ef:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030f2:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  1030f5:	eb 11                	jmp    103108 <strfind+0x1f>
        if (*s == c) {
  1030f7:	8b 45 08             	mov    0x8(%ebp),%eax
  1030fa:	0f b6 00             	movzbl (%eax),%eax
  1030fd:	3a 45 fc             	cmp    -0x4(%ebp),%al
  103100:	75 02                	jne    103104 <strfind+0x1b>
            break;
  103102:	eb 0e                	jmp    103112 <strfind+0x29>
        }
        s ++;
  103104:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  103108:	8b 45 08             	mov    0x8(%ebp),%eax
  10310b:	0f b6 00             	movzbl (%eax),%eax
  10310e:	84 c0                	test   %al,%al
  103110:	75 e5                	jne    1030f7 <strfind+0xe>
        if (*s == c) {
            break;
        }
        s ++;
    }
    return (char *)s;
  103112:	8b 45 08             	mov    0x8(%ebp),%eax
}
  103115:	c9                   	leave  
  103116:	c3                   	ret    

00103117 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  103117:	55                   	push   %ebp
  103118:	89 e5                	mov    %esp,%ebp
  10311a:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  10311d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  103124:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  10312b:	eb 04                	jmp    103131 <strtol+0x1a>
        s ++;
  10312d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  103131:	8b 45 08             	mov    0x8(%ebp),%eax
  103134:	0f b6 00             	movzbl (%eax),%eax
  103137:	3c 20                	cmp    $0x20,%al
  103139:	74 f2                	je     10312d <strtol+0x16>
  10313b:	8b 45 08             	mov    0x8(%ebp),%eax
  10313e:	0f b6 00             	movzbl (%eax),%eax
  103141:	3c 09                	cmp    $0x9,%al
  103143:	74 e8                	je     10312d <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  103145:	8b 45 08             	mov    0x8(%ebp),%eax
  103148:	0f b6 00             	movzbl (%eax),%eax
  10314b:	3c 2b                	cmp    $0x2b,%al
  10314d:	75 06                	jne    103155 <strtol+0x3e>
        s ++;
  10314f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103153:	eb 15                	jmp    10316a <strtol+0x53>
    }
    else if (*s == '-') {
  103155:	8b 45 08             	mov    0x8(%ebp),%eax
  103158:	0f b6 00             	movzbl (%eax),%eax
  10315b:	3c 2d                	cmp    $0x2d,%al
  10315d:	75 0b                	jne    10316a <strtol+0x53>
        s ++, neg = 1;
  10315f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103163:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  10316a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10316e:	74 06                	je     103176 <strtol+0x5f>
  103170:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  103174:	75 24                	jne    10319a <strtol+0x83>
  103176:	8b 45 08             	mov    0x8(%ebp),%eax
  103179:	0f b6 00             	movzbl (%eax),%eax
  10317c:	3c 30                	cmp    $0x30,%al
  10317e:	75 1a                	jne    10319a <strtol+0x83>
  103180:	8b 45 08             	mov    0x8(%ebp),%eax
  103183:	83 c0 01             	add    $0x1,%eax
  103186:	0f b6 00             	movzbl (%eax),%eax
  103189:	3c 78                	cmp    $0x78,%al
  10318b:	75 0d                	jne    10319a <strtol+0x83>
        s += 2, base = 16;
  10318d:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  103191:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  103198:	eb 2a                	jmp    1031c4 <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  10319a:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10319e:	75 17                	jne    1031b7 <strtol+0xa0>
  1031a0:	8b 45 08             	mov    0x8(%ebp),%eax
  1031a3:	0f b6 00             	movzbl (%eax),%eax
  1031a6:	3c 30                	cmp    $0x30,%al
  1031a8:	75 0d                	jne    1031b7 <strtol+0xa0>
        s ++, base = 8;
  1031aa:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1031ae:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  1031b5:	eb 0d                	jmp    1031c4 <strtol+0xad>
    }
    else if (base == 0) {
  1031b7:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1031bb:	75 07                	jne    1031c4 <strtol+0xad>
        base = 10;
  1031bd:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  1031c4:	8b 45 08             	mov    0x8(%ebp),%eax
  1031c7:	0f b6 00             	movzbl (%eax),%eax
  1031ca:	3c 2f                	cmp    $0x2f,%al
  1031cc:	7e 1b                	jle    1031e9 <strtol+0xd2>
  1031ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1031d1:	0f b6 00             	movzbl (%eax),%eax
  1031d4:	3c 39                	cmp    $0x39,%al
  1031d6:	7f 11                	jg     1031e9 <strtol+0xd2>
            dig = *s - '0';
  1031d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1031db:	0f b6 00             	movzbl (%eax),%eax
  1031de:	0f be c0             	movsbl %al,%eax
  1031e1:	83 e8 30             	sub    $0x30,%eax
  1031e4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1031e7:	eb 48                	jmp    103231 <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  1031e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1031ec:	0f b6 00             	movzbl (%eax),%eax
  1031ef:	3c 60                	cmp    $0x60,%al
  1031f1:	7e 1b                	jle    10320e <strtol+0xf7>
  1031f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1031f6:	0f b6 00             	movzbl (%eax),%eax
  1031f9:	3c 7a                	cmp    $0x7a,%al
  1031fb:	7f 11                	jg     10320e <strtol+0xf7>
            dig = *s - 'a' + 10;
  1031fd:	8b 45 08             	mov    0x8(%ebp),%eax
  103200:	0f b6 00             	movzbl (%eax),%eax
  103203:	0f be c0             	movsbl %al,%eax
  103206:	83 e8 57             	sub    $0x57,%eax
  103209:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10320c:	eb 23                	jmp    103231 <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  10320e:	8b 45 08             	mov    0x8(%ebp),%eax
  103211:	0f b6 00             	movzbl (%eax),%eax
  103214:	3c 40                	cmp    $0x40,%al
  103216:	7e 3d                	jle    103255 <strtol+0x13e>
  103218:	8b 45 08             	mov    0x8(%ebp),%eax
  10321b:	0f b6 00             	movzbl (%eax),%eax
  10321e:	3c 5a                	cmp    $0x5a,%al
  103220:	7f 33                	jg     103255 <strtol+0x13e>
            dig = *s - 'A' + 10;
  103222:	8b 45 08             	mov    0x8(%ebp),%eax
  103225:	0f b6 00             	movzbl (%eax),%eax
  103228:	0f be c0             	movsbl %al,%eax
  10322b:	83 e8 37             	sub    $0x37,%eax
  10322e:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  103231:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103234:	3b 45 10             	cmp    0x10(%ebp),%eax
  103237:	7c 02                	jl     10323b <strtol+0x124>
            break;
  103239:	eb 1a                	jmp    103255 <strtol+0x13e>
        }
        s ++, val = (val * base) + dig;
  10323b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10323f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103242:	0f af 45 10          	imul   0x10(%ebp),%eax
  103246:	89 c2                	mov    %eax,%edx
  103248:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10324b:	01 d0                	add    %edx,%eax
  10324d:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  103250:	e9 6f ff ff ff       	jmp    1031c4 <strtol+0xad>

    if (endptr) {
  103255:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103259:	74 08                	je     103263 <strtol+0x14c>
        *endptr = (char *) s;
  10325b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10325e:	8b 55 08             	mov    0x8(%ebp),%edx
  103261:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  103263:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  103267:	74 07                	je     103270 <strtol+0x159>
  103269:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10326c:	f7 d8                	neg    %eax
  10326e:	eb 03                	jmp    103273 <strtol+0x15c>
  103270:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  103273:	c9                   	leave  
  103274:	c3                   	ret    

00103275 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  103275:	55                   	push   %ebp
  103276:	89 e5                	mov    %esp,%ebp
  103278:	57                   	push   %edi
  103279:	83 ec 24             	sub    $0x24,%esp
  10327c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10327f:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  103282:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  103286:	8b 55 08             	mov    0x8(%ebp),%edx
  103289:	89 55 f8             	mov    %edx,-0x8(%ebp)
  10328c:	88 45 f7             	mov    %al,-0x9(%ebp)
  10328f:	8b 45 10             	mov    0x10(%ebp),%eax
  103292:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  103295:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  103298:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  10329c:	8b 55 f8             	mov    -0x8(%ebp),%edx
  10329f:	89 d7                	mov    %edx,%edi
  1032a1:	f3 aa                	rep stos %al,%es:(%edi)
  1032a3:	89 fa                	mov    %edi,%edx
  1032a5:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  1032a8:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  1032ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  1032ae:	83 c4 24             	add    $0x24,%esp
  1032b1:	5f                   	pop    %edi
  1032b2:	5d                   	pop    %ebp
  1032b3:	c3                   	ret    

001032b4 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  1032b4:	55                   	push   %ebp
  1032b5:	89 e5                	mov    %esp,%ebp
  1032b7:	57                   	push   %edi
  1032b8:	56                   	push   %esi
  1032b9:	53                   	push   %ebx
  1032ba:	83 ec 30             	sub    $0x30,%esp
  1032bd:	8b 45 08             	mov    0x8(%ebp),%eax
  1032c0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1032c3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032c6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1032c9:	8b 45 10             	mov    0x10(%ebp),%eax
  1032cc:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  1032cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1032d2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  1032d5:	73 42                	jae    103319 <memmove+0x65>
  1032d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1032da:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1032dd:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1032e0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1032e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1032e6:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  1032e9:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1032ec:	c1 e8 02             	shr    $0x2,%eax
  1032ef:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  1032f1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1032f4:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1032f7:	89 d7                	mov    %edx,%edi
  1032f9:	89 c6                	mov    %eax,%esi
  1032fb:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1032fd:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  103300:	83 e1 03             	and    $0x3,%ecx
  103303:	74 02                	je     103307 <memmove+0x53>
  103305:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103307:	89 f0                	mov    %esi,%eax
  103309:	89 fa                	mov    %edi,%edx
  10330b:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  10330e:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  103311:	89 45 d0             	mov    %eax,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  103314:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103317:	eb 36                	jmp    10334f <memmove+0x9b>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  103319:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10331c:	8d 50 ff             	lea    -0x1(%eax),%edx
  10331f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103322:	01 c2                	add    %eax,%edx
  103324:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103327:	8d 48 ff             	lea    -0x1(%eax),%ecx
  10332a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10332d:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  103330:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103333:	89 c1                	mov    %eax,%ecx
  103335:	89 d8                	mov    %ebx,%eax
  103337:	89 d6                	mov    %edx,%esi
  103339:	89 c7                	mov    %eax,%edi
  10333b:	fd                   	std    
  10333c:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  10333e:	fc                   	cld    
  10333f:	89 f8                	mov    %edi,%eax
  103341:	89 f2                	mov    %esi,%edx
  103343:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  103346:	89 55 c8             	mov    %edx,-0x38(%ebp)
  103349:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  10334c:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  10334f:	83 c4 30             	add    $0x30,%esp
  103352:	5b                   	pop    %ebx
  103353:	5e                   	pop    %esi
  103354:	5f                   	pop    %edi
  103355:	5d                   	pop    %ebp
  103356:	c3                   	ret    

00103357 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  103357:	55                   	push   %ebp
  103358:	89 e5                	mov    %esp,%ebp
  10335a:	57                   	push   %edi
  10335b:	56                   	push   %esi
  10335c:	83 ec 20             	sub    $0x20,%esp
  10335f:	8b 45 08             	mov    0x8(%ebp),%eax
  103362:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103365:	8b 45 0c             	mov    0xc(%ebp),%eax
  103368:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10336b:	8b 45 10             	mov    0x10(%ebp),%eax
  10336e:	89 45 ec             	mov    %eax,-0x14(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  103371:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103374:	c1 e8 02             	shr    $0x2,%eax
  103377:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  103379:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10337c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10337f:	89 d7                	mov    %edx,%edi
  103381:	89 c6                	mov    %eax,%esi
  103383:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103385:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  103388:	83 e1 03             	and    $0x3,%ecx
  10338b:	74 02                	je     10338f <memcpy+0x38>
  10338d:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  10338f:	89 f0                	mov    %esi,%eax
  103391:	89 fa                	mov    %edi,%edx
  103393:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  103396:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  103399:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  10339c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  10339f:	83 c4 20             	add    $0x20,%esp
  1033a2:	5e                   	pop    %esi
  1033a3:	5f                   	pop    %edi
  1033a4:	5d                   	pop    %ebp
  1033a5:	c3                   	ret    

001033a6 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  1033a6:	55                   	push   %ebp
  1033a7:	89 e5                	mov    %esp,%ebp
  1033a9:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  1033ac:	8b 45 08             	mov    0x8(%ebp),%eax
  1033af:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  1033b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033b5:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  1033b8:	eb 30                	jmp    1033ea <memcmp+0x44>
        if (*s1 != *s2) {
  1033ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1033bd:	0f b6 10             	movzbl (%eax),%edx
  1033c0:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1033c3:	0f b6 00             	movzbl (%eax),%eax
  1033c6:	38 c2                	cmp    %al,%dl
  1033c8:	74 18                	je     1033e2 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  1033ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1033cd:	0f b6 00             	movzbl (%eax),%eax
  1033d0:	0f b6 d0             	movzbl %al,%edx
  1033d3:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1033d6:	0f b6 00             	movzbl (%eax),%eax
  1033d9:	0f b6 c0             	movzbl %al,%eax
  1033dc:	29 c2                	sub    %eax,%edx
  1033de:	89 d0                	mov    %edx,%eax
  1033e0:	eb 1a                	jmp    1033fc <memcmp+0x56>
        }
        s1 ++, s2 ++;
  1033e2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1033e6:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  1033ea:	8b 45 10             	mov    0x10(%ebp),%eax
  1033ed:	8d 50 ff             	lea    -0x1(%eax),%edx
  1033f0:	89 55 10             	mov    %edx,0x10(%ebp)
  1033f3:	85 c0                	test   %eax,%eax
  1033f5:	75 c3                	jne    1033ba <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  1033f7:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1033fc:	c9                   	leave  
  1033fd:	c3                   	ret    
