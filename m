From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: Firewalling issue
Date: Wed, 19 Jul 2006 12:59:51 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C40127CA@knowledge.wizdom.nu>
References: <44BE08A8.2020507@linuxpro.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

You need to create a rule on that specific interface. something like:
=20
iptables -t filter -A INPUT -i eth2 -s 0.0.0.0/0 -j DROP
=20
This will drop ALL traffic coming into your eth2 interface. If you need =
certain traffic to come through (like from your internal network) add a =
rule to allow this traffic BEFORE the drop rule.
=20
Also, get yourself a tool like fwbuilder (http://www.fwbuilder.org). It =
will make configuring your firewall a lot easier.
=20
-Sietse

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Ross Cameron
Sent: Wed 19-Jul-06 12:25
To: netfilter@lists.netfilter.org
Subject: Firewalling issue



Hi there list I have the following issue:

I have a IP split setup on one of my Linux boxes (see diagram below), I
can route and all access is hunky dory,... BUT I want to block access to
my DMZ'z gateway address from the outside world.
    How do I do this?


+------------+                                       +------------ +
|            |       eth0 +-------------+  eth1      |             |
|  Internet  |=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D| FW / Router =
|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D| LAN         |
|            |            +-------------+            |             |
+------------+                    || eth2            +------------ +
                                  ||
                                  ||
                                  ||
                                  ||                 +------------ +
                                  |+-----------------|             |
                                  +------------------|    DMZ      |
                                                     |             |
                                                     +------------ +

KEY:
~~~~
eth0   =3D>   196.x.x.122 / 255.255.255.252
eth1   =3D>   192.168.x.x / 255.255.255.0
eth2   =3D>   196.x.x.94  / 255.255.255.240


The Internet needs to be able to see 196.x.x.80 -> 196.x.x.95,... with
the exception of 196.x.x.94!!!

Everything else is correct and how I need it to be,... I need to know
how to DROP the packets coming in on eth0 for 196.x.x.94
BUT packets coming in on eth2 for 196.x.x.94 need to be allowed.

Regards,...
Ross Cameron




