From: Athan <netfilter@miggy.org>
Subject: Re: Display rulenum
Date: Sun, 26 Jan 2003 14:01:09 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030126140109.GI26189@miggy.org>
References: <OFFEB3667B.A96202EB-ON65256CBA.0049D79C-65256CBA.004A36FF@lntinfotech.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="CNK/L7dwKXQ4Ub8J"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <OFFEB3667B.A96202EB-ON65256CBA.0049D79C-65256CBA.004A36FF@lntinfotech.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: harish.k@lntinfotech.com
Cc: netfilter@lists.netfilter.org


--CNK/L7dwKXQ4Ub8J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 26, 2003 at 06:59:20PM +0530, harish.k@lntinfotech.com wrote:
> How do I make iptables list the rule numbers along with the rules?
> The -L option lists the rules, not the actual rule numbers. This will be
> helpful where there are a *lot* of rules in a particular chain.

root@jimblewix:~;
14:00:06 0$ iptables --help | grep line
  --line-numbers                print line numbers when listing
root@jimblewix:~;
14:00:18 0$ iptables -L --line-numbers
Chain INPUT (policy DROP)
num  target     prot opt source               destination        =20
1    acctin     all  --  anywhere             anywhere          =20
2    acctio     all  --  anywhere             anywhere          =20
<etc>=09

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--CNK/L7dwKXQ4Ub8J
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj4z6iUACgkQzbc+I5XfxKcLdQCfVZ7RsWgsaClRUt6Hev2efURt
RmQAnjdXRG+KZVvFpD0kxVUmpqxd7+pY
=04Qs
-----END PGP SIGNATURE-----

--CNK/L7dwKXQ4Ub8J--

