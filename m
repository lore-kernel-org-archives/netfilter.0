From: "David C. Hart" <DCH@TQMcube.com>
Subject: Snort Output v. Iptables Log
Date: Tue, 04 Nov 2003 17:25:07 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067984705.3989.8.camel@main.tqmcube.com>
Reply-To: IPTables List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-hlKTjMuxlzzlo7feNKxA"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: iptables mailing list <netfilter@lists.netfilter.org>


--=-hlKTjMuxlzzlo7feNKxA
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

If I run snort, I get tons of these from a neighboring IP (I'm assuming
"dirty" windows in contrast to anything malicious BTW).
----------------------------
[**] MISC UPnP malformed advertisement [**]
11/04-16:25:15.492306 151.202.17.22:1901 -> 239.255.255.250:1900
UDP TTL:150 TOS:0x0 ID:1 IpLen:20 DgmLen:355
Len: 327
---------------------------
None of these packets get logged by IPTables. To be sure, I added a
"kitchen sink" rule at the very top specific to the offending IP with no
parameters:

-A INPUT -s 151.202.17.22 -j LOG  --log-prefix "Firewall: " --log-level
debug --log-tcp-sequence --log-tcp-options --log-ip-options

Any ideas? What am I not understanding?

--=-hlKTjMuxlzzlo7feNKxA
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/qCdBol4OE0cpGaIRAsbNAKCG94e55tQ2uBEtYR9BvLAL8ANzcQCfTKNd
sAFiB3bcv98YyVoVF7qzAnY=
=dM5g
-----END PGP SIGNATURE-----

--=-hlKTjMuxlzzlo7feNKxA--


