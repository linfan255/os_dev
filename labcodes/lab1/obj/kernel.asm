
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
  100027:	e8 1b 31 00 00       	call   103147 <memset>

    cons_init();                // init the console
  10002c:	e8 3f 15 00 00       	call   101570 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 e0 32 10 00 	movl   $0x1032e0,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 fc 32 10 00 	movl   $0x1032fc,(%esp)
  100046:	e8 c7 02 00 00       	call   100312 <cprintf>

    print_kerninfo();
  10004b:	e8 f6 07 00 00       	call   100846 <print_kerninfo>

    grade_backtrace();
  100050:	e8 86 00 00 00       	call   1000db <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 33 27 00 00       	call   10278d <pmm_init>

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
  10012b:	c7 04 24 01 33 10 00 	movl   $0x103301,(%esp)
  100132:	e8 db 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  100137:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10013b:	0f b7 d0             	movzwl %ax,%edx
  10013e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100143:	89 54 24 08          	mov    %edx,0x8(%esp)
  100147:	89 44 24 04          	mov    %eax,0x4(%esp)
  10014b:	c7 04 24 0f 33 10 00 	movl   $0x10330f,(%esp)
  100152:	e8 bb 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  100157:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10015b:	0f b7 d0             	movzwl %ax,%edx
  10015e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100163:	89 54 24 08          	mov    %edx,0x8(%esp)
  100167:	89 44 24 04          	mov    %eax,0x4(%esp)
  10016b:	c7 04 24 1d 33 10 00 	movl   $0x10331d,(%esp)
  100172:	e8 9b 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  100177:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10017b:	0f b7 d0             	movzwl %ax,%edx
  10017e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100183:	89 54 24 08          	mov    %edx,0x8(%esp)
  100187:	89 44 24 04          	mov    %eax,0x4(%esp)
  10018b:	c7 04 24 2b 33 10 00 	movl   $0x10332b,(%esp)
  100192:	e8 7b 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  100197:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  10019b:	0f b7 d0             	movzwl %ax,%edx
  10019e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001a3:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001a7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001ab:	c7 04 24 39 33 10 00 	movl   $0x103339,(%esp)
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
  1001db:	c7 04 24 48 33 10 00 	movl   $0x103348,(%esp)
  1001e2:	e8 2b 01 00 00       	call   100312 <cprintf>
    lab1_switch_to_user();
  1001e7:	e8 da ff ff ff       	call   1001c6 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001ec:	e8 0f ff ff ff       	call   100100 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001f1:	c7 04 24 68 33 10 00 	movl   $0x103368,(%esp)
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
  10021c:	c7 04 24 87 33 10 00 	movl   $0x103387,(%esp)
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
  100308:	e8 53 26 00 00       	call   102960 <vprintfmt>
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
  100512:	c7 00 8c 33 10 00    	movl   $0x10338c,(%eax)
    info->eip_line = 0;
  100518:	8b 45 0c             	mov    0xc(%ebp),%eax
  10051b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100522:	8b 45 0c             	mov    0xc(%ebp),%eax
  100525:	c7 40 08 8c 33 10 00 	movl   $0x10338c,0x8(%eax)
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
  100549:	c7 45 f4 ec 3b 10 00 	movl   $0x103bec,-0xc(%ebp)
    stab_end = __STAB_END__;
  100550:	c7 45 f0 78 b2 10 00 	movl   $0x10b278,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100557:	c7 45 ec 79 b2 10 00 	movl   $0x10b279,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  10055e:	c7 45 e8 89 d2 10 00 	movl   $0x10d289,-0x18(%ebp)

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
  1006bd:	e8 f9 28 00 00       	call   102fbb <strfind>
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
  10084c:	c7 04 24 96 33 10 00 	movl   $0x103396,(%esp)
  100853:	e8 ba fa ff ff       	call   100312 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100858:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10085f:	00 
  100860:	c7 04 24 af 33 10 00 	movl   $0x1033af,(%esp)
  100867:	e8 a6 fa ff ff       	call   100312 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  10086c:	c7 44 24 04 d0 32 10 	movl   $0x1032d0,0x4(%esp)
  100873:	00 
  100874:	c7 04 24 c7 33 10 00 	movl   $0x1033c7,(%esp)
  10087b:	e8 92 fa ff ff       	call   100312 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100880:	c7 44 24 04 16 ea 10 	movl   $0x10ea16,0x4(%esp)
  100887:	00 
  100888:	c7 04 24 df 33 10 00 	movl   $0x1033df,(%esp)
  10088f:	e8 7e fa ff ff       	call   100312 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100894:	c7 44 24 04 20 fd 10 	movl   $0x10fd20,0x4(%esp)
  10089b:	00 
  10089c:	c7 04 24 f7 33 10 00 	movl   $0x1033f7,(%esp)
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
  1008ce:	c7 04 24 10 34 10 00 	movl   $0x103410,(%esp)
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
  100902:	c7 04 24 3a 34 10 00 	movl   $0x10343a,(%esp)
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
  100971:	c7 04 24 56 34 10 00 	movl   $0x103456,(%esp)
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
  1009c3:	c7 04 24 68 34 10 00 	movl   $0x103468,(%esp)
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
  100a17:	c7 04 24 7c 34 10 00 	movl   $0x10347c,(%esp)
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
  100a8c:	c7 04 24 28 35 10 00 	movl   $0x103528,(%esp)
  100a93:	e8 f0 24 00 00       	call   102f88 <strchr>
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
  100ab6:	c7 04 24 2d 35 10 00 	movl   $0x10352d,(%esp)
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
  100af9:	c7 04 24 28 35 10 00 	movl   $0x103528,(%esp)
  100b00:	e8 83 24 00 00       	call   102f88 <strchr>
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
  100b65:	e8 7f 23 00 00       	call   102ee9 <strcmp>
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
  100bb3:	c7 04 24 4b 35 10 00 	movl   $0x10354b,(%esp)
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
  100bcc:	c7 04 24 64 35 10 00 	movl   $0x103564,(%esp)
  100bd3:	e8 3a f7 ff ff       	call   100312 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100bd8:	c7 04 24 8c 35 10 00 	movl   $0x10358c,(%esp)
  100bdf:	e8 2e f7 ff ff       	call   100312 <cprintf>

    if (tf != NULL) {
  100be4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100be8:	74 0b                	je     100bf5 <kmonitor+0x2f>
        print_trapframe(tf);
  100bea:	8b 45 08             	mov    0x8(%ebp),%eax
  100bed:	89 04 24             	mov    %eax,(%esp)
  100bf0:	e8 61 0c 00 00       	call   101856 <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100bf5:	c7 04 24 b1 35 10 00 	movl   $0x1035b1,(%esp)
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
  100c64:	c7 04 24 b5 35 10 00 	movl   $0x1035b5,(%esp)
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
  100cd6:	c7 04 24 be 35 10 00 	movl   $0x1035be,(%esp)
  100cdd:	e8 30 f6 ff ff       	call   100312 <cprintf>
    vcprintf(fmt, ap);
  100ce2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ce5:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ce9:	8b 45 10             	mov    0x10(%ebp),%eax
  100cec:	89 04 24             	mov    %eax,(%esp)
  100cef:	e8 eb f5 ff ff       	call   1002df <vcprintf>
    cprintf("\n");
  100cf4:	c7 04 24 da 35 10 00 	movl   $0x1035da,(%esp)
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
  100d2d:	c7 04 24 dc 35 10 00 	movl   $0x1035dc,(%esp)
  100d34:	e8 d9 f5 ff ff       	call   100312 <cprintf>
    vcprintf(fmt, ap);
  100d39:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d3c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d40:	8b 45 10             	mov    0x10(%ebp),%eax
  100d43:	89 04 24             	mov    %eax,(%esp)
  100d46:	e8 94 f5 ff ff       	call   1002df <vcprintf>
    cprintf("\n");
  100d4b:	c7 04 24 da 35 10 00 	movl   $0x1035da,(%esp)
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
  100dac:	c7 04 24 fa 35 10 00 	movl   $0x1035fa,(%esp)
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
  101199:	e8 e8 1f 00 00       	call   103186 <memmove>
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
  10151f:	c7 04 24 15 36 10 00 	movl   $0x103615,(%esp)
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
  10158e:	c7 04 24 21 36 10 00 	movl   $0x103621,(%esp)
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
  1017fc:	c7 04 24 40 36 10 00 	movl   $0x103640,(%esp)
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
      *     Can you see idt[256] in this file? Yes, it's IDT! you can use SETGATE macro to setup each item of IDT
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
}
  10180d:	5d                   	pop    %ebp
  10180e:	c3                   	ret    

0010180f <trapname>:

static const char *
trapname(int trapno) {
  10180f:	55                   	push   %ebp
  101810:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101812:	8b 45 08             	mov    0x8(%ebp),%eax
  101815:	83 f8 13             	cmp    $0x13,%eax
  101818:	77 0c                	ja     101826 <trapname+0x17>
        return excnames[trapno];
  10181a:	8b 45 08             	mov    0x8(%ebp),%eax
  10181d:	8b 04 85 a0 39 10 00 	mov    0x1039a0(,%eax,4),%eax
  101824:	eb 18                	jmp    10183e <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101826:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  10182a:	7e 0d                	jle    101839 <trapname+0x2a>
  10182c:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101830:	7f 07                	jg     101839 <trapname+0x2a>
        return "Hardware Interrupt";
  101832:	b8 4a 36 10 00       	mov    $0x10364a,%eax
  101837:	eb 05                	jmp    10183e <trapname+0x2f>
    }
    return "(unknown trap)";
  101839:	b8 5d 36 10 00       	mov    $0x10365d,%eax
}
  10183e:	5d                   	pop    %ebp
  10183f:	c3                   	ret    

00101840 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101840:	55                   	push   %ebp
  101841:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101843:	8b 45 08             	mov    0x8(%ebp),%eax
  101846:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  10184a:	66 83 f8 08          	cmp    $0x8,%ax
  10184e:	0f 94 c0             	sete   %al
  101851:	0f b6 c0             	movzbl %al,%eax
}
  101854:	5d                   	pop    %ebp
  101855:	c3                   	ret    

00101856 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101856:	55                   	push   %ebp
  101857:	89 e5                	mov    %esp,%ebp
  101859:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  10185c:	8b 45 08             	mov    0x8(%ebp),%eax
  10185f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101863:	c7 04 24 9e 36 10 00 	movl   $0x10369e,(%esp)
  10186a:	e8 a3 ea ff ff       	call   100312 <cprintf>
    print_regs(&tf->tf_regs);
  10186f:	8b 45 08             	mov    0x8(%ebp),%eax
  101872:	89 04 24             	mov    %eax,(%esp)
  101875:	e8 a1 01 00 00       	call   101a1b <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  10187a:	8b 45 08             	mov    0x8(%ebp),%eax
  10187d:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101881:	0f b7 c0             	movzwl %ax,%eax
  101884:	89 44 24 04          	mov    %eax,0x4(%esp)
  101888:	c7 04 24 af 36 10 00 	movl   $0x1036af,(%esp)
  10188f:	e8 7e ea ff ff       	call   100312 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101894:	8b 45 08             	mov    0x8(%ebp),%eax
  101897:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  10189b:	0f b7 c0             	movzwl %ax,%eax
  10189e:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018a2:	c7 04 24 c2 36 10 00 	movl   $0x1036c2,(%esp)
  1018a9:	e8 64 ea ff ff       	call   100312 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  1018ae:	8b 45 08             	mov    0x8(%ebp),%eax
  1018b1:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  1018b5:	0f b7 c0             	movzwl %ax,%eax
  1018b8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018bc:	c7 04 24 d5 36 10 00 	movl   $0x1036d5,(%esp)
  1018c3:	e8 4a ea ff ff       	call   100312 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  1018c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1018cb:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  1018cf:	0f b7 c0             	movzwl %ax,%eax
  1018d2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018d6:	c7 04 24 e8 36 10 00 	movl   $0x1036e8,(%esp)
  1018dd:	e8 30 ea ff ff       	call   100312 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  1018e2:	8b 45 08             	mov    0x8(%ebp),%eax
  1018e5:	8b 40 30             	mov    0x30(%eax),%eax
  1018e8:	89 04 24             	mov    %eax,(%esp)
  1018eb:	e8 1f ff ff ff       	call   10180f <trapname>
  1018f0:	8b 55 08             	mov    0x8(%ebp),%edx
  1018f3:	8b 52 30             	mov    0x30(%edx),%edx
  1018f6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1018fa:	89 54 24 04          	mov    %edx,0x4(%esp)
  1018fe:	c7 04 24 fb 36 10 00 	movl   $0x1036fb,(%esp)
  101905:	e8 08 ea ff ff       	call   100312 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  10190a:	8b 45 08             	mov    0x8(%ebp),%eax
  10190d:	8b 40 34             	mov    0x34(%eax),%eax
  101910:	89 44 24 04          	mov    %eax,0x4(%esp)
  101914:	c7 04 24 0d 37 10 00 	movl   $0x10370d,(%esp)
  10191b:	e8 f2 e9 ff ff       	call   100312 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101920:	8b 45 08             	mov    0x8(%ebp),%eax
  101923:	8b 40 38             	mov    0x38(%eax),%eax
  101926:	89 44 24 04          	mov    %eax,0x4(%esp)
  10192a:	c7 04 24 1c 37 10 00 	movl   $0x10371c,(%esp)
  101931:	e8 dc e9 ff ff       	call   100312 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101936:	8b 45 08             	mov    0x8(%ebp),%eax
  101939:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  10193d:	0f b7 c0             	movzwl %ax,%eax
  101940:	89 44 24 04          	mov    %eax,0x4(%esp)
  101944:	c7 04 24 2b 37 10 00 	movl   $0x10372b,(%esp)
  10194b:	e8 c2 e9 ff ff       	call   100312 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101950:	8b 45 08             	mov    0x8(%ebp),%eax
  101953:	8b 40 40             	mov    0x40(%eax),%eax
  101956:	89 44 24 04          	mov    %eax,0x4(%esp)
  10195a:	c7 04 24 3e 37 10 00 	movl   $0x10373e,(%esp)
  101961:	e8 ac e9 ff ff       	call   100312 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101966:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10196d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101974:	eb 3e                	jmp    1019b4 <print_trapframe+0x15e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101976:	8b 45 08             	mov    0x8(%ebp),%eax
  101979:	8b 50 40             	mov    0x40(%eax),%edx
  10197c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10197f:	21 d0                	and    %edx,%eax
  101981:	85 c0                	test   %eax,%eax
  101983:	74 28                	je     1019ad <print_trapframe+0x157>
  101985:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101988:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  10198f:	85 c0                	test   %eax,%eax
  101991:	74 1a                	je     1019ad <print_trapframe+0x157>
            cprintf("%s,", IA32flags[i]);
  101993:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101996:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  10199d:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019a1:	c7 04 24 4d 37 10 00 	movl   $0x10374d,(%esp)
  1019a8:	e8 65 e9 ff ff       	call   100312 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  1019ad:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1019b1:	d1 65 f0             	shll   -0x10(%ebp)
  1019b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1019b7:	83 f8 17             	cmp    $0x17,%eax
  1019ba:	76 ba                	jbe    101976 <print_trapframe+0x120>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  1019bc:	8b 45 08             	mov    0x8(%ebp),%eax
  1019bf:	8b 40 40             	mov    0x40(%eax),%eax
  1019c2:	25 00 30 00 00       	and    $0x3000,%eax
  1019c7:	c1 e8 0c             	shr    $0xc,%eax
  1019ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019ce:	c7 04 24 51 37 10 00 	movl   $0x103751,(%esp)
  1019d5:	e8 38 e9 ff ff       	call   100312 <cprintf>

    if (!trap_in_kernel(tf)) {
  1019da:	8b 45 08             	mov    0x8(%ebp),%eax
  1019dd:	89 04 24             	mov    %eax,(%esp)
  1019e0:	e8 5b fe ff ff       	call   101840 <trap_in_kernel>
  1019e5:	85 c0                	test   %eax,%eax
  1019e7:	75 30                	jne    101a19 <print_trapframe+0x1c3>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  1019e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1019ec:	8b 40 44             	mov    0x44(%eax),%eax
  1019ef:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019f3:	c7 04 24 5a 37 10 00 	movl   $0x10375a,(%esp)
  1019fa:	e8 13 e9 ff ff       	call   100312 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  1019ff:	8b 45 08             	mov    0x8(%ebp),%eax
  101a02:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101a06:	0f b7 c0             	movzwl %ax,%eax
  101a09:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a0d:	c7 04 24 69 37 10 00 	movl   $0x103769,(%esp)
  101a14:	e8 f9 e8 ff ff       	call   100312 <cprintf>
    }
}
  101a19:	c9                   	leave  
  101a1a:	c3                   	ret    

00101a1b <print_regs>:

void
print_regs(struct pushregs *regs) {
  101a1b:	55                   	push   %ebp
  101a1c:	89 e5                	mov    %esp,%ebp
  101a1e:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101a21:	8b 45 08             	mov    0x8(%ebp),%eax
  101a24:	8b 00                	mov    (%eax),%eax
  101a26:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a2a:	c7 04 24 7c 37 10 00 	movl   $0x10377c,(%esp)
  101a31:	e8 dc e8 ff ff       	call   100312 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101a36:	8b 45 08             	mov    0x8(%ebp),%eax
  101a39:	8b 40 04             	mov    0x4(%eax),%eax
  101a3c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a40:	c7 04 24 8b 37 10 00 	movl   $0x10378b,(%esp)
  101a47:	e8 c6 e8 ff ff       	call   100312 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101a4c:	8b 45 08             	mov    0x8(%ebp),%eax
  101a4f:	8b 40 08             	mov    0x8(%eax),%eax
  101a52:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a56:	c7 04 24 9a 37 10 00 	movl   $0x10379a,(%esp)
  101a5d:	e8 b0 e8 ff ff       	call   100312 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101a62:	8b 45 08             	mov    0x8(%ebp),%eax
  101a65:	8b 40 0c             	mov    0xc(%eax),%eax
  101a68:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a6c:	c7 04 24 a9 37 10 00 	movl   $0x1037a9,(%esp)
  101a73:	e8 9a e8 ff ff       	call   100312 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101a78:	8b 45 08             	mov    0x8(%ebp),%eax
  101a7b:	8b 40 10             	mov    0x10(%eax),%eax
  101a7e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a82:	c7 04 24 b8 37 10 00 	movl   $0x1037b8,(%esp)
  101a89:	e8 84 e8 ff ff       	call   100312 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101a8e:	8b 45 08             	mov    0x8(%ebp),%eax
  101a91:	8b 40 14             	mov    0x14(%eax),%eax
  101a94:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a98:	c7 04 24 c7 37 10 00 	movl   $0x1037c7,(%esp)
  101a9f:	e8 6e e8 ff ff       	call   100312 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101aa4:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa7:	8b 40 18             	mov    0x18(%eax),%eax
  101aaa:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aae:	c7 04 24 d6 37 10 00 	movl   $0x1037d6,(%esp)
  101ab5:	e8 58 e8 ff ff       	call   100312 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101aba:	8b 45 08             	mov    0x8(%ebp),%eax
  101abd:	8b 40 1c             	mov    0x1c(%eax),%eax
  101ac0:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ac4:	c7 04 24 e5 37 10 00 	movl   $0x1037e5,(%esp)
  101acb:	e8 42 e8 ff ff       	call   100312 <cprintf>
}
  101ad0:	c9                   	leave  
  101ad1:	c3                   	ret    

