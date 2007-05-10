From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptables NAT routing issues
Date: Fri, 11 May 2007 00:14:07 +0200
Message-ID: <4643992F.4050001@plouf.fr.eu.org>
References: <4640E893.1010206@bserved.nl>	<Pine.LNX.4.61.0705090024450.2342@yvahk01.tjqt.qr>	<4640FAD0.9050301@plouf.fr.eu.org>	<Pine.LNX.4.61.0705090036060.2342@yvahk01.tjqt.qr>	<4640FDA9.5000706@bserved.nl>	<464101DA.4070102@plouf.fr.eu.org>	<46432A84.2010409@bserved.nl>	<464372FE.1070802@plouf.fr.eu.org>
	<46437B28.5000805@bserved.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46437B28.5000805@bserved.nl>
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

Bas Verhoeven a =E9crit :
>=20
>> Which option did you choose ?
[...]
> On the webserver we now mark all outgoing web packets:
[...]
> And we use iproute2 to forward them back to the outbound server:
[...]

Ok. You seem to know how to use advanced routing, I am a bit surprised=20
you said you "weren't aware of that option".

> Couldn't test with CONNMARK, as the box doesn't ship with that, but MAR=
K=20
> works great for now.

The 'CONNMARK' target and the 'connmark' match were included in the=20
kernel 2.6.10. Earlier kernel versions had to be patched with the=20
patch-o-matic-ng.

> I did test your last option too, but that just didn't work and sounded=20
> very hacky-ish, not something we could rely on, even if it worked.

Huh, what last option ? I don't know what you're talking about. ;-)

