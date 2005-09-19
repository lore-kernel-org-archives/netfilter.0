From: Gabriel <jarod125@yahoo.com>
Subject: Fwd: Re: netfilter conntrack performance problems
Date: Mon, 19 Sep 2005 14:47:22 -0700 (PDT)
Message-ID: <20050919214722.28145.qmail@web60921.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org


 --- Horvath Szabolcs <hsz@sth.sze.hu> wrote:
 
 > Hi!
 > 
 > We have a firewalling-only machine, called natbox.
 > Traffic is around
 > 20-40 MByte/s, ~400 clients snatted to 4 public IPs,
 > approx. 10000-40000
 > parallel connections.
 > 
 > You can see the traffic here:
 >

http://mrtg.sth.sze.hu/14all.cgi?log=193.224.129.230&cfg=uplink.cfg
 > 
 > When the traffic grows above 30 MByte/sec, the
 > sysinterrupts is around
 > 90%.
 > 
 > vmstat's output at 20 MByte/sec:
 > 
 > gw:~# vmstat 1
 > procs -----------memory---------- ---swap-- -----io----
 > --system-- ----cpu----
 >  r  b   swpd   free   buff  cache   si   so    bi    bo
  
 > in    cs us sy id wa
 >  3  0      0 844720   5936  23476    0    0    12    16
 > 7887  2364  4 57 39  0
 >  2  0      0 844656   5936  23476    0    0     0     0
 > 30336  3263  5 76 19  0
 >  0  0      0 844592   5936  23476    0    0     0     0
 > 30102  3314  5 72 23  0
 >  1  0      0 844656   5936  23476    0    0     0     0
 > 28954  4219  5 66 29  0
 >  0  0      0 844656   5936  23476    0    0     0     0
 > 29902  3428  6 71 23  0
 >  1  0      0 844656   5944  23476    0    0     0    64
 > 29250  4071  5 71 24  0
 > 
 > When the sysinterrupt is near to 100%, the machine is
 > natting further,
 > but we can't manage via ssh. The interactive tasks
 don't
 > work.
 > 
 > sysctl parameters:
 http://193.224.129.230/log/sysctl.txt
 > dmesg info: http://193.224.129.230/log/dmesg.txt
 > kernel configuration:
 > http://193.224.129.230/log/config.txt
 > firewall conf: http://193.224.129.230/log/firewall.txt
 > (If I missed any importation information, please let me
 > know!)
 > 
 > munin: http://193.224.129.230/munin/
 > 
 > from the munin graphics, I see the nic's interrupts
 > generate the machine
 > load. What can we tuning to provide better performance?
 
 > 
 > It is a P4 3.0GHz with 1 GB ram, is this computer
 enough
 > to do this task?
 > 
 > 
 > Thanks for your reply.
 > 
 > Szabolcs Horvath
 > 
 Maybe it's the load average bug. They fixed it in 2.6.13.
 Below is an excerpt from the 2.6.13 changelog:
 -------
 commit 7e1f49da6881bbf938e502d99335ad5488eb93b4
 Author: Jeff Dike <jdike@addtoit.com>
 Date:   Thu Jul 28 21:16:09 2005 -0700
 
     [PATCH] uml: Fix load average >=1
     
     update_process_times was missing its
 irq_enter/irq_exit
 wrapper.  This caused
     ksoftirqd to be scheduled on every clock tick.
     
     Signed-off-by: Jeff Dike <jdike@addtoit.com>
     Cc: Paolo 'Blaisorblade' Giarrusso
 <blaisorblade@yahoo.it>
     Signed-off-by: Andrew Morton <akpm@osdl.org>
     Signed-off-by: Linus Torvalds <torvalds@osdl.org>
 -------
P.S.: Damn, I have to get used to changing the "To:" field
when replying... Sorry again for replying to the private
address... 



		
__________________________________ 
Yahoo! Mail - PC Magazine Editors' Choice 2005 
http://mail.yahoo.com

