From: Athan <netfilter@miggy.org>
Subject: Re: sniffing the forwarded packets
Date: Mon, 10 Mar 2003 22:49:43 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030310224943.GK1025@miggy.org>
References: <ABEKJILKOKKGGDJKHKDFMECCCAAA.patrick@vikus.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5VuzLDXibKSJvVYD"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <ABEKJILKOKKGGDJKHKDFMECCCAAA.patrick@vikus.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Patrick Ahler <patrick@vikus.com>
Cc: netfilter EMAIL <netfilter@lists.netfilter.org>


--5VuzLDXibKSJvVYD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2003 at 04:05:28PM -0500, Patrick Ahler wrote:
> What can I use to view the packets passing through my router/firewall? I'=
ve
> tried tethereal but that only seems to be able to capture on the specific
> devices (eth1 or eth2) not the packets being forwarded, can anyone help?

  Unfortunately that's just how it works.  Any packet sniffer attaches
to a device and only sees the packets that go through that specific
device.

  The best you can do is run multiple sniffers, one per interface.
*Possibly* you might be able to use tcpdump for this and then write
something to interleave the packets from the timestamps.

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--5VuzLDXibKSJvVYD
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj5tFocACgkQzbc+I5XfxKc0NwCgmReMrrIdqUosyNJS0RtG/1Lq
ZIEAnRvCyMtXxEILitqDy6/97EWYiYaE
=MTqh
-----END PGP SIGNATURE-----

--5VuzLDXibKSJvVYD--

