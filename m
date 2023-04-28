From: seentr@at.encryp.ch
Subject: Re: Possible to check if ip daddr belongs to an interface in the
 prerouting chain?
Date: Fri, 28 Apr 2023 07:22:55 +0000 (UTC)
Message-ID: <37bf019b-6c6e-4e97-a121-91a38270d845@at.encryp.ch>
References: <D797AC4D-8B12-4F80-8C82-1591C3658D0B@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=at.encryp.ch;
        s=flopster; t=1682666580;
        bh=M2brnQ76cOZA4iGqA8gNFGxOPZhugmCb+lz53ybL0hA=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject;
        b=ctjqywgS1D0HUBG47rgHJb1yX9z74hBPvChnIsyPpMFaeNC6v0ezJQcTHDlyOVW37
         06yTscsgxbe9/IRbKF/HurVk4wAKV7FTt/S2dEbh2HyqWg5VX2oem4CMJQdCrfjI+c
         xKYeKjv0ez1W78DYOcJxiIoSfVXcQTv0PSg7F0gE=
In-Reply-To: <D797AC4D-8B12-4F80-8C82-1591C3658D0B@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Glen Huang <heyhgl@gmail.com>
Cc: netfilter@vger.kernel.org

Have you tried this: https://wiki.nftables.org/wiki-nftables/index.php/Matc=
hing_routing_information ?

2023-04-28T03:59:07Z Glen Huang <heyhgl@gmail.com>:

> Hi,
>=20
> I use tproxy to redirect all traffic from the lan interface, but I want t=
o exemplify traffic whose destination IP belongs to the wan interface. I wo=
nder if it=E2=80=99s possible to specify if ip daddr matches the wan interf=
ace IP in the prerouting chain?
>=20
> The only solution I can think of right now, is to create a set, and manua=
lly update the set with wan IPs (also whenever they change), which is very =
cumbersome.
>=20
> I wonder if there is a direct way to that in nft?
>=20
> I use nft1.0.7 with kernel 5.15.108
