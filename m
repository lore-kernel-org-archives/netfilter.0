From: Chris Barnes <runtimeerror@bigpond.com>
Subject: RE: newbie problem
Date: 17 Feb 2003 21:48:24 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045478904.21055.17.camel@billybob.back2front.homelinux.org>
References: <B848917C9D07D71199C5005004D778B8017B59@TELECOMS04>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-A1FJQl9kcht1zmOwOGfq"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <B848917C9D07D71199C5005004D778B8017B59@TELECOMS04>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter <netfilter@lists.netfilter.org>


--=-A1FJQl9kcht1zmOwOGfq
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-02-17 at 19:49, Eugene Joubert wrote:
> Is your webserver on your firewall?
>=20
> Also I would suggest moving your webserver to another server behind your
> firewall.
> Just my 5 cents.

The firewall is on the web server yes. Future plans dictate that we will
be purchasing new machines for a dedicated firewall and web server, etc
but right now we have to make do with 1 machine.


>=20
> PS:
> You could also set your OUTPUT Policy to default ACCEPT, but if your real=
ly
> paranoid then just make it DROP
>=20

Its is set to DROP because i am paranoid :) I'm so paranoid i was hoping
to get away with just the 2 rules in the table, one for web in and one
for web out but as Joel Newkirk pointed out i need to allow some other
"related" packets to traverse as well.

thanks for your help :)


--=-A1FJQl9kcht1zmOwOGfq
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+UL33Mutcjt77K+ARAiIpAKCeyDJgSx/Z5/dLEo0xU4SNP8bcWgCffEd1
8yiHxKhk45xizvS/dBVb/Wc=
=t4c7
-----END PGP SIGNATURE-----

--=-A1FJQl9kcht1zmOwOGfq--


