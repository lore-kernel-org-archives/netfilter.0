From: Athan <netfilter@miggy.org>
Subject: Re: Logging
Date: Thu, 16 Jan 2003 19:20:56 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030116192056.GP22487@miggy.org>
References: <20030114182310.GA23089@cablespeed.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4IFtMBbmeqbTM/ox"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030114182310.GA23089@cablespeed.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Subba Rao <subba9@cablespeed.com>
Cc: Netfilter/Iptables Users <netfilter@lists.netfilter.org>


--4IFtMBbmeqbTM/ox
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2003 at 01:23:10PM -0500, Subba Rao wrote:
> --------------------
> iptables -A INPUT -i $EXTERNAL_IF -p tcp --destination-port 25 -j LOG \
>                 --log-level 4 --log-prefix "Incoming Mail Traffic "
> iptables -A INPUT -i $EXTERNAL_IF -p tcp --destination-port 25 -j ACCEPT
> --------------------
>=20
> The default policy is on the INPUT chain is to drop the packets.  How do =
I capture
> what is being dropped?

  iptables -A INPUT -i $EXTERNAL_IF -j LOG --log-level 4 \
  	--log-prefix "Dropped Incoming "

Remember a LOG target simply LOGs then returns, so it'll still drop
through to the policy after this.

> My goal is to log the inbound traffic and my syslog has the following
> configuration:
>=20
> --------------------
> *.=3Dinfo;*.=3Dnotice;mail.none                     /usr/adm/messages
> *.=3Dalert                                        /usr/adm/messages
> *.=3Dcrit                                         /usr/adm/debug
> mail.*                                          /var/log/mail-log
> kern.*                                          /var/log/messages

   All iptables -j LOG goes to kern.*, so you should see it in your
/var/log/messages.  You could also use --log-level 7 (DEBUG) instead
and:

kern.=3Ddebug			/var/log/iptables

Note you _CAN_ also do --log-level debug to make things clearer.

HTH,

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--4IFtMBbmeqbTM/ox
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj4nBhgACgkQzbc+I5XfxKc2QQCcDA0s3HaOaIzH/gVtTBv1mAYv
YK8AoJdwdtsle8uoPhc7V9Se0c4o34Jf
=4t9H
-----END PGP SIGNATURE-----

--4IFtMBbmeqbTM/ox--

