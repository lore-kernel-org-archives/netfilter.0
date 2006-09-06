From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Newbie question about NAT and forwarding
Date: Thu, 07 Sep 2006 01:52:34 +0200
Message-ID: <44FF5F42.4050605@plouf.fr.eu.org>
References: <20060906205232.GA23980@crowfix.com> <ednhr3$pjc$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ednhr3$pjc$1@sea.gmane.org>
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

Hello,

Danny Rathjens a =E9crit :
> felix@crowfix.com wrote:
[...]
>> What iptables commands would I used to route non-SMTP packets between,
>> say, eth0 (local net, static real addresses) and eth1 (broadband DHCP)=
?
>=20
> Just follow normal procedure for NAT of traffc using and us broadband a=
s=20
> default route:
> route add default gw $broadband_gateway

And for NAT :
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

MASQUERADE is because eth1's address is dynamic. Else SNAT could be used=20
instead.

> Then you just need to route the smtp traffic through your dial-up.
>=20
> iptables -A PREROUTING -i eth0 -t mangle -p tcp --dport 25 -j MARK=20
> --set-mark 2
> echo 202 mail >> /etc/iproute2/rt_tables
> ip rule add fwmark 2 table mail
> ip route add default via $dialup_gateway dev eth0 table mail
                                            ^^^^^^^^
"dev ppp0" would be better IMHO.

If source address validation is enabled, don't forget to disable it on=20
the non-default interface :

sysctl -w net/ipv4/conf/ppp0/rp_filter=3D0

If net/ipv4/conf/default/rp_filter=3D1, you'll have to do this every time=
=20
after ppp0 is created. If net/ipv4/conf/default/rp_filter=3D0 before ppp0=
=20
is created, net/ipv4/conf/ppp0/rp_filter will be automatically set to 0.

One remark : if there is SMTP traffic from a local host with a private=20
address, this  traffic will be routed via ppp0 but must be NATed with=20
any public address routed on the dialup link. If it is not NATed, it=20
will go out with its original private source address and that's not good.

Note to Felix : you don't need to define and use a table name in=20
/etc/iproute2/rt_tables. It just makes routes and routing rules more=20
readable. You can use a table number in the range 1-252 instead.

