From: Alan Ezust <alan.ezust@presinet.com>
Subject: Re: Patch for h323 conntack for certain kernels
Date: Wed, 20 Dec 2006 13:17:09 -0800
Message-ID: <200612201317.13361.alan.ezust@presinet.com>
References: <59064.195.55.244.106.1164885677.squirrel@www.arcoscom.com>
	<200612201258.02920.alan.ezust@presinet.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2011525.DJAbdnXjAx";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200612201258.02920.alan.ezust@presinet.com>
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
To: netfilter@lists.netfilter.org

--nextPart2011525.DJAbdnXjAx
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Just to follow-up: the bittorrent match seems to work fine, just the h323=20
doesn't. I was using that for testing, just to make sure that l7filters is=
=20
installed properly.

I added a SIP match just in case this phone speaks SIP language, but I don'=
t=20
think I need it.

On Wednesday 20 December 2006 12:57, Alan Ezust wrote:
> I just patched 2.6.16.29 with the h323 patchlets from a version of
> patchomatic in the archives. lsmod shows me that these modules are proper=
ly
> loaded.
>
> ip_nat_sip              3936  0
> ip_conntrack_sip        6960  1 ip_nat_sip
> ip_nat_h323             2368  0
> ip_conntrack_h323      70080  1 ip_nat_h323
>
> Then I added a couple of matches
> iptables -t promisc -I PROMISC -m layer7 --l7proto "bittorrent"
> iptables -t promisc -I PROMISC -m layer7 --l7proto "h323"
> iptables -t promisc -I PROMISC -m layer7 --l7proto "sip"
>
> I expected after making some phonecalls and running a bittorrent client,
> I'd see some packets and bytes listed when I did iptables -L -t promisc -=
nv
>
>  pkts bytes target     prot opt in     out     source
> destination
>     0     0            0    --  *      *       0.0.0.0/0          =20
> 0.0.0.0/0 LAYER7 l7proto bittorrent
>     0     0            0    --  *      *       0.0.0.0/0          =20
> 0.0.0.0/0 LAYER7 l7proto sip
>     0     0            0    --  *      *       0.0.0.0/0          =20
> 0.0.0.0/0 LAYER7 l7proto h323
>
>
> But it seems that none of these matches are getting detected...
> Has anyone succeeded in getting the h323 match working?
>
> I'd like to try to debug it, but I think what I would be very useful for
> debugging is some sort of formal protocol specification that describes how
> the H323 protocol is suppoed to look. Does such a thing exist in the publ=
ic
> domain?
>
> On Thursday 30 November 2006 03:21, ArcosCom Linux User wrote:
> > Hi, I'm trying to patch kernel 2.6.16.34 with h323 conntrack patches, b=
ut
> > I don't found it in pom-ng.
> >
> > I'm thinking in take it from 2.6.19 kernel (the *h323* files and take a
> > view in Kconfigs and Makefiles files).
> >
> > I know from 2.6.17 series, h323 where into kernel and they patched
> > sometimes h323 sources.
> >
> > Could anybody say me if copying the files into 2.6.16.34 sources and
> > modifiying Kconfig and Makefile files it will work?
> >
> > Thanks

=2D-=20
Alan Ezust            www.presinet.com
Presinet, inc         alan.ezust@presinet.com
           Victoria, BC, Canada

--nextPart2011525.DJAbdnXjAx
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFiahZsJbtw6GURksRAnn9AJ9Sg6T05xGTdqW3MhcweSKcTHkPOACggeY3
0OuDtdF6enILxxSqsBkJf6s=
=JIa9
-----END PGP SIGNATURE-----

--nextPart2011525.DJAbdnXjAx--

