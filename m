From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: VPN through the firewall
Date: Thu, 3 Mar 2005 21:47:14 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F0199B1@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message
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
To: "Gary W. Smith" <gary@primeexalia.com>, Marty Phee <mphee@jump-technologies.com>, netfilter@lists.netfilter.org
Cc: James Cameron <james.cameron@hp.com>


Here is some additional details regarding the problem:

https://bugzilla.netfilter.org/bugzilla/show_bug.cgi?id=3D275

https://bugzilla.netfilter.org/bugzilla/show_bug.cgi?id=3D302

My problem is though RHEL3 is based on 2.4 its network is based on 2.6
which screws things up.  RHEL4 is based on 2.6 but it doesn't work there
either.  The 2.4.29 works but it kills all of the RHEL3 applications
because of an incompatibility with glibc.

If you have an older kernel that you can go back to or if you can use
the vanilla kernel under 2.4.29 then you can get it to work.  Otherwise
we will have to await the changes from the Netfilter team.  Phil and
Harold have been a big help in getting to the cause (and getting me some
additional experience in compiling kernels).

Gary=20

> -----Original Message-----
> From: Gary W. Smith
> Sent: Thursday, March 03, 2005 9:39 PM
> To: 'Marty Phee'; 'netfilter@lists.netfilter.org'
> Cc: 'James Cameron'; 'opie@817west.com'
> Subject: RE: VPN through the firewall
>=20
> It's odd but for some reasons it only fails with Microsoft PPTP
> implementation.  It seems to be too picky about something.
Unfortunately
> my c skills are rusty and I'm usually strapped for time otherwise I
would
> delve into it and try to help them out.
>=20
> I'm inclined to include James Cameron in this (from the pptp and
poptop
> sites) as he seems to have a much better understanding of the protocol
> than I do.  Maybe he can help out so we can try to implement the
> functionality in the 2.6 kernel.
>=20
> Gary
>=20
> > -----Original Message-----
> > From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> > bounces@lists.netfilter.org] On Behalf Of Marty Phee
> > Sent: Thursday, March 03, 2005 3:22 PM
> > To: netfilter@lists.netfilter.org
> > Subject: Re: VPN through the firewall
> >
> >  > Gary W. Smith can speak to this much better than myself, but 2.6
+
> >  > pptp/gre conntrack/nat is not a winning combo, AFAIK...
> >
> > That sucks.  Why exactly?  What causes problems.
> >

