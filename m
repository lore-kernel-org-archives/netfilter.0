From: Andreas Hainke <andreas.hainke@foteviken.de>
Subject: Re: Rule for PROTO=139?
Date: Tue, 6 Sep 2016 13:25:19 +0200
Message-ID: <b7ea09dd-171a-1969-efbb-5604bf1bb8fe@foteviken.de>
References: <562f1fbc3e658613eafdd2c6f5200be4.1473159539@squirrel.mail>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="OBdUCOni1HlIE7HjphsBN3NLKSGkBhuuC"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <562f1fbc3e658613eafdd2c6f5200be4.1473159539@squirrel.mail>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "Walter H." <walter.h@mathemainzel.info>, netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OBdUCOni1HlIE7HjphsBN3NLKSGkBhuuC
Content-Type: multipart/mixed; boundary="iFMfF2nwjI5WfM03s3IEgalGqN2Nn2mKX";
 protected-headers="v1"
From: Andreas Hainke <andreas.hainke@foteviken.de>
To: "Walter H." <walter.h@mathemainzel.info>, netfilter@vger.kernel.org
Message-ID: <b7ea09dd-171a-1969-efbb-5604bf1bb8fe@foteviken.de>
Subject: Re: Rule for PROTO=139?
References: <562f1fbc3e658613eafdd2c6f5200be4.1473159539@squirrel.mail>
In-Reply-To: <562f1fbc3e658613eafdd2c6f5200be4.1473159539@squirrel.mail>

--iFMfF2nwjI5WfM03s3IEgalGqN2Nn2mKX
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Walter,

as far as I know you can use the -p <protocol_number> parameter using
iptables.

iptables -A FORWARD -i br0 -p 139 -j DROP

If you are using nftables

nft add rule <table> <chain> ip protocol 139 drop

should work.

Regards,
Andreas


Am 06.09.2016 um 12:58 schrieb Walter H.:
> Hello,
>
> does anybody know with which rule I can catch these entries:
>
> [317607.438061] IN=3Dbr0 OUT=3D MAC=3Dff:ff:ff:ff:ff:ff:4c:72:b9:56:16:=
3e:08:00
> SRC=3D0.0.0.0 DST=3D255.255.255.255 LEN=3D72 TOS=3D0x00 PREC=3D0x00 TTL=
=3D255 ID=3D1624
> PROTO=3D139
>
> Thanks,
> Walter
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in=

> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--iFMfF2nwjI5WfM03s3IEgalGqN2Nn2mKX--

--OBdUCOni1HlIE7HjphsBN3NLKSGkBhuuC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJXzqenAAoJENMia1VtPcvYeBkP/RdoxhMTkKBq9twmBgr0PkPx
GgrfY7/LQhVHfXTKoWYv/E9lNyn6UV70NRVA1Zt4AqOPZo67MhGWnnMKJ3ENthHL
rRSOx+0hVXCqTrMzpMSIlF6xAeVfPZ/1asHoRr4nL685NyRrWUsprko6YDWu8Tzi
dyDdGPIFU0rl2F3fvH/xhC6aR4r5jvMMm3100w1ZSdFTVtx4N69Vno6amRw1puhW
qfaRRYvDD2uONLiNXA2/8lcnCSHAD8DNg3147iXsk9ebF+eUzQQMX2bMTZBQV7Hp
AK2bUnRbYpqS8RsRdYHW22X3v30gxIe6CiIIGmBkrpe4zeaSRy9/czCey2m8EW8O
MTk5QBHYACKDxP9TnQvE5vAqERroL/s6lZlPQvH8yzzJfiSFLEk0Vz+v2huWXfF1
iNltY66pyyGWn/ZNUP3+i2z1xSyBWFbXcLZTD4W/YkFUMqx0RGF8vIJFXVQ8VZDt
HDFOxNhr7jozJQ70AlW6G7sZ6SnSoe/Lz70qPOe2qUyNcj/DSv+RQFotw03ps9wh
XjTFrQjPZH1CLpxpgMWEjJoUJmLu3iy8uF97sv6Gs0iCVRgaPt63fxFvQlP3lB2y
02B+3Q9wOeuY20n/WEkzXx8MAUTQjcDPYCHcUT36Ybi/lv9WLxbfWFpQrjz3i5OK
a7bRbl+6qtR7uDQBKLMa
=r+w/
-----END PGP SIGNATURE-----

--OBdUCOni1HlIE7HjphsBN3NLKSGkBhuuC--
