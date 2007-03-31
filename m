From: Franck Joncourt <franck.joncourt@wanadoo.fr>
Subject: Re: Band limit without squid
Date: Sat, 31 Mar 2007 09:59:36 +0200
Message-ID: <20070331075936.GA23114@toystory.lan>
References: <200703301822.56518.davividal@siscompar.com.br>
	<Pine.LNX.4.61.0703302327570.31834@yvahk01.tjqt.qr>
	<200703301834.50784.davividal@siscompar.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200703301834.50784.davividal@siscompar.com.br>
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


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 30, 2007 at 06:34:50PM -0300, Davi wrote:
> Em Sexta 30 Mar=C3=A7o 2007 18:28, voc=C3=AA escreveu:
> > On Mar 30 2007 18:22, Davi wrote:
> > >Hi all!
> > >
> > >I would like to reserve some band to some services.
> > >Like 30 Kb to HTTP, 60 Kb to POP/IMAP, 20 Kb to SMTP and FTP, i.e.
> > >
> > >Can I do this using iptables + iproute or I must use Squid?
> >
> > No to all three questions.
> >
> >
> > Jan
>=20
> Sorry... =3DP
> Just one question: can I do this (band limit) without Squid?
>=20
> Searching here, I found CBQ...
> Anyone has used it?
>=20

More information about traffic shaping and the different classes (HTB, CBQ)=
 here :

http://www.lartc.org/
http://luxik.cdi.cz/~devik/qos/htb/manual/userg.htm

Some useful examples :

http://luxik.cdi.cz/~devik/qos/htb/manual/userg.htm
http://lartc.org/wondershaper/

And with iptables you can use connmark target to mark your packets :
(working on it)

[...]

# Let's restore the mark, if there is one, otherwise redirect
# the packet to be matched
# A packet which has been marked is known to have the eighth bit set
iptables -t mangle -A traffic_shaping -m connmark --mark 0x80/0x80 \
	-j CONNMARK --restore-mark
iptables -t mangle -A traffic_shaping -m connmark --mark 0x80/0x80 \
	-j RETURN

# Set the right mark for traffic
# ------------------------------
# Set non-TCP packets to the highest priority since there is no handshake
# It means the client is not waiting for a reply to send you other data. Th=
is would result
# in the loss of theses data.
iptables -t mangle -A traffic_shaping -p !tcp \
		-j CONNMARK --set-mark 0x81
iptables -t mangle -A traffic_shaping -p ! tcp \
		-j RETURN

# Sort SSH connections
iptables -t mangle -A traffic_shaping -p tcp --sport 22 \
		-j CONNMARK --set-mark 0x82
iptables -t mangle -A traffic_shaping -p tcp --sport 22 \
		-j RETURN
iptables -t mangle -A traffic_shaping -p tcp --dport 22 \
		-j CONNMARK --set-mark 0x82
iptables -t mangle -A traffic_shaping -p tcp --dport 22 \
		-j RETURN
[...]


--=20
Franck Joncourt
http://www.debian.org
http://smhteam.info/wiki/
GPG server : pgpkeys.mit.edu
Fingerprint : C10E D1D0 EF70 0A2A CACF 9A3C C490 534E 75C0 89FE

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFGDhToxJBTTnXAif4RAtekAKDDJU3864CQjKkBLcU9+cogs00a2gCfXREm
ejoNP56YApB77tQO9Qjfiew=
=Q3MR
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--


