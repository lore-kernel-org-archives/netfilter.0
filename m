From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Sun, 18 Dec 2005 08:16:21 -0500
Message-ID: <20051218131621.GC2197@bostoncoop.net>
References: <20051218055403.002CDA00EA@bostoncoop.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20051218055403.002CDA00EA@bostoncoop.net>
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


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 18, 2005 at 032:42:43M -0500, Leonardo Rodrigues Magalhes wrote:
>     Adam, have you tried adding a properly PREROUTING rule for this=20
> specific traffic ? It would be like
> iptables -t nat -A PREROUTING -p udp -d EXTERNAL_IP_OF_NAT_BOT --dport=20
> 500 -j DNAT --to LOCAL_CLIENT

I have tried that--same result. In fact, I've tried creating a "tunnel"
between the internal and external client by leaving out the port
limitation, i.e.:

iptables -t nat -A PREROUTING -s SERVER_IP -j DNAT --to LOCAL_CLIENT

None of these have any effect because the packets never reach the nat
PREROUTING chain. If I put a LOG rule at the start of nat PREROUTING, I
don't see the inbound packets from the server on the Internet. (I do see
those packets in the mangle PREROUTING though).

>     Other test I would suggest ....... have you tried some other UDP=20
> traffic, just like DNS and see if it works ? Have you tried some TCP=20
> traffic and see if it works fine ?

Everything else seems to work fine. I have another internal box to which
certain ssh connections from the Internet go, and that's fine. I'm not
sure exactly how I'd test other UDP traffic... Certainly UDP traffic that
is FORWARDed through the NAT box (e.g., RealPlayer streams) seems fine.
--=20
Adam Rosi-Kessel
http://adam.rosi-kessel.org

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD4DBQFDpWEldTf3ZklQ6qYRAsF3AJd+5Ks1I3JE4BjNa8aKlB2/SiXCAJ9fd4pA
A6T5YNFBypXZVTC+M/atDw==
=ZmKp
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--

