From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: SNMP device replies by alternate address
Date: 17 Feb 2003 08:33:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045463638.17705.20.camel@rayw.knowledgefactory.co.za>
References: <000101c2d380$ae062c70$3201a8c0@BEOWULF>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-8IGeS9ciXT/7T/w28qpM"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000101c2d380$ae062c70$3201a8c0@BEOWULF>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-8IGeS9ciXT/7T/w28qpM
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-02-13 at 18:55, Peter Hurley wrote:
> Is there an extension target that can be used in the PREROUTING chain of
> nat and/or mangle to alter the incoming source ip address? Say something
> in the form of...
>=20
> iptables -t nat -A PREROUTING -i eth1 -m mac --mac-source
> xx.xx.xx.xx.xx.xx -j SRC_MANGLE --from_src 192.168.50.17/32
>=20

You need to use -j SNAT on postrouting:
iptables -t nat -A POSTROUTING -o eth0 -m mac --mac-source
xx.xx.xx.xx.xx.xx -j SNAT --to-source 192.168.50.17

> The situation is this:  a SNMP device accepts SNMP requests on two
> separate ip addresses.  One ip is fixed and private, the other is
> dynamic/unknown.  This device is on the outside of a private network
> being SNAT'ed.  The problem is that even though it receives SNMP
> requests on the private ip address it replies with the other
> dynamic/unknown ip address as the source.
>=20
> This means that ip_conntrack_core doesn't recognize the reply packet as
> belonging to the previous outgoing request.
>=20
> Matching the reply packet is easy with the mac address which is fixed.
> But I can't seem to get past that.  Marking and using iproute2 won't
> work since only ip_conntrack* knows the reply path.  Mapping both
> request and reply packets onto the same network (say 10.x.x.x) won't
> work because the two SNMP addresses aren't simple
> reflections/derivatives of each other (e.g., 192.168.50.17 and
> xx.xx.72.116).
>=20
> Perhaps I'm missing something that already exists in the stock
> netfilter?
>=20
> Thanks in advance,
>=20
> Peter Hurley
> phurley@imaginexd.com


--=-8IGeS9ciXT/7T/w28qpM
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+UIJWh1fuR/Bv+ygRAqcoAJ9r14YEDrrCSyg1USMUL/rst4pJBwCdEJ7j
H2CzqJA8O37vWEsjAN+j3U4=
=t97o
-----END PGP SIGNATURE-----

--=-8IGeS9ciXT/7T/w28qpM--


