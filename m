From: leolistas@solucoesip.net
Subject: Re: iptables with alias?
Date: Sat,  5 Oct 2002 17:59:23 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1033851563.3d9f52ab0fa9d@webmail.solucoesip.net>
References: <000a01c26cb0$309bdc80$1801a8c0@CBOOK>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000a01c26cb0$309bdc80$1801a8c0@CBOOK>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Jeppe =?ISO-8859-1?B?U/hyZW5zZW4=?= <smed@tdcadsl.dk>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>



   I think you'll have to tweak your firewall scripts and build your own=20
customized SNAT rules. I mean ..... your firewall script can easily get=20
the IP address of the interface ( even alias one ) with something similar=20
to:

ifconfig "eth0 " | grep inet | cut -d":" -f 2 | cut -d" " -f 1


   Then, in POSTROUTING you could build your rules, just like:

iptables -t nat -A POSTROUTING -s 192.168.1.5 -j SNAT --to-source $IP_ETH0
iptables -t nat -A POSTROUTING -s 192.168.1.6 -j SNAT --to-source=20
$IP_ETH00
iptables -t nat -A POSTROUTING -s 192.168.1.8/29 -j SNAT --to-source=20
$IP_ETH01 ( 192.168.1.8/29 matches 7-15 )
... and go on ....

   Note that this script can be only executed after ALL interfaces get=20
their IP addresses ....


   Hope this helps,
   Leonardo Rodrigues


Quoting Jeppe S=F8rensen <smed@tdcadsl.dk>:

> Hello
>=20
> I have a little question that perhaps someone can help me with
>=20
> I have a interface to the inet with 4 dynamic ip addr
> eth0 =3D first dynamic ip addr
> eth0:0 =3D second dynmaic ip addr
> and so on
>=20
> I want to make 1 on 1 nat on the frist 2 aliass and the last 2 alias are
> for
> the rest of the network
> 192.168.1.5 nat to eth0
> 192.168.1.6 nat to eth0:0
> 192.168.1.7-to-15 nat to eth0:1
> 192.168.1.16-to-30 nat to eth0:2
>=20
> but iptables wan't take alias
>=20
> What do I do / what can I do ?
>=20
> I have looked in the The netfilter user mailinglist Archives and found
> the
> following solution
>=20
> ip addr add w.x.y.z/bits dev eth0 label eth00
>=20
> but how does I get it to work with dynamic address?

