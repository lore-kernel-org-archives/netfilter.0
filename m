From: Athan <netfilter@miggy.org>
Subject: Re: problem configuring for NFS between RH8 and RH6
Date: Wed, 8 Jan 2003 22:06:04 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030108220604.GE21359@miggy.org>
References: <3E1C808F.9030202@TemporalArts.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0QFb0wBpEddLcDHQ"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3E1C808F.9030202@TemporalArts.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Randall J. Parr" <RParr@TemporalArts.COM>
Cc: Guarddog-user@lists.sourceforge.net, netfilter@lists.netfilter.org, psyche-list@redhat.com


--0QFb0wBpEddLcDHQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 08, 2003 at 11:48:31AM -0800, Randall J. Parr wrote:
> But then the log messages indicated RH8 -> RH6 port 887 was being=20
> dropped. Note that the dynamic port (in this example 887) changes every=
=20
> time I restarted RH6 NFS.

   Assuming this is the user-space NFS daemon, not the in-kernel one you
should be able to make use of the following option for the mountd:

       -P portnum or --port portnum
              Makes mountd listen on port portnum instead of some
              random  port. By default, mountd will listen on the
              mount/udp port specified in /etc/services,  or,  if
              that  is  undefined,  on some arbitrary port number
              below 1024.

Reading the above, if you put a line in /etc/services like:

mount             887/udp

Then it will *ALWAYS* use that port and you can simply open that up in
your firewall settings.

HTH,

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--0QFb0wBpEddLcDHQ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj4coMwACgkQzbc+I5XfxKfIFQCeMq57mnbsl4lB/KgAI/BYIn6t
pKcAn3OIgsrTmuBVsjlR+h3SR9N/FAkK
=3huJ
-----END PGP SIGNATURE-----

--0QFb0wBpEddLcDHQ--

