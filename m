From: "William L. Childers" <childew@cox.net>
Subject: SNAT rule
Date: 22 Oct 2002 07:36:50 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1035290210.2921.4.camel@develop.wlc.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-J2dfzFf+L0SpC6ovuK7T"
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


--=-J2dfzFf+L0SpC6ovuK7T
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

All,

	Now that I have made myself look like a fool, by sending the wrong
rules.  Please excuse my other email. =20

        I have a network with 4 computers behind the firewall.  Three of
these
are workstations.  The firewall works fine for these.  Here is the fun
part. =20

One of the computers is a server with the Windows 2000 Operating System
installed.  It is running IIS, and a mail server.  The SMTP portion of
IIS is configured to send email out on port 1125.  I have DNAT working
for the WEB server and SMTP.  There is, however, an issue with one of
the applications that is running on the web server.  It will not send
email out on port 1125.  The rule that I am trying to get to work is:

## Outgoing from IIS Web Server
$IPTABLES -t nat -A POSTROUTING -p tcp -o $EXTERNALIF -j SNAT --to
$MYADDR:1125


$INTERNALIF is the Private Interface
$MYADDR is the Public IP Address

192.168.0.4 is the Private IP of the IIS Server=20

Thank you in advance for any assistance that you may be able to provide.

Bill



--=-J2dfzFf+L0SpC6ovuK7T
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA9tUZiieQ+LKG9MTARAvAAAJ9jA5gfUoIpRD2i4fpLsNFUVSRWZACeNvrA
nY5VkyMYA21pZH3wo7taGbU=
=Z12c
-----END PGP SIGNATURE-----

--=-J2dfzFf+L0SpC6ovuK7T--


