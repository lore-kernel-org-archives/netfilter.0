From: Clemens <clemens.schaefer@gmx.de>
Subject: Re: How make virtual interfaces ( subinterfaces ) on linux machine
Date: Wed, 06 Dec 2006 08:57:51 +0100
Message-ID: <457677FF.1010605@gmx.de>
References: <428559.74702.qm@web56206.mail.re3.yahoo.com>
	<4575D2D9.4020308@riverviewtech.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig537E87833943109B16811A76"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4575D2D9.4020308@riverviewtech.net>
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
--------------enig537E87833943109B16811A76
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

>=20
> Then use IPTables / EBTables / ARPTables to your heart's content. If yo=
u
> enable layer 3 matching on layer 2 for ebtables, you can use IPTables t=
o
> filter bridged traffic.

this is very interesting, because i was trying to set up a firewall
on a vmware server (vmware creates a bridge, which is not a linux
bridge (so brctl and ebtables do not work on this) , and connects
all virtual machines to this bridge in order to give access to the
network).

i did the exact thing as you described, created a dummy interface,
bridged my eth0 via a linuxbridge to the dummy interface, and then
connected the vmware bridge to my dummy interface. that way, i am
able to firewall the vmware traffic using ebtables.

but now my question: what are you using the is there any advantage
in using iptables to filter bridged traffic as you noted in my quote
above? i use ebtables to do all the filtering in the linuxbridge,
and it works pretty well..

thanks for your reply,

clemens



--------------enig537E87833943109B16811A76
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFFdngEnDei4azjmoERAo73AJ9Y/y2VWhhNN27UwaWIIG76KDS2BQCfXBOT
iBg1sxOTat92o+7slLXlXqc=
=xEzd
-----END PGP SIGNATURE-----

--------------enig537E87833943109B16811A76--

