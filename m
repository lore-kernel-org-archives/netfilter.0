From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: VPN through the firewall
Date: Thu, 3 Mar 2005 21:39:22 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F0199B0@pxtvjoexd01.pxt.primeexalia.com>
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
To: Marty Phee <mphee@jump-technologies.com>, netfilter@lists.netfilter.org
Cc: James Cameron <james.cameron@hp.com>

It's odd but for some reasons it only fails with Microsoft PPTP
implementation.  It seems to be too picky about something.
Unfortunately my c skills are rusty and I'm usually strapped for time
otherwise I would delve into it and try to help them out.

I'm inclined to include James Cameron in this (from the pptp and poptop
sites) as he seems to have a much better understanding of the protocol
than I do.  Maybe he can help out so we can try to implement the
functionality in the 2.6 kernel.

Gary=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Marty Phee
> Sent: Thursday, March 03, 2005 3:22 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: VPN through the firewall
>=20
>  > Gary W. Smith can speak to this much better than myself, but 2.6 +
>  > pptp/gre conntrack/nat is not a winning combo, AFAIK...
>=20
> That sucks.  Why exactly?  What causes problems.
>=20

