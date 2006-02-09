From: Stephen Beck <becks@marietta.edu>
Subject: Re: help with netmap.
Date: Thu, 9 Feb 2006 12:40:34 -0500 (EST)
Message-ID: <Pine.GSO.4.58.0602091233550.8009@mcnet.marietta.edu>
References: <Pine.GSO.4.58.0602080823470.26810@mcnet.marietta.edu>
	<1139407730.2969.13.camel@localhost>
	<Pine.GSO.4.58.0602080912470.26810@mcnet.marietta.edu>
	<Pine.LNX.4.64.0602091228560.3258@darkstar.sysinfo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.64.0602091228560.3258@darkstar.sysinfo.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "R. DuFresne" <dufresne@sysinfo.com>
Cc: "John A. Sullivan III" <jsullivan@opensourcedevel.com>, netfilter@lists.netfilter.org

i tried

ip addr add dev eth2  205.133.141.42
(eth2 is the outside interface )

now the router itself is responding to the pings rather that
forwarding them.

my test pings are being routed ( perhaps by static routes )
to the linux router, i can see them enter, be forwarded but
not natted, and passed to the outside interface?


On Thu, 9 Feb 2006, R. DuFresne wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On Wed, 8 Feb 2006, Stephen Beck wrote:
>
> > well at the moment mo FORWARD table blocks a few virus ports
> > and protects a few of my on campus servers. otherwise has a blanket
> > Accept at the bottom, so ime not perventing outside connections there.
> > but they dont seem to be working across the netmap. should netmap pervent
> > outside connections or have I broken it somehow.
> >
> >
>
>
> did you also do the "ip addr add" stuffs to the extenal nic for the public
> addresses?
>
>
> Thanks,
>
> Ron DuFresne
> - --
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          admin & senior security consultant:  sysinfo.com
>                          http://sysinfo.com
> Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629
>
> ...We waste time looking for the perfect lover
> instead of creating the perfect love.
>
>                  -Tom Robbins <Still Life With Woodpecker>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.4 (GNU/Linux)
>
> iD8DBQFD63w9st+vzJSwZikRAnZyAKCvM5AfOl13Y0+D52qFQQeew1//AACfc+rc
> H22i8dY0utPFR7Xe6SK/Rb4=
> =PxEn
> -----END PGP SIGNATURE-----
>

