From: "Allshouse, Brian M (Sabre)" <AllshouseBM@navair.navy.mil>
Subject: Kernel panic
Date: Wed, 16 Apr 2003 08:45:55 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7160403BF562D211A1C70000F809810B05286F7C@nems09.nawcad.navy.mil>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

I'm having problems with kernel panics. I set up my firewall with the
latest and greatest version of iptables and the latest stable kernel. I'm
running slackware 8.1, and ever since I put it on the network for testing I
get kernel panics that crash the machine I tried the previous kernel
version (2.4.18) and also tried the latest patches for Iptables. I posted 
this problem here a few weeks ago and someone suggested using ksymoops to 
track down what is causing the kernel panic. I finally have been able to do
that, but not being a kernel programmer I don't know what to make of it. I'm
pasting the output from ksymoops below. If anyone knows what to make of this
or where I can find out what this means I would greatly appreciate it. I'm
on 
the verge of missing my deadline to have this box in place. Thanks.

<-------------------------Start ksymoops
output----------------------------------------->

ksymoops 2.4.9 on i586 2.4.20.  Options used
     -V (default)
     -k /proc/ksyms (default)
     -l /proc/modules (default)
     -o /lib/modules/2.4.20/ (default)
     -m /usr/src/linux/System.map (default)

Warning: You did not tell me where to find symbol information.  I will
assume that the log matches the kernel and modules that are running
right now and I'll use the default options above for symbol resolution.
If the current kernel and/or modules do not match the log, you can get
more accurate output by telling me the kernel version and where to find
map, modules, ksyms etc.  ksymoops -h explains the options.

*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<c0272a86>]   Not tainted
Using defaults from ksymoops -t elf32-i386 -a i386
EFLAGS: 00010202
eax:  00000080  ebx:  00000000  ecx:  7354e5cc  edx:  000007ff
esi:  0000008c  edi:  ffffffea  ebp:  c0351e5c  esp:  c0351e0c
ds:  0018  es:  0018 ss:  0018
Process swapper (pid: 0, stackpage=c0351000)
Stack: 00000000 00000002 5750e58c 00000000 00000000 000004e8 00000000
00000000
       cb8fb990 cb8fb990 00000000 7d56e58c 00000000 fd010015 cb919920
5750e58c
       7354e48c 00000002 00000000 00000000 7354e58c c0272fbc cbe1cee0
5750e58c
Call Trace:   [<c0272fbc>] [<c0290c4b>] [<c026cf4a>] [<c0290f8f>]
[<c029aa8f>]
 [<c026745b>] [<c02674ee>] [<c0267604>] [<c0119c5a>] [<c0109aae>]
[<c0106d00>]
 [<c010bf38>] [<c0106d00>] [<c0106d23>] [<c0106d87>] [<c0105000>]
[<c0105027>]
Code: 03 00 83 f8 7f 0f 84 f0 03 00 00 8d 7d ec 8d 5d e4 a1 bc


>>EIP; c0272a86 <ip_route_input_slow+12e/558>   <=====

>>ebp; c0351e5c <init_task_union+1e5c/2000>
>>esp; c0351e0c <init_task_union+1e0c/2000>

Trace; c0272fbc <ip_route_input+10c/114>
Trace; c0290c4b <arp_process+1a3/44c>
Trace; c026cf4a <nf_hook_slow+132/188>
Trace; c0290f8f <arp_rcv+9b/c4>
Trace; c029aa8f <unix_dgram_sendmsg+35f/364>
Trace; c026745b <netif_receive_skb+14f/178>
Trace; c02674ee <process_backlog+6a/110>
Trace; c0267604 <net_rx_action+70/114>
Trace; c0119c5a <do_softirq+5a/a4>
Trace; c0109aae <do_IRQ+96/a8>
Trace; c0106d00 <default_idle+0/28>
Trace; c010bf38 <call_do_IRQ+5/d>
Trace; c0106d00 <default_idle+0/28>
Trace; c0106d23 <default_idle+23/28>
Trace; c0106d87 <cpu_idle+3f/54>
Trace; c0105000 <_stext+0/0>
Trace; c0105027 <rest_init+27/28>

Code;  c0272a86 <ip_route_input_slow+12e/558>
00000000 <_EIP>:
Code;  c0272a86 <ip_route_input_slow+12e/558>   <=====
   0:   03 00                     add    (%eax),%eax   <=====
Code;  c0272a88 <ip_route_input_slow+130/558>
   2:   83 f8 7f                  cmp    $0x7f,%eax
Code;  c0272a8b <ip_route_input_slow+133/558>
   5:   0f 84 f0 03 00 00         je     3fb <_EIP+0x3fb> c0272e81
<ip_route_input_slow+529/558>
Code;  c0272a91 <ip_route_input_slow+139/558>
   b:   8d 7d ec                  lea    0xffffffec(%ebp),%edi
Code;  c0272a94 <ip_route_input_slow+13c/558>
   e:   8d 5d e4                  lea    0xffffffe4(%ebp),%ebx
Code;  c0272a97 <ip_route_input_slow+13f/558>
  11:   a1 bc 00 00 00            mov    0xbc,%eax

 <0>Kernel panic: Aiee, killing interrupt handler!

1 warning issued.  Results may not be reliable.

<----------------------------------End ksymoops
output------------------------------------------->



Sincerely,

Brian Allshouse
UNIX Systems Administrator
Sabre Systems Inc.
mailto:allshousebm@navair.navy.mil
(301) 342-7034


