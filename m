From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Policy, why is it doing that
Date: Fri, 17 Oct 2003 14:24:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066393466.10567.22.camel@raylinux.internal>
References: <BDF3100EBB9E3A47B84F816A10D9A4E5A8E5@eai-exchange.edgeaccess.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-mkXweGMbs+ohK0akkm5Y"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BDF3100EBB9E3A47B84F816A10D9A4E5A8E5@eai-exchange.edgeaccess.net>
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


--=-mkXweGMbs+ohK0akkm5Y
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-10-16 at 17:37, Britt Tabor wrote:
> Hello,
>=20
> 	I have a linux (slackware) box that I am running iptables on. I have mas=
q. on and I have only one entry in the table. I currently have the policy f=
or FORWARD set to ACCEPT. Here's the problem, if I set the policy to DROP i=
t drops everything. No rules are looked at before dropping it just drops ev=
erything. Here is a list of my iptables.
>=20
> bash-2.05# iptables -L
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination        =20
>=20
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination        =20
> ACCEPT     all  --  anywhere             anywhere          =20
>=20
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination        =20
> bash-2.05# iptables -t nat -L
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination        =20
>=20
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination        =20
> MASQUERADE  all  --  anywhere             anywhere          =20
>=20
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
>=20
> with this everything is fine but as you can tell there is no real securit=
y, because I ACCEPT all. However, if I set the policy on FORWARD to DROP ev=
erything gets dropped regardless of rule entries. Previously I used ipchain=
s, when a packet came in it would traverse the rule entries in the FORWARD =
list and if it didn't match anything it would apply the policy. With iptabl=
es it seems to be doing just the opposite. When packets come in it applys t=
he policy first.???
>=20
> Is this the case?=20
>=20
No, what command are you using to set the policy on the forward chain?

>=20
>=20
>=20
> =20
> =20
> Britt Tabor
> Edge Access, Inc.
> btabor@edgeaccess.net
> http://www.edgeaccess.net
> 813.594.6142 Voice
> 813.249.1126 Fax
> =20
> =20
> =20
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-mkXweGMbs+ohK0akkm5Y
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/j996h1fuR/Bv+ygRAoWdAJ9xrmqC91CjgjpcmY5qhWEOAxbh9QCcDzt5
+AefgAnEnWMBdfGMF+hDOMk=
=z/VA
-----END PGP SIGNATURE-----

--=-mkXweGMbs+ohK0akkm5Y--


