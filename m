From: =?UTF-8?Q?Pawe=c5=82_Krawczyk?= <pawel.krawczyk@hush.com>
Subject: Re: Lint for nftables
Date: Mon, 3 Feb 2020 13:14:31 +0000
Message-ID: <49eef164ec814a8cd1b3835d366a3f7d@smtp.hushmail.com>
References: <e94e649a-0d30-6fd1-4144-4bb73564d0ff@satchell.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------F0CCECBC09F6838C78357428"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=hush.com; h=subject:to:from:date; s=hush; bh=rPcPhXawpfec3w6WBGo+RGFmIHImBbN9Ja9+WVvm2SM=; b=H5ylOMWgeFfmYUQknMRb9p61Ep5XZKr0d9qqcFYa/FDJIE8OcxPqskSt51PB9l5piyWNRR49RWikmwDY/mdB7aYKdaXcCYIe9caJn6k6kPzTzVl0q6BviDzfciVQ58v7YLejxKK1N+syZSsKQlpTFWoVMeBWAVVfVHYPF1pN2dHxAqht6T+5UVfx1ctmnfmJ/JJzdHZjoCKRHI1mfqJ+tChORN+EdleX/OCnNv4yvGKv8RwirawcVIOsrCZTNaX92gRIQw9H1VTe+WZSnVKJ/bo2+nuvdhRROdAuQw2FBROVefTZQc8EKAw9b1DATPEzo5dAfyswpjhOxcNz5uSxEA==
In-Reply-To: <e94e649a-0d30-6fd1-4144-4bb73564d0ff@satchell.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: list@satchell.net, netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------F0CCECBC09F6838C78357428
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/02/2020 19:23, Stephen Satchell wrote:
> Is there an equivalent to lint(1) for nftables?=C2=A0 One that, instead=
 of
> just saying "you blew it", it shows where you blew it and what it was
> expected.
>
nft --check --file nftables.conf does a pretty good job already.

Just make sure you have a recent version. What's being distributed in
Linux distros is usually out-of-date with long-fixed bugs still present.

--=20
Pawe=C5=82 Krawczyk
+44 7879 180015


--------------F0CCECBC09F6838C78357428
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

mQENBFg5z8kBCACs2svy+XIZvNoP54dOXNjq1WABvm7NMy7xWudMxw2tvMVa1Fgh
shRC61ivjoNH21i12ELqmPeSwJFQefecDyssOR8+W7AIhYsHUdM1VnZsorzGZdyc
oomwWYusv1BBeGTInMdpLi35oK0gxg2BjAASWodo/aJwnNss4rSklWzsK9pCnDbM
7dhDuR3hvd0Jf2AhE8OmlZBvBkWEGNXgNzoUslf/mcn/iJIvUjxsI22Qm3nAfaRM
Ex9WeS9ujEgX2CtM93Y31Aou80Ok5IxgpepuQ29rKjmZxNmYeb39hBn413SGEqnn
RQeA6BogxhQajOIGqEdLhToLJNS+zy5AvKGZABEBAAG0M1Bhd2XFgiBLcmF3Y3p5
ayAoYmFja3VwcykgPHBhd2VsLmtyYXdjenlrQGh1c2guY29tPokBNwQTAQoAIQUC
WDnPyQIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRDWDU3qNHr5qlLTB/41
LIqh80n0bYO5TML4RZi6FuUlMSzhiIw9llWVyM1GgSjiAkA6KGO1z3nR6/NHOJ1l
+HtSwr3LsVXsnjwy+krNWgGRTDlxdPATy2T8fpgyALP8PPHArHj9/rKmXdlepTdk
Om2+5TFnChOCA2TPHa/YhN5b1TQ2iBjmrHXCWcA8DiwIlTCJpu76Pmv3UIRg+wgz
ussEgf97dkSR6nV+ys7xiHMGc22TLnpts01p1RjM9/8TyhJmABzj3YQNUEDrRPON
XhZT7+OXn/zKZBLWJGqnroZ28CDrp+eLsXhSYXkkKD9wzkrDAdpkwCg1MvJNdxYU
QyeNoRmZ4+eLftvMDNSiuQENBFg5z8kBCADN5vApPqbAGPSesDMiaQEZIRf9eNU2
rRp3zmnQ+sR4Q8mImUftXtMS1/riffOlyBAPNFE7E8PxdXxp4OzcYzbf2IElfHje
W5ldfrgYebfhkmA/qxNop6Z2ImhkFS0lWc4lfrIhRtt9E0AFeIFX8sxAhRBbBxRE
UWHSfJODf3uYCT74B5cO0U+e9i2viuXj3qEcgfuwVv110yioJmX00XvrcvSTUgsF
tPVpAmtqhINZblGBcv6T2/TF+ILLP8vFt2Oi6D6lDctg5M7TLixvMURe0g5CSwO3
g28yWG7HIsuhgMtdw7UtGKp6FKUG1ws1P01toDfMyJ4V7kZD54zGMukNABEBAAGJ
AR8EGAEKAAkFAlg5z8kCGwwACgkQ1g1N6jR6+apPuAf/YRbHgtJPDqqtx8wfn0yv
BOB3GvwerXcrCHMZk6qznKiZ/zWyF6WokCIfBtB8M2uGg/R8NYTXRWqKwnL/txRV
LNEOw9JyztM8oz6ltHEUW+4t1LYuweiEjxu0K7sY8bB1SRvwJ59mHzY6SZ+sn4Dn
r+yCNRXamSk1YAJ3A5NMzR35c1aKwxK9/XRrP5qQWdBiTkEOCU4M8Aqvpj4V+kgQ
cxJOmkzvEK5kEF7+xNZti2gNewxzto4DmcWXbZed2DSjw5VcDoH1DKsGYMRs8Sa9
lRLPQFDZZe/Fjxt/ecFvt/0QJQmw9EZQxGtzZAyoyT05EPBYr4VnTBmTYU3IvBPX
nQ=3D=3D
=3Dpz1+
-----END PGP PUBLIC KEY BLOCK-----

--------------F0CCECBC09F6838C78357428--

