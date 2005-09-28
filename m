From: Sheldon Hearn <sheldonh@clue.co.za>
Subject: Re: SNAT for two interfaces not working
Date: Wed, 28 Sep 2005 16:08:23 +0200
Message-ID: <200509281608.23256@axl.clue.co.za>
References: <200509281547.23683@axl.clue.co.za>
	<433A9FE6.4030904@davidcoulson.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2055460.lJmK8hCUFp";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <433A9FE6.4030904@davidcoulson.net>
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
To: David Coulson <david@davidcoulson.net>
Cc: netfilter@lists.netfilter.org

--nextPart2055460.lJmK8hCUFp
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 28 September 2005 15:51, David Coulson wrote:
> Sheldon Hearn wrote:
> > So basically, the SYN+ACK is arriving back at the firewall, but the
> > firewall then ignores it.  If I add logging, I see the packet hit
> > PREROUTING, but that's it.
>
> Disable return path filtering on the interfaces.
>
> echo 0 > /proc/sys/net/ipv4/conf/eth0/rp_filter
>
> David

=46or the integrity of the archives, it was actually=20
net.ipv4.conf.eth2.rp_filter; I forgot to mention that, and I'd hate=20
for someone else to struggle any more than necessary with the same=20
problem.

But again, thank you so much.

Ciao,
Sheldon.

--nextPart2055460.lJmK8hCUFp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBDOqPXpGJX8XSgas0RAkCuAKCpBa/CJeVS9O0z1yLiJ9qcL1NcWwCcD0gk
miM5spbU3kSr1JpmtvT2tXw=
=XGfw
-----END PGP SIGNATURE-----

--nextPart2055460.lJmK8hCUFp--