00101ad2 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101ad2:	55                   	push   %ebp
  101ad3:	89 e5                	mov    %esp,%ebp
  101ad5:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101ad8:	8b 45 08             	mov    0x8(%ebp),%eax
  101adb:	8b 40 30             	mov    0x30(%eax),%eax
  101ade:	83 f8 2f             	cmp    $0x2f,%eax
  101ae1:	77 1e                	ja     101b01 <trap_dispatch+0x2f>
  101ae3:	83 f8 2e             	cmp    $0x2e,%eax
  101ae6:	0f 83 bf 00 00 00    	jae    101bab <trap_dispatch+0xd9>
  101aec:	83 f8 21             	cmp    $0x21,%eax
  101aef:	74 40                	je     101b31 <trap_dispatch+0x5f>
  101af1:	83 f8 24             	cmp    $0x24,%eax
  101af4:	74 15                	je     101b0b <trap_dispatch+0x39>
  101af6:	83 f8 20             	cmp    $0x20,%eax
  101af9:	0f 84 af 00 00 00    	je     101bae <trap_dispatch+0xdc>
  101aff:	eb 72                	jmp    101b73 <trap_dispatch+0xa1>
  101b01:	83 e8 78             	sub    $0x78,%eax
  101b04:	83 f8 01             	cmp    $0x1,%eax
  101b07:	77 6a                	ja     101b73 <trap_dispatch+0xa1>
  101b09:	eb 4c                	jmp    101b57 <trap_dispatch+0x85>
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        break;
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101b0b:	e8 b5 fa ff ff       	call   1015c5 <cons_getc>
  101b10:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101b13:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101b17:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101b1b:	89 54 24 08          	mov    %edx,0x8(%esp)
  101b1f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b23:	c7 04 24 f4 37 10 00 	movl   $0x1037f4,(%esp)
  101b2a:	e8 e3 e7 ff ff       	call   100312 <cprintf>
        break;
  101b2f:	eb 7e                	jmp    101baf <trap_dispatch+0xdd>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101b31:	e8 8f fa ff ff       	call   1015c5 <cons_getc>
  101b36:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101b39:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101b3d:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101b41:	89 54 24 08          	mov    %edx,0x8(%esp)
  101b45:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b49:	c7 04 24 06 38 10 00 	movl   $0x103806,(%esp)
  101b50:	e8 bd e7 ff ff       	call   100312 <cprintf>
        break;
  101b55:	eb 58                	jmp    101baf <trap_dispatch+0xdd>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101b57:	c7 44 24 08 15 38 10 	movl   $0x103815,0x8(%esp)
  101b5e:	00 
  101b5f:	c7 44 24 04 a2 00 00 	movl   $0xa2,0x4(%esp)
  101b66:	00 
  101b67:	c7 04 24 25 38 10 00 	movl   $0x103825,(%esp)
  101b6e:	e8 34 f1 ff ff       	call   100ca7 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101b73:	8b 45 08             	mov    0x8(%ebp),%eax
  101b76:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101b7a:	0f b7 c0             	movzwl %ax,%eax
  101b7d:	83 e0 03             	and    $0x3,%eax
  101b80:	85 c0                	test   %eax,%eax
  101b82:	75 2b                	jne    101baf <trap_dispatch+0xdd>
            print_trapframe(tf);
  101b84:	8b 45 08             	mov    0x8(%ebp),%eax
  101b87:	89 04 24             	mov    %eax,(%esp)
  101b8a:	e8 c7 fc ff ff       	call   101856 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101b8f:	c7 44 24 08 36 38 10 	movl   $0x103836,0x8(%esp)
  101b96:	00 
  101b97:	c7 44 24 04 ac 00 00 	movl   $0xac,0x4(%esp)
  101b9e:	00 
  101b9f:	c7 04 24 25 38 10 00 	movl   $0x103825,(%esp)
  101ba6:	e8 fc f0 ff ff       	call   100ca7 <__panic>
        panic("T_SWITCH_** ??\n");
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101bab:	90                   	nop
  101bac:	eb 01                	jmp    101baf <trap_dispatch+0xdd>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        break;
  101bae:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101baf:	c9                   	leave  
  101bb0:	c3                   	ret    

00101bb1 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101bb1:	55                   	push   %ebp
  101bb2:	89 e5                	mov    %esp,%ebp
  101bb4:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101bb7:	8b 45 08             	mov    0x8(%ebp),%eax
  101bba:	89 04 24             	mov    %eax,(%esp)
  101bbd:	e8 10 ff ff ff       	call   101ad2 <trap_dispatch>
}
  101bc2:	c9                   	leave  
  101bc3:	c3                   	ret    

00101bc4 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  101bc4:	1e                   	push   %ds
    pushl %es
  101bc5:	06                   	push   %es
    pushl %fs
  101bc6:	0f a0                	push   %fs
    pushl %gs
  101bc8:	0f a8                	push   %gs
    pushal
  101bca:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  101bcb:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  101bd0:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  101bd2:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  101bd4:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  101bd5:	e8 d7 ff ff ff       	call   101bb1 <trap>

    # pop the pushed stack pointer
    popl %esp
  101bda:	5c                   	pop    %esp

00101bdb <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  101bdb:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  101bdc:	0f a9                	pop    %gs
    popl %fs
  101bde:	0f a1                	pop    %fs
    popl %es
  101be0:	07                   	pop    %es
    popl %ds
  101be1:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  101be2:	83 c4 08             	add    $0x8,%esp
    iret
  101be5:	cf                   	iret   

00101be6 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101be6:	6a 00                	push   $0x0
  pushl $0
  101be8:	6a 00                	push   $0x0
  jmp __alltraps
  101bea:	e9 d5 ff ff ff       	jmp    101bc4 <__alltraps>

00101bef <vector1>:
.globl vector1
vector1:
  pushl $0
  101bef:	6a 00                	push   $0x0
  pushl $1
  101bf1:	6a 01                	push   $0x1
  jmp __alltraps
  101bf3:	e9 cc ff ff ff       	jmp    101bc4 <__alltraps>

00101bf8 <vector2>:
.globl vector2
vector2:
  pushl $0
  101bf8:	6a 00                	push   $0x0
  pushl $2
  101bfa:	6a 02                	push   $0x2
  jmp __alltraps
  101bfc:	e9 c3 ff ff ff       	jmp    101bc4 <__alltraps>

00101c01 <vector3>:
.globl vector3
vector3:
  pushl $0
  101c01:	6a 00                	push   $0x0
  pushl $3
  101c03:	6a 03                	push   $0x3
  jmp __alltraps
  101c05:	e9 ba ff ff ff       	jmp    101bc4 <__alltraps>

00101c0a <vector4>:
.globl vector4
vector4:
  pushl $0
  101c0a:	6a 00                	push   $0x0
  pushl $4
  101c0c:	6a 04                	push   $0x4
  jmp __alltraps
  101c0e:	e9 b1 ff ff ff       	jmp    101bc4 <__alltraps>

00101c13 <vector5>:
.globl vector5
vector5:
  pushl $0
  101c13:	6a 00                	push   $0x0
  pushl $5
  101c15:	6a 05                	push   $0x5
  jmp __alltraps
  101c17:	e9 a8 ff ff ff       	jmp    101bc4 <__alltraps>

00101c1c <vector6>:
.globl vector6
vector6:
  pushl $0
  101c1c:	6a 00                	push   $0x0
  pushl $6
  101c1e:	6a 06                	push   $0x6
  jmp __alltraps
  101c20:	e9 9f ff ff ff       	jmp    101bc4 <__alltraps>

00101c25 <vector7>:
.globl vector7
vector7:
  pushl $0
  101c25:	6a 00                	push   $0x0
  pushl $7
  101c27:	6a 07                	push   $0x7
  jmp __alltraps
  101c29:	e9 96 ff ff ff       	jmp    101bc4 <__alltraps>

00101c2e <vector8>:
.globl vector8
vector8:
  pushl $8
  101c2e:	6a 08                	push   $0x8
  jmp __alltraps
  101c30:	e9 8f ff ff ff       	jmp    101bc4 <__alltraps>

00101c35 <vector9>:
.globl vector9
vector9:
  pushl $0
  101c35:	6a 00                	push   $0x0
  pushl $9
  101c37:	6a 09                	push   $0x9
  jmp __alltraps
  101c39:	e9 86 ff ff ff       	jmp    101bc4 <__alltraps>

00101c3e <vector10>:
.globl vector10
vector10:
  pushl $10
  101c3e:	6a 0a                	push   $0xa
  jmp __alltraps
  101c40:	e9 7f ff ff ff       	jmp    101bc4 <__alltraps>

00101c45 <vector11>:
.globl vector11
vector11:
  pushl $11
  101c45:	6a 0b                	push   $0xb
  jmp __alltraps
  101c47:	e9 78 ff ff ff       	jmp    101bc4 <__alltraps>

00101c4c <vector12>:
.globl vector12
vector12:
  pushl $12
  101c4c:	6a 0c                	push   $0xc
  jmp __alltraps
  101c4e:	e9 71 ff ff ff       	jmp    101bc4 <__alltraps>

00101c53 <vector13>:
.globl vector13
vector13:
  pushl $13
  101c53:	6a 0d                	push   $0xd
  jmp __alltraps
  101c55:	e9 6a ff ff ff       	jmp    101bc4 <__alltraps>

00101c5a <vector14>:
.globl vector14
vector14:
  pushl $14
  101c5a:	6a 0e                	push   $0xe
  jmp __alltraps
  101c5c:	e9 63 ff ff ff       	jmp    101bc4 <__alltraps>

00101c61 <vector15>:
.globl vector15
vector15:
  pushl $0
  101c61:	6a 00                	push   $0x0
  pushl $15
  101c63:	6a 0f                	push   $0xf
  jmp __alltraps
  101c65:	e9 5a ff ff ff       	jmp    101bc4 <__alltraps>

00101c6a <vector16>:
.globl vector16
vector16:
  pushl $0
  101c6a:	6a 00                	push   $0x0
  pushl $16
  101c6c:	6a 10                	push   $0x10
  jmp __alltraps
  101c6e:	e9 51 ff ff ff       	jmp    101bc4 <__alltraps>

00101c73 <vector17>:
.globl vector17
vector17:
  pushl $17
  101c73:	6a 11                	push   $0x11
  jmp __alltraps
  101c75:	e9 4a ff ff ff       	jmp    101bc4 <__alltraps>

00101c7a <vector18>:
.globl vector18
vector18:
  pushl $0
  101c7a:	6a 00                	push   $0x0
  pushl $18
  101c7c:	6a 12                	push   $0x12
  jmp __alltraps
  101c7e:	e9 41 ff ff ff       	jmp    101bc4 <__alltraps>

00101c83 <vector19>:
.globl vector19
vector19:
  pushl $0
  101c83:	6a 00                	push   $0x0
  pushl $19
  101c85:	6a 13                	push   $0x13
  jmp __alltraps
  101c87:	e9 38 ff ff ff       	jmp    101bc4 <__alltraps>

00101c8c <vector20>:
.globl vector20
vector20:
  pushl $0
  101c8c:	6a 00                	push   $0x0
  pushl $20
  101c8e:	6a 14                	push   $0x14
  jmp __alltraps
  101c90:	e9 2f ff ff ff       	jmp    101bc4 <__alltraps>

00101c95 <vector21>:
.globl vector21
vector21:
  pushl $0
  101c95:	6a 00                	push   $0x0
  pushl $21
  101c97:	6a 15                	push   $0x15
  jmp __alltraps
  101c99:	e9 26 ff ff ff       	jmp    101bc4 <__alltraps>

00101c9e <vector22>:
.globl vector22
vector22:
  pushl $0
  101c9e:	6a 00                	push   $0x0
  pushl $22
  101ca0:	6a 16                	push   $0x16
  jmp __alltraps
  101ca2:	e9 1d ff ff ff       	jmp    101bc4 <__alltraps>

00101ca7 <vector23>:
.globl vector23
vector23:
  pushl $0
  101ca7:	6a 00                	push   $0x0
  pushl $23
  101ca9:	6a 17                	push   $0x17
  jmp __alltraps
  101cab:	e9 14 ff ff ff       	jmp    101bc4 <__alltraps>

00101cb0 <vector24>:
.globl vector24
vector24:
  pushl $0
  101cb0:	6a 00                	push   $0x0
  pushl $24
  101cb2:	6a 18                	push   $0x18
  jmp __alltraps
  101cb4:	e9 0b ff ff ff       	jmp    101bc4 <__alltraps>

00101cb9 <vector25>:
.globl vector25
vector25:
  pushl $0
  101cb9:	6a 00                	push   $0x0
  pushl $25
  101cbb:	6a 19                	push   $0x19
  jmp __alltraps
  101cbd:	e9 02 ff ff ff       	jmp    101bc4 <__alltraps>

00101cc2 <vector26>:
.globl vector26
vector26:
  pushl $0
  101cc2:	6a 00                	push   $0x0
  pushl $26
  101cc4:	6a 1a                	push   $0x1a
  jmp __alltraps
  101cc6:	e9 f9 fe ff ff       	jmp    101bc4 <__alltraps>

00101ccb <vector27>:
.globl vector27
vector27:
  pushl $0
  101ccb:	6a 00                	push   $0x0
  pushl $27
  101ccd:	6a 1b                	push   $0x1b
  jmp __alltraps
  101ccf:	e9 f0 fe ff ff       	jmp    101bc4 <__alltraps>

00101cd4 <vector28>:
.globl vector28
vector28:
  pushl $0
  101cd4:	6a 00                	push   $0x0
  pushl $28
  101cd6:	6a 1c                	push   $0x1c
  jmp __alltraps
  101cd8:	e9 e7 fe ff ff       	jmp    101bc4 <__alltraps>

00101cdd <vector29>:
.globl vector29
vector29:
  pushl $0
  101cdd:	6a 00                	push   $0x0
  pushl $29
  101cdf:	6a 1d                	push   $0x1d
  jmp __alltraps
  101ce1:	e9 de fe ff ff       	jmp    101bc4 <__alltraps>

00101ce6 <vector30>:
.globl vector30
vector30:
  pushl $0
  101ce6:	6a 00                	push   $0x0
  pushl $30
  101ce8:	6a 1e                	push   $0x1e
  jmp __alltraps
  101cea:	e9 d5 fe ff ff       	jmp    101bc4 <__alltraps>

00101cef <vector31>:
.globl vector31
vector31:
  pushl $0
  101cef:	6a 00                	push   $0x0
  pushl $31
  101cf1:	6a 1f                	push   $0x1f
  jmp __alltraps
  101cf3:	e9 cc fe ff ff       	jmp    101bc4 <__alltraps>

00101cf8 <vector32>:
.globl vector32
vector32:
  pushl $0
  101cf8:	6a 00                	push   $0x0
  pushl $32
  101cfa:	6a 20                	push   $0x20
  jmp __alltraps
  101cfc:	e9 c3 fe ff ff       	jmp    101bc4 <__alltraps>

00101d01 <vector33>:
.globl vector33
vector33:
  pushl $0
  101d01:	6a 00                	push   $0x0
  pushl $33
  101d03:	6a 21                	push   $0x21
  jmp __alltraps
  101d05:	e9 ba fe ff ff       	jmp    101bc4 <__alltraps>

00101d0a <vector34>:
.globl vector34
vector34:
  pushl $0
  101d0a:	6a 00                	push   $0x0
  pushl $34
  101d0c:	6a 22                	push   $0x22
  jmp __alltraps
  101d0e:	e9 b1 fe ff ff       	jmp    101bc4 <__alltraps>

00101d13 <vector35>:
.globl vector35
vector35:
  pushl $0
  101d13:	6a 00                	push   $0x0
  pushl $35
  101d15:	6a 23                	push   $0x23
  jmp __alltraps
  101d17:	e9 a8 fe ff ff       	jmp    101bc4 <__alltraps>

00101d1c <vector36>:
.globl vector36
vector36:
  pushl $0
  101d1c:	6a 00                	push   $0x0
  pushl $36
  101d1e:	6a 24                	push   $0x24
  jmp __alltraps
  101d20:	e9 9f fe ff ff       	jmp    101bc4 <__alltraps>

00101d25 <vector37>:
.globl vector37
vector37:
  pushl $0
  101d25:	6a 00                	push   $0x0
  pushl $37
  101d27:	6a 25                	push   $0x25
  jmp __alltraps
  101d29:	e9 96 fe ff ff       	jmp    101bc4 <__alltraps>

00101d2e <vector38>:
.globl vector38
vector38:
  pushl $0
  101d2e:	6a 00                	push   $0x0
  pushl $38
  101d30:	6a 26                	push   $0x26
  jmp __alltraps
  101d32:	e9 8d fe ff ff       	jmp    101bc4 <__alltraps>

00101d37 <vector39>:
.globl vector39
vector39:
  pushl $0
  101d37:	6a 00                	push   $0x0
  pushl $39
  101d39:	6a 27                	push   $0x27
  jmp __alltraps
  101d3b:	e9 84 fe ff ff       	jmp    101bc4 <__alltraps>

00101d40 <vector40>:
.globl vector40
vector40:
  pushl $0
  101d40:	6a 00                	push   $0x0
  pushl $40
  101d42:	6a 28                	push   $0x28
  jmp __alltraps
  101d44:	e9 7b fe ff ff       	jmp    101bc4 <__alltraps>

