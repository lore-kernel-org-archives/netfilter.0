From: Athan <netfilter@miggy.org>
Subject: Re: NAT & Homepage Statistics
Date: Thu, 30 Jan 2003 19:36:33 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030130193633.GS11221@miggy.org>
References: <se391cd4.045@mail.bmb-bbm.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y5wfsVCgeKAcINk2"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <se391cd4.045@mail.bmb-bbm.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Mischa Gossen <mgossen@bmb-bbm.org>
Cc: netfilter@lists.netfilter.org


--Y5wfsVCgeKAcINk2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2003 at 12:38:35PM +0100, Mischa Gossen wrote:
> Recently I've installed a webserver behind my firewall. On my website I
> keep statistics where my visitors come from. This is based on the
> IPadrress they have.=20
> Ever since I run my webserver behind my firewall (which NAT's to the
> inside), all the users come from the IPaddress of my firewall. This way
> I don't have any statistics anymore :(

  What are the specific rule(s) you're using to do this?  I have some
DNAT rules to allow gnutella behind my firewall and the client sees the
original source IP fine.  I've doublechecked this with tcpdump on the
'inside' host, telnet to the port from outside does show up the IP of
the machine I telnet from.

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--Y5wfsVCgeKAcINk2
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj45fsEACgkQzbc+I5XfxKcoJwCdEP8TTylmkDWtq1OxTmwHNpZw
AqwAn1bekiLVrYPS5sD7ejhuiqGlNLI6
=2Iq6
-----END PGP SIGNATURE-----

--Y5wfsVCgeKAcINk2--

