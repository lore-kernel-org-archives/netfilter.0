From: Clemens <clemens.schaefer@gmx.de>
Subject: Re: Marks set in PREROUTING got lost
Date: Thu, 28 Sep 2006 18:06:48 +0200
Message-ID: <451BF318.2010200@gmx.de>
References: <451B0E63.3010806@gmx.de>
	<Pine.LNX.4.61.0609281029430.21498@yvahk01.tjqt.qr>
	<451B9794.9090209@gmx.de>
	<Pine.LNX.4.61.0609281253020.30351@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig6A4A1D3D4373C80BAFED6454"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0609281253020.30351@yvahk01.tjqt.qr>
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

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig6A4A1D3D4373C80BAFED6454
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

> -j MARK =3D> per-packet
> -j CONNMARK =3D> per-connection

thank you

>=20
>> through a certain user defined chain. I guess this is a mark per packe=
t.
>> The particular chain lookes like this:
>>
>>
>> Chain FWD_WWW-101 (2 references)
>> target     prot opt source               destination
>> ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           quota:
>> 100000000 bytes
>> MARK       all  --  0.0.0.0/0            0.0.0.0/0           MARK
>> set 0x65
>> ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           quota:
>> 1000000 bytes
>> MARK       all  --  0.0.0.0/0            0.0.0.0/0           MARK
>> set 0x1
>=20
> MARK is only allowed in the mangle table.
>=20
Yes I know that. The abstract above comes from the mangle table, the
name of the userdefined chain (which I jump into from PREROUTING
mangle) might be a bit irritating, I admit, but it has nothing to do
with FORWARD.

> http://www.imagestream.com/~josh/PacketFlow.png
>=20
> PREROUTING comes before FORWARD.

Yes I also know that. The Packets get marked correctly, I checked
that in FORWARD filter, but in PREROUTING nat they are not, even
though they should have been, hence I cannot dnat

--
Clemens


--------------enig6A4A1D3D4373C80BAFED6454
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFFG/MYnDei4azjmoERAvKPAJ9a3J4wJP28NGC3E4Ebgj7TE8r+lACeNyY5
w4X7lFu/47dUP3gsYPAISJI=
=0ZYw
-----END PGP SIGNATURE-----

--------------enig6A4A1D3D4373C80BAFED6454--

