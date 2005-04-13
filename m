From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Re: Strange connection problems.
Date: Wed, 13 Apr 2005 13:43:11 +0200
Message-ID: <1403218a05041304432cb75881@mail.gmail.com>
References: <B39AA5DB06510C4591C6EDDD580B0B81AA9C40@mail.int.sealevel.com>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <B39AA5DB06510C4591C6EDDD580B0B81AA9C40@mail.int.sealevel.com>
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

Are you blocking ICMP ??

On 4/13/05, Ryan Belcher <Ryanb@sealevel.com> wrote:
> Gentlemen,
>=20
> Thank you!  That cleared things up perfectly.  ppp0 had the MTU set for 1=
492; however, none of the other interfaces did (including eth1 which I fail=
ed to mention was actually the path to ppp0).  You are both gentlemen and s=
cholars.
>=20
> Thanks again!
>=20
> Ryan
>=20
> -----Original Message-----
> From: Jason Opperisano [mailto:opie@817west.com]
> Sent: Monday, April 11, 2005 6:04 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: Strange connection problems.
>=20
> On Fri, Apr 08, 2005 at 05:14:09PM -0400, Ryan Belcher wrote:
> > Hi All,
> >
> > Below I've posted my FW config.  It's handling 3 interfaces.  ppp0, eth=
0, an ath0.
> > It's on Linux kernel version 2.6.10.
> >
> > Pretty much everything works as I expect except for a strange issue wit=
h certain websites while trying to connect from clients within my network. =
 For example, penny-arcade.com, americanexpress.com SSL logins, and a few o=
thers.  If you want to poke at this configuration, penny-arcade will appear=
 to begin connection but after the SYN, ACK, then HTTP GET sequence, the HT=
TP response never gets here (according to Ethereal anyways).  If I try conn=
ecting from the actual firewalling box itself, it works fine.
> >
> > Does anyone have any ideas?
>=20
> sounds like the classic description of an MTU issue.
>=20
> -j
>=20
> --
> "Tom Tucker: This is Tom Tucker... Tucker's evil twin Todd Tucker
>  out to destroy his brother's reputation. Now I'm going to go back inside
>  my motel room where I'm going to have freaky sex with my prostitute
>  with whom I still have another 45 minutes."
>         --Family Guy
>=20
>=20


--=20
Mohamed Eldesoky
www.eldesoky.net
RHCE

