From: Athan <netfilter@miggy.org>
Subject: Re: Querry about contrack
Date: Thu, 30 Jan 2003 20:59:50 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030130205950.GT11221@miggy.org>
References: <3E39819F.3060501@actiswitch.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XFI+TFG+M3u0jUjZ"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3E39819F.3060501@actiswitch.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Dhirendra Pal Singh <list@actiswitch.com>
Cc: netfilter@lists.netfilter.org


--XFI+TFG+M3u0jUjZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2003 at 11:48:47AM -0800, Dhirendra Pal Singh wrote:
> Is it possible to find
>=20
> A) number of packets recived and send,
> B) no of connections existing
> on the basis of port no.  ???
>=20
> Does contrack keeps a track of it.. or something else...
> I think somwehere in /proc contrack keeps a list of the active=20
> connections.. but I need the info to analyse it in my piece of c code.

   A simple "cat /proc/net/ip_conntrack | wc -l" will tell you how many
connections are currently being tracked.  This does include possibly
failed connections as well though ([UNREPLIED]), so some use of grep or
perl on the output is probably a good idea.

   As for the packets received/sent, you'd have to either set up
accounting targets per port (ick), or simply LOG every such packet and
then count the matching lines in the syslog file(s).  Ugh.

  Maybe ULOG or similar can be of help with this.


-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--XFI+TFG+M3u0jUjZ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj45kkYACgkQzbc+I5XfxKfHGwCbBwkZQfEFpGu3uLcc4Yt69S99
bQsAn1kX0btiKNVLXH3myKaztkSXthIU
=a4uI
-----END PGP SIGNATURE-----

--XFI+TFG+M3u0jUjZ--

