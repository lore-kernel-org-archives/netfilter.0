From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: How to find nvl table?
Date: 15 Apr 2003 09:08:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050390495.1437.5.camel@raylinux.internal>
References: <20030415065751.DEEDD1C6C8DB0@sm205.163.com>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-WYC5hRICNEthbVtuqGwi"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030415065751.DEEDD1C6C8DB0@sm205.163.com>
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


--=-WYC5hRICNEthbVtuqGwi
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

The built in chains are in CAPITALS. INPUT is a chain in the filter
table (the default if not specified).

try:
iptables -nvL INPUT

Ray

On Tue, 2003-04-15 at 09:02, Bobo wrote:
> HI
>=20
>      Some days ago ,a member of here reply me the followings about traffi=
c account:
> >try this one:
> >
> >iptables -nvL INPUT
> >
> >in Perl:
> >
> >open(CHAINS, "iptables -nvL INPUT|") or die "Error reading chains\n";
> >
> >while(<CHAINS>)
> >{
> ># read the lines one by one, matching on the text you want
> >}
> >
> >close(CHAINS);
>=20
>    My platform is Redhat 7.2 in  default congiguration.
>=20
>   While I execute "iptables  -nvL input"
>=20
>   I got the following message on screen:
>=20
>=20
>    [root@myfirewall account]# iptables -nvL  input
> iptables: Table does not exist (do you need to insmod?)
>=20
>     why?  how to find the talbe? does  it need a special patch?
>=20
>  Thanks.

--=-WYC5hRICNEthbVtuqGwi
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+m6/fh1fuR/Bv+ygRAifWAJwIr1f/HQET5LM+suC+dE8MtCD7ggCfQw0c
MpIgtOwvsBeO0WrqrexJzDg=
=6dWY
-----END PGP SIGNATURE-----

--=-WYC5hRICNEthbVtuqGwi--


