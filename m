From: Mike Wright <ebwximaurm@mailinator.com>
Subject: Re: Using default policy drop in FORWARD =?iso-8859-1?q?chain=B4s?=
Date: Wed, 22 Mar 2006 09:42:01 -0800
Message-ID: <44218C69.2020502@mailinator.com>
References: <BAY116-F11578E646F01D1A39B8C4DCED80@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY116-F11578E646F01D1A39B8C4DCED80@phx.gbl>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Juan Santamaria wrote:
> Hello Guys

Hi Juan,

>=20
> Nowdays, I =B4ve been working  in a firewall configuration. I want use=20
> default policy DROP, for the INPUT,FORWARD,OUTPUT chain=B4s.  I using the=
=20
> redwall firewall, it has support for l7-protocols. I need to block msn,=20
> but when I apply the ruler to the forward chain it isn=B4t block.
>=20
> But when y change de default policy in Forward chain=B4s  to ACCEPT, tha =

> same ruler block the msn traffic.
>=20
> I appreciate some advices
>=20
> Cheerio!
>=20
> IPTABLES=3D/sbin/iptables
>=20
> $IPTABLES -F
> $IPTABLES -t nat -F
> $IPTABLES -X
> $IPTABLES -P INPUT DROP
> $IPTABLES -P OUTPUT DROP
> $IPTABLES -P FORWARD DROP
>=20
>=20
> $IPTABLES  -A FORWARD -p tcp -m tcp -m layer7 --l7proto msnmessenger
> -j DROP
>=20
>=20
>=20
>=20
> $IPTABLES -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
> $IPTABLES -A INPUT -p icmp --icmp-type destination-unreachable -j ACCEPT
> $IPTABLES -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
> $IPTABLES -A OUTPUT -p icmp --icmp-type echo-reply -j ACCEPT
> $IPTABLES -A OUTPUT -p icmp --icmp-type destination-unreachable -j ACCEPT
> $IPTABLES -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT
>=20
> #$IPTABLES -A FORWARD -s 10.0.109.20 -j DROP
>=20
> $IPTABLES -A INPUT   -i eth2 -p tcp -m tcp --dport 22 -j ACCEPT
> $IPTABLES -A OUTPUT  -o eth2 -p tcp -m tcp --sport 22 -m state --state=20
> RELATED,ESTABLISHED -j ACCEPT
>=20

I think the problem occurs here.  It's important to put the more=20
specific rules in front of the more general rules or they will never be=20
seen because the condition has already been matched.  Move the following=20
two rules to after those of "layer7" and all should be well.

Hope this is useful.

>=20
>=20
> $IPTABLES -A FORWARD -p tcp -m tcp --sport 80 -j ACCEPT
> $IPTABLES -A FORWARD -p tcp -m tcp --dport 80 -j ACCEPT
>=20
> $IPTABLES -A FORWARD -p tcp -m tcp --sport 80 -m layer7 --l7proto=20
> msnmessenger -j DROP
> $IPTABLES -A FORWARD -p tcp -m tcp --dport 80 -m layer7 --l7proto=20
> msnmessenger -j DROP
> $IPTABLES -A FORWARD -p tcp -m tcp --sport 443 -j ACCEPT
> $IPTABLES -A FORWARD -p tcp -m tcp --dport 443 -j ACCEPT
>=20
> $IPTABLES -A FORWARD -p udp -m udp --sport 53 -j ACCEPT
> $IPTABLES -A FORWARD -p udp -m udp --dport 53 -j ACCEPT
>=20
>=20
>=20
>=20
>=20

