From: "Michael D. Berger" <m.d.berger@ieee.org>
Subject: Kernel panic - not syncing
Date: Sun, 8 Jan 2006 13:03:59 -0500
Message-ID: <000101c6147d$e9affc10$2801a8c0@MBRC40>
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

I reported this problem previously on redhat-list@redhat.com
possibly in relation to the leap second.  We see now that the
leap second may have been coincidental.

I am running a rather complex libipq daemon, which may be
related to this.  

I am also running tethereal in the background on this box.

I note that while previously the failure occurred on two
boxes, in this case, only one box failed.

I am considering upgrading to the latest fedora.

On:
   Red Hat Enterprise Linux WS release 4(Nahant)
   Kernel 2.6.9-5.EL on an i686
I get:
   Kernel panic - not syncing: net/ipv4/tcp_timer.c:yyy:
   spin_lock(net/ipv4/tcp_minisocks.c:xxxxxxxx) already locked by
   net/ipv4/tcp_ipv4.c/1790

                     previous         now
yyy                  211              422
xxxxxxxx             f5fee080         f62db080

Suggestions would be much appreciated.
Mike.
--
Michael D. Berger
m.d.berger@ieee.org 



