From: Stephen Frost <sfrost@snowman.net>
Subject: Re: dynamically update iptables with module ?
Date: Wed, 14 May 2003 08:37:30 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030514123730.GZ8524@ns.snowman.net>
References: <000c01c319a1$13883af0$95dc6f89@wonderland>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/ZPAxgSw4JMezHmq"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000c01c319a1$13883af0$95dc6f89@wonderland>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Calvin <calvinproject@ihug.com.au>
Cc: netfilter@lists.netfilter.org


--/ZPAxgSw4JMezHmq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Calvin (calvinproject@ihug.com.au) wrote:
> I am a newbies in netfilter, just a question in my mind, would it be poss=
ible to dynamically changing the=20
> iptables from a module? For example, if i see a paticular message from a =
pc, then I update the iptable to allow outgoing communication frmo that pc.=
  Or there is some other way to achieve=20
>=20
> Is it possible to do it?

You should be able to do this with iptables and the ipt_recent module,
assuming the 'message' can be matched using other iptables modules/rules.

> Or... is it possible that the iptables can be updated by a C++/C programe=
 by executing a shell script to update the iptables?

That can probably be done too...

	Stephen

--/ZPAxgSw4JMezHmq
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+wjiJrzgMPqB3kigRAnqMAKCRu4FvVpd1Te2hgTXBUe9ldkB/jgCbBOY0
K5bcoab62u9mjfXPxEZfHWc=
=wDwJ
-----END PGP SIGNATURE-----

--/ZPAxgSw4JMezHmq--

