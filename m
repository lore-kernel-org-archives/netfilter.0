From: Athan <netfilter@miggy.org>
Subject: Re: patching iptables - how?
Date: Thu, 9 Jan 2003 01:24:20 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030109012420.GG21359@miggy.org>
References: <20030108221616.1503.qmail@web12706.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3xoW37o/FfUZJwQG"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030108221616.1503.qmail@web12706.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Mladen Meduric <mladen_meduric@yahoo.com>
Cc: netfilter@lists.netfilter.org


--3xoW37o/FfUZJwQG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 08, 2003 at 10:16:16PM +0000, Mladen Meduric wrote:
> Pretty new to linux/iptables (on SuSE8.0). I'm trying to patch from 1.2.5
> to 1.2.6a and then to 1.2.7a.

  It would probably be easier to just grab the tar ball of 1.2.7a:

	http://www.netfilter.org/downloads.html#1.2.7a

> Do have all patches. Tried "patch" command, but I seem can't figure it out
> properly. Would someone explain how to do this in couple of steps, please?
> Also, from reading other articles, after patching up or reinstalling
> iptables from scratch, is it necessary to recompile the kernel?

  Depends what features you're trying to make use of.  What's your
current kernel version (uname -r) ?

  The only thing I've personally found not working on 2.4.20 is ECN
mangle'ing for which you need this patch to the kernel:

	http://www.netfilter.org/documentation/pomlist/pom-pending.html#05_ECN-tcp=
checksum-littleendian-fix

HTH,

-Ath
-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--3xoW37o/FfUZJwQG
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEUEARECAAYFAj4cz0QACgkQzbc+I5XfxKfgWACdFsYjITzWAFnQxoTkJD6sodal
WFwAl2d7r93jSYys5Ev90/fKeGMWOAk=
=wAmk
-----END PGP SIGNATURE-----

--3xoW37o/FfUZJwQG--

