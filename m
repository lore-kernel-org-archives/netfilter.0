From: David T-G <davidtg-netfilter@justpickone.org>
Subject: tears of joy! (was "Re: ready to cry over NATting!")
Date: Tue, 20 May 2003 21:11:46 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030521011146.GC33081@justpickone.org>
References: <20030520102957.GA98543@justpickone.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cQXOx3fnlpmgJsTP"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030520102957.GA98543@justpickone.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: NetFilter Users' List <netfilter@lists.netfilter.org>


--cQXOx3fnlpmgJsTP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, all --

I am thrilled to say that I FINALLY had my first successful test tonight:

  linux:/tmp # iptables -t nat -vL
  Chain PREROUTING (policy ACCEPT 567 packets, 47480 bytes)
   pkts bytes target     prot opt in     out     source           destinati=
on =20

  Chain POSTROUTING (policy ACCEPT 527 packets, 32365 bytes)
   pkts bytes target     prot opt in     out     source           destinati=
on   =20
     20  1118 MASQUERADE  all  --  any    eth1    anywhere         anywhere=
   =20

  Chain OUTPUT (policy ACCEPT 307 packets, 18553 bytes)
   pkts bytes target     prot opt in     out     source           destinati=
on =20

Woo hoo!  Thanks to the invaluable help of Ralf and Julian and Guillermo,
in particular, as well as the other notes and tips that rolled in.

Now to 1) make it a boot script so that it will run all of the time and 2)
make it a wee bit more secure (though it's not as loose as it could be)
and then post a summary :-)


Thanks again & HAND & stay tuned

:-D
--=20
David T-G                      * There is too much animal courage in=20
(play) davidtg@justpickone.org * society and not sufficient moral courage.
(work) davidtgwork@justpickone.org  -- Mary Baker Eddy, "Science and Health"
http://justpickone.org/davidtg/      Shpx gur Pbzzhavpngvbaf Qrprapl Npg!


--cQXOx3fnlpmgJsTP
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (FreeBSD)

iD8DBQE+ytJSGb7uCXufRwARAoK8AKCAdLYhcSQgGOnUN83djxGxPcsfggCgnRcs
uANCuoksG+VsUDsA2iyoYYA=
=rCWU
-----END PGP SIGNATURE-----

--cQXOx3fnlpmgJsTP--

