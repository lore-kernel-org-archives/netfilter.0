From: imacat <imacat@mail.imacat.idv.tw>
Subject: SVN Down Again
Date: Sun, 10 Apr 2005 16:40:13 +0800
Message-ID: <20050410164004.11B0.IMACAT@mail.imacat.idv.tw>
Mime-Version: 1.0
Content-Type: multipart/signed;
	boundary="===[PGP/MIME_RFC2015]===4258E664.06D3===";
	protocol="application/pgp-signature"; micalg="pgp-sha1"
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
To: netfilter@lists.netfilter.org

--===[PGP/MIME_RFC2015]===4258E664.06D3===
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

SVN seems to be down again

imacat@rinse ~ % svn co http://svn.netfilter.org/netfilter/trunk/patch-o-matic-ng
svn: PROPFIND request failed on '/netfilter/trunk/patch-o-matic-ng'
svn:
Could not open the requested SVN filesystem

imacat@rinse ~ %


http://svn.netfilter.org/ ->
http://svn.netfilter.org/cgi-bin/viewcvs.cgi/trunk

ViewCVS Exception

An Exception Has Occurred
Python Traceback

Traceback (most recent call last):
  File "/var/www/localhost/viewcvs/lib/viewcvs.py", line 3194, in main
    request.run_viewcvs()
  File "/var/www/localhost/viewcvs/lib/viewcvs.py", line 264, in run_viewcvs
    self.rootpath, rev)
  File "/var/www/localhost/viewcvs/lib/vclib/svn/__init__.py", line 322, in __init__
    self.repos = repos.svn_repos_open(rootpath, self.pool)
SubversionException: ("Berkeley DB error while opening 'uuids' table for
filesystem /data/svn/netfilter.org/netfilter/db:\nCannot allocate memory",
160029)

--

Best regards,
imacat ^_*' <imacat@mail.imacat.idv.tw>
PGP Key: http://www.imacat.idv.tw/me/pgpkey.txt

<<Woman's Voice>> News: http://www.wov.idv.tw/
Tavern IMACAT's: http://www.imacat.idv.tw/
TLUG List Manager: http://www.linux.org.tw/mailman/listinfo/tlug

--===[PGP/MIME_RFC2015]===4258E664.06D3===
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (MingW32)

iEYEABECAAYFAkJY5mMACgkQi9gubzC5S1zc0QCeIq5MS8OO6efN3nCyc2fDlMal
vTEAn2bZs0x6QBLQhmYvoy18023rWviC
=8ciR
-----END PGP SIGNATURE-----
--===[PGP/MIME_RFC2015]===4258E664.06D3===--


