From: Ted Kaczmarek <tedkaz@optonline.net>
Subject: Re: how can I improve the throughput of linux firewall that use	the
 netfilter + iptable
Date: Sun, 26 Oct 2003 09:27:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067178467.16453.69.camel@tarkus>
References: <6257303.1067001733624.JavaMail.postfix@mx17.mail.sohu.com>
Reply-To: tedkaz@optonline.net
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-VIea+4KVCIDaRMz8Gjv1";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <6257303.1067001733624.JavaMail.postfix@mx17.mail.sohu.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: zhaohui_scu@sohu.com
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>


--=-VIea+4KVCIDaRMz8Gjv1
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

With any newer box and good nic cards the performance should not be an
issue. Even adding QOS with the htb qdisc should be no problem for 1000
simultaneous streams if you set it up right on say a p3 1 gig.

You may want to throw a squid box into your mix if your router/firewall
is say a 486, and don't use a 486 for that :-)

Ted=20

On Fri, 2003-10-24 at 09:22, zhaohui_scu@sohu.com wrote:
> I want to use the netfilter+iptables for my company's local_net.
>=20
> but I have read the following words on some webpage
> "we use linux as our router. i just tested the performance of the router =
with smartbits, and i found that the throughput of 64byte .and the result i=
s not good"
>=20
> we have not the smartbits
>=20
> but we want to use "iptables + netfilter + a normal pc with two eth " for=
 our company
> there are about 1,000 PCs in the local_net
>=20
> what can I do to improve it
>=20
>=20


--=-VIea+4KVCIDaRMz8Gjv1
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQA/m9njiZhiYWDacWIRAnDFAKDqjPn66p6xkz/XBsMQqPQAVQznPgCgsXqj
546/my+ggoXAIiL1Vj4vdHE=
=W7i/
-----END PGP SIGNATURE-----

--=-VIea+4KVCIDaRMz8Gjv1--


