From: Athan <netfilter@miggy.org>
Subject: Re: DNAT/MASQ Precedence
Date: Thu, 30 Jan 2003 19:34:08 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030130193408.GR11221@miggy.org>
References: <200301301931.41645.katriel@traum.org.il>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QGBKWVSgmlsIyJ+t"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200301301931.41645.katriel@traum.org.il>
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
Cc: netfilter@lists.netfilter.org


--QGBKWVSgmlsIyJ+t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2003 at 07:31:38PM +0000, Katriel Traum wrote:
> I want to redirect _all_ traffic into the DMZ (is that even possible?) an=
d in=20
> the same time MASQ the LAN. The question is will they collide? If I use a=
=20
> ruleset such as:
> iptables -A PREROUTING -i $INET_IF -j DNAT --to-destination $DMZ_IP=20
> iptables -A POSTROUTING -o $INET_IF -j MASQUERADE
> (yes, there's only one computer in the DMZ)
>=20
> Will I get return traffic into my lan? won't it be DNATed into the DMZ?

  You need at least one public IP that is *NOT* in the DMZ.  Then change
the DMZ rule to exclude on this:

iptables -A PREROUTING -i $INET_IF -d ! <not-DMZ IP> -j DNAT --to-destinati=
on $DMZ_IP

This IP would also be the IP on the outgoing interface of the firewall.
So should automatically get used for MASQUERADE.  If it's all static,
then just use SNAT instead of MASQUERADE and you can specify the IP to
be sure of it:

iptables -A POSTROUTING -o $INET_IF -s <LAN network> -j SNAT --to-source <n=
ot DMZ IP>

Note the '-s' bit on that rule so you only SNAT traffic coming from the
LAN, and not that from the DMZ.

  I'm sure others will correct me if anything in this is wrong ;).

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--QGBKWVSgmlsIyJ+t
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj45fjAACgkQzbc+I5XfxKdQJgCeJFvJi6xZHmDXWx1WfsDj+q9k
jgIAnj9i07ibVXiSaxqvhFieNDm7GCfl
=rZiu
-----END PGP SIGNATURE-----

--QGBKWVSgmlsIyJ+t--

