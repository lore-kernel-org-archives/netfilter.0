From: Athan <netfilter@miggy.org>
Subject: Re: Dynamic Deny rule
Date: Sat, 4 Jan 2003 21:46:07 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030104214607.GD16581@miggy.org>
References: <000101c2b405$a39f7dd0$0501a8c0@underworld> <Pine.LNX.4.44.0301041051010.25229-100000@firefox.malibyte.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RYJh/3oyKhIjGcML"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0301041051010.25229-100000@firefox.malibyte.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Bob Sully <rcs@malibyte.net>
Cc: Mark Ryan <markryan@cfl.rr.com>, netfilter@lists.netfilter.org


--RYJh/3oyKhIjGcML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 04, 2003 at 10:53:16AM -0800, Bob Sully wrote:
> Here's the excerpt from my script:
>=20
>   # Refuse any connections to/from problem sites.
[snip]
>=20
>   if [ -f /etc/firewall/firewall.banned ]; then
>      while read BANNED; do
>          iptables -A INPUT -i $EXTERNAL_INTERFACE -s $BANNED -j DROP
>          iptables -A INPUT -i $EXTERNAL_INTERFACE -d $BANNED -j DROP
>          iptables -A OUTPUT -o $EXTERNAL_INTERFACE -s $BANNED -j DROP
>          iptables -A OUTPUT -o $EXTERNAL_INTERFACE -d $BANNED -j DROP
>      done < /etc/firewall/firewall.banned
>   fi

  Given it reads the entire file each time, wouldn't you want to put
some sort of flush in there first?  Of course that's going to get rid of
all rules.  Just if you run this every time you're going to end up with
some entries in a lot of times.

  How about having the actual INPUT/OUTPUT chains jump to a userdefined
one at the end and you put these rules in that user-defined chain?  That
way you can flush *that* entire chain each time before adding the
current bans.

  Of course if you use a decent FTPd it's easy to ban by IP anyway, i.e.
proftpd:

        <Directory *>
                <Limit ALL>
                        Deny from 62.80.132.
                        Deny from .CXXXII.adsl.multi.fi
                </Limit>
        </Directory>

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--RYJh/3oyKhIjGcML
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj4XVh8ACgkQzbc+I5XfxKc7agCfUnEirkSNAEAIMvxphNLhEu4q
9JAAnjosoXMaRPOxi/3CIcnJrX5aOA0G
=mquJ
-----END PGP SIGNATURE-----

--RYJh/3oyKhIjGcML--

