From: Diaa Radwan <diaaradwan@gmail.com>
Subject: Re: Transparent proxy errors
Date: Fri, 09 Jun 2006 17:56:29 +0300
Message-ID: <44898C1D.2020008@gmail.com>
References: <44365.10.137.2.111.1149854383.squirrel@mail.medcol.mw>
	<9255886c0606090507w7980d50es9d08edd12c89ee8f@mail.gmail.com>
	<448981AE.1080508@gmail.com>
	<55995.10.145.5.76.1149863766.squirrel@mail.medcol.mw>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig9ECF9D60CC9C9D50D9CF8C30"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <55995.10.145.5.76.1149863766.squirrel@mail.medcol.mw>
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
To: isaiah@medcol.mw
Cc: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig9ECF9D60CC9C9D50D9CF8C30
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Isaiah Makwakwa wrote:
> Diaa,
>=20
> How do you do it?
>=20
> Isaiah
>> Rodrigo Montoro wrote:
>>>   You can't use transparent proxy with SSL cause headers are
>>> encrypted and contains no useful data about destinations.
>> You can use it ,there is nothing will stop iptables from forwarding th=
e
>> requests to your proxy ports.
>>
>>> Regards,
>>>
>>> On 6/9/06, isaiah@medcol.mw <isaiah@medcol.mw> wrote:
>>>> Dear all,
>>>>
>>>> I have a box setup for transparent proxying. Since this happened I h=
ave
>>>> had several websites timing out.
>>>>
>>>> I have what seems like an SSL problem with many websites especially
>>>> hotmail. When one wants to log onto hotmail, the proxy gives "docume=
nt
>>>> contains no data reply". When I manually configure the proxy in my
>>>> browser, I then can logon with no problems.
>>>>
>>>> Could anyone help me resolve this?
>>>>
>>>> Regards,
>>>>
>>>> Isaiah.
>>>>
>>>>
>>>
>>
>>
>=20
>=20
iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT
--to-ports 3128

yes it's not important to redirect 433(it will not work if you will
do),it depends on your proxy server configuration you should allow the
433 for https.

If you are using squid I'll recommend you to have these options :

httpd_accel_host virtual
httpd_accel_port 80
httpd_accel_with_proxy on
httpd_accel_uses_host_header on

--
Diaa Radwan




--------------enig9ECF9D60CC9C9D50D9CF8C30
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQFEiYwmr6hbNdYtyWwRAoJpAJ9E3xKtUIePF9O8ywLntMJh7Z7KVgCglkkI
qkxUXc8avITI3oTWoelEGak=
=uiku
-----END PGP SIGNATURE-----

--------------enig9ECF9D60CC9C9D50D9CF8C30--

