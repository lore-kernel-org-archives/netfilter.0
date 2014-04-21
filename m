From: =?ISO-8859-15?Q?Sven_K=F6hler?= <sven.koehler@gmail.com>
Subject: how to ignore forwarded traffic?
Date: Mon, 21 Apr 2014 04:22:42 +0300
Message-ID: <lj1rka$f3l$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

consider the following example:
you have a router between two networks, and you want to cut off the
router from the outside world using some iptables rules. However, all
traffic that is forwarded by the router between the two networks
basically is to be ignored by iptables (i.e., the router does not play
firewall for any of the two networks).

Currently, if conntrack is loaded on the router, then conntrack -L on
the router lists all the connections, not only those to and from the
router, but also all connections between the two. Certainly, it takes
some CPU cycles for the router to keep track of all the connections.
Also, the number of connections that conntrack can take of is limited.

So is there a way to let Linux "bypass" conntrack and maybe other
netfilter stuff when it comes to forwarded packets?


Kind Regards,
  Sven

