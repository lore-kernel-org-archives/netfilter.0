From: "Carl Farrington" <carl@compsup.net>
Subject: RE: an annoying question
Date: Thu, 12 Feb 2004 00:33:46 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <739652C2AFA4834AAB5986A215F68CEC016586@svr1.home.compsup.net>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

If you've got patched netfilter code (possibly pptp_nat helpers with it =
being shorewall) it might be that you need to recompile the iptables =
userspace tools. I had to do this as I was getting : Invalid Argument.

> -----Original Message-----
> From: Richard Bown [mailto:richard.bown@blueyonder.co.uk]
> Sent: 12 February 2004 00:11
> To: Cedric Blancher
> Cc: netfilter@lists.netfilter.org
> Subject: Re: an annoying question
>=20
> On Wed, 2004-02-11 at 22:14, Cedric Blancher wrote:
> > Le mer 11/02/2004 =E0 22:53, Richard Bown a =E9crit :
> > > I suspect from the results I've seen running 2.6.2 with =
iptables-1.2.9
> > > that the handling of DNAT & SNAT is very different.
> >
> > Afaik, from a user point of vue, there's no difference between 2.4 =
and
> > 2.6. I'm using a 2.6.1 kernel on which all the scripts I've written =
for
> > 2.4 kernels are working just the way they did before, for filtering,
> > mangling and nating...
> >
> > What kind of results makes you believe there are major differences =
on
> > NAT handling ?
> >
> Hi Cedric
> I'm using MDK 9.2 and iptables-1.2.9-4mdk plus shorewall 1.4.8-3mdk =
with
> kernel 2.4.22-26mddk
>=20
>=20
> when trying to run with kernel -2.6.2 shorewall stopped after an =
iptable
> invalid argument o n a rule starting DNAT.
> That rule was hashed out and all rules loaded , until the masq section
> which again halted shorewall.
> I tried an iptables -F to flush out all rules and allow networking but
> no avail.
> I really would like to knoqw whats happening so I understand what to =
do.
>=20
> Richard
> > One big difference is bridge interfaces handling, as physical =
interfaces
> > cannot get matched using -i/-o switches anymore (br0 is seen through
> > them) so you have to use physdev match.
> --
> Richard Bown <richard.bown@blueyonder.co.uk>
>=20