00101d49 <vector41>:
.globl vector41
vector41:
  pushl $0
  101d49:	6a 00                	push   $0x0
  pushl $41
  101d4b:	6a 29                	push   $0x29
  jmp __alltraps
  101d4d:	e9 72 fe ff ff       	jmp    101bc4 <__alltraps>

00101d52 <vector42>:
.globl vector42
vector42:
  pushl $0
  101d52:	6a 00                	push   $0x0
  pushl $42
  101d54:	6a 2a                	push   $0x2a
  jmp __alltraps
  101d56:	e9 69 fe ff ff       	jmp    101bc4 <__alltraps>

00101d5b <vector43>:
.globl vector43
vector43:
  pushl $0
  101d5b:	6a 00                	push   $0x0
  pushl $43
  101d5d:	6a 2b                	push   $0x2b
  jmp __alltraps
  101d5f:	e9 60 fe ff ff       	jmp    101bc4 <__alltraps>

00101d64 <vector44>:
.globl vector44
vector44:
  pushl $0
  101d64:	6a 00                	push   $0x0
  pushl $44
  101d66:	6a 2c                	push   $0x2c
  jmp __alltraps
  101d68:	e9 57 fe ff ff       	jmp    101bc4 <__alltraps>

00101d6d <vector45>:
.globl vector45
vector45:
  pushl $0
  101d6d:	6a 00                	push   $0x0
  pushl $45
  101d6f:	6a 2d                	push   $0x2d
  jmp __alltraps
  101d71:	e9 4e fe ff ff       	jmp    101bc4 <__alltraps>

00101d76 <vector46>:
.globl vector46
vector46:
  pushl $0
  101d76:	6a 00                	push   $0x0
  pushl $46
  101d78:	6a 2e                	push   $0x2e
  jmp __alltraps
  101d7a:	e9 45 fe ff ff       	jmp    101bc4 <__alltraps>

00101d7f <vector47>:
.globl vector47
vector47:
  pushl $0
  101d7f:	6a 00                	push   $0x0
  pushl $47
  101d81:	6a 2f                	push   $0x2f
  jmp __alltraps
  101d83:	e9 3c fe ff ff       	jmp    101bc4 <__alltraps>

00101d88 <vector48>:
.globl vector48
vector48:
  pushl $0
  101d88:	6a 00                	push   $0x0
  pushl $48
  101d8a:	6a 30                	push   $0x30
  jmp __alltraps
  101d8c:	e9 33 fe ff ff       	jmp    101bc4 <__alltraps>

00101d91 <vector49>:
.globl vector49
vector49:
  pushl $0
  101d91:	6a 00                	push   $0x0
  pushl $49
  101d93:	6a 31                	push   $0x31
  jmp __alltraps
  101d95:	e9 2a fe ff ff       	jmp    101bc4 <__alltraps>

00101d9a <vector50>:
.globl vector50
vector50:
  pushl $0
  101d9a:	6a 00                	push   $0x0
  pushl $50
  101d9c:	6a 32                	push   $0x32
  jmp __alltraps
  101d9e:	e9 21 fe ff ff       	jmp    101bc4 <__alltraps>

00101da3 <vector51>:
.globl vector51
vector51:
  pushl $0
  101da3:	6a 00                	push   $0x0
  pushl $51
  101da5:	6a 33                	push   $0x33
  jmp __alltraps
  101da7:	e9 18 fe ff ff       	jmp    101bc4 <__alltraps>

00101dac <vector52>:
.globl vector52
vector52:
  pushl $0
  101dac:	6a 00                	push   $0x0
  pushl $52
  101dae:	6a 34                	push   $0x34
  jmp __alltraps
  101db0:	e9 0f fe ff ff       	jmp    101bc4 <__alltraps>

00101db5 <vector53>:
.globl vector53
vector53:
  pushl $0
  101db5:	6a 00                	push   $0x0
  pushl $53
  101db7:	6a 35                	push   $0x35
  jmp __alltraps
  101db9:	e9 06 fe ff ff       	jmp    101bc4 <__alltraps>

00101dbe <vector54>:
.globl vector54
vector54:
  pushl $0
  101dbe:	6a 00                	push   $0x0
  pushl $54
  101dc0:	6a 36                	push   $0x36
  jmp __alltraps
  101dc2:	e9 fd fd ff ff       	jmp    101bc4 <__alltraps>

00101dc7 <vector55>:
.globl vector55
vector55:
  pushl $0
  101dc7:	6a 00                	push   $0x0
  pushl $55
  101dc9:	6a 37                	push   $0x37
  jmp __alltraps
  101dcb:	e9 f4 fd ff ff       	jmp    101bc4 <__alltraps>

00101dd0 <vector56>:
.globl vector56
vector56:
  pushl $0
  101dd0:	6a 00                	push   $0x0
  pushl $56
  101dd2:	6a 38                	push   $0x38
  jmp __alltraps
  101dd4:	e9 eb fd ff ff       	jmp    101bc4 <__alltraps>

00101dd9 <vector57>:
.globl vector57
vector57:
  pushl $0
  101dd9:	6a 00                	push   $0x0
  pushl $57
  101ddb:	6a 39                	push   $0x39
  jmp __alltraps
  101ddd:	e9 e2 fd ff ff       	jmp    101bc4 <__alltraps>

00101de2 <vector58>:
.globl vector58
vector58:
  pushl $0
  101de2:	6a 00                	push   $0x0
  pushl $58
  101de4:	6a 3a                	push   $0x3a
  jmp __alltraps
  101de6:	e9 d9 fd ff ff       	jmp    101bc4 <__alltraps>

00101deb <vector59>:
.globl vector59
vector59:
  pushl $0
  101deb:	6a 00                	push   $0x0
  pushl $59
  101ded:	6a 3b                	push   $0x3b
  jmp __alltraps
  101def:	e9 d0 fd ff ff       	jmp    101bc4 <__alltraps>

00101df4 <vector60>:
.globl vector60
vector60:
  pushl $0
  101df4:	6a 00                	push   $0x0
  pushl $60
  101df6:	6a 3c                	push   $0x3c
  jmp __alltraps
  101df8:	e9 c7 fd ff ff       	jmp    101bc4 <__alltraps>

00101dfd <vector61>:
.globl vector61
vector61:
  pushl $0
  101dfd:	6a 00                	push   $0x0
  pushl $61
  101dff:	6a 3d                	push   $0x3d
  jmp __alltraps
  101e01:	e9 be fd ff ff       	jmp    101bc4 <__alltraps>

00101e06 <vector62>:
.globl vector62
vector62:
  pushl $0
  101e06:	6a 00                	push   $0x0
  pushl $62
  101e08:	6a 3e                	push   $0x3e
  jmp __alltraps
  101e0a:	e9 b5 fd ff ff       	jmp    101bc4 <__alltraps>

00101e0f <vector63>:
.globl vector63
vector63:
  pushl $0
  101e0f:	6a 00                	push   $0x0
  pushl $63
  101e11:	6a 3f                	push   $0x3f
  jmp __alltraps
  101e13:	e9 ac fd ff ff       	jmp    101bc4 <__alltraps>

00101e18 <vector64>:
.globl vector64
vector64:
  pushl $0
  101e18:	6a 00                	push   $0x0
  pushl $64
  101e1a:	6a 40                	push   $0x40
  jmp __alltraps
  101e1c:	e9 a3 fd ff ff       	jmp    101bc4 <__alltraps>

00101e21 <vector65>:
.globl vector65
vector65:
  pushl $0
  101e21:	6a 00                	push   $0x0
  pushl $65
  101e23:	6a 41                	push   $0x41
  jmp __alltraps
  101e25:	e9 9a fd ff ff       	jmp    101bc4 <__alltraps>

00101e2a <vector66>:
.globl vector66
vector66:
  pushl $0
  101e2a:	6a 00                	push   $0x0
  pushl $66
  101e2c:	6a 42                	push   $0x42
  jmp __alltraps
  101e2e:	e9 91 fd ff ff       	jmp    101bc4 <__alltraps>

00101e33 <vector67>:
.globl vector67
vector67:
  pushl $0
  101e33:	6a 00                	push   $0x0
  pushl $67
  101e35:	6a 43                	push   $0x43
  jmp __alltraps
  101e37:	e9 88 fd ff ff       	jmp    101bc4 <__alltraps>

00101e3c <vector68>:
.globl vector68
vector68:
  pushl $0
  101e3c:	6a 00                	push   $0x0
  pushl $68
  101e3e:	6a 44                	push   $0x44
  jmp __alltraps
  101e40:	e9 7f fd ff ff       	jmp    101bc4 <__alltraps>

00101e45 <vector69>:
.globl vector69
vector69:
  pushl $0
  101e45:	6a 00                	push   $0x0
  pushl $69
  101e47:	6a 45                	push   $0x45
  jmp __alltraps
  101e49:	e9 76 fd ff ff       	jmp    101bc4 <__alltraps>

00101e4e <vector70>:
.globl vector70
vector70:
  pushl $0
  101e4e:	6a 00                	push   $0x0
  pushl $70
  101e50:	6a 46                	push   $0x46
  jmp __alltraps
  101e52:	e9 6d fd ff ff       	jmp    101bc4 <__alltraps>

00101e57 <vector71>:
.globl vector71
vector71:
  pushl $0
  101e57:	6a 00                	push   $0x0
  pushl $71
  101e59:	6a 47                	push   $0x47
  jmp __alltraps
  101e5b:	e9 64 fd ff ff       	jmp    101bc4 <__alltraps>

00101e60 <vector72>:
.globl vector72
vector72:
  pushl $0
  101e60:	6a 00                	push   $0x0
  pushl $72
  101e62:	6a 48                	push   $0x48
  jmp __alltraps
  101e64:	e9 5b fd ff ff       	jmp    101bc4 <__alltraps>

00101e69 <vector73>:
.globl vector73
vector73:
  pushl $0
  101e69:	6a 00                	push   $0x0
  pushl $73
  101e6b:	6a 49                	push   $0x49
  jmp __alltraps
  101e6d:	e9 52 fd ff ff       	jmp    101bc4 <__alltraps>

00101e72 <vector74>:
.globl vector74
vector74:
  pushl $0
  101e72:	6a 00                	push   $0x0
  pushl $74
  101e74:	6a 4a                	push   $0x4a
  jmp __alltraps
  101e76:	e9 49 fd ff ff       	jmp    101bc4 <__alltraps>

00101e7b <vector75>:
.globl vector75
vector75:
  pushl $0
  101e7b:	6a 00                	push   $0x0
  pushl $75
  101e7d:	6a 4b                	push   $0x4b
  jmp __alltraps
  101e7f:	e9 40 fd ff ff       	jmp    101bc4 <__alltraps>

00101e84 <vector76>:
.globl vector76
vector76:
  pushl $0
  101e84:	6a 00                	push   $0x0
  pushl $76
  101e86:	6a 4c                	push   $0x4c
  jmp __alltraps
  101e88:	e9 37 fd ff ff       	jmp    101bc4 <__alltraps>

00101e8d <vector77>:
.globl vector77
vector77:
  pushl $0
  101e8d:	6a 00                	push   $0x0
  pushl $77
  101e8f:	6a 4d                	push   $0x4d
  jmp __alltraps
  101e91:	e9 2e fd ff ff       	jmp    101bc4 <__alltraps>

00101e96 <vector78>:
.globl vector78
vector78:
  pushl $0
  101e96:	6a 00                	push   $0x0
  pushl $78
  101e98:	6a 4e                	push   $0x4e
  jmp __alltraps
  101e9a:	e9 25 fd ff ff       	jmp    101bc4 <__alltraps>

00101e9f <vector79>:
.globl vector79
vector79:
  pushl $0
  101e9f:	6a 00                	push   $0x0
  pushl $79
  101ea1:	6a 4f                	push   $0x4f
  jmp __alltraps
  101ea3:	e9 1c fd ff ff       	jmp    101bc4 <__alltraps>

00101ea8 <vector80>:
.globl vector80
vector80:
  pushl $0
  101ea8:	6a 00                	push   $0x0
  pushl $80
  101eaa:	6a 50                	push   $0x50
  jmp __alltraps
  101eac:	e9 13 fd ff ff       	jmp    101bc4 <__alltraps>

00101eb1 <vector81>:
.globl vector81
vector81:
  pushl $0
  101eb1:	6a 00                	push   $0x0
  pushl $81
  101eb3:	6a 51                	push   $0x51
  jmp __alltraps
  101eb5:	e9 0a fd ff ff       	jmp    101bc4 <__alltraps>

00101eba <vector82>:
.globl vector82
vector82:
  pushl $0
  101eba:	6a 00                	push   $0x0
  pushl $82
  101ebc:	6a 52                	push   $0x52
  jmp __alltraps
  101ebe:	e9 01 fd ff ff       	jmp    101bc4 <__alltraps>

00101ec3 <vector83>:
.globl vector83
vector83:
  pushl $0
  101ec3:	6a 00                	push   $0x0
  pushl $83
  101ec5:	6a 53                	push   $0x53
  jmp __alltraps
  101ec7:	e9 f8 fc ff ff       	jmp    101bc4 <__alltraps>

00101ecc <vector84>:
.globl vector84
vector84:
  pushl $0
  101ecc:	6a 00                	push   $0x0
  pushl $84
  101ece:	6a 54                	push   $0x54
  jmp __alltraps
  101ed0:	e9 ef fc ff ff       	jmp    101bc4 <__alltraps>

00101ed5 <vector85>:
.globl vector85
vector85:
  pushl $0
  101ed5:	6a 00                	push   $0x0
  pushl $85
  101ed7:	6a 55                	push   $0x55
  jmp __alltraps
  101ed9:	e9 e6 fc ff ff       	jmp    101bc4 <__alltraps>

00101ede <vector86>:
.globl vector86
vector86:
  pushl $0
  101ede:	6a 00                	push   $0x0
  pushl $86
  101ee0:	6a 56                	push   $0x56
  jmp __alltraps
  101ee2:	e9 dd fc ff ff       	jmp    101bc4 <__alltraps>

00101ee7 <vector87>:
.globl vector87
vector87:
  pushl $0
  101ee7:	6a 00                	push   $0x0
  pushl $87
  101ee9:	6a 57                	push   $0x57
  jmp __alltraps
  101eeb:	e9 d4 fc ff ff       	jmp    101bc4 <__alltraps>

00101ef0 <vector88>:
.globl vector88
vector88:
  pushl $0
  101ef0:	6a 00                	push   $0x0
  pushl $88
  101ef2:	6a 58                	push   $0x58
  jmp __alltraps
  101ef4:	e9 cb fc ff ff       	jmp    101bc4 <__alltraps>

00101ef9 <vector89>:
.globl vector89
vector89:
  pushl $0
  101ef9:	6a 00                	push   $0x0
  pushl $89
  101efb:	6a 59                	push   $0x59
  jmp __alltraps
  101efd:	e9 c2 fc ff ff       	jmp    101bc4 <__alltraps>

00101f02 <vector90>:
.globl vector90
vector90:
  pushl $0
  101f02:	6a 00                	push   $0x0
  pushl $90
  101f04:	6a 5a                	push   $0x5a
  jmp __alltraps
  101f06:	e9 b9 fc ff ff       	jmp    101bc4 <__alltraps>

00101f0b <vector91>:
.globl vector91
vector91:
  pushl $0
  101f0b:	6a 00                	push   $0x0
  pushl $91
  101f0d:	6a 5b                	push   $0x5b
  jmp __alltraps
  101f0f:	e9 b0 fc ff ff       	jmp    101bc4 <__alltraps>

00101f14 <vector92>:
.globl vector92
vector92:
  pushl $0
  101f14:	6a 00                	push   $0x0
  pushl $92
  101f16:	6a 5c                	push   $0x5c
  jmp __alltraps
  101f18:	e9 a7 fc ff ff       	jmp    101bc4 <__alltraps>

00101f1d <vector93>:
.globl vector93
vector93:
  pushl $0
  101f1d:	6a 00                	push   $0x0
  pushl $93
  101f1f:	6a 5d                	push   $0x5d
  jmp __alltraps
  101f21:	e9 9e fc ff ff       	jmp    101bc4 <__alltraps>

00101f26 <vector94>:
.globl vector94
vector94:
  pushl $0
  101f26:	6a 00                	push   $0x0
  pushl $94
  101f28:	6a 5e                	push   $0x5e
  jmp __alltraps
  101f2a:	e9 95 fc ff ff       	jmp    101bc4 <__alltraps>

00101f2f <vector95>:
.globl vector95
vector95:
  pushl $0
  101f2f:	6a 00                	push   $0x0
  pushl $95
  101f31:	6a 5f                	push   $0x5f
  jmp __alltraps
  101f33:	e9 8c fc ff ff       	jmp    101bc4 <__alltraps>

00101f38 <vector96>:
.globl vector96
vector96:
  pushl $0
  101f38:	6a 00                	push   $0x0
  pushl $96
  101f3a:	6a 60                	push   $0x60
  jmp __alltraps
  101f3c:	e9 83 fc ff ff       	jmp    101bc4 <__alltraps>

00101f41 <vector97>:
.globl vector97
vector97:
  pushl $0
  101f41:	6a 00                	push   $0x0
  pushl $97
  101f43:	6a 61                	push   $0x61
  jmp __alltraps
  101f45:	e9 7a fc ff ff       	jmp    101bc4 <__alltraps>

00101f4a <vector98>:
.globl vector98
vector98:
  pushl $0
  101f4a:	6a 00                	push   $0x0
  pushl $98
  101f4c:	6a 62                	push   $0x62
  jmp __alltraps
  101f4e:	e9 71 fc ff ff       	jmp    101bc4 <__alltraps>

00101f53 <vector99>:
.globl vector99
vector99:
  pushl $0
  101f53:	6a 00                	push   $0x0
  pushl $99
  101f55:	6a 63                	push   $0x63
  jmp __alltraps
  101f57:	e9 68 fc ff ff       	jmp    101bc4 <__alltraps>

00101f5c <vector100>:
.globl vector100
vector100:
  pushl $0
  101f5c:	6a 00                	push   $0x0
  pushl $100
  101f5e:	6a 64                	push   $0x64
  jmp __alltraps
  101f60:	e9 5f fc ff ff       	jmp    101bc4 <__alltraps>

00101f65 <vector101>:
.globl vector101
vector101:
  pushl $0
  101f65:	6a 00                	push   $0x0
  pushl $101
  101f67:	6a 65                	push   $0x65
  jmp __alltraps
  101f69:	e9 56 fc ff ff       	jmp    101bc4 <__alltraps>

