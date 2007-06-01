From: "Neil Russell" <NeilR@mulberry.com>
Subject: Force use of outgoing IP address
Date: Fri, 1 Jun 2007 17:42:43 +0100
Message-ID: <B3FAB89EFECD684E9E648B81133263F1466025@MAIL_COM.MULBERRY.COM>
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


Hi,
=20
new to all this so please be gentle with me....
=20
I have a linux router with 3 network cards in, each card has multiple IP
address's assigned. I want to route all aoutbound traffic TO a
destination port of $DESTPRT out of eth0 on its IPAddress of 10.0.0.2
=20
=20
Example is=20
=20
Eth0 has IP address's of=20
10.0.0.1
10.0.0.2
10.0.0.3
and connects to 10.0.0.99 (Internet router)
=20
eth1 has ip address's of
192.168.0.1
192.168.0.2
192.168.0.3
=20
=20
and eth3 has ip address's of
192.168.1.0
192.168.1.2
192.168.1.3
=20
=20
So ALL traffic on the router with a destination address MUST go out on
eth0 and show its IP address as 10.0.0.2 even though the default route
is out via 10.0.0.1
=20
Hope thats clear and that someone can advise.
=20
=20
Neil.

