From: "Carl Farrington" <carl@compsup.net>
Subject: RE: PPTP connection tracking and Poptop on same box
Date: Mon, 19 Jan 2004 16:23:28 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <739652C2AFA4834AAB5986A215F68CEC01652F@svr1.home.compsup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org



> -----Original Message-----
> From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
> Sent: 19 January 2004 00:04
> To: netfilter@lists.netfilter.org
> Subject: Re: PPTP connection tracking and Poptop on same box
>=20
> On Sunday 18 January 2004 11:47 pm, Carl Farrington wrote:
>=20
> > From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
> >
> > > On Sunday 18 January 2004 11:00 pm, Carl Farrington wrote:
> > > > Does anybody know if there is a workaround for this problem? As
soon
> > > > as I insmod ip_nat_pptp , poptop cannot accept any incoming pptp
> > > > connections.
> >
> > > Why do you want to use both of these on the same box?
>=20
> > Well, I want to do both. I am putting together a router/gateway box.
It
> > performs NAT for all the workstations on the private side of the box
> > (hence the need for ip_nat_pptp since some workstations need to
contact
> > outside pptp servers), and also allows access from the outside when
> > users are roaming (hence the need for poptop).
> >
> > Astaro Security Linux (www.astaro.com) is one product which achieves
> > this without problem using poptop, as is win2k rras.
>=20
> In that case your simplest solution might be to ask Astaro how they've
> done
> it.   Their products are based on Linux / netfilter etc, so should be
> fully
> GPL.
>=20
> Antony
>=20

It seems this might prove more difficult than one would hope. Source
code is not available from Astaro - they instead claim that any source
code would simply be direct copies from ftp.gnu.org, and that they
release all their patches back to project maintainers. Hmmmm.

Excuse the long url (I felt a http://tinyurl thing might appear
untrustworthy, but here's some talk on it:

http://www.astaro.org/showflat.php?Cat=3D&Board=3DUBB2&Number=3D26110&For=
um=3DAl
l_Forums&Words=3DGPL&Match=3DEntire%20Phrase&Searchpage=3D0&Limit=3D25&Ol=
d=3D1year
&Main=3D3557&Search=3Dtrue#Post26110

Carl