00101f6e <vector102>:
.globl vector102
vector102:
  pushl $0
  101f6e:	6a 00                	push   $0x0
  pushl $102
  101f70:	6a 66                	push   $0x66
  jmp __alltraps
  101f72:	e9 4d fc ff ff       	jmp    101bc4 <__alltraps>

00101f77 <vector103>:
.globl vector103
vector103:
  pushl $0
  101f77:	6a 00                	push   $0x0
  pushl $103
  101f79:	6a 67                	push   $0x67
  jmp __alltraps
  101f7b:	e9 44 fc ff ff       	jmp    101bc4 <__alltraps>

00101f80 <vector104>:
.globl vector104
vector104:
  pushl $0
  101f80:	6a 00                	push   $0x0
  pushl $104
  101f82:	6a 68                	push   $0x68
  jmp __alltraps
  101f84:	e9 3b fc ff ff       	jmp    101bc4 <__alltraps>

00101f89 <vector105>:
.globl vector105
vector105:
  pushl $0
  101f89:	6a 00                	push   $0x0
  pushl $105
  101f8b:	6a 69                	push   $0x69
  jmp __alltraps
  101f8d:	e9 32 fc ff ff       	jmp    101bc4 <__alltraps>

00101f92 <vector106>:
.globl vector106
vector106:
  pushl $0
  101f92:	6a 00                	push   $0x0
  pushl $106
  101f94:	6a 6a                	push   $0x6a
  jmp __alltraps
  101f96:	e9 29 fc ff ff       	jmp    101bc4 <__alltraps>

00101f9b <vector107>:
.globl vector107
vector107:
  pushl $0
  101f9b:	6a 00                	push   $0x0
  pushl $107
  101f9d:	6a 6b                	push   $0x6b
  jmp __alltraps
  101f9f:	e9 20 fc ff ff       	jmp    101bc4 <__alltraps>

00101fa4 <vector108>:
.globl vector108
vector108:
  pushl $0
  101fa4:	6a 00                	push   $0x0
  pushl $108
  101fa6:	6a 6c                	push   $0x6c
  jmp __alltraps
  101fa8:	e9 17 fc ff ff       	jmp    101bc4 <__alltraps>

00101fad <vector109>:
.globl vector109
vector109:
  pushl $0
  101fad:	6a 00                	push   $0x0
  pushl $109
  101faf:	6a 6d                	push   $0x6d
  jmp __alltraps
  101fb1:	e9 0e fc ff ff       	jmp    101bc4 <__alltraps>

00101fb6 <vector110>:
.globl vector110
vector110:
  pushl $0
  101fb6:	6a 00                	push   $0x0
  pushl $110
  101fb8:	6a 6e                	push   $0x6e
  jmp __alltraps
  101fba:	e9 05 fc ff ff       	jmp    101bc4 <__alltraps>

00101fbf <vector111>:
.globl vector111
vector111:
  pushl $0
  101fbf:	6a 00                	push   $0x0
  pushl $111
  101fc1:	6a 6f                	push   $0x6f
  jmp __alltraps
  101fc3:	e9 fc fb ff ff       	jmp    101bc4 <__alltraps>

00101fc8 <vector112>:
.globl vector112
vector112:
  pushl $0
  101fc8:	6a 00                	push   $0x0
  pushl $112
  101fca:	6a 70                	push   $0x70
  jmp __alltraps
  101fcc:	e9 f3 fb ff ff       	jmp    101bc4 <__alltraps>

00101fd1 <vector113>:
.globl vector113
vector113:
  pushl $0
  101fd1:	6a 00                	push   $0x0
  pushl $113
  101fd3:	6a 71                	push   $0x71
  jmp __alltraps
  101fd5:	e9 ea fb ff ff       	jmp    101bc4 <__alltraps>

00101fda <vector114>:
.globl vector114
vector114:
  pushl $0
  101fda:	6a 00                	push   $0x0
  pushl $114
  101fdc:	6a 72                	push   $0x72
  jmp __alltraps
  101fde:	e9 e1 fb ff ff       	jmp    101bc4 <__alltraps>

00101fe3 <vector115>:
.globl vector115
vector115:
  pushl $0
  101fe3:	6a 00                	push   $0x0
  pushl $115
  101fe5:	6a 73                	push   $0x73
  jmp __alltraps
  101fe7:	e9 d8 fb ff ff       	jmp    101bc4 <__alltraps>

00101fec <vector116>:
.globl vector116
vector116:
  pushl $0
  101fec:	6a 00                	push   $0x0
  pushl $116
  101fee:	6a 74                	push   $0x74
  jmp __alltraps
  101ff0:	e9 cf fb ff ff       	jmp    101bc4 <__alltraps>

00101ff5 <vector117>:
.globl vector117
vector117:
  pushl $0
  101ff5:	6a 00                	push   $0x0
  pushl $117
  101ff7:	6a 75                	push   $0x75
  jmp __alltraps
  101ff9:	e9 c6 fb ff ff       	jmp    101bc4 <__alltraps>

00101ffe <vector118>:
.globl vector118
vector118:
  pushl $0
  101ffe:	6a 00                	push   $0x0
  pushl $118
  102000:	6a 76                	push   $0x76
  jmp __alltraps
  102002:	e9 bd fb ff ff       	jmp    101bc4 <__alltraps>

00102007 <vector119>:
.globl vector119
vector119:
  pushl $0
  102007:	6a 00                	push   $0x0
  pushl $119
  102009:	6a 77                	push   $0x77
  jmp __alltraps
  10200b:	e9 b4 fb ff ff       	jmp    101bc4 <__alltraps>

00102010 <vector120>:
.globl vector120
vector120:
  pushl $0
  102010:	6a 00                	push   $0x0
  pushl $120
  102012:	6a 78                	push   $0x78
  jmp __alltraps
  102014:	e9 ab fb ff ff       	jmp    101bc4 <__alltraps>

00102019 <vector121>:
.globl vector121
vector121:
  pushl $0
  102019:	6a 00                	push   $0x0
  pushl $121
  10201b:	6a 79                	push   $0x79
  jmp __alltraps
  10201d:	e9 a2 fb ff ff       	jmp    101bc4 <__alltraps>

00102022 <vector122>:
.globl vector122
vector122:
  pushl $0
  102022:	6a 00                	push   $0x0
  pushl $122
  102024:	6a 7a                	push   $0x7a
  jmp __alltraps
  102026:	e9 99 fb ff ff       	jmp    101bc4 <__alltraps>

0010202b <vector123>:
.globl vector123
vector123:
  pushl $0
  10202b:	6a 00                	push   $0x0
  pushl $123
  10202d:	6a 7b                	push   $0x7b
  jmp __alltraps
  10202f:	e9 90 fb ff ff       	jmp    101bc4 <__alltraps>

00102034 <vector124>:
.globl vector124
vector124:
  pushl $0
  102034:	6a 00                	push   $0x0
  pushl $124
  102036:	6a 7c                	push   $0x7c
  jmp __alltraps
  102038:	e9 87 fb ff ff       	jmp    101bc4 <__alltraps>

0010203d <vector125>:
.globl vector125
vector125:
  pushl $0
  10203d:	6a 00                	push   $0x0
  pushl $125
  10203f:	6a 7d                	push   $0x7d
  jmp __alltraps
  102041:	e9 7e fb ff ff       	jmp    101bc4 <__alltraps>

00102046 <vector126>:
.globl vector126
vector126:
  pushl $0
  102046:	6a 00                	push   $0x0
  pushl $126
  102048:	6a 7e                	push   $0x7e
  jmp __alltraps
  10204a:	e9 75 fb ff ff       	jmp    101bc4 <__alltraps>

0010204f <vector127>:
.globl vector127
vector127:
  pushl $0
  10204f:	6a 00                	push   $0x0
  pushl $127
  102051:	6a 7f                	push   $0x7f
  jmp __alltraps
  102053:	e9 6c fb ff ff       	jmp    101bc4 <__alltraps>

00102058 <vector128>:
.globl vector128
vector128:
  pushl $0
  102058:	6a 00                	push   $0x0
  pushl $128
  10205a:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  10205f:	e9 60 fb ff ff       	jmp    101bc4 <__alltraps>

00102064 <vector129>:
.globl vector129
vector129:
  pushl $0
  102064:	6a 00                	push   $0x0
  pushl $129
  102066:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  10206b:	e9 54 fb ff ff       	jmp    101bc4 <__alltraps>

00102070 <vector130>:
.globl vector130
vector130:
  pushl $0
  102070:	6a 00                	push   $0x0
  pushl $130
  102072:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102077:	e9 48 fb ff ff       	jmp    101bc4 <__alltraps>

0010207c <vector131>:
.globl vector131
vector131:
  pushl $0
  10207c:	6a 00                	push   $0x0
  pushl $131
  10207e:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102083:	e9 3c fb ff ff       	jmp    101bc4 <__alltraps>

00102088 <vector132>:
.globl vector132
vector132:
  pushl $0
  102088:	6a 00                	push   $0x0
  pushl $132
  10208a:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  10208f:	e9 30 fb ff ff       	jmp    101bc4 <__alltraps>

00102094 <vector133>:
.globl vector133
vector133:
  pushl $0
  102094:	6a 00                	push   $0x0
  pushl $133
  102096:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  10209b:	e9 24 fb ff ff       	jmp    101bc4 <__alltraps>

001020a0 <vector134>:
.globl vector134
vector134:
  pushl $0
  1020a0:	6a 00                	push   $0x0
  pushl $134
  1020a2:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  1020a7:	e9 18 fb ff ff       	jmp    101bc4 <__alltraps>

001020ac <vector135>:
.globl vector135
vector135:
  pushl $0
  1020ac:	6a 00                	push   $0x0
  pushl $135
  1020ae:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  1020b3:	e9 0c fb ff ff       	jmp    101bc4 <__alltraps>

001020b8 <vector136>:
.globl vector136
vector136:
  pushl $0
  1020b8:	6a 00                	push   $0x0
  pushl $136
  1020ba:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  1020bf:	e9 00 fb ff ff       	jmp    101bc4 <__alltraps>

001020c4 <vector137>:
.globl vector137
vector137:
  pushl $0
  1020c4:	6a 00                	push   $0x0
  pushl $137
  1020c6:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1020cb:	e9 f4 fa ff ff       	jmp    101bc4 <__alltraps>

001020d0 <vector138>:
.globl vector138
vector138:
  pushl $0
  1020d0:	6a 00                	push   $0x0
  pushl $138
  1020d2:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1020d7:	e9 e8 fa ff ff       	jmp    101bc4 <__alltraps>

001020dc <vector139>:
.globl vector139
vector139:
  pushl $0
  1020dc:	6a 00                	push   $0x0
  pushl $139
  1020de:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1020e3:	e9 dc fa ff ff       	jmp    101bc4 <__alltraps>

001020e8 <vector140>:
.globl vector140
vector140:
  pushl $0
  1020e8:	6a 00                	push   $0x0
  pushl $140
  1020ea:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1020ef:	e9 d0 fa ff ff       	jmp    101bc4 <__alltraps>

001020f4 <vector141>:
.globl vector141
vector141:
  pushl $0
  1020f4:	6a 00                	push   $0x0
  pushl $141
  1020f6:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1020fb:	e9 c4 fa ff ff       	jmp    101bc4 <__alltraps>

00102100 <vector142>:
.globl vector142
vector142:
  pushl $0
  102100:	6a 00                	push   $0x0
  pushl $142
  102102:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  102107:	e9 b8 fa ff ff       	jmp    101bc4 <__alltraps>

0010210c <vector143>:
.globl vector143
vector143:
  pushl $0
  10210c:	6a 00                	push   $0x0
  pushl $143
  10210e:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  102113:	e9 ac fa ff ff       	jmp    101bc4 <__alltraps>

00102118 <vector144>:
.globl vector144
vector144:
  pushl $0
  102118:	6a 00                	push   $0x0
  pushl $144
  10211a:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  10211f:	e9 a0 fa ff ff       	jmp    101bc4 <__alltraps>

00102124 <vector145>:
.globl vector145
vector145:
  pushl $0
  102124:	6a 00                	push   $0x0
  pushl $145
  102126:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  10212b:	e9 94 fa ff ff       	jmp    101bc4 <__alltraps>

00102130 <vector146>:
.globl vector146
vector146:
  pushl $0
  102130:	6a 00                	push   $0x0
  pushl $146
  102132:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  102137:	e9 88 fa ff ff       	jmp    101bc4 <__alltraps>

0010213c <vector147>:
.globl vector147
vector147:
  pushl $0
  10213c:	6a 00                	push   $0x0
  pushl $147
  10213e:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102143:	e9 7c fa ff ff       	jmp    101bc4 <__alltraps>

00102148 <vector148>:
.globl vector148
vector148:
  pushl $0
  102148:	6a 00                	push   $0x0
  pushl $148
  10214a:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  10214f:	e9 70 fa ff ff       	jmp    101bc4 <__alltraps>

00102154 <vector149>:
.globl vector149
vector149:
  pushl $0
  102154:	6a 00                	push   $0x0
  pushl $149
  102156:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  10215b:	e9 64 fa ff ff       	jmp    101bc4 <__alltraps>

00102160 <vector150>:
.globl vector150
vector150:
  pushl $0
  102160:	6a 00                	push   $0x0
  pushl $150
  102162:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102167:	e9 58 fa ff ff       	jmp    101bc4 <__alltraps>

0010216c <vector151>:
.globl vector151
vector151:
  pushl $0
  10216c:	6a 00                	push   $0x0
  pushl $151
  10216e:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  102173:	e9 4c fa ff ff       	jmp    101bc4 <__alltraps>

00102178 <vector152>:
.globl vector152
vector152:
  pushl $0
  102178:	6a 00                	push   $0x0
  pushl $152
  10217a:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  10217f:	e9 40 fa ff ff       	jmp    101bc4 <__alltraps>

00102184 <vector153>:
.globl vector153
vector153:
  pushl $0
  102184:	6a 00                	push   $0x0
  pushl $153
  102186:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  10218b:	e9 34 fa ff ff       	jmp    101bc4 <__alltraps>

00102190 <vector154>:
.globl vector154
vector154:
  pushl $0
  102190:	6a 00                	push   $0x0
  pushl $154
  102192:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102197:	e9 28 fa ff ff       	jmp    101bc4 <__alltraps>

0010219c <vector155>:
.globl vector155
vector155:
  pushl $0
  10219c:	6a 00                	push   $0x0
  pushl $155
  10219e:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  1021a3:	e9 1c fa ff ff       	jmp    101bc4 <__alltraps>

001021a8 <vector156>:
.globl vector156
vector156:
  pushl $0
  1021a8:	6a 00                	push   $0x0
  pushl $156
  1021aa:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  1021af:	e9 10 fa ff ff       	jmp    101bc4 <__alltraps>

001021b4 <vector157>:
.globl vector157
vector157:
  pushl $0
  1021b4:	6a 00                	push   $0x0
  pushl $157
  1021b6:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  1021bb:	e9 04 fa ff ff       	jmp    101bc4 <__alltraps>

001021c0 <vector158>:
.globl vector158
vector158:
  pushl $0
  1021c0:	6a 00                	push   $0x0
  pushl $158
  1021c2:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1021c7:	e9 f8 f9 ff ff       	jmp    101bc4 <__alltraps>

001021cc <vector159>:
.globl vector159
vector159:
  pushl $0
  1021cc:	6a 00                	push   $0x0
  pushl $159
  1021ce:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1021d3:	e9 ec f9 ff ff       	jmp    101bc4 <__alltraps>

001021d8 <vector160>:
.globl vector160
vector160:
  pushl $0
  1021d8:	6a 00                	push   $0x0
  pushl $160
  1021da:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1021df:	e9 e0 f9 ff ff       	jmp    101bc4 <__alltraps>

001021e4 <vector161>:
.globl vector161
vector161:
  pushl $0
  1021e4:	6a 00                	push   $0x0
  pushl $161
  1021e6:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1021eb:	e9 d4 f9 ff ff       	jmp    101bc4 <__alltraps>

001021f0 <vector162>:
.globl vector162
vector162:
  pushl $0
  1021f0:	6a 00                	push   $0x0
  pushl $162
  1021f2:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1021f7:	e9 c8 f9 ff ff       	jmp    101bc4 <__alltraps>

001021fc <vector163>:
.globl vector163
vector163:
  pushl $0
  1021fc:	6a 00                	push   $0x0
  pushl $163
  1021fe:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  102203:	e9 bc f9 ff ff       	jmp    101bc4 <__alltraps>

00102208 <vector164>:
.globl vector164
vector164:
  pushl $0
  102208:	6a 00                	push   $0x0
  pushl $164
  10220a:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  10220f:	e9 b0 f9 ff ff       	jmp    101bc4 <__alltraps>

00102214 <vector165>:
.globl vector165
vector165:
  pushl $0
  102214:	6a 00                	push   $0x0
  pushl $165
  102216:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  10221b:	e9 a4 f9 ff ff       	jmp    101bc4 <__alltraps>

00102220 <vector166>:
.globl vector166
vector166:
  pushl $0
  102220:	6a 00                	push   $0x0
  pushl $166
  102222:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  102227:	e9 98 f9 ff ff       	jmp    101bc4 <__alltraps>

0010222c <vector167>:
.globl vector167
vector167:
  pushl $0
  10222c:	6a 00                	push   $0x0
  pushl $167
  10222e:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102233:	e9 8c f9 ff ff       	jmp    101bc4 <__alltraps>

00102238 <vector168>:
.globl vector168
vector168:
  pushl $0
  102238:	6a 00                	push   $0x0
  pushl $168
  10223a:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  10223f:	e9 80 f9 ff ff       	jmp    101bc4 <__alltraps>

00102244 <vector169>:
.globl vector169
vector169:
  pushl $0
  102244:	6a 00                	push   $0x0
  pushl $169
  102246:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  10224b:	e9 74 f9 ff ff       	jmp    101bc4 <__alltraps>

00102250 <vector170>:
.globl vector170
vector170:
  pushl $0
  102250:	6a 00                	push   $0x0
  pushl $170
  102252:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102257:	e9 68 f9 ff ff       	jmp    101bc4 <__alltraps>

0010225c <vector171>:
.globl vector171
vector171:
  pushl $0
  10225c:	6a 00                	push   $0x0
  pushl $171
  10225e:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  102263:	e9 5c f9 ff ff       	jmp    101bc4 <__alltraps>

