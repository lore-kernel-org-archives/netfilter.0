From: Amit Kucheria <akucheria@metricsystems.com>
Subject: sending same packet stream over both links
Date: Fri, 23 Jan 2004 19:48:47 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1074916127.3329.9.camel@amit.metricsystems.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-IIx04pH6d4/Zk3t/dAfn";
 protocol="application/pgp-signature"; micalg=pgp-sha1
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
To: Linux-Netfilter-Users Mailing List <netfilter@lists.netfilter.org>


--=-IIx04pH6d4/Zk3t/dAfn
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

I have an application requirement that hints at the use of multicast,
but I think it can be solved without it.


                                    |------- [Receiver 1]
[Sender] ------- [Relay/Router] ----|
                                    |------- [Receiver 2]

There is a UDP stream from the [sender] that needs to reach both the
receivers. Is it possible to direct the stream to the [Router] and have
iproute2/iptable rules that modify the packets and send it to both the
receivers?

Thanks for your time.

Regards,
Amit

--=20
     .| Amit Kucheria                       |.
   ...| Wireless Systems Engineer           |...
 .....| Metric Systems Corp., San Diego, CA |.....
......| www.metricsystems.com               |......


--=-IIx04pH6d4/Zk3t/dAfn
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQBAEesftLg6PvU36DYRAtV7AKDB9sWJAUaUwN/qZuAOJlc3Yk8HawCfVXzh
G0G/KGXCFUNZ8QLreGF3zTE=
=YXr6
-----END PGP SIGNATURE-----

--=-IIx04pH6d4/Zk3t/dAfn--


