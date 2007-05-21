From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: is it possible to block ip packets that contains experimental
 tcp options ?
Date: Mon, 21 May 2007 20:27:15 +0200
Message-ID: <4651E483.9000204@plouf.fr.eu.org>
References: <F163413C9250D211A55C0060979D5280016AB361@hertz.rad.nd.edu>
	<1179747134.32083.19.camel@bathory.webcat.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1179747134.32083.19.camel@bathory.webcat.no>
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

Glenn Terjesen a =E9crit :
> What i meant with "experimental tcp options" is that my ids (snort)
> keept logging these "experimental tcp options"
>=20
> #
> code 76
> length 8
> data 01019DEDBEF00005
>=20
> I know this aint a snort list, but my servers don't serve any services
> that require this kind of traffic.
>=20
> So i was wondering if iptables has any way of blocking these.

If you have a black list of options you want to drop (or a white list of=20
allowed options), what about the "--tcp-option" option of the "tcp" match=
 ?

> These to magic lines fixed it all
> iptables -A FORWARD -p tcp --tcp-flags ALL ALL -j DROP
> iptables -A FORWARD -p tcp --tcp-flags ALL NONE -j DROP

I wonder how these rules could drop packets according to TCP options.=20
TCP flag combinations are not TCP options.

