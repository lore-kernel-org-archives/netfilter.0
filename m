From: Athan <netfilter@miggy.org>
Subject: Re: another conntrack table query
Date: Fri, 31 Jan 2003 11:30:14 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030131113014.GW11221@miggy.org>
References: <Pine.LNX.4.43.0301311554140.13580-100000@avishkaar.lan.deeproot.co.in>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4PJudQiuYY5+cwwi"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.43.0301311554140.13580-100000@avishkaar.lan.deeproot.co.in>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Nimit Gupta <nimit@deeproot.co.in>
Cc: netfilter@lists.netfilter.org


--4PJudQiuYY5+cwwi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2003 at 04:10:23PM +0530, Nimit Gupta wrote:
> hello,
> 	can somebody point me to a link or answer why does the conntrack table
> keeps the entry for connections marked as TIME_WAIT, and if it is not so
> useful how can i remove them as soon as the connection finishes.

  My guess would be because it is still waiting for the remote end to
fully close the connection.  This means there's the possibility of
further packets getting sent to that local ip:port.  If you delete the
entry and the port gets reused you'll possibly have two remote ip:port's
both trying to send traffic to the same local ip:port and causing
erroneous RSTs of the connection.

  Or something like that.

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--4PJudQiuYY5+cwwi
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj46XkYACgkQzbc+I5XfxKdqjACdHPys5Hi1aAmejnzgan4aodBd
VzQAoIXFqTDpLEpPbj8rRKa6DkFtiGb5
=t2cZ
-----END PGP SIGNATURE-----

--4PJudQiuYY5+cwwi--

