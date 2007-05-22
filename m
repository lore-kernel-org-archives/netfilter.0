From: Glenn Terjesen <glenn@webcat.no>
Subject: Re: is it possible to block ip packets that contains experimental
	tcp options ?
Date: Tue, 22 May 2007 10:58:24 +0200
Message-ID: <1179824305.32083.69.camel@bathory.webcat.no>
References: <F163413C9250D211A55C0060979D5280016AB361@hertz.rad.nd.edu>
	<1179747134.32083.19.camel@bathory.webcat.no>
	<4651E483.9000204@plouf.fr.eu.org>
Reply-To: glenn@webcat.no
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4651E483.9000204@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Thanks allot Pascal,

iptables -A FORWARD -p tcp --tcp-option 76 -j REJECT

seems to be working.


On Mon, 2007-05-21 at 20:27 +0200, Pascal Hambourg wrote:
> Hello,
>=20
> Glenn Terjesen a =E9crit :
> > What i meant with "experimental tcp options" is that my ids (snort)
> > keept logging these "experimental tcp options"
> >=20
> > #
> > code 76
> > length 8
> > data 01019DEDBEF00005
> >=20
> > I know this aint a snort list, but my servers don't serve any services
> > that require this kind of traffic.
> >=20
> > So i was wondering if iptables has any way of blocking these.
>=20
> If you have a black list of options you want to drop (or a white list of=20
> allowed options), what about the "--tcp-option" option of the "tcp" match=
 ?
>=20
> > These to magic lines fixed it all
> > iptables -A FORWARD -p tcp --tcp-flags ALL ALL -j DROP
> > iptables -A FORWARD -p tcp --tcp-flags ALL NONE -j DROP
>=20
> I wonder how these rules could drop packets according to TCP options.=20
> TCP flag combinations are not TCP options.
>=20
>=20
--=20
Mvh Glenn Terjesen @ Webcat AS
Tlf: +47 37 02 20 20
E-post: support@webcat.no

