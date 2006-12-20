From: Alan Ezust <alan.ezust@presinet.com>
Subject: Re: Patch for h323 conntack for certain kernels
Date: Wed, 20 Dec 2006 12:57:58 -0800
Message-ID: <200612201258.02920.alan.ezust@presinet.com>
References: <59064.195.55.244.106.1164885677.squirrel@www.arcoscom.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart22015754.8VNEDWWrqL";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <59064.195.55.244.106.1164885677.squirrel@www.arcoscom.com>
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
To: netfilter@lists.netfilter.org, linux@arcoscom.com

--nextPart22015754.8VNEDWWrqL
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

I just patched 2.6.16.29 with the h323 patchlets from a version of patchoma=
tic=20
in the archives. lsmod shows me that these modules are properly loaded.

ip_nat_sip              3936  0
ip_conntrack_sip        6960  1 ip_nat_sip
ip_nat_h323             2368  0
ip_conntrack_h323      70080  1 ip_nat_h323

Then I added a couple of matches
iptables -t promisc -I PROMISC -m layer7 --l7proto "bittorrent"=20
iptables -t promisc -I PROMISC -m layer7 --l7proto "h323"
iptables -t promisc -I PROMISC -m layer7 --l7proto "sip"

I expected after making some phonecalls and running a bittorrent client, I'=
d=20
see some packets and bytes listed when I did iptables -L -t promisc -nv

 pkts bytes target     prot opt in     out     source              =20
destination
    0     0            0    --  *      *       0.0.0.0/0            0.0.0.0=
/0          =20
LAYER7 l7proto bittorrent
    0     0            0    --  *      *       0.0.0.0/0            0.0.0.0=
/0          =20
LAYER7 l7proto sip
    0     0            0    --  *      *       0.0.0.0/0            0.0.0.0=
/0          =20
LAYER7 l7proto h323


But it seems that none of these matches are getting detected...
Has anyone succeeded in getting the h323 match working?=20

I'd like to try to debug it, but I think what I would be very useful for=20
debugging is some sort of formal protocol specification that describes how=
=20
the H323 protocol is suppoed to look. Does such a thing exist in the public=
=20
domain?=20


On Thursday 30 November 2006 03:21, ArcosCom Linux User wrote:
> Hi, I'm trying to patch kernel 2.6.16.34 with h323 conntrack patches, but
> I don't found it in pom-ng.
>
> I'm thinking in take it from 2.6.19 kernel (the *h323* files and take a
> view in Kconfigs and Makefiles files).
>
> I know from 2.6.17 series, h323 where into kernel and they patched
> sometimes h323 sources.
>
> Could anybody say me if copying the files into 2.6.16.34 sources and
> modifiying Kconfig and Makefile files it will work?
>
> Thanks

=2D-=20
Alan Ezust            www.presinet.com
Presinet, inc         alan.ezust@presinet.com
           Victoria, BC, Canada

--nextPart22015754.8VNEDWWrqL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQBFiaPasJbtw6GURksRAn1nAJ9Yf8rYKquDrRMZgR275O29OZrtGwCfRk9v
b8nAtkAUiI+0zJ6wkWS4hMc=
=WhLZ
-----END PGP SIGNATURE-----

--nextPart22015754.8VNEDWWrqL--

