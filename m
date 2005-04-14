From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: SNAT and IPSEC
Date: Thu, 14 Apr 2005 16:03:43 +0200
Message-ID: <425E783F.5070502@lopsch.com>
References: <1113329293.29536.13.camel@fly.in.iantel.com.uy><425C1D5F.7000302@lopsch.com>	<1113393681.4244.3.camel@fly.in.iantel.com.uy>
	<d3j9vh$tnf$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d3j9vh$tnf$1@sea.gmane.org>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@lists.netfilter.org

Michael Muenz schrieb:
> Hi,
>=20
>=20
>>"Eduardo Spremolla" <edspremolla@antel.com.uy> schrieb im=20
>>Newsbeitragnews:1113393681.4244.3.camel@fly.in.iantel.com.uy...
>>Yes, the OpenSwan is mutch more clear, yuo have the packet with the
>>originals ip in the nat post chain to the tunn0 device.=20
>=20
>=20
>>Is there any chance to aplay NETMAP to the source=20
>>ip on PREROUTING ?
>=20
>=20
> I never used NETMAP but this is from the description:
> It can be applied to the PREROUTING chain to alter the destination of
> incoming connections, to the POSTROUTING chain to alter the source=20
> of outgoing connections, or both (with separate rules).
>=20
> You want to alter the source (10.2.2.0/24) and that's an outgoing conn.
> (Of course vice versa) ..
>=20
> So perhaps this will work:
> iptables -t nat -A POSTROUTING -s 10.2.2.0/24 -d 10.37.130.0/24 \
>    -j NETMAP --to 10.3.3.0/24
> iptables -t nat -A PREROUTING -s 10.37.130.0/24 -d 10.3.3.0/24 \
>    -j NETMAP --to 10.2.2.0/24
>=20
> - Michael
>=20
>=20
>=20
>=20
No it won=C2=B4t that=C2=B4s the problem because with native IPSec the pa=
ckets=20
only pass the chains once (without the patches). So they arrive tunnel=20
encapsulated at the POSTROUTING chain. But with the patches it would=20
probably work.

