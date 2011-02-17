From: Italo Valcy <italo@dcc.ufba.br>
Subject: How to use DNAT
Date: Thu, 17 Feb 2011 15:47:08 -0300
Message-ID: <4D5D6D2C.7010109@dcc.ufba.br>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello Guys!

I'm in doubt about the correct use of DNAT, if I should use an alias
interface (like eth0:0) with the original target IP address or I should
use something to advertise the arp-reply for that IP (like farpd).

I'm asking this because when I tried to use the alias interface I've go=
t
*some* packages being processed by INPUT chain of the filter table...

Do you guys have any ideia?


Thank you so much for any help!

- --=20
Sauda=E7=F5es,

Italo Valcy :: http://wiki.dcc.ufba.br/~ItaloValcy
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk1dbSwACgkQfidLqjN6RNHb6wCeKUDzLjJiGKNVfM1H3W7EQxjA
V9wAnjaRmU/OLFQnGJ86N5vepct2TINz
=3Dfokt
-----END PGP SIGNATURE-----
