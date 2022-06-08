From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Possibly dangerous interpretation of address/prefix pair in -s
 option
Date: Wed, 8 Jun 2022 14:59:04 +0200
Message-ID: <d03f0dea-f059-6e51-493c-a8b3c702c4b1@thelounge.net>
References: <mail.629a20b0.7e37.7f80bf761b5d8a04@storage.wm.amazon.com>
 <010201812a0fb624-e64464be-4c31-4d01-afb6-1cbfab70e333-000000@eu-west-1.amazonses.com>
 <60e26dbd-93a8-1c2a-5204-66bbdffb1291@thelounge.net>
 <c4a18871-d4e7-ce65-eaaa-55c58b230077@gmch.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <c4a18871-d4e7-ce65-eaaa-55c58b230077@gmch.uk>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Chris Hall <netfilter@gmch.uk>, netfilter@vger.kernel.org



Am 08.06.22 um 12:38 schrieb Chris Hall:
> For input such as "-s 10.0.0.2/24", the 10.0.0.2 simply isn't a valid=20
> network address for a /24 network.
>=20
> I agree: the parser should detect invalid input and reject it.=C2=A0 I ca=
n=20
> see no good reason for being sloppy here

there is nothing to parse or interprete
/24 clearly says only the first 3 octets are the relevant
again: it's a calculation
