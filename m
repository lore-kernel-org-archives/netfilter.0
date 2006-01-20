From: Ville Mattila <vmattila@csc.fi>
Subject: Re: Using iptables on a single NIC to map old IP addresses onto new.
Date: Fri, 20 Jan 2006 20:19:39 +0200
Message-ID: <20060120181939.GB32324@sampo3.csc.fi>
References: <43D12380.6080901@dtlink.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <43D12380.6080901@dtlink.com>
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
To: Yermo Lamers <yml@dtlink.com>
Cc: netfilter@lists.netfilter.org


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

	Terve,


On Fri, 20 Jan 2006, Yermo Lamers wrote:

> That was my first thought. I bound a.a.a.2 and b.b.b.2 to the same box.
> I obviously have two pipes. If I set the default route on the box to the
> a.a.a.1 router I can ping a.a.a.2 from the outside but not b.b.b.2. If I
> switch to the b.b.b.1 router the opposite happens.

> I would have expected packets to come down either pipe and go out
> whichever one happens to be the default gateway.

	It could be that both your ISPs are using source address spoofing
	filters (as they should, of course). That is, the router a.a.a.1
	will only accept traffic with source address a.a.a.2 and the rest
	(including ping replies from b.b.b.2) get dropped.


	Ville

--=20
Ville Mattila, System Support Specialist, Funet network, CSC
PO Box 405, FIN-02101 Espoo, Finland, fax +385 9 457 2302
CSC is the Finnish IT Center for Science, http://www.csc.fi/, email:
ville.mattila@csc.fi

--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----

iD8DBQFD0Sm7mGNFfULqN2YRAuXaAJkBE0tkst1/+B7kmHW+85XknQFEugCgu3+F
cwZVODvUITPeQziaxdraEVg=
=jIuU
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--

