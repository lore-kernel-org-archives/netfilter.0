From: Tom Marshall <tommy@home.tig-grr.com>
Subject: Re: about yahoo messenger and http download
Date: Sat, 12 Apr 2003 07:53:16 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030412145316.GA26026@home.tig-grr.com>
References: <000801c30088$90e25490$9600000a@xpsys>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k1lZvvs/B4yU6o8G"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000801c30088$90e25490$9600000a@xpsys>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: chammy <chammy@netvigator.com>
Cc: netfilter@lists.netfilter.org


--k1lZvvs/B4yU6o8G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 12, 2003 at 08:15:03AM +0800, chammy wrote:
> Does any one can provide tip & hints, how to block the yahoo messenger an=
d http
> downlaod, the mainly problem of yahoo messenger is can not block "all blo=
ck"
> =20
> yahoo mesenger default is 5050, if not avaiable will scan 80 , we can not=
 stop
> 80 cause we need to www service and the http download is same problem

1. The easy way

  * Tell employees that Yahoo Messenger is prohibited.
  * Log outbound connections to port 5050.
  * Find a unique signature for the HTTP connections and log them.
   (eg. "Host: scs.yahoo.com" or somesuch).
  * Let management deal with offenders.

2. The hard way

  Try to fool Yahoo Messenger into thinking that it got a connection, but
  the server immediately closed the connection.  Perhaps then it will not
  try to go stealth and instead tell the user that it cannot connect.  You
  might try using a REDIRECT to a local port and use tcpwrappers to force
  the socket to be immediately closed.

--=20
I hate mankind, for I think myself one of the best of them, and I know
how bad I am.
        -- Samuel Johnson

--k1lZvvs/B4yU6o8G
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj6YKFwACgkQFMm9uvwPXW5M8wCdEhK7NL67eiJNBE7sg/FNdfq/
nCwAn2M6TwdAthMqhc+6suN6oWNgyM1W
=j5Ye
-----END PGP SIGNATURE-----

--k1lZvvs/B4yU6o8G--

