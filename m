From: Athan <netfilter@miggy.org>
Subject: Re: DNAT/MASQ Precedence
Date: Fri, 31 Jan 2003 12:18:17 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030131121817.GX11221@miggy.org>
References: <200301301931.41645.katriel@traum.org.il> <200301311314.06777.katriel@traum.org.il> <20030131111949.GV11221@miggy.org> <200301311341.11635.katriel@traum.org.il>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RvrrZ8vH9xW05bsQ"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200301311341.11635.katriel@traum.org.il>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Katriel Traum <katriel@traum.org.il>
Cc: Athan <netfilter@miggy.org>, netfilter@lists.netfilter.org


--RvrrZ8vH9xW05bsQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2003 at 01:41:11PM +0000, Katriel Traum wrote:
> On Friday 31 January 2003 11:19, Athan wrote:
> >   Basically not allowing ICMP in a blind fashion is NOT the way to do
> > things.  You probably just need to make sure you have the proper FORWARD
> > rules (filter chain, it's the default so no -t) to allow both
> > ESTABLISHED and RELATED.  You can find these in any mention of SNAT in
> > docs/howtos.
> Ofcourse ICMP is important. I wan't going to leave it out.
> The qiestion is will the rule:
> iptables -A PREROUTING -i $INET_IF -p icmp --dport ! 60000:62000 -j DNAT \
> - --to-destination $DMZ_IP
>=20
> do it? and what about ICMP messages aimed back at the LAN?
> This will all be acompanied with the apropriate -m state entries.

   This I'm mostly sure won't work.  As I kind of said above, what you
want is -m state --state RELATED rules to do it, as RELATED includes
'icmp to do with this connection'.  No need for ports or IPs as it'll
get info on which connections to do it for and where to pass it from the
connection tracking.

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--RvrrZ8vH9xW05bsQ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj46aYkACgkQzbc+I5XfxKeySwCglsU2y/DDY58Dfy6kbanxgjLW
r/YAn1EEKWcDgCvLjOeebexn4MSrxez6
=PRku
-----END PGP SIGNATURE-----

--RvrrZ8vH9xW05bsQ--