00102268 <vector172>:
.globl vector172
vector172:
  pushl $0
  102268:	6a 00                	push   $0x0
  pushl $172
  10226a:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  10226f:	e9 50 f9 ff ff       	jmp    101bc4 <__alltraps>

00102274 <vector173>:
.globl vector173
vector173:
  pushl $0
  102274:	6a 00                	push   $0x0
  pushl $173
  102276:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  10227b:	e9 44 f9 ff ff       	jmp    101bc4 <__alltraps>

00102280 <vector174>:
.globl vector174
vector174:
  pushl $0
  102280:	6a 00                	push   $0x0
  pushl $174
  102282:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102287:	e9 38 f9 ff ff       	jmp    101bc4 <__alltraps>

0010228c <vector175>:
.globl vector175
vector175:
  pushl $0
  10228c:	6a 00                	push   $0x0
  pushl $175
  10228e:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102293:	e9 2c f9 ff ff       	jmp    101bc4 <__alltraps>

00102298 <vector176>:
.globl vector176
vector176:
  pushl $0
  102298:	6a 00                	push   $0x0
  pushl $176
  10229a:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  10229f:	e9 20 f9 ff ff       	jmp    101bc4 <__alltraps>

001022a4 <vector177>:
.globl vector177
vector177:
  pushl $0
  1022a4:	6a 00                	push   $0x0
  pushl $177
  1022a6:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  1022ab:	e9 14 f9 ff ff       	jmp    101bc4 <__alltraps>

001022b0 <vector178>:
.globl vector178
vector178:
  pushl $0
  1022b0:	6a 00                	push   $0x0
  pushl $178
  1022b2:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  1022b7:	e9 08 f9 ff ff       	jmp    101bc4 <__alltraps>

001022bc <vector179>:
.globl vector179
vector179:
  pushl $0
  1022bc:	6a 00                	push   $0x0
  pushl $179
  1022be:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  1022c3:	e9 fc f8 ff ff       	jmp    101bc4 <__alltraps>

001022c8 <vector180>:
.globl vector180
vector180:
  pushl $0
  1022c8:	6a 00                	push   $0x0
  pushl $180
  1022ca:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1022cf:	e9 f0 f8 ff ff       	jmp    101bc4 <__alltraps>

001022d4 <vector181>:
.globl vector181
vector181:
  pushl $0
  1022d4:	6a 00                	push   $0x0
  pushl $181
  1022d6:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1022db:	e9 e4 f8 ff ff       	jmp    101bc4 <__alltraps>

001022e0 <vector182>:
.globl vector182
vector182:
  pushl $0
  1022e0:	6a 00                	push   $0x0
  pushl $182
  1022e2:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1022e7:	e9 d8 f8 ff ff       	jmp    101bc4 <__alltraps>

001022ec <vector183>:
.globl vector183
vector183:
  pushl $0
  1022ec:	6a 00                	push   $0x0
  pushl $183
  1022ee:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1022f3:	e9 cc f8 ff ff       	jmp    101bc4 <__alltraps>

001022f8 <vector184>:
.globl vector184
vector184:
  pushl $0
  1022f8:	6a 00                	push   $0x0
  pushl $184
  1022fa:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1022ff:	e9 c0 f8 ff ff       	jmp    101bc4 <__alltraps>

00102304 <vector185>:
.globl vector185
vector185:
  pushl $0
  102304:	6a 00                	push   $0x0
  pushl $185
  102306:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  10230b:	e9 b4 f8 ff ff       	jmp    101bc4 <__alltraps>

00102310 <vector186>:
.globl vector186
vector186:
  pushl $0
  102310:	6a 00                	push   $0x0
  pushl $186
  102312:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  102317:	e9 a8 f8 ff ff       	jmp    101bc4 <__alltraps>

0010231c <vector187>:
.globl vector187
vector187:
  pushl $0
  10231c:	6a 00                	push   $0x0
  pushl $187
  10231e:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102323:	e9 9c f8 ff ff       	jmp    101bc4 <__alltraps>

00102328 <vector188>:
.globl vector188
vector188:
  pushl $0
  102328:	6a 00                	push   $0x0
  pushl $188
  10232a:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  10232f:	e9 90 f8 ff ff       	jmp    101bc4 <__alltraps>

00102334 <vector189>:
.globl vector189
vector189:
  pushl $0
  102334:	6a 00                	push   $0x0
  pushl $189
  102336:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  10233b:	e9 84 f8 ff ff       	jmp    101bc4 <__alltraps>

00102340 <vector190>:
.globl vector190
vector190:
  pushl $0
  102340:	6a 00                	push   $0x0
  pushl $190
  102342:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102347:	e9 78 f8 ff ff       	jmp    101bc4 <__alltraps>

0010234c <vector191>:
.globl vector191
vector191:
  pushl $0
  10234c:	6a 00                	push   $0x0
  pushl $191
  10234e:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102353:	e9 6c f8 ff ff       	jmp    101bc4 <__alltraps>

00102358 <vector192>:
.globl vector192
vector192:
  pushl $0
  102358:	6a 00                	push   $0x0
  pushl $192
  10235a:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  10235f:	e9 60 f8 ff ff       	jmp    101bc4 <__alltraps>

00102364 <vector193>:
.globl vector193
vector193:
  pushl $0
  102364:	6a 00                	push   $0x0
  pushl $193
  102366:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  10236b:	e9 54 f8 ff ff       	jmp    101bc4 <__alltraps>

00102370 <vector194>:
.globl vector194
vector194:
  pushl $0
  102370:	6a 00                	push   $0x0
  pushl $194
  102372:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102377:	e9 48 f8 ff ff       	jmp    101bc4 <__alltraps>

0010237c <vector195>:
.globl vector195
vector195:
  pushl $0
  10237c:	6a 00                	push   $0x0
  pushl $195
  10237e:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102383:	e9 3c f8 ff ff       	jmp    101bc4 <__alltraps>

00102388 <vector196>:
.globl vector196
vector196:
  pushl $0
  102388:	6a 00                	push   $0x0
  pushl $196
  10238a:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  10238f:	e9 30 f8 ff ff       	jmp    101bc4 <__alltraps>

00102394 <vector197>:
.globl vector197
vector197:
  pushl $0
  102394:	6a 00                	push   $0x0
  pushl $197
  102396:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  10239b:	e9 24 f8 ff ff       	jmp    101bc4 <__alltraps>

001023a0 <vector198>:
.globl vector198
vector198:
  pushl $0
  1023a0:	6a 00                	push   $0x0
  pushl $198
  1023a2:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  1023a7:	e9 18 f8 ff ff       	jmp    101bc4 <__alltraps>

001023ac <vector199>:
.globl vector199
vector199:
  pushl $0
  1023ac:	6a 00                	push   $0x0
  pushl $199
  1023ae:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  1023b3:	e9 0c f8 ff ff       	jmp    101bc4 <__alltraps>

001023b8 <vector200>:
.globl vector200
vector200:
  pushl $0
  1023b8:	6a 00                	push   $0x0
  pushl $200
  1023ba:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  1023bf:	e9 00 f8 ff ff       	jmp    101bc4 <__alltraps>

001023c4 <vector201>:
.globl vector201
vector201:
  pushl $0
  1023c4:	6a 00                	push   $0x0
  pushl $201
  1023c6:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1023cb:	e9 f4 f7 ff ff       	jmp    101bc4 <__alltraps>

001023d0 <vector202>:
.globl vector202
vector202:
  pushl $0
  1023d0:	6a 00                	push   $0x0
  pushl $202
  1023d2:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1023d7:	e9 e8 f7 ff ff       	jmp    101bc4 <__alltraps>

001023dc <vector203>:
.globl vector203
vector203:
  pushl $0
  1023dc:	6a 00                	push   $0x0
  pushl $203
  1023de:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1023e3:	e9 dc f7 ff ff       	jmp    101bc4 <__alltraps>

001023e8 <vector204>:
.globl vector204
vector204:
  pushl $0
  1023e8:	6a 00                	push   $0x0
  pushl $204
  1023ea:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1023ef:	e9 d0 f7 ff ff       	jmp    101bc4 <__alltraps>

001023f4 <vector205>:
.globl vector205
vector205:
  pushl $0
  1023f4:	6a 00                	push   $0x0
  pushl $205
  1023f6:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1023fb:	e9 c4 f7 ff ff       	jmp    101bc4 <__alltraps>

00102400 <vector206>:
.globl vector206
vector206:
  pushl $0
  102400:	6a 00                	push   $0x0
  pushl $206
  102402:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  102407:	e9 b8 f7 ff ff       	jmp    101bc4 <__alltraps>

0010240c <vector207>:
.globl vector207
vector207:
  pushl $0
  10240c:	6a 00                	push   $0x0
  pushl $207
  10240e:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  102413:	e9 ac f7 ff ff       	jmp    101bc4 <__alltraps>

00102418 <vector208>:
.globl vector208
vector208:
  pushl $0
  102418:	6a 00                	push   $0x0
  pushl $208
  10241a:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  10241f:	e9 a0 f7 ff ff       	jmp    101bc4 <__alltraps>

00102424 <vector209>:
.globl vector209
vector209:
  pushl $0
  102424:	6a 00                	push   $0x0
  pushl $209
  102426:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  10242b:	e9 94 f7 ff ff       	jmp    101bc4 <__alltraps>

00102430 <vector210>:
.globl vector210
vector210:
  pushl $0
  102430:	6a 00                	push   $0x0
  pushl $210
  102432:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  102437:	e9 88 f7 ff ff       	jmp    101bc4 <__alltraps>

0010243c <vector211>:
.globl vector211
vector211:
  pushl $0
  10243c:	6a 00                	push   $0x0
  pushl $211
  10243e:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102443:	e9 7c f7 ff ff       	jmp    101bc4 <__alltraps>

00102448 <vector212>:
.globl vector212
vector212:
  pushl $0
  102448:	6a 00                	push   $0x0
  pushl $212
  10244a:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  10244f:	e9 70 f7 ff ff       	jmp    101bc4 <__alltraps>

00102454 <vector213>:
.globl vector213
vector213:
  pushl $0
  102454:	6a 00                	push   $0x0
  pushl $213
  102456:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  10245b:	e9 64 f7 ff ff       	jmp    101bc4 <__alltraps>

00102460 <vector214>:
.globl vector214
vector214:
  pushl $0
  102460:	6a 00                	push   $0x0
  pushl $214
  102462:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102467:	e9 58 f7 ff ff       	jmp    101bc4 <__alltraps>

0010246c <vector215>:
.globl vector215
vector215:
  pushl $0
  10246c:	6a 00                	push   $0x0
  pushl $215
  10246e:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  102473:	e9 4c f7 ff ff       	jmp    101bc4 <__alltraps>

00102478 <vector216>:
.globl vector216
vector216:
  pushl $0
  102478:	6a 00                	push   $0x0
  pushl $216
  10247a:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  10247f:	e9 40 f7 ff ff       	jmp    101bc4 <__alltraps>

00102484 <vector217>:
.globl vector217
vector217:
  pushl $0
  102484:	6a 00                	push   $0x0
  pushl $217
  102486:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  10248b:	e9 34 f7 ff ff       	jmp    101bc4 <__alltraps>

00102490 <vector218>:
.globl vector218
vector218:
  pushl $0
  102490:	6a 00                	push   $0x0
  pushl $218
  102492:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102497:	e9 28 f7 ff ff       	jmp    101bc4 <__alltraps>

0010249c <vector219>:
.globl vector219
vector219:
  pushl $0
  10249c:	6a 00                	push   $0x0
  pushl $219
  10249e:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  1024a3:	e9 1c f7 ff ff       	jmp    101bc4 <__alltraps>

001024a8 <vector220>:
.globl vector220
vector220:
  pushl $0
  1024a8:	6a 00                	push   $0x0
  pushl $220
  1024aa:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  1024af:	e9 10 f7 ff ff       	jmp    101bc4 <__alltraps>

001024b4 <vector221>:
.globl vector221
vector221:
  pushl $0
  1024b4:	6a 00                	push   $0x0
  pushl $221
  1024b6:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  1024bb:	e9 04 f7 ff ff       	jmp    101bc4 <__alltraps>

001024c0 <vector222>:
.globl vector222
vector222:
  pushl $0
  1024c0:	6a 00                	push   $0x0
  pushl $222
  1024c2:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1024c7:	e9 f8 f6 ff ff       	jmp    101bc4 <__alltraps>

001024cc <vector223>:
.globl vector223
vector223:
  pushl $0
  1024cc:	6a 00                	push   $0x0
  pushl $223
  1024ce:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1024d3:	e9 ec f6 ff ff       	jmp    101bc4 <__alltraps>

001024d8 <vector224>:
.globl vector224
vector224:
  pushl $0
  1024d8:	6a 00                	push   $0x0
  pushl $224
  1024da:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1024df:	e9 e0 f6 ff ff       	jmp    101bc4 <__alltraps>

001024e4 <vector225>:
.globl vector225
vector225:
  pushl $0
  1024e4:	6a 00                	push   $0x0
  pushl $225
  1024e6:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1024eb:	e9 d4 f6 ff ff       	jmp    101bc4 <__alltraps>

001024f0 <vector226>:
.globl vector226
vector226:
  pushl $0
  1024f0:	6a 00                	push   $0x0
  pushl $226
  1024f2:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1024f7:	e9 c8 f6 ff ff       	jmp    101bc4 <__alltraps>

001024fc <vector227>:
.globl vector227
vector227:
  pushl $0
  1024fc:	6a 00                	push   $0x0
  pushl $227
  1024fe:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  102503:	e9 bc f6 ff ff       	jmp    101bc4 <__alltraps>

00102508 <vector228>:
.globl vector228
vector228:
  pushl $0
  102508:	6a 00                	push   $0x0
  pushl $228
  10250a:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  10250f:	e9 b0 f6 ff ff       	jmp    101bc4 <__alltraps>

00102514 <vector229>:
.globl vector229
vector229:
  pushl $0
  102514:	6a 00                	push   $0x0
  pushl $229
  102516:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  10251b:	e9 a4 f6 ff ff       	jmp    101bc4 <__alltraps>

00102520 <vector230>:
.globl vector230
vector230:
  pushl $0
  102520:	6a 00                	push   $0x0
  pushl $230
  102522:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  102527:	e9 98 f6 ff ff       	jmp    101bc4 <__alltraps>

0010252c <vector231>:
.globl vector231
vector231:
  pushl $0
  10252c:	6a 00                	push   $0x0
  pushl $231
  10252e:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102533:	e9 8c f6 ff ff       	jmp    101bc4 <__alltraps>

00102538 <vector232>:
.globl vector232
vector232:
  pushl $0
  102538:	6a 00                	push   $0x0
  pushl $232
  10253a:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  10253f:	e9 80 f6 ff ff       	jmp    101bc4 <__alltraps>

00102544 <vector233>:
.globl vector233
vector233:
  pushl $0
  102544:	6a 00                	push   $0x0
  pushl $233
  102546:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  10254b:	e9 74 f6 ff ff       	jmp    101bc4 <__alltraps>

00102550 <vector234>:
.globl vector234
vector234:
  pushl $0
  102550:	6a 00                	push   $0x0
  pushl $234
  102552:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102557:	e9 68 f6 ff ff       	jmp    101bc4 <__alltraps>

0010255c <vector235>:
.globl vector235
vector235:
  pushl $0
  10255c:	6a 00                	push   $0x0
  pushl $235
  10255e:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  102563:	e9 5c f6 ff ff       	jmp    101bc4 <__alltraps>

00102568 <vector236>:
.globl vector236
vector236:
  pushl $0
  102568:	6a 00                	push   $0x0
  pushl $236
  10256a:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  10256f:	e9 50 f6 ff ff       	jmp    101bc4 <__alltraps>

00102574 <vector237>:
.globl vector237
vector237:
  pushl $0
  102574:	6a 00                	push   $0x0
  pushl $237
  102576:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  10257b:	e9 44 f6 ff ff       	jmp    101bc4 <__alltraps>

00102580 <vector238>:
.globl vector238
vector238:
  pushl $0
  102580:	6a 00                	push   $0x0
  pushl $238
  102582:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102587:	e9 38 f6 ff ff       	jmp    101bc4 <__alltraps>

0010258c <vector239>:
.globl vector239
vector239:
  pushl $0
  10258c:	6a 00                	push   $0x0
  pushl $239
  10258e:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102593:	e9 2c f6 ff ff       	jmp    101bc4 <__alltraps>

00102598 <vector240>:
.globl vector240
vector240:
  pushl $0
  102598:	6a 00                	push   $0x0
  pushl $240
  10259a:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  10259f:	e9 20 f6 ff ff       	jmp    101bc4 <__alltraps>

001025a4 <vector241>:
.globl vector241
vector241:
  pushl $0
  1025a4:	6a 00                	push   $0x0
  pushl $241
  1025a6:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  1025ab:	e9 14 f6 ff ff       	jmp    101bc4 <__alltraps>

001025b0 <vector242>:
.globl vector242
vector242:
  pushl $0
  1025b0:	6a 00                	push   $0x0
  pushl $242
  1025b2:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  1025b7:	e9 08 f6 ff ff       	jmp    101bc4 <__alltraps>

001025bc <vector243>:
.globl vector243
vector243:
  pushl $0
  1025bc:	6a 00                	push   $0x0
  pushl $243
  1025be:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  1025c3:	e9 fc f5 ff ff       	jmp    101bc4 <__alltraps>

001025c8 <vector244>:
.globl vector244
vector244:
  pushl $0
  1025c8:	6a 00                	push   $0x0
  pushl $244
  1025ca:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1025cf:	e9 f0 f5 ff ff       	jmp    101bc4 <__alltraps>

001025d4 <vector245>:
.globl vector245
vector245:
  pushl $0
  1025d4:	6a 00                	push   $0x0
  pushl $245
  1025d6:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1025db:	e9 e4 f5 ff ff       	jmp    101bc4 <__alltraps>

001025e0 <vector246>:
.globl vector246
vector246:
  pushl $0
  1025e0:	6a 00                	push   $0x0
  pushl $246
  1025e2:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1025e7:	e9 d8 f5 ff ff       	jmp    101bc4 <__alltraps>

001025ec <vector247>:
.globl vector247
vector247:
  pushl $0
  1025ec:	6a 00                	push   $0x0
  pushl $247
  1025ee:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1025f3:	e9 cc f5 ff ff       	jmp    101bc4 <__alltraps>

