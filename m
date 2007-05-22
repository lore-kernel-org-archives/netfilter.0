From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Bridge Transparent Proxy
Date: Wed, 23 May 2007 00:07:43 +0200
Message-ID: <465369AF.2060107@plouf.fr.eu.org>
References: <C2787F66.1C272%robert@leblancnet.us>	<465336C4.5060600@riverviewtech.net>	<46533842.9080404@plouf.fr.eu.org>
	<46533B98.9030706@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46533B98.9030706@riverviewtech.net>
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

Grant Taylor a =E9crit :
>=20
> Let me re-layout the network including IP addresses.
>=20
> (INet [A.B.C.Z]) --- (BRouter [A.B.C.D]) --- ([A.B.C.E] Server(s)
>                        [192.168.144.254] --- ([192.168.144.1-100])
>=20
> Here you can see that you have the same subnet of A.B.C.x on both sides=
=20
> of the bridging router.

Now I see. But wouldn't it be worth subnetting A.B.C.x ?

>  There is no good (read easy) way to have the=20
> same subnet on multiple sides of a router

Do you mean that ARP proxy would not be a good way ? Ok, I guess it=20
would disrupt IP broadcasts a bit...

> short of double natting which=20
> in and of its self is not easy to do on a singular box.

Anyway NAT is evil. Don't use unless you can't avoid it.

