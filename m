From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: 2 NICs on same subnet
Date: Fri, 5 Nov 2004 15:22:19 +0100
Message-ID: <20041105142219.GB12563@zion.homelinux.com>
References: <20041105123843.GB11016@zion.homelinux.com>
	<20041105124107.GE9379@torres.ka0.zugschlus.de>
	<20041105125421.GA12058@zion.homelinux.com>
	<20041105130424.GF9379@torres.ka0.zugschlus.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041105130424.GF9379@torres.ka0.zugschlus.de>
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


--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline


Hi Marc,

On Fri, Nov 05, 2004 at 02:04:24PM +0100, Marc Haber told us:
> What you intend to do does not make sense.
>
> This surely is meant to be a solution to some unmentioned problem. By
> asking about the problem, I am just trying to give a solution.

well, I know that it doesn't make much sense. This setup was made to
"balance" the traffic coming in to the machine. I know that there's
not much  difference between one NIC running at, say 400 Mbps, or
two NICs running at 200 Mbps each which will also be 400 Mbps, because
the machine can't handle more traffic (data (backups) is received via
network from other machines and written to disks)...but as I've already
written, this wasn't my decision...


Sven


>
> Greetings
> Marc
>

--
Linux zion 2.6.9-rc1-mm4 #1 Tue Sep 7 12:57:19 CEST 2004 i686 athlon i386 GNU/Linux
 14:21:46 up 1 day, 17:49,  1 user,  load average: 0.02, 0.01, 0.00

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQFBi4ybo4FAdB2PneQRAh/iAJ4wWCETZ4+VDcitOyeOsC+zZlZ0YACeOfil
HH01VASUoX1l7sFSRecg0rc=
=stj0
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--

