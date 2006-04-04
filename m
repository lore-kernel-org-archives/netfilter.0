From: Alexander Samad <alex@samad.com.au>
Subject: Multi default gateway and 2.4.30
Date: Tue, 4 Apr 2006 10:24:01 +1000
Message-ID: <20060404002401.GE7733@hufpuf.lan1.hme1.samad.com.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5oH/S/bF6lOfqCQb"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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


--5oH/S/bF6lOfqCQb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

I have just moved my firewall from a 2.6 debian machine to a 2.4.30
openwrt (linksys wrt54gs) box.

I orginially had this working with 2 isp, 1 cable 1 adsl and dyndns.

Now when i have moved to 2.4.30 I am having problems.  Everything else
is working fine except when I DNAT packets from the firewall to an
internal address, ie my web browser is inside so I DNAT from the
external IP  to the internal web server.

now I am getting time outs, upon investigation what is happening is that
packets are coming in, getting DNAT'ed, the web server is returning
them, they get un DNAT, but a new call to the routing table is made and
it seems to bypass the ip rules rules I have, all traffic that
terminates on the external IP is okay and doesn't suffer from the
problem.

I remember reading about patches for the iproute and the kernel but I
haven't kept up to date with those since I started using 2.6

Am i missing a patch ??

Thanks



--5oH/S/bF6lOfqCQb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFEMbyhkZz88chpJ2MRAtLAAKCH2Mu8dpRYTplpv11rEfSazx9uoQCgxWtc
2I+L7YgAqdROVRdwPMuEpfU=
=jKCX
-----END PGP SIGNATURE-----

--5oH/S/bF6lOfqCQb--

