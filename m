From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Problems with prerouting
Date: Tue, 30 Sep 2003 07:06:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064898376.16779.57.camel@raylinux.internal>
References: <20030929155529.E451617C80@delta.anup.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Dyu/9pNv3UxMLTUlM7JV"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030929155529.E451617C80@delta.anup.de>
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


--=-Dyu/9pNv3UxMLTUlM7JV
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-09-29 at 17:55, Andreas Meyer wrote:
> Hi!
>=20
> I could need some help with setting up a prerouting for a webserver
> on my gateway.
>=20
>=20
>     static-Internet-IP on eth1
>                 |
>         +----------------+
>         |                |
>         | 192.168.20.210 |
>         |    on eth0     |
>         +----------------+
>                 |
>             +-----------+
>             |           |
>        +---------+ +----------+
>        |         | |          |
>    192.168.20.60 | | 192.168.20.61
>       Squid      | |    Webserver
>        |         | |          |
>    192.168.1.75  | |          |
>        +---------+ +----------+
>            |
>=20
>        +--------+
>    192.168.1.3  |
>       WKS       |
>        +--------+
>=20
> I addes a rule before all other forwarding and input and output
> rules:
>=20
> iptables -A FORWARD -p TCP -d 192.168.20.61 --dport 8080 -j ACCEPT
> iptables -t nat -A PREROUTING -p TCP -d 192.168.20.210 --sport 1024: \
>                           --dport 80 -j DNAT --to 192.168.20.61:8080
>=20
> When I contact the proxy on 192.168.20.60 from 192.168.1.3 or from within=
 the
> the DMZ at 192.168.20.60 to call 192.168.20.210, nothing happens,
> nothing in the logs.
>=20
> What kind of problem do I have here? Is it possible at all to test such
> a prerouting-rule from within the DMZ or the local network?
>=20
You also need a FORWARD rule to forward the return traffic from the
webserver.

You can use something like ethereal or tcpdump to trace your traffic,
then you will see where the problem is.

Also, try usimg iptables LOG rules.

> Thank you for listening!
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-Dyu/9pNv3UxMLTUlM7JV
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/eQ9Ih1fuR/Bv+ygRAl3GAJ9xEUHP6ed+qxnlgc6E1lOyCBZSGACgolPd
gB32K6ThGgG1Sw+Zqu19vFY=
=P79+
-----END PGP SIGNATURE-----

--=-Dyu/9pNv3UxMLTUlM7JV--


