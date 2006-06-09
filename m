From: Diaa Radwan <diaaradwan@gmail.com>
Subject: Re: Transparent proxy errors
Date: Fri, 09 Jun 2006 17:11:58 +0300
Message-ID: <448981AE.1080508@gmail.com>
References: <44365.10.137.2.111.1149854383.squirrel@mail.medcol.mw>
	<9255886c0606090507w7980d50es9d08edd12c89ee8f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig09333E0B37F414B15E77E7C2"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9255886c0606090507w7980d50es9d08edd12c89ee8f@mail.gmail.com>
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
To: Rodrigo Montoro <spooker@gmail.com>
Cc: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig09333E0B37F414B15E77E7C2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Rodrigo Montoro wrote:
>   You can't use transparent proxy with SSL cause headers are
> encrypted and contains no useful data about destinations.
You can use it ,there is nothing will stop iptables from forwarding the
requests to your proxy ports.

>=20
> Regards,
>=20
> On 6/9/06, isaiah@medcol.mw <isaiah@medcol.mw> wrote:
>> Dear all,
>>
>> I have a box setup for transparent proxying. Since this happened I hav=
e
>> had several websites timing out.
>>
>> I have what seems like an SSL problem with many websites especially
>> hotmail. When one wants to log onto hotmail, the proxy gives "document=

>> contains no data reply". When I manually configure the proxy in my
>> browser, I then can logon with no problems.
>>
>> Could anyone help me resolve this?
>>
>> Regards,
>>
>> Isaiah.
>>
>>
>=20
>=20



--------------enig09333E0B37F414B15E77E7C2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQFEiYG0r6hbNdYtyWwRAqymAJ9P8+Eg3yvVrmgG5PiH84V1W7h0xgCeMlNw
G0mvs/+6Nj5RTy+ATsFI1VA=
=Jina
-----END PGP SIGNATURE-----

--------------enig09333E0B37F414B15E77E7C2--

