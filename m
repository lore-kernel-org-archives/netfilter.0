From: Mark Ord <netfilter-list@losthorizons.mailshell.com>
Subject: iptables local port forwarding
Date: Sat, 3 Apr 2004 19:50:05 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040403095005.GA4511@scholars.home>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

I'm sure the answer to this is out there somewhere on the internet,
however numberous searches since I installed Debian a couple of months
ago haven't provided the exact answer to what I want.

My setup is:

Debian woody
uname: Linux scholars 2.4.18-mppe #1 Sat Dec 20 13:42:14 EST 2003 i686 unknown
iptables: iptables v1.2.6a
eth0: 10.0.13.192 (-> internet)
eth1: 192.168.0.1 (-> lan)

I have iptables setup, firewalling eth0 (the internet) extensively, and
doing NAT for my lan, and some custom port forwards.

One is forwarding port 81 -> 80 - due to my provider firewalling port
80:
     iptables -t nat -I PREROUTING -p tcp --dport 81 -j REDIRECT --to 80

This works for connections coming in on both eth0, and eth1. However, I
can't connect to port 81 on the iptables machine (no matter what
iptables rules I try). On the lan side, I use a http proxy residing on
the iptables machine, hence can not connect to port 81 from the lan when
going through the proxy. It's not a huge problem (since I can and do use
port 80 from the lan side), I'm moreso just really interested in whether this
actually IS possible, and if not, why?

While making this work isn't critical, I would like to do some other
fancy forwarding which requires the same sort of thing. (ssh port
forwarding on the iptables machine, then forwarding ports on specific
nic interfaces to the ssh forwarded port on lo, to avoid having to bind ssh
forwarded ports with 'GatewayPorts yes'). Basically I'd like to know if
this crazy type of setup is acheivable.

TIA.
Mark.


