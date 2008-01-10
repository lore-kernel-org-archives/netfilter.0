From: Mike Kasick <mkasick-nf@club.cc.cmu.edu>
Subject: Is there a way to DROP on OUTPUT without returning EPERM?
Date: Thu, 10 Jan 2008 16:36:05 -0500
Message-ID: <20080110213605.GA14931@club.cc.cmu.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm trying to emulate network packet loss by randomly dropping packets with
netfilter and the statistic match module.  Everything works fine with the
following firewall rule:

iptables -A INPUT -i eth1 -m statistic --mode random --probability 0.5 -j DROP

However, since packets are dropped by the receiving machine, they're still
making it out on the wire.  I also want to test dropping packets on the
sending machine such that they never make it to the wire, unfortunately the
analogous rule:

iptables -A OUTPUT -o eth1 -m statistic --mode random --probability 0.5 -j DROP

has the side effect of returning EPERM for write/send syscalls for which
packets are dropped.  While this behavior makes sense in the usual case,
I'd really like to drop packets silently without the user application being
notified.

Is there a way I can achieve a truly silent DROP on the OUTPUT chain?  Is
there an extension target that does this that I've missed?

Thanks!
