From: Igor Popov <igorpopov@newmail.ru>
Subject: module matches a set of source or destination ip addresses
Date: Tue, 12 Apr 2005 09:27:50 +0300
Message-ID: <200504120928.01319.igorpopov@newmail.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3265803.WM5NWzBaLo";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter <netfilter@lists.netfilter.org>

--nextPart3265803.WM5NWzBaLo
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

	Hi all,
It there iptables module(something like mport), but that matches a set of=20
source or destination ip addresses:
iptables -A ... -p ... -m megamatcher -s ip1,ip2,...-d ip1,ip2,... -j ...

=2D-=20
I have great faith in fools -- self confidence my friends call it.
		-- Edgar Allan Poe

--nextPart3265803.WM5NWzBaLo
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (FreeBSD)

iQEVAwUAQltqcIE3+5OFEFEBAQJaiggAhDC3Xsj9AM56HWT+ome4Y7W5HufM9Tq/
ZZ94Xx1J82a3X+WdFnsjX90X0mZxYO/k5cmnsCxMBlT88XwDavybJMNG/UuXpLge
RhMgjygcNN/4WIG8DX+zKfKJ1oEjyFSwSBQEHyOYK0mxAMWEB92Xs6CHde+QUtkP
CIya5h7xkqCTwSngNuDE5nzT8xp9ziKyRnYFZZg0ZUN58rLBNGU3AaGQOutF81nR
9J+wkLYWXP+Jm3F/1mg/NKbdXOY0qm9egPu5Y2HIVtrlsv65aw6Do08IpsGXR35R
EnMfuJ6Q1jpWSwhgf8cfZsIItGjs6PJ5rCsoVjteoKBzy6fLByhBIw==
=WsXE
-----END PGP SIGNATURE-----

--nextPart3265803.WM5NWzBaLo--

