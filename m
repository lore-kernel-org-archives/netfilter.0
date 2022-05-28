From: =?iso-8859-2?Q?Kamil_Jo=F1ca?= <kjonca@op.pl>
Subject: Re: traffic shaping with tc and nft
Date: Sat, 28 May 2022 12:20:14 +0200
Message-ID: <877d66t0v5.fsf@alfa.kjonca>
References: <c3bc1649-d70b-ae7b-b306-0d5f2a765857@gmx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=op.pl; s=2011;
        t=1653733215; bh=CAPUm20vIRn6AlqmeOixdBeWAt7PiPZb2qnrjsaox1o=;
        h=From:To:Subject:References:Date:In-Reply-To:From;
        b=q31OliayppReniubBtiRHZ7ekwX3e5VDOODUl8W873pgqGgL3bHoME1VCcHnZH0KW
         einAbB4B+NnzPUhGtvXcvFWxGFAbNMZtahyNSyLW52ucs0D6O5Q5ZDUCfphJjGV1bF
         IZqu6Wk7qL4uHQmrLz4ljVFBUwHDYlXT5tPt7C/0=
In-Reply-To: <c3bc1649-d70b-ae7b-b306-0d5f2a765857@gmx.com> ("Lars
 =?iso-8859-2?Q?Nood=E9n=22's?=
        message of "Sat, 28 May 2022 13:07:12 +0300")
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Lars Nood=E9n <lars.nooden@gmx.com> writes:

> Hello,
>
> I'm working on traffic shaping with tc and have some old iptables rules
> with which I've tried to use iptables-translate to convert legacy
> instructions to nftables.  For example, I have the following:
>
>     iptables -t mangle -A OUTPUT -p tcp --match multiport \
> 	--sports 22,1965 -j MARK --set-mark 100
>
> and the result is,
>
>     nft add rule ip mangle OUTPUT ip protocol tcp \
> 	tcp sport {22,1965} counter meta mark set 0x64

Blind shot: in nftables you have no OUTPUT chain by default so I suspect
you have to create it manually.

nft add chain ip mangle  OUTPUT ...

KJ


--=20
http://wolnelektury.pl/wesprzyj/teraz/