001025f8 <vector248>:
.globl vector248
vector248:
  pushl $0
  1025f8:	6a 00                	push   $0x0
  pushl $248
  1025fa:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1025ff:	e9 c0 f5 ff ff       	jmp    101bc4 <__alltraps>

00102604 <vector249>:
.globl vector249
vector249:
  pushl $0
  102604:	6a 00                	push   $0x0
  pushl $249
  102606:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  10260b:	e9 b4 f5 ff ff       	jmp    101bc4 <__alltraps>

00102610 <vector250>:
.globl vector250
vector250:
  pushl $0
  102610:	6a 00                	push   $0x0
  pushl $250
  102612:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  102617:	e9 a8 f5 ff ff       	jmp    101bc4 <__alltraps>

0010261c <vector251>:
.globl vector251
vector251:
  pushl $0
  10261c:	6a 00                	push   $0x0
  pushl $251
  10261e:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102623:	e9 9c f5 ff ff       	jmp    101bc4 <__alltraps>

00102628 <vector252>:
.globl vector252
vector252:
  pushl $0
  102628:	6a 00                	push   $0x0
  pushl $252
  10262a:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  10262f:	e9 90 f5 ff ff       	jmp    101bc4 <__alltraps>

00102634 <vector253>:
.globl vector253
vector253:
  pushl $0
  102634:	6a 00                	push   $0x0
  pushl $253
  102636:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  10263b:	e9 84 f5 ff ff       	jmp    101bc4 <__alltraps>

00102640 <vector254>:
.globl vector254
vector254:
  pushl $0
  102640:	6a 00                	push   $0x0
  pushl $254
  102642:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102647:	e9 78 f5 ff ff       	jmp    101bc4 <__alltraps>

0010264c <vector255>:
.globl vector255
vector255:
  pushl $0
  10264c:	6a 00                	push   $0x0
  pushl $255
  10264e:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102653:	e9 6c f5 ff ff       	jmp    101bc4 <__alltraps>

00102658 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102658:	55                   	push   %ebp
  102659:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  10265b:	8b 45 08             	mov    0x8(%ebp),%eax
  10265e:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102661:	b8 23 00 00 00       	mov    $0x23,%eax
  102666:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102668:	b8 23 00 00 00       	mov    $0x23,%eax
  10266d:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  10266f:	b8 10 00 00 00       	mov    $0x10,%eax
  102674:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102676:	b8 10 00 00 00       	mov    $0x10,%eax
  10267b:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  10267d:	b8 10 00 00 00       	mov    $0x10,%eax
  102682:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102684:	ea 8b 26 10 00 08 00 	ljmp   $0x8,$0x10268b
}
  10268b:	5d                   	pop    %ebp
  10268c:	c3                   	ret    

0010268d <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  10268d:	55                   	push   %ebp
  10268e:	89 e5                	mov    %esp,%ebp
  102690:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102693:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  102698:	05 00 04 00 00       	add    $0x400,%eax
  10269d:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  1026a2:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  1026a9:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  1026ab:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  1026b2:	68 00 
  1026b4:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1026b9:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  1026bf:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1026c4:	c1 e8 10             	shr    $0x10,%eax
  1026c7:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  1026cc:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1026d3:	83 e0 f0             	and    $0xfffffff0,%eax
  1026d6:	83 c8 09             	or     $0x9,%eax
  1026d9:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1026de:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1026e5:	83 c8 10             	or     $0x10,%eax
  1026e8:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1026ed:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1026f4:	83 e0 9f             	and    $0xffffff9f,%eax
  1026f7:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  1026fc:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102703:	83 c8 80             	or     $0xffffff80,%eax
  102706:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  10270b:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102712:	83 e0 f0             	and    $0xfffffff0,%eax
  102715:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  10271a:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102721:	83 e0 ef             	and    $0xffffffef,%eax
  102724:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102729:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102730:	83 e0 df             	and    $0xffffffdf,%eax
  102733:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102738:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  10273f:	83 c8 40             	or     $0x40,%eax
  102742:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102747:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  10274e:	83 e0 7f             	and    $0x7f,%eax
  102751:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102756:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  10275b:	c1 e8 18             	shr    $0x18,%eax
  10275e:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102763:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10276a:	83 e0 ef             	and    $0xffffffef,%eax
  10276d:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102772:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  102779:	e8 da fe ff ff       	call   102658 <lgdt>
  10277e:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102784:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102788:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  10278b:	c9                   	leave  
  10278c:	c3                   	ret    

0010278d <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  10278d:	55                   	push   %ebp
  10278e:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102790:	e8 f8 fe ff ff       	call   10268d <gdt_init>
}
  102795:	5d                   	pop    %ebp
  102796:	c3                   	ret    

00102797 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102797:	55                   	push   %ebp
  102798:	89 e5                	mov    %esp,%ebp
  10279a:	83 ec 58             	sub    $0x58,%esp
  10279d:	8b 45 10             	mov    0x10(%ebp),%eax
  1027a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1027a3:	8b 45 14             	mov    0x14(%ebp),%eax
  1027a6:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  1027a9:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1027ac:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1027af:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1027b2:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  1027b5:	8b 45 18             	mov    0x18(%ebp),%eax
  1027b8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1027bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1027be:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1027c1:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1027c4:	89 55 f0             	mov    %edx,-0x10(%ebp)
  1027c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1027ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1027cd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  1027d1:	74 1c                	je     1027ef <printnum+0x58>
  1027d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1027d6:	ba 00 00 00 00       	mov    $0x0,%edx
  1027db:	f7 75 e4             	divl   -0x1c(%ebp)
  1027de:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1027e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1027e4:	ba 00 00 00 00       	mov    $0x0,%edx
  1027e9:	f7 75 e4             	divl   -0x1c(%ebp)
  1027ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1027ef:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1027f2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1027f5:	f7 75 e4             	divl   -0x1c(%ebp)
  1027f8:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1027fb:	89 55 dc             	mov    %edx,-0x24(%ebp)
  1027fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102801:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102804:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102807:	89 55 ec             	mov    %edx,-0x14(%ebp)
  10280a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10280d:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102810:	8b 45 18             	mov    0x18(%ebp),%eax
  102813:	ba 00 00 00 00       	mov    $0x0,%edx
  102818:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  10281b:	77 56                	ja     102873 <printnum+0xdc>
  10281d:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  102820:	72 05                	jb     102827 <printnum+0x90>
  102822:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  102825:	77 4c                	ja     102873 <printnum+0xdc>
        printnum(putch, putdat, result, base, width - 1, padc);
  102827:	8b 45 1c             	mov    0x1c(%ebp),%eax
  10282a:	8d 50 ff             	lea    -0x1(%eax),%edx
  10282d:	8b 45 20             	mov    0x20(%ebp),%eax
  102830:	89 44 24 18          	mov    %eax,0x18(%esp)
  102834:	89 54 24 14          	mov    %edx,0x14(%esp)
  102838:	8b 45 18             	mov    0x18(%ebp),%eax
  10283b:	89 44 24 10          	mov    %eax,0x10(%esp)
  10283f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102842:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102845:	89 44 24 08          	mov    %eax,0x8(%esp)
  102849:	89 54 24 0c          	mov    %edx,0xc(%esp)
  10284d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102850:	89 44 24 04          	mov    %eax,0x4(%esp)
  102854:	8b 45 08             	mov    0x8(%ebp),%eax
  102857:	89 04 24             	mov    %eax,(%esp)
  10285a:	e8 38 ff ff ff       	call   102797 <printnum>
  10285f:	eb 1c                	jmp    10287d <printnum+0xe6>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102861:	8b 45 0c             	mov    0xc(%ebp),%eax
  102864:	89 44 24 04          	mov    %eax,0x4(%esp)
  102868:	8b 45 20             	mov    0x20(%ebp),%eax
  10286b:	89 04 24             	mov    %eax,(%esp)
  10286e:	8b 45 08             	mov    0x8(%ebp),%eax
  102871:	ff d0                	call   *%eax
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  102873:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  102877:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  10287b:	7f e4                	jg     102861 <printnum+0xca>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  10287d:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102880:	05 70 3a 10 00       	add    $0x103a70,%eax
  102885:	0f b6 00             	movzbl (%eax),%eax
  102888:	0f be c0             	movsbl %al,%eax
  10288b:	8b 55 0c             	mov    0xc(%ebp),%edx
  10288e:	89 54 24 04          	mov    %edx,0x4(%esp)
  102892:	89 04 24             	mov    %eax,(%esp)
  102895:	8b 45 08             	mov    0x8(%ebp),%eax
  102898:	ff d0                	call   *%eax
}
  10289a:	c9                   	leave  
  10289b:	c3                   	ret    

0010289c <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  10289c:	55                   	push   %ebp
  10289d:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  10289f:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  1028a3:	7e 14                	jle    1028b9 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  1028a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1028a8:	8b 00                	mov    (%eax),%eax
  1028aa:	8d 48 08             	lea    0x8(%eax),%ecx
  1028ad:	8b 55 08             	mov    0x8(%ebp),%edx
  1028b0:	89 0a                	mov    %ecx,(%edx)
  1028b2:	8b 50 04             	mov    0x4(%eax),%edx
  1028b5:	8b 00                	mov    (%eax),%eax
  1028b7:	eb 30                	jmp    1028e9 <getuint+0x4d>
    }
    else if (lflag) {
  1028b9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1028bd:	74 16                	je     1028d5 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  1028bf:	8b 45 08             	mov    0x8(%ebp),%eax
  1028c2:	8b 00                	mov    (%eax),%eax
  1028c4:	8d 48 04             	lea    0x4(%eax),%ecx
  1028c7:	8b 55 08             	mov    0x8(%ebp),%edx
  1028ca:	89 0a                	mov    %ecx,(%edx)
  1028cc:	8b 00                	mov    (%eax),%eax
  1028ce:	ba 00 00 00 00       	mov    $0x0,%edx
  1028d3:	eb 14                	jmp    1028e9 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  1028d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1028d8:	8b 00                	mov    (%eax),%eax
  1028da:	8d 48 04             	lea    0x4(%eax),%ecx
  1028dd:	8b 55 08             	mov    0x8(%ebp),%edx
  1028e0:	89 0a                	mov    %ecx,(%edx)
  1028e2:	8b 00                	mov    (%eax),%eax
  1028e4:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  1028e9:	5d                   	pop    %ebp
  1028ea:	c3                   	ret    

001028eb <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  1028eb:	55                   	push   %ebp
  1028ec:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  1028ee:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  1028f2:	7e 14                	jle    102908 <getint+0x1d>
        return va_arg(*ap, long long);
  1028f4:	8b 45 08             	mov    0x8(%ebp),%eax
  1028f7:	8b 00                	mov    (%eax),%eax
  1028f9:	8d 48 08             	lea    0x8(%eax),%ecx
  1028fc:	8b 55 08             	mov    0x8(%ebp),%edx
  1028ff:	89 0a                	mov    %ecx,(%edx)
  102901:	8b 50 04             	mov    0x4(%eax),%edx
  102904:	8b 00                	mov    (%eax),%eax
  102906:	eb 28                	jmp    102930 <getint+0x45>
    }
    else if (lflag) {
  102908:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10290c:	74 12                	je     102920 <getint+0x35>
        return va_arg(*ap, long);
  10290e:	8b 45 08             	mov    0x8(%ebp),%eax
  102911:	8b 00                	mov    (%eax),%eax
  102913:	8d 48 04             	lea    0x4(%eax),%ecx
  102916:	8b 55 08             	mov    0x8(%ebp),%edx
  102919:	89 0a                	mov    %ecx,(%edx)
  10291b:	8b 00                	mov    (%eax),%eax
  10291d:	99                   	cltd   
  10291e:	eb 10                	jmp    102930 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102920:	8b 45 08             	mov    0x8(%ebp),%eax
  102923:	8b 00                	mov    (%eax),%eax
  102925:	8d 48 04             	lea    0x4(%eax),%ecx
  102928:	8b 55 08             	mov    0x8(%ebp),%edx
  10292b:	89 0a                	mov    %ecx,(%edx)
  10292d:	8b 00                	mov    (%eax),%eax
  10292f:	99                   	cltd   
    }
}
  102930:	5d                   	pop    %ebp
  102931:	c3                   	ret    

00102932 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102932:	55                   	push   %ebp
  102933:	89 e5                	mov    %esp,%ebp
  102935:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102938:	8d 45 14             	lea    0x14(%ebp),%eax
  10293b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  10293e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102941:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102945:	8b 45 10             	mov    0x10(%ebp),%eax
  102948:	89 44 24 08          	mov    %eax,0x8(%esp)
  10294c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10294f:	89 44 24 04          	mov    %eax,0x4(%esp)
  102953:	8b 45 08             	mov    0x8(%ebp),%eax
  102956:	89 04 24             	mov    %eax,(%esp)
  102959:	e8 02 00 00 00       	call   102960 <vprintfmt>
    va_end(ap);
}
  10295e:	c9                   	leave  
  10295f:	c3                   	ret    

