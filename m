From: darius <dram@mailbox.org>
Subject: Re: Metering is not working with dynamic sets on nft v0.9.2
Date: Sat, 8 Feb 2020 22:49:06 +0100
Message-ID: <6be894ad-b817-6c14-365c-21d068eaa261@mailbox.org>
References: <8665bae3-ba91-2699-15ea-27d256d9bcd2@mailbox.org>
 <4d26b387-5466-d57d-6191-dcbe8926ec01@gmx.net>
 <20200207101740.GC6466@breakpoint.cc>
 <89800836.90200.1581073253643@office.mailbox.org>
 <20200207110626.GD6466@breakpoint.cc>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="vwuODqxpdj8V0kbXTO7DfbHlfojxfke19"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-type:content-type:in-reply-to:mime-version:date:date
        :message-id:from:from:references:subject:subject:received; s=
        mail20150812; t=1581198670; bh=lIbCAz1IMi6ma16/yi153F0NkI7e+3UXM
        cuIM+e+X/M=; b=tWKcUtr86REku5yNzu5gqRjuSJaRQFF8DYt6jR/EJcSoSV+KT
        QJKxQBnrcJL8QCivwGDpbRMhlKdoV73HebAhMYvE1qTKoHBdy4JA/jta6ZyIW2ix
        z8metnoeziAuwn22X6x91SjZdUIig7X6PEINh8ezMJOKj8oXV8+hQtARAo0/UCfg
        gyJtDph2DrOy9rSvqBpOvuAop7bU3UISIt0ay4E9auJGI2BuPHQ93cbOyYwEDQca
        y6QonuLNPPDDeNjDIxPwKC9m9O7xYPGrQ57svwAPuHCOmjYlgGDzVUS7zBRUQ5Ul
        h317zgW9SnGeBkFIdlMV0PXMWij7dgzx3CBrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1581198671;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
        bh=8Yaa3FbJXEgjKAkMS0TveIM30hTmlTYCR4RDPcSLwuw=;
        b=V6qhRfEksKy0SWkUUD8WwCGNW0r+lPdNXmWTWc1quQHH01BIL9UlT+JZuT4pou1/ij0k/0
        +/zRNXeFPzd1cAkqXyebMzTykoA6F7O9z/I7gnoqHGcvGNcGPSTfCR0LL8u0N1m236Q4yP
        +AmK6JM/m/M9epQBa8pB5ATqTN79XCkS2wge2ZPdDKQazOqrMmN+LCtJF6yspPehqhQG6w
        1JGx8HC2tMUkKDsAlw5Y7lWz9VGEOljVO+sqdRfU3rV8SY9sZohl4ebbS7XAhV468EtAit
        6nZoCL5ewn1gN3doD5QPmgVMQWLtzTnjVGoK/cK2Ta0AE2Kco3C7vgWADd13QA==
In-Reply-To: <20200207110626.GD6466@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Florian Westphal <fw@strlen.de>
Cc: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vwuODqxpdj8V0kbXTO7DfbHlfojxfke19
Content-Type: multipart/mixed; boundary="iCkCAOD0pIe0S4IuaTLdAdZAb78bzJ19h"

--iCkCAOD0pIe0S4IuaTLdAdZAb78bzJ19h
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

I have checked link provided by you. This patch is already implemented
on 4.14 kernel that runs on OpenWRT, but that does not help with the
error. I still have fault.
Any other ideas where to check? Just would be nice to find where is probl=
em.

Regards

On 07.02.2020 12.06, Florian Westphal wrote:
> Darius <dram@mailbox.org> wrote:
>> Ok, I'll keep using 'meter' keywork. Sets are working just perfectly, =
all sets instructions works as well.
>>
>> But do you know if it is only 4.14 kernel affected? Is there any bug r=
eport and patch available for this issue for kernel 4.14?
>=20
> No idea.  I suspect its this patch:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3Dacab713177377d9e0889c46bac7ff0cfb9a90c4d
>=20


--iCkCAOD0pIe0S4IuaTLdAdZAb78bzJ19h--

--vwuODqxpdj8V0kbXTO7DfbHlfojxfke19
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEsTT6a9w8eWH3N7FdweSUJGHD1ZoFAl4/LNsACgkQweSUJGHD
1Zo5Egf8DSSlZHiTPXn63lNdRkKl9Tv3GwgnI9ElalRT/6WFrQtYhm8xg4grnI3u
tyHY2Lqp2tMrta/dL9fItDJ/yd/yPwKUlDivEEMdliKscU79MAtmdzb0HKk28PYb
ZnlU7TT8KsBBSkmO4Xz52pcBklwGGOtdZmtNd1Jz2IPePDFgBH4+Gflo1eid63ST
5gQMOVMpj2Lho2mYDJxJuY8wcCx3d3+D0UBex5Kg/yNVrjJuYeGe6wS4S6teLH4j
/SrGhf+fWxtz+bX5nLB6Nx1e797UVth2UIQbL5AaKV12yEzUxfQTqteLFbh59E76
mc5V9+hIzJs/Qua5weo/FPfHOVplag==
=TkNm
-----END PGP SIGNATURE-----

--vwuODqxpdj8V0kbXTO7DfbHlfojxfke19--
