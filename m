From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: RE: portfw on iptables 2.4 kernel problem.
Date: 10 Dec 2002 13:00:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039518051.1713.91.camel@rayw.knowledgefactory.co.za>
References: <FD8F124A387AD6119F7900A0D218B321019A3A@hslex01.hslbz.local>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-1nNvQbB1W0nFYM7RliGV"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B321019A3A@hslex01.hslbz.local>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: rsterenborg@xs4all.nl
Cc: 'Paulo Andre' <pandre@darkstar.nom.za>, 'louie miranda' <lmiranda@chikka.com>, 'netfilter' <netfilter@lists.netfilter.org>


--=-1nNvQbB1W0nFYM7RliGV
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Yes, you do. Port 20 (and/or any other) connections after the control
connection are not 'RELATED, ESTABLISHED' to the control connection.
They are new connections either from the client to the server or vice
versa. You therefore need seperate rules for them.

Remember connection tracking happens at a pakcet level, i.e all states
relate to packets of a connection, not per protocol.

Ray

On Tue, 2002-12-10 at 11:43, Rob Sterenborg wrote:
> > You will have to allow port 20 aswell...FTP uses both port 20 and 21
>=20
> Do you ?
> I was under the impression that this line would take care of that (which
> is already in the iptables config) :
>=20
> > iptables -A FORWARD -i eth0 -o eth1 -p tcp --dport 21 -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT
>=20
> However, I'm not sure if it's better to split them up into 2 rules :
> iptables -A FORWARD -i eth0 -o eth1 -p tcp --dport 21 -m state --state
> NEW -j ACCEPT
> iptables -A FORWARD -i eth0 -o eth1 -m state --state ESTABLISHED,RELATED
> -j ACCEPT
>=20
>=20
> Rob

--=-1nNvQbB1W0nFYM7RliGV
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA99cljh1fuR/Bv+ygRApc9AKCEfa7DIfscA45l3uQ3FReC+h2fLQCeL7Qu
zEnmcYpoDJKszIxS7Jamrd0=
=kaN8
-----END PGP SIGNATURE-----

--=-1nNvQbB1W0nFYM7RliGV--


