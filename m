From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables] cross compiling for arm-linux-gnueabihf?
Date: Sun, 15 Nov 2020 16:32:00 +0000
Message-ID: <3aca7e1d-ffec-d38b-7506-a162821ab0ab@gmx.net>
References: <c664d562-3bfb-1768-554e-da73b05a209e@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LLXFHosBdoMljkRXGkCpj0J5YzJlqu6fA"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1605457923;
        bh=e2DpX2J7H643gmD6VweGmshTj+4MpyNDflddZsal8us=;
        h=X-UI-Sender-Class:Reply-To:From:To:References:Subject:Date:
         In-Reply-To;
        b=Mw4EoY/pHXvAjDVxeHOIV17YMWTcH56ydcVK22Yuxk6bQzcZYAYVrGTexHA8mt/hI
         quze/DUYRuTegysaIyqIklv0aRQi8xMMMN60ynZYpQNFHx3Nl86EwDXnIrK7viDUJu
         iJlS/rOMqWASIKes+7b2th7FqXtd4C3IMDbG3pfQ=
In-Reply-To: <c664d562-3bfb-1768-554e-da73b05a209e@gmx.net>
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LLXFHosBdoMljkRXGkCpj0J5YzJlqu6fA
Content-Type: multipart/mixed; boundary="QLbDDEYTUW3x6XZkssUk1GAwW8xJagTT3";
 protected-headers="v1"
From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Reply-To: vtol@gmx.net
To: netfilter@vger.kernel.org
Message-ID: <3aca7e1d-ffec-d38b-7506-a162821ab0ab@gmx.net>
Subject: Re: [nftables] cross compiling for arm-linux-gnueabihf?
References: <c664d562-3bfb-1768-554e-da73b05a209e@gmx.net>
In-Reply-To: <c664d562-3bfb-1768-554e-da73b05a209e@gmx.net>

--QLbDDEYTUW3x6XZkssUk1GAwW8xJagTT3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB

On 15/11/2020 16:21, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 wrote:
> build node: x86_64-pc-linux-gnu
> gcc: 10.2.0 (Debian 10.2.0-16)
> toolchains installed: binutils-arm-linux-gnueabihf /=20
> gcc-arm-linux-gnueabihf / g++-arm-linux-gnueabihf
> _____
>
> Trying to cross-compile for arm-linux-gnueabihf - which commonly=20
> works, e.g. kernel and others sources but with nftables:
>
> sh configure --host=3Darm-linux-gnueabihf-
>
> throwing:
>
> host system type... Invalid configuration `arm-linux-gnueabihf-':=20
> machine `arm-linux-gnueabihf' not recognized
>
> I am at a loss; what would be correct/expected syntax then?
>
> Unfortunately there is nothing pertinent in the wiki article=20
> https://wiki.nftables.org/wiki-nftables/index.php/Building_and_installi=
ng_nftables_from_sources
>

Just been the trailing "-" apparently, with > arm-linux-gnueabihf < the=20
error does not exhibit.


--QLbDDEYTUW3x6XZkssUk1GAwW8xJagTT3--

--LLXFHosBdoMljkRXGkCpj0J5YzJlqu6fA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEemyk2LJ8gvWPJnOR9Pc1kx8Fxc4FAl+xWAIFAwAAAAAACgkQ9Pc1kx8Fxc6V
mA//T0ix7BLLDROms6UU9PSJSozg5CWjhNTzPGg21fLPKsLvnQRtmeigMYoXoLZuNBieV81EY5PH
Hjvm39dnktpt4eFBjZodpT1xCX7t2zy4uCrvrwDrlwkF8/CmFqJRpeRZVR49JGhmbv6e/P/EcFK4
dYqiqHnsPJeCdcsOZz7Q2S+NFZmU9ZDfDRUUo35fnQvDHqjWATkCy5kzUCqHZJqA1lzbVCWR2AdJ
9anarRbFyYVkt9w7qsGmxKG0MmosJsv/9EwJaZOV17VTs4F/n692cJaq1bBWuZYL73Bk7ACgH5k7
HSJpyjIC3vsjTCvlggHIAD3mYb2rf0YMLIykvOr0t816afWe7hcj1tAtt0HyFitGHzU+uWZuoRwz
/Loo9rdEmpib/C2aWJ4upfALfVt6+CLdG3j4BU4IrK3dqVnrGuQ8nlYv2cMt60BK1oWkZYm7Mupl
erazmtRd7JYW3DSqH7T2cRwvmcnbEqBrttXlRvqP0++IaZfyR2C3PfHABNDJbUenZ1AOfnVluXpC
6ES/xbqIzYvIdfDug5Xa3K/uW+LaFsje3ihU9cHWbg5AiLlCRJ3/iaWgGSJa1MqrCcgYK7VcZj8/
/Xt9cZmN2Ry8jWW1/zBF2SAhIlz/JOGlxJSjihMAUMoEXdF7C41pZ67GmtfK2TRKQ5fAyf4yveQS
968=
=74Hm
-----END PGP SIGNATURE-----

--LLXFHosBdoMljkRXGkCpj0J5YzJlqu6fA--
