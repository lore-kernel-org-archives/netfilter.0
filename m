From: Athan <netfilter@miggy.org>
Subject: Re: different DMZs which is better?
Date: Mon, 13 Jan 2003 20:28:44 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030113202844.GH22487@miggy.org>
References: <001e01c2bb10$05d79300$9865fea9@win2k.com> <001201c2bb38$25e45980$1e01a8c0@win2k.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UthUFkbMtH2ceUK2"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <001201c2bb38$25e45980$1e01a8c0@win2k.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Mike <mikeeo@msn.com>
Cc: netfilter@lists.netfilter.org


--UthUFkbMtH2ceUK2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2003 at 02:15:34PM -0500, Mike wrote:
> I talked with my ISP and they will route me a /30 for my firewall and a /=
28
> for the DMZ segment. The DMZ will be hosting a webfarm does anyone have a
> list of things I should to the box besides filtering rules? like how I can
> stop directed broadcasts etc... I am going to accept Established and New
> connections in the forward chain going to the webservers and drop invalid.
> Is that ok for webservers or should I also accept related? Im only going =
to
> open up port 80 to the webservers and drop everything else.

  Are the web servers going to be setup to do reverse DNS lookups on
their connections?  Usually best not to, as it can be quite a
performance hit for busy servers, but bear this in mind for access rules
if restricting any part of the webspace by client host, as you'll only
be able to do that on IP.
  If you are allowing such reverse lookups then obviously the DMZ needs
to be able to access at least one DNS server, probably the firewall box
acting as a forwarder, or just plain doing the lookups itself.

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--UthUFkbMtH2ceUK2
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj4jIXwACgkQzbc+I5XfxKfyRQCghRR4+o82a0AJF+Ghe2FtZlaA
DjsAn12ICdBnZG3PVHI90eGjIuDKbHTM
=z2vw
-----END PGP SIGNATURE-----

--UthUFkbMtH2ceUK2--

