From: Athan <netfilter@miggy.org>
Subject: Re: Spoofed ip's
Date: Tue, 11 Feb 2003 17:09:36 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030211170936.GC6194@miggy.org>
References: <1044948351.23287.11.camel@filth.sadomain.co.za>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1044948351.23287.11.camel@filth.sadomain.co.za>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: deff <deff@sadomain.co.za>
Cc: netfilter@lists.netfilter.org


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2003 at 09:25:50AM +0200, deff wrote:
> Could anyone please check the rules below and tell me if the the source=
=20
> ip'ss are valid. I'm seeing an incredible amount of these ip's
> attempting to get through .=20

  Check them using whois:

15:34:49 0$ whois 1.0.0.0

OrgName:    Internet Assigned Numbers Authority=20
OrgID:      IANA
Address:    4676 Admiralty Way, Suite 330
City:       Marina del Rey
StateProv:  CA
PostalCode: 90292-6695
Country:    US

NetRange:   1.0.0.0 - 1.255.255.255=20
CIDR:       1.0.0.0/8=20
NetName:    RESERVED-9
NetHandle:  NET-1-0-0-0-1
Parent:    =20
NetType:    IANA Reserved
Comment:   =20
RegDate:   =20
Updated:    2002-09-12

OrgTechHandle: IANA-ARIN
OrgTechName:   Internet Corporation for Assigned Names and Number=20
OrgTechPhone:  +1-310-823-9358
OrgTechEmail:  res-ip@iana.org

# ARIN WHOIS database, last updated 2003-02-10 20:00
# Enter ? for additional hints on searching ARIN's WHOIS database.

So, yes, that one shouldn't be getting used at all.

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj5JLlAACgkQzbc+I5XfxKfUgACfYH6D7ypkfnpU5MVc4YztuMQp
JT0An1aAu/QyZoSt45ZaX7sHiVY4Ajca
=2ujY
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--

