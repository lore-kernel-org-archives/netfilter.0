From: Unknown <unknown@unknown.invalid>
Subject: Re: Marking and Mangling for QoS
Date: 25 Nov 2002 12:29:35 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1038220174.19168.149.camel@rayw.knowledgefactory.co.za>
References: <B5D7C6B6D020D511838A0060082D4CC90299BBF7@kheops.sigma.fr>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-P1GKFzYMlRDBp/0104KR"
Return-path: <netfilter-admin@lists.netfilter.org>
From: Raymond Leach <Ray@work>
In-Reply-To: <B5D7C6B6D020D511838A0060082D4CC90299BBF7@kheops.sigma.fr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>


--=-P1GKFzYMlRDBp/0104KR
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2002-11-25 at 12:24, COUSIN Marc wrote:
> Hi,
> I'm having trouve using mangling on NATed packets:
>=20
> Here's what we're trying to do:
> We're trying to build a system to test the behaviour of our web applicati=
ons
> with slow links. For that, we decided to use the Linux QoS, and SNAT+DNAT=
 to
> redirect the packets from the linux system to the webserver. The idea beh=
ind
> this is that someone contacting the linux on the 8081 port will be
> transparently redirected to the 8080 of the real web server, simulating a
> 56k modem. on the 8082 port, it could be a 128 link, etc ...
>=20
> The system is a Redhat 7.3
>=20
> To create this, I used:
> - DNAT and SNAT rules to redirect the packets from my port to the web
> server, and SNAT the packet (so that it is returned to me and i can shape=
 it
> too) [these are OK]
> - a QoS script (simple, using fwmarks) [ok too]
> - And I wanted to mangle the packets to put the marks on the NATed pakets
> [here comes the trouble]
> I'll continue on the above example :
>=20
> # For the NAT
> iptables -t nat -A PREROUTING -p tcp --destination-port 8081:8090 -j DNAT
> --to-destination 89.131.0.7:8080
> iptables -t nat -A POSTROUTING -p tcp --destination 89.131.0.7 -j SNAT
> --to-source 89.131.0.58
> # For the marks
> iptables -A PREROUTING -t mangle -p tcp --destination-port 8081 -j MARK
> --set-mark 10=20
> iptables -A POSTROUTING -t mangle -p tcp --source-port 8081 -j MARK
> --set-mark 11 # Trying to match the return NATed packet
>=20
>=20
> The --set-mark 10 works (no surprise, very simple rule in fact)
> the --set-mark 11 doesn't match. It may be normal, as I'm trying to match=
 a
> return packet on a NAT connexion. How am I supposed to match the return
> packet in such a situation ?
>=20
The return packets (AFAIK) are part of the original PREROUTING rule, and
therefore will not be matched by the POSTROUTING rule which will be
matched by traffic originating from your webserver (and not RELATED to
another connection).

Hope this helps ...

Ray
> Thanks fof helping
--=20

--=-P1GKFzYMlRDBp/0104KR
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA94fuOh1fuR/Bv+ygRAqjqAJ9/iGpWNmsXCUTbIyN6abk8Lq9OzQCfQOFN
8PD94CRQ/F1eob4Lpy9XgCA=
=KGGR
-----END PGP SIGNATURE-----

--=-P1GKFzYMlRDBp/0104KR--


