From: Tom Marshall <tommy@home.tig-grr.com>
Subject: Re: mangling a packet
Date: Tue, 20 Apr 2004 21:35:41 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040421043541.GB1312@home.tig-grr.com>
References: <46653.172.31.1.1.1081403125.squirrel@mail.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <46653.172.31.1.1.1081403125.squirrel@mail.local>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: shantanu sharma <ssharma_02@iiita.ac.in>
Cc: netfilter@lists.netfilter.org


--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2004 at 11:15:25AM +0530, shantanu sharma wrote:
> we are supposed to capture a dns packet at the firewall and mangle  it
> appropriately

This is a very tricky process.  I've done some work on DNS mangling myself,
but it is not complete.  I stopped working on it when Verisign stopped their
SiteFinder.  Would you be interested in comparing implementations and/or
merging efforts?

> please tell us how do we correct the checksum filed of UDP and IP after
> the reverse S NAT takes place or do we need to queue the packets using
> some other chain of someother table

I think this should be the least of your problems.  :-)  I would start by
looking near the end of ip_nat_mangle_udp_packet().

--=20
Nothing will dispel enthusiasm like a small admission fee.
        -- Kim Hubbard

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAkCF+h0ACgkQFMm9uvwPXW7nXwCfcLUSRjQUrLRrjgR3v6IRbM7c
97UAn1LvFx96Pr2CyqZ8ELIVo0MvicPN
=2JHP
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--

