From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Re: Strange connection problems.
Date: Wed, 13 Apr 2005 15:00:41 +0200
Message-ID: <1403218a050413060068d2561d@mail.gmail.com>
References: <B39AA5DB06510C4591C6EDDD580B0B81B5315E@mail.int.sealevel.com>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <B39AA5DB06510C4591C6EDDD580B0B81B5315E@mail.int.sealevel.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: Ryan Belcher <Ryanb@sealevel.com>, netfilter <netfilter@lists.netfilter.org>

OK
But I have read in this list before that some ICMP types shouldn't be
blocked, or problems with the MTU may arise !!


On 4/13/05, Ryan Belcher <Ryanb@sealevel.com> wrote:
> Kind of depends on how you look at it.  If an ICMP Ping (as an example) g=
oes out of the network, the echo will make it back, but if an unrelated, or=
 unestablished ICMP is directed to the network from the outside, it will be=
 dropped.  I know this could be considered "bad form" in the right context,=
 but I'm not specifically worried about it.
>=20
> In any case, everything's working as I expect now.
>=20
> Thanks,
>=20
> Ryan
>=20
> -----Original Message-----
> From: Mohamed Eldesoky [mailto:eldesoky.lists@gmail.com]
> Sent: Wednesday, April 13, 2005 7:43 AM
> To: Ryan Belcher; netfilter
> Subject: Re: Strange connection problems.
>=20
> Are you blocking ICMP ??
>=20
> On 4/13/05, Ryan Belcher <Ryanb@sealevel.com> wrote:
> > Gentlemen,
> >
> > Thank you!  That cleared things up perfectly.  ppp0 had the MTU set for=
 1492; however, none of the other interfaces did (including eth1 which I fa=
iled to mention was actually the path to ppp0).  You are both gentlemen and=
 scholars.
> >
> > Thanks again!
> >
> > Ryan
> >
> > -----Original Message-----
> > From: Jason Opperisano [mailto:opie@817west.com]
> > Sent: Monday, April 11, 2005 6:04 PM
> > To: netfilter@lists.netfilter.org
> > Subject: Re: Strange connection problems.
> >
> > On Fri, Apr 08, 2005 at 05:14:09PM -0400, Ryan Belcher wrote:
> > > Hi All,
> > >
> > > Below I've posted my FW config.  It's handling 3 interfaces.  ppp0, e=
th0, an ath0.
> > > It's on Linux kernel version 2.6.10.
> > >
> > > Pretty much everything works as I expect except for a strange issue w=
ith certain websites while trying to connect from clients within my network=
.  For example, penny-arcade.com, americanexpress.com SSL logins, and a few=
 others.  If you want to poke at this configuration, penny-arcade will appe=
ar to begin connection but after the SYN, ACK, then HTTP GET sequence, the =
HTTP response never gets here (according to Ethereal anyways).  If I try co=
nnecting from the actual firewalling box itself, it works fine.
> > >
> > > Does anyone have any ideas?
> >
> > sounds like the classic description of an MTU issue.
> >
> > -j
> >
> > --
> > "Tom Tucker: This is Tom Tucker... Tucker's evil twin Todd Tucker
> >  out to destroy his brother's reputation. Now I'm going to go back insi=
de
> >  my motel room where I'm going to have freaky sex with my prostitute
> >  with whom I still have another 45 minutes."
> >         --Family Guy
> >
> >
>=20
> --
> Mohamed Eldesoky
> www.eldesoky.net
> RHCE
>=20


--=20
Mohamed Eldesoky
www.eldesoky.net
RHCE

