From: Stefanos Harhalakis <v13@it.teithe.gr>
Subject: nat/conntrack module names
Date: Wed, 3 Sep 2003 23:54:55 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309032354.56137.v13@it.teithe.gr>
Mime-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_gUlV/ncaE0Yn5IX";
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--Boundary-02=_gUlV/ncaE0Yn5IX
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Description: signed data
Content-Disposition: inline

 In short....

I believe that the modules named ip_nat_* (like ip_nat_ftp) should be named=
=20
ip_conntrack_* (ip_conntrack_ftp). "nat" is not correct because they are us=
ed=20
in cases where nat is not performed.=20

=46or example, firewalls that want to allow ftp sessions will load the=20
ip_nat_ftp module no matter if they are doing nat or not... Since this has =
to=20
do with connection tracking their name should contain 'conntrack' instead o=
f=20
'nat'.

Sorry if this is a known issue...

TIA

<<V13>>

p.s. Please CC any reply to me too since I'm not subscribed to the list...

--Boundary-02=_gUlV/ncaE0Yn5IX
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)

iD8DBQA/VlUgNXYAc2rSkzURAlJ+AKC1KDKs0QSqsA3d4W8HlWBb1FLTCwCgp73k
gfoY+7nhnpgwK+RtnJnVCkc=
=bSPM
-----END PGP SIGNATURE-----

--Boundary-02=_gUlV/ncaE0Yn5IX--

