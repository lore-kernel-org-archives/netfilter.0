From: Tom Marshall <tommy@home.tig-grr.com>
Subject: Re: How iptables know when an UDP connection is closed ?
Date: Wed, 31 Dec 2003 16:19:39 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040101001939.GA27749@home.tig-grr.com>
References: <1072463937.3743.6.camel@gamux> <200312262141.hBQLfSTS011481@server5.bandwidthco.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200312262141.hBQLfSTS011481@server5.bandwidthco.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Mark E. Donaldson" <markee@bandwidthco.com>
Cc: 'Eddahbi Karim' <installation_fault_association@yahoo.fr>, netfilter@lists.netfilter.org


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Some protocols do know when packets should no longer be sent on associated
"connections".  Take RTSP or SIP for example -- a UDP connection is created
and destroyed via the control channel.  The conntrack helper could remove
the UDP connection when the appropriate message is seen (TEARDOWN or BYE).=
=20
Is there a way to do this?

On Fri, Dec 26, 2003 at 01:41:29PM -0800, Mark E. Donaldson wrote:
> Netfilter/IPTables works at layers three & four of the OSI model - not at
> layer seven.  So, if I understand your question correctly, the answer wou=
ld
> be NO, because it knows nothing about what is happening above layer four.
> However, if you have an application that is programmed to always use the
> same use the same source & destination ports for it's socket channels, th=
en
> this could be defined as such within an iptables rule as an application an
> handled accordingly. It would not be able to distinguish them from similar
> crafted packets though.  Having said that, the "limit match is available =
to
> handle packet "flooding" as you describe it here. Basically, you have
> entered the realm of what an IDS/IPS, such as Snort, do best.  A Snort
> preprocessor could well handle this activity.
>=20
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Eddahbi Karim
> Sent: Friday, December 26, 2003 10:39 AM
> To: netfilter@lists.netfilter.org
> Subject: RE: How iptables know when an UDP connection is closed ?
>=20
> Le jeu 25/12/2003 =E0 20:27, Mark E. Donaldson a =E9crit :
> > Correct.  The UDP state machine is based on "timers".=20
>=20
> Ok, so I've another question.
> Can Iptables make a difference between packets of the real application an=
d a
> packet generator ?
>=20
> For example :
>=20
> X communicates with Y with the application Mooh-1.0 which sends UDP packe=
ts
> via the port 789 and receives packets from the port 987.
>=20
> Then Z sends UDP packets to X with a packet generator. The UDP packets
> sended have the same dport and sport.
>=20
> Can Iptables make a difference between "Mooh-1.0" and the packet generator
> to avoid flood ?
>=20
> --
> --
> Eddahbi Karim
>=20
> Phone :
> (33) (0)6 61 30 57 77
>=20
> France
>=20
>=20
>=20

--=20
There are three principal ways to lose money: wine, women, and engineers.
While the first two are more pleasant, the third is by far the more certain.
        -- Baron Rothschild, ca. 1800

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj/zZ5sACgkQFMm9uvwPXW5X+gCePcYgSGUkn/Q4d8R9RBfX+DAz
L4gAnifqUQM7W1fwyGf6XQRPrVOyqycS
=NZwp
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--

