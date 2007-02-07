From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: IPTables and different types of NAT
Date: Wed, 07 Feb 2007 19:10:22 +0100
Message-ID: <45CA160E.90102@plouf.fr.eu.org>
References: <45C9F509.8010309@gmail.com> <45C9FBFB.9090607@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45C9FBFB.9090607@riverviewtech.net>
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

Hello,

Grant Taylor a =E9crit :
> Pedro Gon=E7alves wrote:
>=20
>> I want to know if it is possible to use IPTables to implement
>> -Full Cone NAT
>> -Restricted Cone NAT
>> -Port Restricted Cone NAT
>> -Symmetric NAT
>=20
> I see no reason why it would not be possible.

The reason is Netfilter/iptables performs UDP NAT on a per-connection=20
basis (connection =3D source address, source port, destination address,=20
destination port).

> "Full Cone Nat" could easily be implemented with inbound redirection to=
=20
> the internal system.

"Full cone NAT" can be implemented with 1-to-1 bidirectional NAT using=20
SNAT+DNAT or NETMAP.

> "Port Restricted Cone NAT" is nothing more than "Restricted Cone NAT"=20
> with port filtering.  This is what is usually done if you have a server=
=20
> behind a NATing router / firewall.  In this case, you only port forward=
=20
> the ports that you need.

No. Please read more carefully the definitions of "restricted cone NAT"=20
and "port restricted cone NAT". Neither can be implemented with iptables=20
because they do not fit in the per-connection model.

> I'm not sure if there is inherent support for "Symmetric NAT" or not.=20

"Symmetric NAT" works on a per-connection basis and is the NAT form that=20
is the easiest to implement with iptables using SNAT or MASQUERADE.

