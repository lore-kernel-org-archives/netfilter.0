From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Change iptables log format (would be a nice feature)
Date: Tue, 07 Oct 2003 07:27:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065504467.2952.16.camel@raylinux.internal>
References: <Pine.LNX.4.56L0.0310021637520.11122@sutsko.kollegie.dk>
	 <1065456746.1189.32.camel@valhalla>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-6LvIlyggywMTrqf5YLsj"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1065456746.1189.32.camel@valhalla>
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


--=-6LvIlyggywMTrqf5YLsj
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-10-06 at 18:12, Chris Brenton wrote:
> On Thu, 2003-10-02 at 10:40, Lasse B. Jensen wrote:
> >
> > Is it possible to change the log format of iptables?
>=20
What about using something like ULOG?

AFAIR you can use ULOG (and ulogd) to 'redirect' the log to almost any
other format, including a SQL database.

> As others have pointed out this is not possible, however it might make a
> nice feature to be added in. I've noticed that in high bandwidth
> environments what chokes throughput the most is logging. This
> materializes as the boxes throughput topping out quicker as well as
> garbled/partial log entries being written.
>=20
> I *strongly* feel that one of Netfilter's biggest strengths is the level
> of detail in the logs and would hate to see that change. When your
> pushing high speeds however, your choices come down to collecting
> verbose info (and thus limiting throughput) or not collecting log
> entries. An option that permits a terse log format (say IPs, ports &
> transport only) might be a nice balance.
>=20
> Just my $.02,
> Chris
>=20
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-6LvIlyggywMTrqf5YLsj
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/gk7Th1fuR/Bv+ygRAlBLAJ9FWiVCFEaI0ebaTwppkkrBz8qKiACfduzv
qO+wd9b2W8equFLCT7v+964=
=Qryy
-----END PGP SIGNATURE-----

--=-6LvIlyggywMTrqf5YLsj--


