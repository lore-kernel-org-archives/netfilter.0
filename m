From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: RE: Windows file sharing over different subnets
Date: 29 Mar 2003 09:50:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048924202.17839.96.camel@raylinux.internal>
References: <7C9884991ADAE0479C14F10C858BCDF5122DA7@alderaan.smgtec.com>
	 <1048923066.8358.36.camel@psyche>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-MNBONFEOBYONRN4Snrjl"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1048923066.8358.36.camel@psyche>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Mailing List: Netfilter" <netfilter@lists.netfilter.org>


--=-MNBONFEOBYONRN4Snrjl
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, 2003-03-29 at 09:31, Y Makki wrote:
> Hello,
>=20
> Just thought I'd post to let you guys know how I got it to work.
>=20
> On the Linux side, 2 simple things: enable IP forwarding and make sure
> it's -P FORWARD ACCEPT or add 135:139 + whatever relevant traffic.
>=20
If you use Win2K and/or WinXP then you should also add port 445.

> On the Windows side I removed netbios/netbeui from all 9x clients, and
> checked 'client for microsoft networks' in bindings under tcp properties
> for the ethernet adapter.
>=20
On Win9x it is impossible to remove Netbios/Netbui. Even if you remove
the 'service' from the network setup, you will notice that on the tcp/ip
page the option to select/deselct netbios over ip is disabled. That is
because netbios over ip is required by win9x for file and print sharing.

If you disable netbios over ip on win2k and/or winxp, then they use port
445 for file and print sharing and they use ip instead of netbios
tunneled in an ip packet. However, this will result in win9x machines
not being able to see or connect to your win2k and winxp machines.


> With this you can browse computers even over different subnets using
> \\IP, or maybe add netbios names to lmhosts on each machine (which I
> didn't bother trying). I took the other alternative which is install
> Samba on the router and have it run as a WINS server; everything works
> like a charm.
>=20
> Thanks for the suggestions/help everyone
>=20
> Cheers.

<<snip>>


--=-MNBONFEOBYONRN4Snrjl
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+hVAqh1fuR/Bv+ygRAqA0AJ99YsRoHA+nIrqLajCRREnAMt4YgQCeJUCE
bJ+MRWOsv0EWvB3/Zshf7P0=
=3Hu9
-----END PGP SIGNATURE-----

--=-MNBONFEOBYONRN4Snrjl--


