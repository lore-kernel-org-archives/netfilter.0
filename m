From: Athan <netfilter@miggy.org>
Subject: Re: ip_conntract_ftp on another port
Date: Sun, 5 Jan 2003 11:34:27 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030105113427.GH16581@miggy.org>
References: <61127EF4BF2E9C4C8DA4E358CFD4E52D7A41EB@olga.chs.chalmers.se>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GBDnBH7+ZvLx8QD4"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <61127EF4BF2E9C4C8DA4E358CFD4E52D7A41EB@olga.chs.chalmers.se>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Kim Leandersson <kim.leandersson@chs.chalmers.se>
Cc: Tommy McNeely <Tommy.McNeely@Sun.COM>, netfilter@lists.netfilter.org


--GBDnBH7+ZvLx8QD4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 05, 2003 at 12:00:26PM +0100, Kim Leandersson wrote:
> Try loading the ip_conntrack_ftp module with the option ports instead.
>=20
> ip_conntrack_ftp ports=3D6969 should do the trick for you!

   Yup, this should do the job.  You can do a similar thing with
ip_conntrack_irc and ip_nat_irc (has to both or it won't work, that
confused me for a while ;).

   This is one MAJOR reason to do these netfilter parts as modules, not
hard-compiled into the kernel, although I've not checked if you can pass
the options as boot-time instead.  Still, doing it modular means you can
always unload the module(s), change/add ports, and re-load without a
reboot.

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--GBDnBH7+ZvLx8QD4
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj4YGEMACgkQzbc+I5XfxKeByQCfXz36FLuC02z8J6LelLEs5E/g
hKMAn1oy/e0p8DE44tamcDYbr3GEbuAz
=zzob
-----END PGP SIGNATURE-----

--GBDnBH7+ZvLx8QD4--

