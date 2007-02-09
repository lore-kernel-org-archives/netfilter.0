From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Iptables proxy to a different network
Date: Fri, 09 Feb 2007 18:01:00 +0100
Message-ID: <45CCA8CC.6060205@plouf.fr.eu.org>
References: <D392D4803D14354CBC49D772E19DD0CD45660A@zeus.w2k.nrlmry.navy.mil>	<45CC5A91.4090200@plouf.fr.eu.org><Pine.LNX.4.61.0702091338030.31955@yvahk01.tjqt.qr>	<45CC919C.7030104@plouf.fr.eu.org>
	<D392D4803D14354CBC49D772E19DD0CD45660B@zeus.w2k.nrlmry.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D392D4803D14354CBC49D772E19DD0CD45660B@zeus.w2k.nrlmry.navy.mil>
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

Andrus, Mr. Brian (Contractor) a =E9crit :
>=20
> So to properly do this, I _must_ SNAT the connection

It is a possibility.

> and route them back from system C via system B?

"Or", not "and". If you SNAT, the return traffic will be routed properly.

> Diagram:
>=20
> +---------------+
> |   System A    |
> +-------+-------+
>         |
> {=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D}
> {    Internet   }
> {=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D}
>         |
> +---------------+        +---A.B.C.x-----+
> |    Router     +--------|   System B    +
> +-------+-------+        +---------------+
>         |
> +-------+-------+
> |   System C    |
> +---X.Y.Z.x-----+

This is getting complicated...
In your first message, you said that A (the proxy) was a.b.c.1 and  B=20
(the server) was x.y.z.1.
In this diagram, where are the client, the proxy and the server ?

