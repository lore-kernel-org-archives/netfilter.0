From: "Enrico Demarin" <enricod@videotron.ca>
Subject: RE: Conntrack PPTP broken in 2.4.22 ?
Date: Fri, 12 Sep 2003 13:01:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000301c3791d$401bc4c0$f901010a@SC2003002>
References: <3F611548.4020102@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <3F611548.4020102@snapgear.com>
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
To: 'Philip Craig' <philipc@snapgear.com>
Cc: netfilter@lists.netfilter.org

The problem goes away with the patches you mentioned. I also tried to
establish a connection from a NATed box behind

The linux firewall to an external PPTP server ( win2k and linux poptop)
: it works , even without the module loaded .

I think at this point I miss the functionality of the pptp_conntrack
module ? When is it necessary to load it ?

- Enrico

> -----Original Message-----
> From: Philip Craig [mailto:philipc@snapgear.com]=20
> Sent: venerd=EC 12 settembre 2003 2.37
> To: Enrico Demarin
> Cc: netfilter@lists.netfilter.org
> Subject: Re: Conntrack PPTP broken in 2.4.22 ?
>=20
>=20
> Enrico Demarin wrote:
> > I have tried to use the pptp_conntrack patch from the last=20
> > patch-o-matic on Linux kernel 2.4.22 , but with that patch applied,=20
> > apps using
> > =20
> > getsockopt SO_ORIGINAL_DST stop working  :
> > =20
> > the perror i get is :
> > =20
> > getsockopt(SO_ORIGINAL_DST): No such file or directory
>=20
> The following patch in the netfilter patch-o-matic CVS is=20
> meant to fix this:
>=20
http://cvs.netfilter.org/~checkout~/netfilter/patch-o-matic/pending/63_g
etorigdst-tuple-zero.patch?sortby=3Drev

But unfortunately that patch is broken too, and you'll need to apply the
patch from this message to fix the patch:

http://lists.netfilter.org/pipermail/netfilter-devel/2003-September/0123
82.html

(Btw, check the netfilter-devel archives for this month for some
discussion about what patches you need for pptp conntrack.)

--=20
Philip Craig - philipc@snapgear.com - http://www.SnapGear.com SnapGear -
Custom Embedded Solutions and Security Appliances


