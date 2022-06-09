From: Joshua Moore <j@jcm.me>
Subject: Re: Possibly dangerous interpretation of address/prefix pair in -s option
Date: Thu, 9 Jun 2022 12:21:58 -0700
Message-ID: <E24384BE-A4C0-491D-8876-C43BA0DAF4EA@jcm.me>
References: <3530fa1d-0ce3-37a8-884d-921907b780e2@thelounge.net>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jcm.me; s=google;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=ib8Zi94NZ/tWwfswcF7C3JQ+L6zJ5Vk76Lz/o6hnIV8=;
        b=MVlbUI8byMIown732ALH60V+qvQlEm6j8LQNpOdpLGborBm389aTyw98UVX6rWtzm1
         tKjWqCXPgpxsxojCaTWcty+C4XmTSQ/yKka4h0CLE0SoQBRi7c7IDI+xTx+aag9j3laA
         zjokjIPlScLROqK8rtx03emjw9Q8OitIpm1XA=
In-Reply-To: <3530fa1d-0ce3-37a8-884d-921907b780e2@thelounge.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Reindl Harald <h.reindl@thelounge.net>
Cc: Chris Hall <netfilter@gmch.uk>, netfilter@vger.kernel.org, Florian Westphal <fw@strlen.de>

Agreed as a user that netmask =3D=3D more specific filtering. No netmask =3D=
=3D use the /32 host as presented.



> On Jun 9, 2022, at 12:11 PM, Reindl Harald <h.reindl@thelounge.net> wrote:=

>=20
> =EF=BB=BF
>=20
>> Am 09.06.22 um 19:52 schrieb Chris Hall:
>> I am hoping that it is agreed that it is a mistake for the parser to sile=
ntly accept unspecified input
>=20
> it is *not* unspecified input
>=20
> with /24 you *clearly* say "only use the first 3 octets of the address"
>=20
> when you use a netmask you are supposed to know what it does and if not ju=
st don't specify it - the address alone would have had the assumed result
>=20
> it's dead simple and there is nothing to agree
