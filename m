From: Patrick PIGNOL <patrick.pignol@gmail.com>
Subject: Re: dnat port range to single port, udp, between two local machines
 on a LAN
Date: Fri, 3 Feb 2017 17:33:46 +0100
Message-ID: <3640349f-8b7d-1214-8862-dbccc73b404e@gmail.com>
References: <CAM9he-WzEXUf-oWa3yV6-raXudF6ce2TYn2qFbiq4xXDVx_5nw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6qs1eH7auGwJmJX2sdWsM9TsXrRgai8EF"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to;
        bh=mjI4nO6A5dgErxNUn0qM7nY0/rXFoAp6MIHN5x6Tn+U=;
        b=AgvLT0qkEuAAv3cdgguIOW1wWtBLTZzwt6CiHvSenxhblGQlE+JkcCelaUrFj+OSWh
         4N7ZBBRlZw9u8M06FYkPXjMYHN2e9LmlJOdDt4up6bqwnSJU5MckHPTf0WRWx6WZ0YZt
         VlodTXtv7035UTSx5Ex8BmNqZuBhnkOXr9gAHCc7xCY/jwsfZ/IRhZaWJn8ZRowOobk2
         rnlHr7MeHoU4SNnFy2HjV9zWwtBDiPF+uW/7yCx2XZCXUBpw22VWP6jtFP82XVpSe5M9
         8tK7hG5Vmw5nHlDw37aqvS8lNdFhVGSR3oD3dKDAeNKqLMIosaIcou9yGxfa6lE3I8af
         Rsmw==
In-Reply-To: <CAM9he-WzEXUf-oWa3yV6-raXudF6ce2TYn2qFbiq4xXDVx_5nw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6qs1eH7auGwJmJX2sdWsM9TsXrRgai8EF
Content-Type: multipart/mixed; boundary="adNqEhNi36nM79c9dBWk5qQKlF2ReUMLL";
 protected-headers="v1"
From: Patrick PIGNOL <patrick.pignol@gmail.com>
To: netfilter@vger.kernel.org
Message-ID: <3640349f-8b7d-1214-8862-dbccc73b404e@gmail.com>
Subject: Re: dnat port range to single port, udp, between two local machines
 on a LAN
References: <CAM9he-WzEXUf-oWa3yV6-raXudF6ce2TYn2qFbiq4xXDVx_5nw@mail.gmail.com>
In-Reply-To: <CAM9he-WzEXUf-oWa3yV6-raXudF6ce2TYn2qFbiq4xXDVx_5nw@mail.gmail.com>

--adNqEhNi36nM79c9dBWk5qQKlF2ReUMLL
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi

why DNAT(3.3.3.8) retransmit local address  of the sender(3.3.3.7) to
the listener(3.3.3.9) ?

I think DNAT must act as a proxy and talk to listener as he do the
request. And retransmit to the sender the answer from listener. Else of
course it issue the picture comportment (what the hell do you want ? I
talked to DNAT ! Why do you answer ?)

A litle bit like you do with me .... ;D

Best regards

Patrick


Le 03/02/2017 =C3=A0 17:04, Brian Bostwick a =C3=A9crit :
> Thanks for the help! I realized that my goal is not attainable because
> I do not have control over the initial connection. I believe your
> suggestion would work if that weren't the case.
>
> However, I came across this picture, which seems misleading. It is an
> example of how not to use NAT, which is admittedly what I am doing,
> but it suggests I can change the destination. Can anyone confirm that
> it is just meant as an illustration of why this scenario is improper?
>
> http://inai.de/images/dnat-mistake.png
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in=

> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--adNqEhNi36nM79c9dBWk5qQKlF2ReUMLL--

--6qs1eH7auGwJmJX2sdWsM9TsXrRgai8EF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYlLDrAAoJEFLgSl/sQy9LZWAP/A1PJ1DYoe4uG+O/2S2eK2Kr
07Osa1ksffSj0JuoaaedfZllqobjB0PEFSVDZwI2Im45wZ9idDGp8BRA1UnQ0fHW
/Cs2rfONM7GpzikBeW6ZPdXYIdLAPWQpSJUNxaKwLOD7a24yvv0q3DnDQi5sCJ7x
mGLSbC5MtUOhwd8skdy/HDBtxFh/FJKMhAWEDaCEmV/TsmJnTMtUaD+pGt/BBl3w
gzF4SpPi69SkomwYTdEcXx8esIbpdd7ek5HZYaNE8YTjwNFpBrySWRpp+x6UQaGk
XPIbvZ8Zz1K5ol6wLZGCV4ftt1QXEGTopIEf2PbLt6vpjHDbBK9zaC7MdNis0ge9
y0J/lhWo4E2e+E5+II/uecY1Is9/LAiaFAjU9HeEDHIxNWE6ozMQWOprbRSG5x7X
41CVHvtKV4cViPhlMRULaBdFCk7LqsjLEbXwSeFX8lUimnuZIBuEhODxvLHyOpKZ
3EdHEjoeKW8+qiKkEYl5Is9oqIGnDizxRS7GGiDRxDGyT3VIHe5me175jHSYFgYl
cB+iVjDi/xMHG6tT5tnM3pIloGGSp3duPuiPf7RuXn5nYDV3DZJ0QmNfk6ace9yg
JY3XaYZdCAFxxVEPZhiAXZXV0/ixIMrKMDgcZxPVYA6anakdMCgFIMjS78FfdNO1
8oRfNMWaLBmX29TIrivu
=zcTR
-----END PGP SIGNATURE-----

--6qs1eH7auGwJmJX2sdWsM9TsXrRgai8EF--
