From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Moving from ipset to nftables: Sets not ready for prime time yet?
Date: Wed, 8 Jul 2020 12:36:56 +0200
Message-ID: <20200708103656.GA22743@salvia>
References: <20200702231812.E43146C80D34@dd34104.kasserver.com>
 <alpine.DEB.2.21.2007030758180.6006@piplus.local.jubileegroup.co.uk>
 <a140ef1f-b238-3c8b-d8ec-3e266a893aea@thelounge.net>
 <874kqih2ca.fsf@goll.lan>
 <44067eef-0cfe-ac29-f3e6-463c20d8e38d@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <44067eef-0cfe-ac29-f3e6-463c20d8e38d@thelounge.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Reindl Harald <h.reindl@thelounge.net>
Cc: "Trent W. Buck" <trentbuck@gmail.com>, netfilter@vger.kernel.org

On Wed, Jul 08, 2020 at 12:16:18PM +0200, Reindl Harald wrote:
>=20
>=20
> Am 08.07.20 um 09:51 schrieb Trent W. Buck:
> > Reindl Harald <h.reindl@thelounge.net> writes:
> >=20
> >> Am 03.07.20 um 09:04 schrieb G.W. Haywood:
> >>> On Fri, 3 Jul 2020, Timo Sigurdsson wrote:
> >>>
> >>>> ... I use ipsets for blacklisting.
> >>>> =A0=A0=A0 I fetch blacklists from various sources
> >>>> ... This approach has worked for me for quite some time.
> >>>> ... some of my blacklists may contain the same addresses or ranges,
> >>>> =A0=A0=A0 I use ipsets' -exist switch when loading
> >>>> ... I don't think that the use case is that extraordinary ...
> >>>
> >>> +6
> >>>
> >>> FWIW I'll be following this thread very closely.
> >>
> >> it turned out at least with recent kernel and recent userland
> >> "iptables-nft" can fully replace "iptables" and continue to use "ipset"
> >> unchanged
> >=20
> > I tested this and you're right - it is working.  This surprised me!
> >=20
> > I saw these "commented out" rules in iptables-translate, where
> > I (wrongly) assumed that meant the rule was completely inactive.
>=20
> "iptables-translate" comments out much more than just upset related
> stuff, in my case xt_recent and connlimit rules are also just comments

If you could post what kind of rule examples are commented out, it
would help us keep this in the radar.

It is not too hard to add new translations, there is a _xlate()
function under iptables/extensions/libxt_*.c that provides the
translation. The important thing is to validate that the translation
is semantically equivalent, or if not possible, provide a close
translation.

Thanks.
