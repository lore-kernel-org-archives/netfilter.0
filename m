From: Athan <netfilter@miggy.org>
Subject: Re: [Q]: Filtering based on reverse DNS
Date: Sat, 12 Apr 2003 08:51:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030412075101.GA32561@miggy.org>
References: <NCBBIBNHAKHDGJGMPLPJCEKBKPAA.netfilter@codeworks.gen.nz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <NCBBIBNHAKHDGJGMPLPJCEKBKPAA.netfilter@codeworks.gen.nz>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Wayne McDougall <netfilter@codeworks.gen.nz>
Cc: netfilter@lists.netfilter.org


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2003 at 07:24:42PM +1200, Wayne McDougall wrote:
> What I want to achieve is to filter based on a reverse name lookup on a s=
ource (and ideally destination) IP on initiating a connection.

  Doing this dynamically is going to get very hairy very quickly IMO.

  An alternative is to go via the whois info on the IP block an IP is
in.  A quick check on your own IP includes info about the APNIC
(Asia/Pacific NIC) registry at http://www.apnic.net/db/, looking a
little further on that page reveals:

	http://ftp.apnic.net/stats/apnic/

The latest file from there is:

	http://ftp.apnic.net/stats/apnic/apnic-2003-04-01

and the fields are explained at:

	ftp://ftp.apnic.net/pub/apnic/stats/apnic/_README-apnic-stats.txt

It should be possible to use this information to create a list of IP
blocks in CIDR notation that are assigned to NZ, and from that generate
a list of rules for firewalling/traffic shaping.
  Of course when dealing with a great number of rules like this you
should take the advice someone else offered which is to aggregate the
blocks into chunks, with top-level rules distinguishing between the
chunks jumping to chains that deal with smaller sub-chunks and so on
down to chains containing a few actual IP blocks.  This way you minimise
the number of rules traversed for any given block.

HTH,

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--huq684BweRXVnRxX
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj6XxWUACgkQIr2uvLNOS8OQgACfaVM2wDJlxpy0SUWQDX+FPYTJ
rZMAnRva7qyUpeRLgVA0ZNeVL7QJ02i+
=AayP
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--

