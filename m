From: Athanasius <link@miggy.org>
Subject: NF_QUEUE: nfq_bind_pf() fails - solution
Date: Tue, 31 Aug 2010 21:15:30 +0100
Message-ID: <20100831201530.GE11893@miggy.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: netfilter@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

  In the hope that this will make it into Google and help others, and
maybe someone will clarify the Kconfig....

  I've just spent a gew hours trying to figure out why simple code
attempting to use Netfilter Queues has been failing to even do the nice
simple nfq_bind_pf(h, AF_INET).  I eventually spotted some /proc code
that lead me to find /proc/net/netfilter/nf_queue which contained:

 0 NONE
 1 NONE
 2 ip_queue
 3 NONE
 4 NONE
 5 NONE
 6 NONE
 7 NONE
 8 NONE
 9 NONE
10 NONE
11 NONE
12 NONE

And indeed '2' is AF_INET.  So, what's this ip_queue ?  It's an
implementation of the *OLD* ip_queue interface using the new
nfnetlink_queue interface.  But this being in place totally blocks
anything else from binding to AF_INET.

So, it's this kernel option:

config IP_NF_QUEUE
        tristate "IP Userspace queueing via NETLINK (OBSOLETE)"
        depends on NETFILTER_ADVANCED
        help
          Netfilter has the ability to queue packets to user space: the
          netlink device can be used to access them using this driver.

          This option enables the old IPv4-only "ip_queue" implementation
          which has been obsoleted by the new "nfnetlink_queue" code (see
          CONFIG_NETFILTER_NETLINK_QUEUE).

          To compile it as a module, choose M here.  If unsure, say N.

I feel this could be a little more explicit that "if you have this
active then nothing else will be able to use nfnetlink_queue instead".

Yes, now I'm wishing I compiled this stuff as modules so I could just
remove the bugger.

--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkx9YuIACgkQSEDmQuIYzh2xFACfbxdaVsL3L2aWixXL0w2kNN0n
zfYAn0DIZDEopsPkkVJWxUVRTXiGp6Jp
=s3bY
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
