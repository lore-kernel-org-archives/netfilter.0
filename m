From: "Peter T. Breuer" <P.T.Breuer@cs.bham.ac.uk>
Subject: [help] modern iptables rule for transproxy
Date: Thu, 10 Jan 2008 17:02:44 +0100 (CET)
Message-ID: <200801101602.m0AG2iC5022136@betty.it.uc3m.es>
Reply-To: ptb@inv.it.uc3m.es
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'd be much obliged if somebody could give me a modern iptables
equivalent for this ipchains rule

   ipchains -A input -p tcp -d 0.0.0.0/0 80 -j REDIRECT 8081

which is intended to redirect OUTGOING packets with port 80 as
destination to port 8081 on localhost, where I have tproxy sitting
waiting to talk to the LAN web proxy and cache.

The tproxy man page doesn't give anything other than ipfw (freebsd)
or ipfwadm or ipchains (or ipnat, whatever that is) rules, but then it
was written in 2000. Perhaps the man page could be updated, with a
suitable note of thanks, when we know what to put in it!

Thanks in advance!

Peter (ptb@cs.bham.ac.uk, ptb@inv.it.uc3m.es)

