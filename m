From: "Iwan A. Vasilyev" <via-netfilter@vortex.udsu.ru>
Subject: ULOG iptables target OOPS on SMP
Date: Tue, 17 Jan 2006 20:27:49 +0400
Message-ID: <20060117162749.GA13563@udsu.ru>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

I am having problems with ULOG target on SMP hosts,
it crashes kernel after some time (in my case - about once a day, and
I can't directly reproduce it).

I use it for accounting with ipcad (http://ipcad.sf.net) on debian Sarge.
ULOG rule 
-j ULOG --ulog-prefix "FORWARD" --ulog-cprange 80 --ulog-qthreshold 50
is inserted into FORWARD, INPUT and OUTPUT chains.

OOPS output from linux 2.6.15 is below. ipt_ULOG module was loaded with
nlbufsiz=65536. Problem remains on some older 2.6 kernels (at least on 2.6.12) and with
default nlbufsiz=4096, but the same configuration works
with one processor, even on the same host with maxcpus=1
set at boot.

Maybe there is a simple solution, like modifying CPU affinity?

With best regards,
Iwan A. Vasilyev  [via@udsu.ru]

======= cut here =======
Unable to handle kernel NULL pointer dereference
at virtual address 00000044 
printing eip: 
c8925048 
*pde = 00000000 
Oops: 0002 [#1] 
SMP 
 
Modules linked in:
ipt_ULOG netconsole ide_cd i2c_piix4 8139too shpchp pci_hotplug 8139cp 3c59x i2c_core
 
CPU:    0 
EIP:    0060:[<c8925048>]    Not tainted VLI 
EFLAGS: 00010297   (2.6.15-gw-p1)  
EIP is at ulog_send+0x48/0x90 [ipt_ULOG] 
eax: 00000000   ebx: c8926ce0   ecx: 00000001   edx: 00000000 
esi: 00000020   edi: 00000000   ebp: c07bc000   esp: c07bdf30 
ds: 007b   es: 007b   ss: 0068 
Process swapper (pid: 0, threadinfo=c07bc000 task=c070bb20)
 
Stack: 
00000000 00000000 00000000 c1104e20 c8925090 c89250a4 00000100 c012aa59 
00000000 00000000 002e8bef 00000000 c0866c48 c0866c48 c070bb20 00000001 
c07b5f48 c080ff20 00000000 c01267f4 0000000a 00000046 c080d380 c080d300 
 
Call Trace: 
[<c8925090>]
ulog_timer+0x0/0x20 [ipt_ULOG]
 
[<c89250a4>]
ulog_timer+0x14/0x20 [ipt_ULOG]
 
[<c012aa59>]
run_timer_softirq+0xd9/0x1a0
 
[<c01267f4>]
__do_softirq+0xd4/0xf0
 
[<c0126845>]
do_softirq+0x35/0x40
 
[<c01038cc>]
apic_timer_interrupt+0x1c/0x24
 
[<c0100d51>]
default_idle+0x41/0x70
 
[<c0100e20>]
cpu_idle+0x80/0x90
 
[<c07be95a>]
start_kernel+0x18a/0x1d0
 
[<c07be360>]
unknown_bootoption+0x0/0x1c0
 
Code: 
e0 6c 92 c8 8b 53 0c 8d 43 0c 85 d2 75 5c 83 bf e0 6c 92 c8 01 76 09 8b 43 04 66 c7 40 04 
03 00 8b 43 08 8d 4e 01 be 20 00 00 00 

48 44 8b 53 08 89 0c 24 a1 60 71 92 c8 31 c9 89 74 24 04 e8 
 
Kernel panic - not syncing: Fatal exception in interrupt 


======= cut here =======

