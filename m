From: Athan <netfilter@miggy.org>
Subject: Re: HELP: Conntrack table filling up !!!
Date: Thu, 2 Jan 2003 20:35:53 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030102203552.GC10404@miggy.org>
References: <20021231235005.GD1985@miggy.org> <007b01c2b295$d8422540$0100a8c0@zultys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NMuMz9nt05w80d4+"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <007b01c2b295$d8422540$0100a8c0@zultys.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--NMuMz9nt05w80d4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 02, 2003 at 11:33:36AM -0800, Ranjeet Shetye wrote:
> Actually, the ICMP problem that I have seen does not go away with a
> larger ip_conntrack_max. The extra table space just gets filled up.
> Agreed, that the ICMP packets I used to flood the iptables conntrack
> mechanism did not strictly comply with ICMP RFC standards, but then
> which cracker cares about standards ? :( That's why I asked, are you
> seeing malformed ICMP packets ?

  Fair enough.  Check out if the unclean match module catches these bad
ICMP packets then:

	iptables -A INPUT -i ${PUBINT} --match unclean -j LOG --log-level info --l=
og-prefix "fwr-unclean "

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--NMuMz9nt05w80d4+
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj4UoqgACgkQzbc+I5XfxKcMJQCfapBNDbuquGwTJfz6KLDuGgA8
W0cAn3tYM8MlvKuOKMMYy14jfrNEKIKi
=IcY4
-----END PGP SIGNATURE-----

--NMuMz9nt05w80d4+--

