From: Mariusz Kruk <kruk@rdc.pl>
Subject: Re: interface vs ip
Date: Tue, 27 Sep 2005 13:43:35 +0200
Message-ID: <43393067.1010000@rdc.pl>
References: <BAY102-F8E3F9B17E34FC090707EEAE8A0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY102-F8E3F9B17E34FC090707EEAE8A0@phx.gbl>
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

P theodorou napisa=B3(a):
> Im new to this therefore i need to clarify the followings
>=20
> 1)can i send or recieve packets from interface to ip and vise versa
>=20
> or  only to interfaces and only to ips
>=20
> 2)
>=20
> I want to let icmp packets from 192.168.0.1(eth1) to 192.168.1.1(eth2)
>=20
> is it safer to declare
>=20
> iptables -A INPUT  -i eth1   -o eth2 -J ACCEPT
>=20
> or
> iptables -A INPUT -s 192.168.0.1 -d 192.168.1.1

It depends on what you really want to do. If you want to control the=20
flow on the level of physical interfaces, you use -i and -o. If you want=20
to control on the level of IP addresses, you use -s and -d. But that you=20
already know. You can also combine both forms to, for example, filter=20
out traffic which comes from a physical interface, but from IP's not=20
belonging to this network. Or other similar things.
Anyway, it's up to you to decide which form is apropriate for what you=20
want to achieve.
Remember tho, that you can use -s and -d in any table/chain (correct me=20
if I'm wrong) regardless of whether it makes sense or not (already=20
NATted or not yet and so on), but physical interfaces are limited to=20
those tables/chains they make sense in. So you cannot use input=20
interface in POSTROUTING because netfilter simply doesn't know which=20
interface the packet came from.

