From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Problems with NAT
Date: 29 May 2003 17:55:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054223719.13048.37.camel@raylinux.internal>
References: <001d01c325f5$1ab72010$010319ac@jhime>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Oq/yMSmvr1FSeecM8X2U"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001d01c325f5$1ab72010$010319ac@jhime>
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


--=-Oq/yMSmvr1FSeecM8X2U
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-05-29 at 17:15, Jose Luis Hime wrote:
> Dear all:
>=20
> I have the following network:
>               :
>               :    /---------\
> /-------\  Leased  | Router  |  Leased  /----------\
> | LAN B |----------| without |----------| Internet |
> \-------/  Line 1  | NAT     |  Line 2  \----------/
>               :    \---------/
>               :         |
>               :         |
>               :   /----------\
>               :   | Firewall |      /-------\
>               :   | Linux    |------| LAN A |
>               :   | with NAT |      \-------/
>               :   \----------/
>               :
>    CITY "B"   :     CITY "A"
>=20
> 1. The router, the firewall and LAN A are in city "A"
> 2. LAN B is in another city (city "B")
> 3. LAN A must access the internet, LAN B must not;
> 4. Unfortunately my router does not support NAT;
> 5. Both the router and the linux firewall have real internet IP addresses=
;
> 6. So:
>    - The linux firewall must NAT packets from LAN A to the internet;
>    - The linux firewall must not NAT packets from LAN A to LAN B;
>=20
> I created rules in table "filter" allowing communication between LAN A an=
d
> LAN B:
>    -t filter -A INPUT   -s LAN A -d LAN B -j ACCEPT
>    -t filter -A INPUT   -s LAN B -d LAN A -j ACCEPT
>    -t filter -A FORWARD -s LAN A -d LAN B -j ACCEPT
>    -t filter -A FORWARD -s LAN B -d LAN A -j ACCEPT
>=20
> After that, I created one rule in table "nat" in order to allow LAN A
> accessing the internet:
>    -t nat -A POSTROUTING -s LAN A -d 0/0 -j SNAT --to Firewall_IP_address
>=20
> The problem is that LAN A is making NAT to LAN B.
>=20
> Is there a way to prevent the firewall from NATing from LAN A to LAN B? T=
he
> problem is that both traffics (LAN A->internet and LAN A->LAN B) are goin=
g
> through the same interface...
>=20
Sure, change your nat rule:
  -t nat -A POSTROUTING -s LAN A -d ! LAN B -j SNAT --to
Firewall_IP_address

> With ipchains, after reaching the INPUT and FORWARD rules the firewall
> would stop and would not reach the NAT rules. This behavior changed in
> iptables and it always check both tables (filter and nat).
>=20
> Thanks in advance,
> Jose Hime
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-Oq/yMSmvr1FSeecM8X2U
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+1i1nh1fuR/Bv+ygRAv7nAKCMc3Kux7KJgIQsfBX49tB6jC2OIACeLK2r
sbc1fxGr+E+u/EpD0Vl9//Y=
=5WcD
-----END PGP SIGNATURE-----

--=-Oq/yMSmvr1FSeecM8X2U--


