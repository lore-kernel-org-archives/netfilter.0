From: Tomasz Wrona <twr@wp.pl>
Subject: oops
Date: Mon, 25 Nov 2002 11:51:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1111168108.20021125115102@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hello,

Is it something interesting in the following oops report ?
Is it really related to ip_nat_pptp ?


<begin>
ksymoops 2.4.5 on i686 2.4.18-grsec.  Options used
     -V (default)
     -k /proc/ksyms (default)
     -l /proc/modules (default)
     -o /lib/modules/2.4.18-grsec/ (default)
     -m /boot/System.map-2.4.18-grsec (default)

Warning: You did not tell me where to find symbol information.  I will
assume that the log matches the kernel and modules that are running
right now and I'll use the default options above for symbol resolution.
If the current kernel and/or modules do not match the log, you can get
more accurate output by telling me the kernel version and where to find
map, modules, ksyms etc.  ksymoops -h explains the options.

Oops: 0000
CPU:    0
EIP:    0010:[<d084b3e7>]  Not tained
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010246
eax: 00000000   ebx: ce8c0480     ecx: ce8c0000       edx: 00000000
esi: 00000000   edi: 00000000     ebp: cb942834       esp: c021fde0
ds: 0018        es: 0018       ss: 0018
Process swapper (pid: 0, stackpage=c021f000)
Stack:  00000000 000016b2 ce8c04e8 00000018 00000000 c025df68 00003707 00000000
        00000000 ce8c05b8 ce8c0518 7b03a8c0 0000c8f8 00000000 0000000c ce8c0548
        c025df68 c01d1ed3 ce8c0480 00000000 ce8c0530 00000003 00000000 c021ff04
Call Trace:     [<c01d1ed3>] [<d084b6c0>] [<c01d0b30>] [<c01a5db8>] [<c019bbd8>]
    [<c01a5db8>] [<c01a5db8>] [<c019be8d>] [<c01a5bd8>] [<c01a5c26>] [<c01a5db8>]
    [<c0182406>] [<c0196a9d>] [<c011554a>] [<c0107f5d>] [<c0105150>] [<c0105150>]
    [<c010a2d8>] [<c0105150>] [<c0105150>] [<c0105173>] [<c01051d9>] [<c0105000>]
    [<c0105027>]
Code: 66 8b 02 35 ff ff 00 00 25 ff ff 00 00 50 e8 7a 5c 98 ef 66


>>EIP; d084b3e7 <[ip_nat_pptp]tcp_help+27f/2fc>   <=====

>>ebx; ce8c0480 <_end+e6434f8/1058e078>
>>ecx; ce8c0000 <_end+e643078/1058e078>
>>ebp; cb942834 <_end+b6c58ac/1058e078>
>>esp; c021fde0 <init_task_union+1de0/2000>

Trace; c01d1ed3 <do_bindings+26f/2f0>
Trace; d084b6c0 <[ip_nat_pptp]pptp_tcp_helper+0/0>
Trace; c01d0b30 <ip_nat_fn+1a0/1ac>
Trace; c01a5db8 <ip_rcv_finish+0/1f8>
Trace; c019bbd8 <nf_iterate+30/84>
Trace; c01a5db8 <ip_rcv_finish+0/1f8>
Trace; c01a5db8 <ip_rcv_finish+0/1f8>
Trace; c019be8d <nf_hook_slow+b5/144>
Trace; c01a5bd8 <ip_rcv+338/3c0>
Trace; c01a5c26 <ip_rcv+386/3c0>
Trace; c01a5db8 <ip_rcv_finish+0/1f8>
Trace; c0182406 <rtl8139_interrupt+76/e8>
Trace; c0196a9d <net_rx_action+1a5/280>
Trace; c011554a <do_softirq+5a/ac>
Trace; c0107f5d <do_IRQ+a1/b4>
Trace; c0105150 <default_idle+0/28>
Trace; c0105150 <default_idle+0/28>
Trace; c010a2d8 <call_do_IRQ+5/d>
Trace; c0105150 <default_idle+0/28>
Trace; c0105150 <default_idle+0/28>
Trace; c0105173 <default_idle+23/28>
Trace; c01051d9 <cpu_idle+41/54>
Trace; c0105000 <_stext+0/0>
Trace; c0105027 <rest_init+27/28>

Code;  d084b3e7 <[ip_nat_pptp]tcp_help+27f/2fc>
00000000 <_EIP>:
Code;  d084b3e7 <[ip_nat_pptp]tcp_help+27f/2fc>   <=====
   0:   66 8b 02                  mov    (%edx),%ax   <=====
Code;  d084b3ea <[ip_nat_pptp]tcp_help+282/2fc>
   3:   35 ff ff 00 00            xor    $0xffff,%eax
Code;  d084b3ef <[ip_nat_pptp]tcp_help+287/2fc>
   8:   25 ff ff 00 00            and    $0xffff,%eax
Code;  d084b3f4 <[ip_nat_pptp]tcp_help+28c/2fc>
   d:   50                        push   %eax
Code;  d084b3f5 <[ip_nat_pptp]tcp_help+28d/2fc>
   e:   e8 7a 5c 98 ef            call   ef985c8d <_EIP+0xef985c8d> c01d1074 <ip_nat_cheat_check+0/48>
Code;  d084b3fa <[ip_nat_pptp]tcp_help+292/2fc>
  13:   66                        data16

<0>Kernel panic: Aiee, killing interrupt handler!

1 warning issued.  Results may not be reliable.
<end>


Regards,
tw                   
--

-----------
 ck.eter.tym.pl


