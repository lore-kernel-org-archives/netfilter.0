From: Athan <netfilter@miggy.org>
Subject: Re: DNS/Router/Firewall question...
Date: Thu, 13 Mar 2003 16:52:41 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030313165241.GO1025@miggy.org>
References: <5DE7560BBF09D6119ED100B0D03D8426013923@MAIL-SERVER>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hIO1AjEoFJ7b3ahE"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <5DE7560BBF09D6119ED100B0D03D8426013923@MAIL-SERVER>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Collins, Kevin" <KCollins@nesbittengineering.com>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>


--hIO1AjEoFJ7b3ahE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2003 at 10:36:34AM -0500, Collins, Kevin wrote:
> When I have the machine running as a router (i.e. ip forwarding enabled, =
no
> firewall rules in place) everything works fine.  When I start my firewall,
> DNS slows down to a crawl.  It works, but it works so slow that it feels
> like it's not.

  First guess is that whatever app is trying to 'do dns' is first trying
a DNS server that is NOT responding due to the firewall rules, and after
timeouts ends up trying one that DOES work.

  So, if it's a unix-like machine inside the network seeing the problem,
what's in the /etc/resolv.conf ?

  When a lookup is attempted from an internal machine with the firewall
up what does a 'tcpdump -ni <extif> port 53' show ?  You may want to run
a similar tcpdump on the appropriate internal interface too to see the
difference.

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--hIO1AjEoFJ7b3ahE
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj5wt1kACgkQzbc+I5XfxKePJwCeO1hLzhmNq4DZa1GT9usm6OTz
BvYAn2N5/1/sT2XiL5d9iNat2fxQ7Fkl
=4WFb
-----END PGP SIGNATURE-----

--hIO1AjEoFJ7b3ahE--

