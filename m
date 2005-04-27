From: "Daniel Wittenberg" <daniel-wittenberg@starken.com>
Subject: no netfilter debugging?
Date: Wed, 27 Apr 2005 13:37:44 -0500
Message-ID: <1114627064.13697.38.camel@plasma.starken.com>
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
To: netfilter@lists.netfilter.org

I'm still trying to find out why NAT stops working after awhile, so I'm
again going to see if anyone has a way to debug this.  I'm not asking
for people to debug it for me, I'll do the leg-work, but how do you
debug at the kernel-level what netfilter is doing with packets?  The
firewall/load balancing works for awhile then suddenly stops working,
could be 5 minutes, could be 5 hours...I am at a loss as to what causes
it and nothing in dmesg/syslog for errors.  Just flushing the rules and
routing tables and re-configing fixes the problem so I'm guessing there
is some limit it is hitting, but with nothing being logged I don't know
where to start.  I'm not sure if some of the kernel debugging tools can
be limited to only view netfilter activity, but I think that's what I'll
need to figure this out.

Thanks,
Dan


