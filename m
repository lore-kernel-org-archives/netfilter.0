From: Alan Ezust <alan.ezust@presinet.com>
Subject: bugzilla.netfilter.org problems
Date: Mon, 6 Nov 2006 09:44:57 -0800
Message-ID: <200611060945.03023.alan.ezust@presinet.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1863397.1clDoFFbYT";
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
To: netfilter@lists.netfilter.org

--nextPart1863397.1clDoFFbYT
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Every time I try to login to bugzilla, I get error messages from DBI

https://bugzilla.netfilter.org/bugzilla/query.cgi?GoAheadAndLogIn=3D1

DBI connect('host=3Dlocalhost;database=3Dbugs;port=3D3306','bugs',...) fail=
ed: Can't=20
connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock'=
=20
(111) at /usr/lib/perl5/vendor_perl/5.8.7/powerpc64-linux/DBI.pm line 628
	DBI::__ANON__('undef', 'undef') called=20
at /usr/lib/perl5/vendor_perl/5.8.7/powerpc64-linux/DBI.pm line 681
=09
DBI::connect('DBI', 'DBI:mysql:host=3Dlocalhost;database=3Dbugs;port=3D3306=
', '', '', 'HASH(0x10b103d0)')=20
called at Bugzilla/DB.pm line 149
	Bugzilla::DB::_connect('DBI:mysql:host=3Dlocalhost;database=3Dbugs;port=3D=
3306')=20
called at Bugzilla/DB.pm line 141
	Bugzilla::DB::connect_main() called at Bugzilla.pm line 143
	Bugzilla::dbh('Bugzilla') called at Bugzilla/Auth/CGI.pm line 156
	Bugzilla::Auth::CGI::login('Bugzilla::Auth::CGI', 2) called at Bugzilla.pm=
=20
line 74
	Bugzilla::login('Bugzilla', 2) called=20
at /var/www/bugzilla.netfilter.org/htdocs/bugzilla/query.cgi line 61
 at Bugzilla/DB.pm line 149
=09

I already contacted the webmaster but got no reply.


--nextPart1863397.1clDoFFbYT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQBFT3SesJbtw6GURksRAlYXAJ9voCSbbTIekubHc2ngC3NQ+IdkxACfem4E
mNo8As2j57bUJxBZiJlelg0=
=1Jm3
-----END PGP SIGNATURE-----

--nextPart1863397.1clDoFFbYT--

