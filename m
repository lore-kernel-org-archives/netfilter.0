From: Martin Bednar <martin@serafean.cz>
Subject: Re: recent module in nftables
Date: Fri, 28 Jul 2017 21:57:25 +0200
Message-ID: <1889595.mTRbqK2Shg@ged>
References: <20170727155959.758138ab@lustre.ryper.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1569930.eLx79itMkQ"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=serafean.cz;
        s=default; t=1501271846;
        bh=NRqOfAzohzIGLEeMc2iRAYTqwgSHBGVv0Ov4eMP6Wn0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=oUlbacAui1cM2gkBM1GloKS8D/vRS15GGwZYQ4zlBZ4nq6ihXnfpKH15YSadlib6i
         ZptcDdX06n7GhNNqlyMC5zlvWok+ig6pC21USD5Sp/1IkX43r8Fj9xr2BBxzly6JwT
         V7BfWPKU/F4neELpJOu88UpXfMbAVlIwoGcsUxHnGgNnMG83GJYxPjIdvN7RqAmOfp
         1Fe1W6W4cKTahjt017FgtUYAe9f+iRGvucn/b6reewDfxPNF+Sh5x6jLbOhMVwuXkW
         bIW83xfUMMj2C0LxfnsEC81VTuv/s6w2hywWtlo4xkUXFW8rYAXZKJwmXGtks+vBYi
         fsfwyn2L1jPYg==
In-Reply-To: <20170727155959.758138ab@lustre.ryper.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Perry Thompson <contact@ryper.org>
Cc: netfilter@vger.kernel.org

--nextPart1569930.eLx79itMkQ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, 27 July 2017 22:59:59 CEST Perry Thompson wrote:
> Hello all,
> 
> It may be way to early to ask this question, but I thought I might as
> well see if anyone has any information on it.
> 
> Will the "recent" module or an option with a similar function be
> introduced into nftables in the future? Are there any plans to create
> something like this? It has always been a very good tool for keeping
> bad IPs from touching my system.

I think flow tables might fit the bill.
https://wiki.nftables.org/wiki-nftables/index.php/Flow_tables

I use them for filtering out SSH connection attempts, by allowing 3 SYN packets 
per minute.

tcp dport ssh ct state new flow table ssh { iif . ip saddr . tcp dport timeout 
1h limit rate 3/minute}  accept


Cheers

Martin.
--nextPart1569930.eLx79itMkQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEc4qICSCF6A6uJsjhjKnpFNspBXIFAll7lyUACgkQjKnpFNsp
BXLwSw/+IE0wwxhXEmUOEnqqM1kTJo2FBqIiHdDU7N0Djw9+S5l4BJ626+NpseXB
qERsgjXzoOSZ3ZknAMHvnSYIGFgCxHLj8rcV2ysR+0ZQvV/iyeAAlSXY8hV8MAAt
PX32kQ3ccTJqtBruZaI4DD0z50zDIavEFu1T0Lz60mVC75sCKqPNRm8lKdGptI98
uPqb7zac6hNssX0vvr9GUUIXEHk+gQ73CBVjAQ4CzhLh+Nwb4be8ebzQPylvMDp/
yeOBypX+Vh4+YJVuT+EodRiEpFapumMQ4RTnJ5z7S+lixtlGKb5G5uQ2nRTyscrC
kjKrZvWPuwqULtGFHd0R1YOM02RYuY33/mkGKb0WTuC9hNeEDir/NaFw86om8BZ9
S2dB/XzGKYzvqt6P4+4RY++364/3O1vAQmBw36bWTs3YKqegLrtOrsSe5khJFnb8
zJZnXXhbIoq/672PGKZrIrKpnu21lgL046/vXwJEaaYSSOTtC0azc9i/72gO1iby
gejCXp0QXffPDFpkwKbLgMNcMwhNL0THAhHLqmt2hOYL9ha1P9y59bFSn+8csQHp
Jhq4bh/3k5+xdyTq9RSvj6u4pAEinnytYBk3abFqnX86sq4a6YBlgkiV7XTCthKu
XKbRDAgLUJ3KTn9mo2yOYkfMocjCA2ikBRgaxP5WmGXEVCrUAfQ=
=G8Q6
-----END PGP SIGNATURE-----

--nextPart1569930.eLx79itMkQ--

