From: "Michael D. Berger" <m.d.berger@ieee.org>
Subject: Leap Second Kernel Panic??
Date: Mon, 2 Jan 2006 21:38:07 -0500
Message-ID: <000001c6100e$bb06a800$2801a8c0@MBRC40>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter <netfilter@lists.netfilter.org>

I have two linux boxes that run all the time.  I was away for
a few days over New Year, and came home to find both boxes
locked up with this on the screens, with the only differences
shown by yy and xxxxxxxx:

   Red Hat Enterprise Linux WS release 4(Nahant)
   Kernel 2.6.9-5.EL on an i686

   mbrcyy login: Clock: inserting leap second: 23:59:60 UTC
   Kernel panic - not syncing: net/ipv4/tcp_timer.c:211:
   spin_lock(net/ipv4/tcp_minisocks.c:xxxxxxxx) already locked by
   net/ipv4/tcp_ipv4.c/1790

   yy = 32, xxxxxxxx = f5fee080
   yy = 20, xxxxxxxx = c276aa40

I add that both boxes are running:
   ntpd (but only one talks to the outside world)
   net_queue_d, a new and rather complex libipq daemon I am developing

I of course suspect my libipq daemon, but the apparent relation
to the leap second is peculiar.

Assistance would be much appreciated.  If additional information would
help, please tell me what it is.

Thanks,
Mike.

--
Michael D. Berger
m.d.berger@ieee.org 



