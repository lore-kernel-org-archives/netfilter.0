From: Francois Chenais <Francois.Chenais@citb.bull.net>
Subject: CVS built
Date: Thu, 30 May 2002 14:35:49 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020530143549.56bd6a63.Francois.Chenais@citb.bull.net>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 boundary="=.2BQffCguHbL1DM"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org

--=.2BQffCguHbL1DM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,=20

  I'm newbie in netfilter hacking and I have to filter my packet
  with an external application. I think that I have to look around
  ip_queue.

  I just have checkouted the cvs netfilter/usernamespace=20
	  		     and netfilter/testsuite

  but I have an error building the libipq.

  The error says

Francois : make
Making dependencies: please wait...
Something wrong... deleting dependencies.
make: *** [/usr/src/linux/include/linux/netfilter_ipv4/ipt_dcsp.h] Error 1


  I have a linux 2.4.17 kernel & src on a woody debian Linux box.


  Any idea ?

  Thank in advance.

		Fran=E7ois
--=.2BQffCguHbL1DM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)

iD8DBQE89hyocMXw4CWlEFsRAqtiAJ9XLQ7DbrPh67mFo1CjelZ0Jm3dggCgrTFw
ynGYy2VuuTyiNcLxfXVd2cU=
=+1Ad
-----END PGP SIGNATURE-----

--=.2BQffCguHbL1DM--


