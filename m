From: "etkaar" <lists.netfilter.org@prvy.eu>
Subject: Re: nftables =?UTF-8?Q?=3E=3D=20=30=2E=39=2E=38=3A=20atomic=20update=20?=
 =?UTF-8?Q?=28nft=20-f=20=2E=2E=2E=29=20of=20a=20set=20not=20possible=20an?=
 =?UTF-8?Q?y=20more?=
Date: Fri, 07 Jan 2022 15:54:13 +0100
Message-ID: <5th97l2av.OyLNSq@prvy.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=prvy.eu; s=20180701;
        t=1641567253; bh=hYnM9qtGv0xFYndsY0HaX05oL4ZbukATljWFD0joN0I=;
        h=Date:From:To:Subject:From;
        b=mUFgAQ6TgMZ0voy7enZfP75OScSAv0nmL/25gTZeHm9GpBRJcBH+vmb1h5AL8ZPmx
         LhFfFFhqScX91G+Lw2fgQHR2AFBx+/cTAk7I8kBCIvOQBMeb+/q3LIUYQ3OUKaAgax
         rxwc4EW53MfX97/1tVGXJdvTM/3dsp8Xo71bVSWxIFu+v5XsQuG+5AhVycUne210/f
         tTX1XrQgDzJkU/sNDd03qMNdsM8HjiKugr33jQeb17xJFVm43yl7uaEoF1gpOKcPE5
         ZyNAPTn3lV3VLkE5cI1EsyTtHFjKWXB25GYrhXcRNQYi/jd85Uw6U5FMsmTu8PB043
         DS+70fYvMeb6g==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Dear Florian and Stefano,=0A=0Athanks so much for your fast response!=0A=0A=
Unfortunately I am not really able yet to apply a kernel patch, because tha=
t would be the first time at all I modify the kernel and I am afraid of bei=
ng locked-out again in case Debian afterwards updates the kernel with a new=
er version which still is affected of the bug. I am not so familiar with th=
at, because for stability and security reasons I usually always leave my De=
bian installation as they are.=0A=0AHowever, I am able to compile nftables =
itself and replace Debian 11 Bullseyes version 0.9.8 with 1.0.1, but this v=
ersion still contains the bug. Once there is an update to 1.0.2 and this bu=
g is fixed, compiling and replacing the 0.9.8 version with it should be eno=
ugh, or is still a kernel patch required in that case?=0A=0AKind Regards,=
=0Aetkaar

