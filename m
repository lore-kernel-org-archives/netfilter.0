From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: How to mangle source packet source ports to a fixed range
Date: Fri, 09 Feb 2007 16:34:04 +0100
Message-ID: <45CC946C.4060201@plouf.fr.eu.org>
References: <200702090915.56546.netfilter@arntzen.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200702090915.56546.netfilter@arntzen.us>
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

Steve a =E9crit :
> I have a need to set the source packet's high (unprivileged) source por=
ts to a=20
> fixed range of high  ports on a firewall providing NAT.

NAT =3D source NAT (or masquerading) ?

> The goal is to be able to identify the inside machines at the destinati=
on=20
> after NAT has changed the addresses.  This is for identification only. =
 I do=20
> not need to connect back to the machines inside the firewall.  I realiz=
e this=20
> may break certain protocols which may use dedicated unprivileged ports.
>=20
> i.e.:
>=20
> PREROUTING -i eth0 -p tcp -m tcp -s 192.168.0.x  --sport 1024:65535 -j=20
> REDIRECT --to-ports 2000-2200
>=20
> The above modifies the destination port based on the source port.

Not only it modifies the destination port but also the destination addres=
s.

>  I wish to modify the source port (  --from-ports ? ).

POSTROUTING [...] -j SNAT --to-source [ipaddr[-ipaddr]]:port-port
or
POSTROUTING [...] -j MASQUERADE --to-ports port-port

