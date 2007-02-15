From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptables: hide the real web server from users
Date: Thu, 15 Feb 2007 16:08:56 +0100
Message-ID: <45D47788.4050105@plouf.fr.eu.org>
References: <869165.54710.qm@web33305.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <869165.54710.qm@web33305.mail.mud.yahoo.com>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Tim Perton a =E9crit :
> I tried the forward rules too but nothing.
> Still telnet a.b.c.d 1099 does not work after issuing
> the following commands(no other firewalling made to
> prohibit packets):
>=20
> iptables -A INPUT -p tcp -m tcp --dport 1099 -j ACCEPT

This rule is useless because connections to port 1099 are forwarded to=20
another host. INPUT chains see only traffic for the local host.

> iptables -A FORWARD -i eth0 -o eth0 -d 216.239.59.103
> -p tcp --dport 80 -j ACCEPT

Ok.

> iptables -A FORWARD -i eth0 -o eth0 -s 216.239.59.103
> -p tcp --sport 80 -j ACCEPT

Use the connection tracking (-m state --state ESTABLISHED) to deal with=20
return traffic.

> iptables -t nat -A PREROUTING -i eth0 -d a.b.c.d -p
> tcp --dport 1099 -j DNAT --to-destination
> 216.239.59.103:80

Ok.

> iptables -t nat -A POSTROUTING -o eth0 -d
> 216.239.59.103 -p tcp --dport 1099 -j SNAT --to-source
> a.b.c.d

The rule must match on destination port 80 instead of 1099, because it=20
occurs after the destination port has been translated. Remember the path=20
is :
PREROUTING (DNAT) -> FORWARD -> POSTROUTING (SNAT)