00102960 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102960:	55                   	push   %ebp
  102961:	89 e5                	mov    %esp,%ebp
  102963:	56                   	push   %esi
  102964:	53                   	push   %ebx
  102965:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102968:	eb 18                	jmp    102982 <vprintfmt+0x22>
            if (ch == '\0') {
  10296a:	85 db                	test   %ebx,%ebx
  10296c:	75 05                	jne    102973 <vprintfmt+0x13>
                return;
  10296e:	e9 d1 03 00 00       	jmp    102d44 <vprintfmt+0x3e4>
            }
            putch(ch, putdat);
  102973:	8b 45 0c             	mov    0xc(%ebp),%eax
  102976:	89 44 24 04          	mov    %eax,0x4(%esp)
  10297a:	89 1c 24             	mov    %ebx,(%esp)
  10297d:	8b 45 08             	mov    0x8(%ebp),%eax
  102980:	ff d0                	call   *%eax
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102982:	8b 45 10             	mov    0x10(%ebp),%eax
  102985:	8d 50 01             	lea    0x1(%eax),%edx
  102988:	89 55 10             	mov    %edx,0x10(%ebp)
  10298b:	0f b6 00             	movzbl (%eax),%eax
  10298e:	0f b6 d8             	movzbl %al,%ebx
  102991:	83 fb 25             	cmp    $0x25,%ebx
  102994:	75 d4                	jne    10296a <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  102996:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  10299a:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  1029a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1029a4:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  1029a7:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  1029ae:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1029b1:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  1029b4:	8b 45 10             	mov    0x10(%ebp),%eax
  1029b7:	8d 50 01             	lea    0x1(%eax),%edx
  1029ba:	89 55 10             	mov    %edx,0x10(%ebp)
  1029bd:	0f b6 00             	movzbl (%eax),%eax
  1029c0:	0f b6 d8             	movzbl %al,%ebx
  1029c3:	8d 43 dd             	lea    -0x23(%ebx),%eax
  1029c6:	83 f8 55             	cmp    $0x55,%eax
  1029c9:	0f 87 44 03 00 00    	ja     102d13 <vprintfmt+0x3b3>
  1029cf:	8b 04 85 94 3a 10 00 	mov    0x103a94(,%eax,4),%eax
  1029d6:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  1029d8:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  1029dc:	eb d6                	jmp    1029b4 <vprintfmt+0x54>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  1029de:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  1029e2:	eb d0                	jmp    1029b4 <vprintfmt+0x54>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  1029e4:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  1029eb:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1029ee:	89 d0                	mov    %edx,%eax
  1029f0:	c1 e0 02             	shl    $0x2,%eax
  1029f3:	01 d0                	add    %edx,%eax
  1029f5:	01 c0                	add    %eax,%eax
  1029f7:	01 d8                	add    %ebx,%eax
  1029f9:	83 e8 30             	sub    $0x30,%eax
  1029fc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  1029ff:	8b 45 10             	mov    0x10(%ebp),%eax
  102a02:	0f b6 00             	movzbl (%eax),%eax
  102a05:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102a08:	83 fb 2f             	cmp    $0x2f,%ebx
  102a0b:	7e 0b                	jle    102a18 <vprintfmt+0xb8>
  102a0d:	83 fb 39             	cmp    $0x39,%ebx
  102a10:	7f 06                	jg     102a18 <vprintfmt+0xb8>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102a12:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  102a16:	eb d3                	jmp    1029eb <vprintfmt+0x8b>
            goto process_precision;
  102a18:	eb 33                	jmp    102a4d <vprintfmt+0xed>

        case '*':
            precision = va_arg(ap, int);
  102a1a:	8b 45 14             	mov    0x14(%ebp),%eax
  102a1d:	8d 50 04             	lea    0x4(%eax),%edx
  102a20:	89 55 14             	mov    %edx,0x14(%ebp)
  102a23:	8b 00                	mov    (%eax),%eax
  102a25:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102a28:	eb 23                	jmp    102a4d <vprintfmt+0xed>

        case '.':
            if (width < 0)
  102a2a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102a2e:	79 0c                	jns    102a3c <vprintfmt+0xdc>
                width = 0;
  102a30:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102a37:	e9 78 ff ff ff       	jmp    1029b4 <vprintfmt+0x54>
  102a3c:	e9 73 ff ff ff       	jmp    1029b4 <vprintfmt+0x54>

        case '#':
            altflag = 1;
  102a41:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102a48:	e9 67 ff ff ff       	jmp    1029b4 <vprintfmt+0x54>

        process_precision:
            if (width < 0)
  102a4d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102a51:	79 12                	jns    102a65 <vprintfmt+0x105>
                width = precision, precision = -1;
  102a53:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102a56:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102a59:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102a60:	e9 4f ff ff ff       	jmp    1029b4 <vprintfmt+0x54>
  102a65:	e9 4a ff ff ff       	jmp    1029b4 <vprintfmt+0x54>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102a6a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  102a6e:	e9 41 ff ff ff       	jmp    1029b4 <vprintfmt+0x54>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102a73:	8b 45 14             	mov    0x14(%ebp),%eax
  102a76:	8d 50 04             	lea    0x4(%eax),%edx
  102a79:	89 55 14             	mov    %edx,0x14(%ebp)
  102a7c:	8b 00                	mov    (%eax),%eax
  102a7e:	8b 55 0c             	mov    0xc(%ebp),%edx
  102a81:	89 54 24 04          	mov    %edx,0x4(%esp)
  102a85:	89 04 24             	mov    %eax,(%esp)
  102a88:	8b 45 08             	mov    0x8(%ebp),%eax
  102a8b:	ff d0                	call   *%eax
            break;
  102a8d:	e9 ac 02 00 00       	jmp    102d3e <vprintfmt+0x3de>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102a92:	8b 45 14             	mov    0x14(%ebp),%eax
  102a95:	8d 50 04             	lea    0x4(%eax),%edx
  102a98:	89 55 14             	mov    %edx,0x14(%ebp)
  102a9b:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102a9d:	85 db                	test   %ebx,%ebx
  102a9f:	79 02                	jns    102aa3 <vprintfmt+0x143>
                err = -err;
  102aa1:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102aa3:	83 fb 06             	cmp    $0x6,%ebx
  102aa6:	7f 0b                	jg     102ab3 <vprintfmt+0x153>
  102aa8:	8b 34 9d 54 3a 10 00 	mov    0x103a54(,%ebx,4),%esi
  102aaf:	85 f6                	test   %esi,%esi
  102ab1:	75 23                	jne    102ad6 <vprintfmt+0x176>
                printfmt(putch, putdat, "error %d", err);
  102ab3:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102ab7:	c7 44 24 08 81 3a 10 	movl   $0x103a81,0x8(%esp)
  102abe:	00 
  102abf:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ac2:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ac6:	8b 45 08             	mov    0x8(%ebp),%eax
  102ac9:	89 04 24             	mov    %eax,(%esp)
  102acc:	e8 61 fe ff ff       	call   102932 <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102ad1:	e9 68 02 00 00       	jmp    102d3e <vprintfmt+0x3de>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  102ad6:	89 74 24 0c          	mov    %esi,0xc(%esp)
  102ada:	c7 44 24 08 8a 3a 10 	movl   $0x103a8a,0x8(%esp)
  102ae1:	00 
  102ae2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ae5:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ae9:	8b 45 08             	mov    0x8(%ebp),%eax
  102aec:	89 04 24             	mov    %eax,(%esp)
  102aef:	e8 3e fe ff ff       	call   102932 <printfmt>
            }
            break;
  102af4:	e9 45 02 00 00       	jmp    102d3e <vprintfmt+0x3de>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102af9:	8b 45 14             	mov    0x14(%ebp),%eax
  102afc:	8d 50 04             	lea    0x4(%eax),%edx
  102aff:	89 55 14             	mov    %edx,0x14(%ebp)
  102b02:	8b 30                	mov    (%eax),%esi
  102b04:	85 f6                	test   %esi,%esi
  102b06:	75 05                	jne    102b0d <vprintfmt+0x1ad>
                p = "(null)";
  102b08:	be 8d 3a 10 00       	mov    $0x103a8d,%esi
            }
            if (width > 0 && padc != '-') {
  102b0d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102b11:	7e 3e                	jle    102b51 <vprintfmt+0x1f1>
  102b13:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102b17:	74 38                	je     102b51 <vprintfmt+0x1f1>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102b19:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  102b1c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102b1f:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b23:	89 34 24             	mov    %esi,(%esp)
  102b26:	e8 15 03 00 00       	call   102e40 <strnlen>
  102b2b:	29 c3                	sub    %eax,%ebx
  102b2d:	89 d8                	mov    %ebx,%eax
  102b2f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102b32:	eb 17                	jmp    102b4b <vprintfmt+0x1eb>
                    putch(padc, putdat);
  102b34:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102b38:	8b 55 0c             	mov    0xc(%ebp),%edx
  102b3b:	89 54 24 04          	mov    %edx,0x4(%esp)
  102b3f:	89 04 24             	mov    %eax,(%esp)
  102b42:	8b 45 08             	mov    0x8(%ebp),%eax
  102b45:	ff d0                	call   *%eax
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  102b47:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102b4b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102b4f:	7f e3                	jg     102b34 <vprintfmt+0x1d4>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102b51:	eb 38                	jmp    102b8b <vprintfmt+0x22b>
                if (altflag && (ch < ' ' || ch > '~')) {
  102b53:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102b57:	74 1f                	je     102b78 <vprintfmt+0x218>
  102b59:	83 fb 1f             	cmp    $0x1f,%ebx
  102b5c:	7e 05                	jle    102b63 <vprintfmt+0x203>
  102b5e:	83 fb 7e             	cmp    $0x7e,%ebx
  102b61:	7e 15                	jle    102b78 <vprintfmt+0x218>
                    putch('?', putdat);
  102b63:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b66:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b6a:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  102b71:	8b 45 08             	mov    0x8(%ebp),%eax
  102b74:	ff d0                	call   *%eax
  102b76:	eb 0f                	jmp    102b87 <vprintfmt+0x227>
                }
                else {
                    putch(ch, putdat);
  102b78:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b7b:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b7f:	89 1c 24             	mov    %ebx,(%esp)
  102b82:	8b 45 08             	mov    0x8(%ebp),%eax
  102b85:	ff d0                	call   *%eax
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102b87:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102b8b:	89 f0                	mov    %esi,%eax
  102b8d:	8d 70 01             	lea    0x1(%eax),%esi
  102b90:	0f b6 00             	movzbl (%eax),%eax
  102b93:	0f be d8             	movsbl %al,%ebx
  102b96:	85 db                	test   %ebx,%ebx
  102b98:	74 10                	je     102baa <vprintfmt+0x24a>
  102b9a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102b9e:	78 b3                	js     102b53 <vprintfmt+0x1f3>
  102ba0:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  102ba4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102ba8:	79 a9                	jns    102b53 <vprintfmt+0x1f3>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102baa:	eb 17                	jmp    102bc3 <vprintfmt+0x263>
                putch(' ', putdat);
  102bac:	8b 45 0c             	mov    0xc(%ebp),%eax
  102baf:	89 44 24 04          	mov    %eax,0x4(%esp)
  102bb3:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  102bba:	8b 45 08             	mov    0x8(%ebp),%eax
  102bbd:	ff d0                	call   *%eax
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102bbf:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102bc3:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102bc7:	7f e3                	jg     102bac <vprintfmt+0x24c>
                putch(' ', putdat);
            }
            break;
  102bc9:	e9 70 01 00 00       	jmp    102d3e <vprintfmt+0x3de>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  102bce:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102bd1:	89 44 24 04          	mov    %eax,0x4(%esp)
  102bd5:	8d 45 14             	lea    0x14(%ebp),%eax
  102bd8:	89 04 24             	mov    %eax,(%esp)
  102bdb:	e8 0b fd ff ff       	call   1028eb <getint>
  102be0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102be3:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  102be6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102be9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102bec:	85 d2                	test   %edx,%edx
  102bee:	79 26                	jns    102c16 <vprintfmt+0x2b6>
                putch('-', putdat);
  102bf0:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bf3:	89 44 24 04          	mov    %eax,0x4(%esp)
  102bf7:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  102bfe:	8b 45 08             	mov    0x8(%ebp),%eax
  102c01:	ff d0                	call   *%eax
                num = -(long long)num;
  102c03:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102c06:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102c09:	f7 d8                	neg    %eax
  102c0b:	83 d2 00             	adc    $0x0,%edx
  102c0e:	f7 da                	neg    %edx
  102c10:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c13:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  102c16:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102c1d:	e9 a8 00 00 00       	jmp    102cca <vprintfmt+0x36a>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  102c22:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102c25:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c29:	8d 45 14             	lea    0x14(%ebp),%eax
  102c2c:	89 04 24             	mov    %eax,(%esp)
  102c2f:	e8 68 fc ff ff       	call   10289c <getuint>
  102c34:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c37:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  102c3a:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102c41:	e9 84 00 00 00       	jmp    102cca <vprintfmt+0x36a>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  102c46:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102c49:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c4d:	8d 45 14             	lea    0x14(%ebp),%eax
  102c50:	89 04 24             	mov    %eax,(%esp)
  102c53:	e8 44 fc ff ff       	call   10289c <getuint>
  102c58:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c5b:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  102c5e:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  102c65:	eb 63                	jmp    102cca <vprintfmt+0x36a>

        // pointer
        case 'p':
            putch('0', putdat);
  102c67:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c6a:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c6e:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  102c75:	8b 45 08             	mov    0x8(%ebp),%eax
  102c78:	ff d0                	call   *%eax
            putch('x', putdat);
  102c7a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c7d:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c81:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  102c88:	8b 45 08             	mov    0x8(%ebp),%eax
  102c8b:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  102c8d:	8b 45 14             	mov    0x14(%ebp),%eax
  102c90:	8d 50 04             	lea    0x4(%eax),%edx
  102c93:	89 55 14             	mov    %edx,0x14(%ebp)
  102c96:	8b 00                	mov    (%eax),%eax
  102c98:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102c9b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  102ca2:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  102ca9:	eb 1f                	jmp    102cca <vprintfmt+0x36a>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  102cab:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102cae:	89 44 24 04          	mov    %eax,0x4(%esp)
  102cb2:	8d 45 14             	lea    0x14(%ebp),%eax
  102cb5:	89 04 24             	mov    %eax,(%esp)
  102cb8:	e8 df fb ff ff       	call   10289c <getuint>
  102cbd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102cc0:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  102cc3:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  102cca:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  102cce:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102cd1:	89 54 24 18          	mov    %edx,0x18(%esp)
  102cd5:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102cd8:	89 54 24 14          	mov    %edx,0x14(%esp)
  102cdc:	89 44 24 10          	mov    %eax,0x10(%esp)
  102ce0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ce3:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102ce6:	89 44 24 08          	mov    %eax,0x8(%esp)
  102cea:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102cee:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cf1:	89 44 24 04          	mov    %eax,0x4(%esp)
  102cf5:	8b 45 08             	mov    0x8(%ebp),%eax
  102cf8:	89 04 24             	mov    %eax,(%esp)
  102cfb:	e8 97 fa ff ff       	call   102797 <printnum>
            break;
  102d00:	eb 3c                	jmp    102d3e <vprintfmt+0x3de>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  102d02:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d05:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d09:	89 1c 24             	mov    %ebx,(%esp)
  102d0c:	8b 45 08             	mov    0x8(%ebp),%eax
  102d0f:	ff d0                	call   *%eax
            break;
  102d11:	eb 2b                	jmp    102d3e <vprintfmt+0x3de>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  102d13:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d16:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d1a:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  102d21:	8b 45 08             	mov    0x8(%ebp),%eax
  102d24:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  102d26:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102d2a:	eb 04                	jmp    102d30 <vprintfmt+0x3d0>
  102d2c:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102d30:	8b 45 10             	mov    0x10(%ebp),%eax
  102d33:	83 e8 01             	sub    $0x1,%eax
  102d36:	0f b6 00             	movzbl (%eax),%eax
  102d39:	3c 25                	cmp    $0x25,%al
  102d3b:	75 ef                	jne    102d2c <vprintfmt+0x3cc>
                /* do nothing */;
            break;
  102d3d:	90                   	nop
        }
    }
  102d3e:	90                   	nop
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102d3f:	e9 3e fc ff ff       	jmp    102982 <vprintfmt+0x22>
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  102d44:	83 c4 40             	add    $0x40,%esp
  102d47:	5b                   	pop    %ebx
  102d48:	5e                   	pop    %esi
  102d49:	5d                   	pop    %ebp
  102d4a:	c3                   	ret    

00102d4b <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  102d4b:	55                   	push   %ebp
  102d4c:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  102d4e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d51:	8b 40 08             	mov    0x8(%eax),%eax
  102d54:	8d 50 01             	lea    0x1(%eax),%edx
  102d57:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d5a:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  102d5d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d60:	8b 10                	mov    (%eax),%edx
  102d62:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d65:	8b 40 04             	mov    0x4(%eax),%eax
  102d68:	39 c2                	cmp    %eax,%edx
  102d6a:	73 12                	jae    102d7e <sprintputch+0x33>
        *b->buf ++ = ch;
  102d6c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d6f:	8b 00                	mov    (%eax),%eax
  102d71:	8d 48 01             	lea    0x1(%eax),%ecx
  102d74:	8b 55 0c             	mov    0xc(%ebp),%edx
  102d77:	89 0a                	mov    %ecx,(%edx)
  102d79:	8b 55 08             	mov    0x8(%ebp),%edx
  102d7c:	88 10                	mov    %dl,(%eax)
    }
}
  102d7e:	5d                   	pop    %ebp
  102d7f:	c3                   	ret    

00102d80 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  102d80:	55                   	push   %ebp
  102d81:	89 e5                	mov    %esp,%ebp
  102d83:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  102d86:	8d 45 14             	lea    0x14(%ebp),%eax
  102d89:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  102d8c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d8f:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102d93:	8b 45 10             	mov    0x10(%ebp),%eax
  102d96:	89 44 24 08          	mov    %eax,0x8(%esp)
  102d9a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d9d:	89 44 24 04          	mov    %eax,0x4(%esp)
  102da1:	8b 45 08             	mov    0x8(%ebp),%eax
  102da4:	89 04 24             	mov    %eax,(%esp)
  102da7:	e8 08 00 00 00       	call   102db4 <vsnprintf>
  102dac:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  102daf:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102db2:	c9                   	leave  
  102db3:	c3                   	ret    

00102db4 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  102db4:	55                   	push   %ebp
  102db5:	89 e5                	mov    %esp,%ebp
  102db7:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  102dba:	8b 45 08             	mov    0x8(%ebp),%eax
  102dbd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102dc0:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dc3:	8d 50 ff             	lea    -0x1(%eax),%edx
  102dc6:	8b 45 08             	mov    0x8(%ebp),%eax
  102dc9:	01 d0                	add    %edx,%eax
  102dcb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102dce:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  102dd5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102dd9:	74 0a                	je     102de5 <vsnprintf+0x31>
  102ddb:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102dde:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102de1:	39 c2                	cmp    %eax,%edx
  102de3:	76 07                	jbe    102dec <vsnprintf+0x38>
        return -E_INVAL;
  102de5:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  102dea:	eb 2a                	jmp    102e16 <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  102dec:	8b 45 14             	mov    0x14(%ebp),%eax
  102def:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102df3:	8b 45 10             	mov    0x10(%ebp),%eax
  102df6:	89 44 24 08          	mov    %eax,0x8(%esp)
  102dfa:	8d 45 ec             	lea    -0x14(%ebp),%eax
  102dfd:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e01:	c7 04 24 4b 2d 10 00 	movl   $0x102d4b,(%esp)
  102e08:	e8 53 fb ff ff       	call   102960 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  102e0d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e10:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  102e13:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102e16:	c9                   	leave  
  102e17:	c3                   	ret    

00102e18 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102e18:	55                   	push   %ebp
  102e19:	89 e5                	mov    %esp,%ebp
  102e1b:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102e1e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102e25:	eb 04                	jmp    102e2b <strlen+0x13>
        cnt ++;
  102e27:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  102e2b:	8b 45 08             	mov    0x8(%ebp),%eax
  102e2e:	8d 50 01             	lea    0x1(%eax),%edx
  102e31:	89 55 08             	mov    %edx,0x8(%ebp)
  102e34:	0f b6 00             	movzbl (%eax),%eax
  102e37:	84 c0                	test   %al,%al
  102e39:	75 ec                	jne    102e27 <strlen+0xf>
        cnt ++;
    }
    return cnt;
  102e3b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102e3e:	c9                   	leave  
  102e3f:	c3                   	ret    

00102e40 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102e40:	55                   	push   %ebp
  102e41:	89 e5                	mov    %esp,%ebp
  102e43:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102e46:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102e4d:	eb 04                	jmp    102e53 <strnlen+0x13>
        cnt ++;
  102e4f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  102e53:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102e56:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102e59:	73 10                	jae    102e6b <strnlen+0x2b>
  102e5b:	8b 45 08             	mov    0x8(%ebp),%eax
  102e5e:	8d 50 01             	lea    0x1(%eax),%edx
  102e61:	89 55 08             	mov    %edx,0x8(%ebp)
  102e64:	0f b6 00             	movzbl (%eax),%eax
  102e67:	84 c0                	test   %al,%al
  102e69:	75 e4                	jne    102e4f <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  102e6b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102e6e:	c9                   	leave  
  102e6f:	c3                   	ret    

00102e70 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102e70:	55                   	push   %ebp
  102e71:	89 e5                	mov    %esp,%ebp
  102e73:	57                   	push   %edi
  102e74:	56                   	push   %esi
  102e75:	83 ec 20             	sub    $0x20,%esp
  102e78:	8b 45 08             	mov    0x8(%ebp),%eax
  102e7b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102e7e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e81:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102e84:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102e87:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102e8a:	89 d1                	mov    %edx,%ecx
  102e8c:	89 c2                	mov    %eax,%edx
  102e8e:	89 ce                	mov    %ecx,%esi
  102e90:	89 d7                	mov    %edx,%edi
  102e92:	ac                   	lods   %ds:(%esi),%al
  102e93:	aa                   	stos   %al,%es:(%edi)
  102e94:	84 c0                	test   %al,%al
  102e96:	75 fa                	jne    102e92 <strcpy+0x22>
  102e98:	89 fa                	mov    %edi,%edx
  102e9a:	89 f1                	mov    %esi,%ecx
  102e9c:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102e9f:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102ea2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102ea5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102ea8:	83 c4 20             	add    $0x20,%esp
  102eab:	5e                   	pop    %esi
  102eac:	5f                   	pop    %edi
  102ead:	5d                   	pop    %ebp
  102eae:	c3                   	ret    

00102eaf <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102eaf:	55                   	push   %ebp
  102eb0:	89 e5                	mov    %esp,%ebp
  102eb2:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102eb5:	8b 45 08             	mov    0x8(%ebp),%eax
  102eb8:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102ebb:	eb 21                	jmp    102ede <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  102ebd:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ec0:	0f b6 10             	movzbl (%eax),%edx
  102ec3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ec6:	88 10                	mov    %dl,(%eax)
  102ec8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ecb:	0f b6 00             	movzbl (%eax),%eax
  102ece:	84 c0                	test   %al,%al
  102ed0:	74 04                	je     102ed6 <strncpy+0x27>
            src ++;
  102ed2:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  102ed6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102eda:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  102ede:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102ee2:	75 d9                	jne    102ebd <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  102ee4:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102ee7:	c9                   	leave  
  102ee8:	c3                   	ret    

