From: Sami Farin <safari-netfilter@safari.iki.fi>
Subject: Re: IPSET iptree problem
Date: Mon, 27 Aug 2007 23:52:50 +0300
Message-ID: <20070827205249.o36eoudvhz3sqymk@m.safari.iki.fi>
References: <E1IPe95-0001aO-B9@welnowiec.net>
	<Pine.LNX.4.64.0708271837440.6383@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r6ntgpq7ce3fkrxd"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0708271837440.6383@blackhole.kfki.hu>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org


--r6ntgpq7ce3fkrxd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 27, 2007 at 18:40:36 +0200, Jozsef Kadlecsik wrote:
> On Mon, 27 Aug 2007, nofast@welnowiec.net wrote:
>
>> I preformed two tests, one shortly after boot and another few minutes=20
>> later.
>> The results are different.
>> I hope this will help you.
>
> It did helped: please give a try to the new version as
> http://ipset.netfilter.org/ipset-2.6.23-rc3.patch2.

Your mask_to_bits function results into infinite loop if called
with parameter 1, for example.

If you care only about first set bit, i.e. you do not bother checking
is netmask valid, you can use:

static inline unsigned int mask_to_bits(ip_set_ip_t mask)
{
  if (mask =3D=3D 0) return 0;
  return 33 - ffs(mask);
}

--=20
Do what you love because life is too short for anything else.


--r6ntgpq7ce3fkrxd
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.3 (GNU/Linux)

iD8DBQFG0zmhMCYCLUwuV18RAlcTAJ9MyfwigXKpM+dvX1bc6D45BmXBYACfbBSY
bPA6nPp4P0voY+8N3J7aVPw=
=vX6s
-----END PGP SIGNATURE-----

--r6ntgpq7ce3fkrxd--

