From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: What ports need to be open to allow for mail?
Date: 10 Apr 2003 12:18:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049969891.8232.0.camel@raylinux.internal>
References: <20030410093951.97924.qmail@web40207.mail.yahoo.com>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-2F2fUOJLQLFUBe5zQVIc"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030410093951.97924.qmail@web40207.mail.yahoo.com>
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


--=-2F2fUOJLQLFUBe5zQVIc
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

Depends what kind of mail:

SMTP uses tcp port 25 (no UDP necessary)
POP3 uses tcp port 110 (no UDP necessary)

HTH

Ray

On Thu, 2003-04-10 at 11:39, James Marcinek wrote:
> Hello All,
>=20
> I'm trying to set up my mail server; however I want to
> make sure that I have the correct port(s) open. I
> already have TCP port 25 open; however do I also have
> to have UDP port 25 open as well? Any help would be
> appreciated.
>=20
> Thanks,
> James
>=20
> __________________________________________________
> Do you Yahoo!?
> Yahoo! Tax Center - File online, calculators, forms, and more
> http://tax.yahoo.com

--=-2F2fUOJLQLFUBe5zQVIc
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+lUTjh1fuR/Bv+ygRAgRLAJ4m3c5lAslme5sjakohzLljmWaBfACePpSa
CqpCUPVmUWB7jBnTf9r9qhE=
=Fi1c
-----END PGP SIGNATURE-----

--=-2F2fUOJLQLFUBe5zQVIc--