00102ee9 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102ee9:	55                   	push   %ebp
  102eea:	89 e5                	mov    %esp,%ebp
  102eec:	57                   	push   %edi
  102eed:	56                   	push   %esi
  102eee:	83 ec 20             	sub    $0x20,%esp
  102ef1:	8b 45 08             	mov    0x8(%ebp),%eax
  102ef4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102ef7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102efa:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  102efd:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102f00:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f03:	89 d1                	mov    %edx,%ecx
  102f05:	89 c2                	mov    %eax,%edx
  102f07:	89 ce                	mov    %ecx,%esi
  102f09:	89 d7                	mov    %edx,%edi
  102f0b:	ac                   	lods   %ds:(%esi),%al
  102f0c:	ae                   	scas   %es:(%edi),%al
  102f0d:	75 08                	jne    102f17 <strcmp+0x2e>
  102f0f:	84 c0                	test   %al,%al
  102f11:	75 f8                	jne    102f0b <strcmp+0x22>
  102f13:	31 c0                	xor    %eax,%eax
  102f15:	eb 04                	jmp    102f1b <strcmp+0x32>
  102f17:	19 c0                	sbb    %eax,%eax
  102f19:	0c 01                	or     $0x1,%al
  102f1b:	89 fa                	mov    %edi,%edx
  102f1d:	89 f1                	mov    %esi,%ecx
  102f1f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102f22:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102f25:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  102f28:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102f2b:	83 c4 20             	add    $0x20,%esp
  102f2e:	5e                   	pop    %esi
  102f2f:	5f                   	pop    %edi
  102f30:	5d                   	pop    %ebp
  102f31:	c3                   	ret    

00102f32 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102f32:	55                   	push   %ebp
  102f33:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102f35:	eb 0c                	jmp    102f43 <strncmp+0x11>
        n --, s1 ++, s2 ++;
  102f37:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102f3b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102f3f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102f43:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102f47:	74 1a                	je     102f63 <strncmp+0x31>
  102f49:	8b 45 08             	mov    0x8(%ebp),%eax
  102f4c:	0f b6 00             	movzbl (%eax),%eax
  102f4f:	84 c0                	test   %al,%al
  102f51:	74 10                	je     102f63 <strncmp+0x31>
  102f53:	8b 45 08             	mov    0x8(%ebp),%eax
  102f56:	0f b6 10             	movzbl (%eax),%edx
  102f59:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f5c:	0f b6 00             	movzbl (%eax),%eax
  102f5f:	38 c2                	cmp    %al,%dl
  102f61:	74 d4                	je     102f37 <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102f63:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102f67:	74 18                	je     102f81 <strncmp+0x4f>
  102f69:	8b 45 08             	mov    0x8(%ebp),%eax
  102f6c:	0f b6 00             	movzbl (%eax),%eax
  102f6f:	0f b6 d0             	movzbl %al,%edx
  102f72:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f75:	0f b6 00             	movzbl (%eax),%eax
  102f78:	0f b6 c0             	movzbl %al,%eax
  102f7b:	29 c2                	sub    %eax,%edx
  102f7d:	89 d0                	mov    %edx,%eax
  102f7f:	eb 05                	jmp    102f86 <strncmp+0x54>
  102f81:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102f86:	5d                   	pop    %ebp
  102f87:	c3                   	ret    

00102f88 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102f88:	55                   	push   %ebp
  102f89:	89 e5                	mov    %esp,%ebp
  102f8b:	83 ec 04             	sub    $0x4,%esp
  102f8e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f91:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102f94:	eb 14                	jmp    102faa <strchr+0x22>
        if (*s == c) {
  102f96:	8b 45 08             	mov    0x8(%ebp),%eax
  102f99:	0f b6 00             	movzbl (%eax),%eax
  102f9c:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102f9f:	75 05                	jne    102fa6 <strchr+0x1e>
            return (char *)s;
  102fa1:	8b 45 08             	mov    0x8(%ebp),%eax
  102fa4:	eb 13                	jmp    102fb9 <strchr+0x31>
        }
        s ++;
  102fa6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  102faa:	8b 45 08             	mov    0x8(%ebp),%eax
  102fad:	0f b6 00             	movzbl (%eax),%eax
  102fb0:	84 c0                	test   %al,%al
  102fb2:	75 e2                	jne    102f96 <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  102fb4:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102fb9:	c9                   	leave  
  102fba:	c3                   	ret    

00102fbb <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102fbb:	55                   	push   %ebp
  102fbc:	89 e5                	mov    %esp,%ebp
  102fbe:	83 ec 04             	sub    $0x4,%esp
  102fc1:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fc4:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102fc7:	eb 11                	jmp    102fda <strfind+0x1f>
        if (*s == c) {
  102fc9:	8b 45 08             	mov    0x8(%ebp),%eax
  102fcc:	0f b6 00             	movzbl (%eax),%eax
  102fcf:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102fd2:	75 02                	jne    102fd6 <strfind+0x1b>
            break;
  102fd4:	eb 0e                	jmp    102fe4 <strfind+0x29>
        }
        s ++;
  102fd6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  102fda:	8b 45 08             	mov    0x8(%ebp),%eax
  102fdd:	0f b6 00             	movzbl (%eax),%eax
  102fe0:	84 c0                	test   %al,%al
  102fe2:	75 e5                	jne    102fc9 <strfind+0xe>
        if (*s == c) {
            break;
        }
        s ++;
    }
    return (char *)s;
  102fe4:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102fe7:	c9                   	leave  
  102fe8:	c3                   	ret    

00102fe9 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102fe9:	55                   	push   %ebp
  102fea:	89 e5                	mov    %esp,%ebp
  102fec:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102fef:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102ff6:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102ffd:	eb 04                	jmp    103003 <strtol+0x1a>
        s ++;
  102fff:	83 45 08 01          	addl   $0x1,0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  103003:	8b 45 08             	mov    0x8(%ebp),%eax
  103006:	0f b6 00             	movzbl (%eax),%eax
  103009:	3c 20                	cmp    $0x20,%al
  10300b:	74 f2                	je     102fff <strtol+0x16>
  10300d:	8b 45 08             	mov    0x8(%ebp),%eax
  103010:	0f b6 00             	movzbl (%eax),%eax
  103013:	3c 09                	cmp    $0x9,%al
  103015:	74 e8                	je     102fff <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  103017:	8b 45 08             	mov    0x8(%ebp),%eax
  10301a:	0f b6 00             	movzbl (%eax),%eax
  10301d:	3c 2b                	cmp    $0x2b,%al
  10301f:	75 06                	jne    103027 <strtol+0x3e>
        s ++;
  103021:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103025:	eb 15                	jmp    10303c <strtol+0x53>
    }
    else if (*s == '-') {
  103027:	8b 45 08             	mov    0x8(%ebp),%eax
  10302a:	0f b6 00             	movzbl (%eax),%eax
  10302d:	3c 2d                	cmp    $0x2d,%al
  10302f:	75 0b                	jne    10303c <strtol+0x53>
        s ++, neg = 1;
  103031:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103035:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  10303c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103040:	74 06                	je     103048 <strtol+0x5f>
  103042:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  103046:	75 24                	jne    10306c <strtol+0x83>
  103048:	8b 45 08             	mov    0x8(%ebp),%eax
  10304b:	0f b6 00             	movzbl (%eax),%eax
  10304e:	3c 30                	cmp    $0x30,%al
  103050:	75 1a                	jne    10306c <strtol+0x83>
  103052:	8b 45 08             	mov    0x8(%ebp),%eax
  103055:	83 c0 01             	add    $0x1,%eax
  103058:	0f b6 00             	movzbl (%eax),%eax
  10305b:	3c 78                	cmp    $0x78,%al
  10305d:	75 0d                	jne    10306c <strtol+0x83>
        s += 2, base = 16;
  10305f:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  103063:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  10306a:	eb 2a                	jmp    103096 <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  10306c:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103070:	75 17                	jne    103089 <strtol+0xa0>
  103072:	8b 45 08             	mov    0x8(%ebp),%eax
  103075:	0f b6 00             	movzbl (%eax),%eax
  103078:	3c 30                	cmp    $0x30,%al
  10307a:	75 0d                	jne    103089 <strtol+0xa0>
        s ++, base = 8;
  10307c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103080:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  103087:	eb 0d                	jmp    103096 <strtol+0xad>
    }
    else if (base == 0) {
  103089:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10308d:	75 07                	jne    103096 <strtol+0xad>
        base = 10;
  10308f:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  103096:	8b 45 08             	mov    0x8(%ebp),%eax
  103099:	0f b6 00             	movzbl (%eax),%eax
  10309c:	3c 2f                	cmp    $0x2f,%al
  10309e:	7e 1b                	jle    1030bb <strtol+0xd2>
  1030a0:	8b 45 08             	mov    0x8(%ebp),%eax
  1030a3:	0f b6 00             	movzbl (%eax),%eax
  1030a6:	3c 39                	cmp    $0x39,%al
  1030a8:	7f 11                	jg     1030bb <strtol+0xd2>
            dig = *s - '0';
  1030aa:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ad:	0f b6 00             	movzbl (%eax),%eax
  1030b0:	0f be c0             	movsbl %al,%eax
  1030b3:	83 e8 30             	sub    $0x30,%eax
  1030b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1030b9:	eb 48                	jmp    103103 <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  1030bb:	8b 45 08             	mov    0x8(%ebp),%eax
  1030be:	0f b6 00             	movzbl (%eax),%eax
  1030c1:	3c 60                	cmp    $0x60,%al
  1030c3:	7e 1b                	jle    1030e0 <strtol+0xf7>
  1030c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1030c8:	0f b6 00             	movzbl (%eax),%eax
  1030cb:	3c 7a                	cmp    $0x7a,%al
  1030cd:	7f 11                	jg     1030e0 <strtol+0xf7>
            dig = *s - 'a' + 10;
  1030cf:	8b 45 08             	mov    0x8(%ebp),%eax
  1030d2:	0f b6 00             	movzbl (%eax),%eax
  1030d5:	0f be c0             	movsbl %al,%eax
  1030d8:	83 e8 57             	sub    $0x57,%eax
  1030db:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1030de:	eb 23                	jmp    103103 <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  1030e0:	8b 45 08             	mov    0x8(%ebp),%eax
  1030e3:	0f b6 00             	movzbl (%eax),%eax
  1030e6:	3c 40                	cmp    $0x40,%al
  1030e8:	7e 3d                	jle    103127 <strtol+0x13e>
  1030ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ed:	0f b6 00             	movzbl (%eax),%eax
  1030f0:	3c 5a                	cmp    $0x5a,%al
  1030f2:	7f 33                	jg     103127 <strtol+0x13e>
            dig = *s - 'A' + 10;
  1030f4:	8b 45 08             	mov    0x8(%ebp),%eax
  1030f7:	0f b6 00             	movzbl (%eax),%eax
  1030fa:	0f be c0             	movsbl %al,%eax
  1030fd:	83 e8 37             	sub    $0x37,%eax
  103100:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  103103:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103106:	3b 45 10             	cmp    0x10(%ebp),%eax
  103109:	7c 02                	jl     10310d <strtol+0x124>
            break;
  10310b:	eb 1a                	jmp    103127 <strtol+0x13e>
        }
        s ++, val = (val * base) + dig;
  10310d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103111:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103114:	0f af 45 10          	imul   0x10(%ebp),%eax
  103118:	89 c2                	mov    %eax,%edx
  10311a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10311d:	01 d0                	add    %edx,%eax
  10311f:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  103122:	e9 6f ff ff ff       	jmp    103096 <strtol+0xad>

    if (endptr) {
  103127:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10312b:	74 08                	je     103135 <strtol+0x14c>
        *endptr = (char *) s;
  10312d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103130:	8b 55 08             	mov    0x8(%ebp),%edx
  103133:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  103135:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  103139:	74 07                	je     103142 <strtol+0x159>
  10313b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10313e:	f7 d8                	neg    %eax
  103140:	eb 03                	jmp    103145 <strtol+0x15c>
  103142:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  103145:	c9                   	leave  
  103146:	c3                   	ret    

00103147 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  103147:	55                   	push   %ebp
  103148:	89 e5                	mov    %esp,%ebp
  10314a:	57                   	push   %edi
  10314b:	83 ec 24             	sub    $0x24,%esp
  10314e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103151:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  103154:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  103158:	8b 55 08             	mov    0x8(%ebp),%edx
  10315b:	89 55 f8             	mov    %edx,-0x8(%ebp)
  10315e:	88 45 f7             	mov    %al,-0x9(%ebp)
  103161:	8b 45 10             	mov    0x10(%ebp),%eax
  103164:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  103167:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  10316a:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  10316e:	8b 55 f8             	mov    -0x8(%ebp),%edx
  103171:	89 d7                	mov    %edx,%edi
  103173:	f3 aa                	rep stos %al,%es:(%edi)
  103175:	89 fa                	mov    %edi,%edx
  103177:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  10317a:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  10317d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  103180:	83 c4 24             	add    $0x24,%esp
  103183:	5f                   	pop    %edi
  103184:	5d                   	pop    %ebp
  103185:	c3                   	ret    

00103186 <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  103186:	55                   	push   %ebp
  103187:	89 e5                	mov    %esp,%ebp
  103189:	57                   	push   %edi
  10318a:	56                   	push   %esi
  10318b:	53                   	push   %ebx
  10318c:	83 ec 30             	sub    $0x30,%esp
  10318f:	8b 45 08             	mov    0x8(%ebp),%eax
  103192:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103195:	8b 45 0c             	mov    0xc(%ebp),%eax
  103198:	89 45 ec             	mov    %eax,-0x14(%ebp)
  10319b:	8b 45 10             	mov    0x10(%ebp),%eax
  10319e:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  1031a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031a4:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  1031a7:	73 42                	jae    1031eb <memmove+0x65>
  1031a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031ac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1031af:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1031b2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1031b5:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1031b8:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  1031bb:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1031be:	c1 e8 02             	shr    $0x2,%eax
  1031c1:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  1031c3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1031c6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1031c9:	89 d7                	mov    %edx,%edi
  1031cb:	89 c6                	mov    %eax,%esi
  1031cd:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1031cf:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  1031d2:	83 e1 03             	and    $0x3,%ecx
  1031d5:	74 02                	je     1031d9 <memmove+0x53>
  1031d7:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1031d9:	89 f0                	mov    %esi,%eax
  1031db:	89 fa                	mov    %edi,%edx
  1031dd:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  1031e0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  1031e3:	89 45 d0             	mov    %eax,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  1031e6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1031e9:	eb 36                	jmp    103221 <memmove+0x9b>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  1031eb:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1031ee:	8d 50 ff             	lea    -0x1(%eax),%edx
  1031f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1031f4:	01 c2                	add    %eax,%edx
  1031f6:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1031f9:	8d 48 ff             	lea    -0x1(%eax),%ecx
  1031fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031ff:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  103202:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103205:	89 c1                	mov    %eax,%ecx
  103207:	89 d8                	mov    %ebx,%eax
  103209:	89 d6                	mov    %edx,%esi
  10320b:	89 c7                	mov    %eax,%edi
  10320d:	fd                   	std    
  10320e:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103210:	fc                   	cld    
  103211:	89 f8                	mov    %edi,%eax
  103213:	89 f2                	mov    %esi,%edx
  103215:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  103218:	89 55 c8             	mov    %edx,-0x38(%ebp)
  10321b:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  10321e:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  103221:	83 c4 30             	add    $0x30,%esp
  103224:	5b                   	pop    %ebx
  103225:	5e                   	pop    %esi
  103226:	5f                   	pop    %edi
  103227:	5d                   	pop    %ebp
  103228:	c3                   	ret    

00103229 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  103229:	55                   	push   %ebp
  10322a:	89 e5                	mov    %esp,%ebp
  10322c:	57                   	push   %edi
  10322d:	56                   	push   %esi
  10322e:	83 ec 20             	sub    $0x20,%esp
  103231:	8b 45 08             	mov    0x8(%ebp),%eax
  103234:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103237:	8b 45 0c             	mov    0xc(%ebp),%eax
  10323a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10323d:	8b 45 10             	mov    0x10(%ebp),%eax
  103240:	89 45 ec             	mov    %eax,-0x14(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  103243:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103246:	c1 e8 02             	shr    $0x2,%eax
  103249:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  10324b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10324e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103251:	89 d7                	mov    %edx,%edi
  103253:	89 c6                	mov    %eax,%esi
  103255:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103257:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  10325a:	83 e1 03             	and    $0x3,%ecx
  10325d:	74 02                	je     103261 <memcpy+0x38>
  10325f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103261:	89 f0                	mov    %esi,%eax
  103263:	89 fa                	mov    %edi,%edx
  103265:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  103268:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  10326b:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  10326e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  103271:	83 c4 20             	add    $0x20,%esp
  103274:	5e                   	pop    %esi
  103275:	5f                   	pop    %edi
  103276:	5d                   	pop    %ebp
  103277:	c3                   	ret    

00103278 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  103278:	55                   	push   %ebp
  103279:	89 e5                	mov    %esp,%ebp
  10327b:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  10327e:	8b 45 08             	mov    0x8(%ebp),%eax
  103281:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  103284:	8b 45 0c             	mov    0xc(%ebp),%eax
  103287:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  10328a:	eb 30                	jmp    1032bc <memcmp+0x44>
        if (*s1 != *s2) {
  10328c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10328f:	0f b6 10             	movzbl (%eax),%edx
  103292:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103295:	0f b6 00             	movzbl (%eax),%eax
  103298:	38 c2                	cmp    %al,%dl
  10329a:	74 18                	je     1032b4 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  10329c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10329f:	0f b6 00             	movzbl (%eax),%eax
  1032a2:	0f b6 d0             	movzbl %al,%edx
  1032a5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1032a8:	0f b6 00             	movzbl (%eax),%eax
  1032ab:	0f b6 c0             	movzbl %al,%eax
  1032ae:	29 c2                	sub    %eax,%edx
  1032b0:	89 d0                	mov    %edx,%eax
  1032b2:	eb 1a                	jmp    1032ce <memcmp+0x56>
        }
        s1 ++, s2 ++;
  1032b4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1032b8:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  1032bc:	8b 45 10             	mov    0x10(%ebp),%eax
  1032bf:	8d 50 ff             	lea    -0x1(%eax),%edx
  1032c2:	89 55 10             	mov    %edx,0x10(%ebp)
  1032c5:	85 c0                	test   %eax,%eax
  1032c7:	75 c3                	jne    10328c <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  1032c9:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1032ce:	c9                   	leave  
  1032cf:	c3                   	ret    
