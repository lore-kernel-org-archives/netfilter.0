From: Greg Oliver <oliver.greg@gmail.com>
Subject: Re: string and u32 modules
Date: Tue, 5 Oct 2010 22:10:04 -0500
Message-ID: <AANLkTikpoxfVpXFaHrYcGLdcNips78wpxVuor_uymCyg@mail.gmail.com>
References: <AANLkTin8Uvd7z0ty6urts2oy53mL=TCE0=r7O7g902HH@mail.gmail.com>
	<AANLkTim4g7nUd1PV=1Dnwybr=t_DVh4cT9iuZP6xESrO@mail.gmail.com>
	<alpine.LNX.2.01.1010020051300.26371@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=OdLUSYq+BX1R/7KZTUSCLDdHyfPAEONygt81CtOUQG8=;
        b=bYfYcfdvxk8sI92o/1TmNFIYjDC2jTaEUEry+vdUnn10XHv7n5cX88cX5fniwDCv6W
         HVcQT2RN/TbL2XpdNfiHC4NsgIzeK0zAvWa0PuMWrbgTiEI6RcHf4lYL4f5g2jz6TIXh
         QG/lepLpy0gd4UnkM1saG/2Xs/ZBVSBXVMsds=
In-Reply-To: <alpine.LNX.2.01.1010020051300.26371@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Hi Jan,

On Fri, Oct 1, 2010 at 5:55 PM, Jan Engelhardt <jengelh@medozas.de> wro=
te:
>
> On Saturday 2010-09-25 20:12, Greg Oliver wrote:
>>> 19:40:13.666679 IP ghost.29364 > ccs1.25862: UDP, length 13
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A00x0000: =C2=A045b8 0029 95cd 0000 3d11 9=
c86 c0a8 6476 =C2=A0E..)....=3D.....dv
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A00x0010: =C2=A0c0a8 64f1 72b4 6506 0015 b=
bc9 800d 9f6b =C2=A0..d.r.e........k
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A00x0020: =C2=A07c06 b562 a690 c613 6400 0=
000 0000 =C2=A0 =C2=A0 =C2=A0 |..b....d.....
>>>
>>> 800d is what I want to catch in bytes 27,28...
>
> But 800D is at position 0x1C =3D 28 (counting from 0), so
>
>>> -A INPUT -m u32 --u32 "0>>22&0x3C@6=3D0x800D" -j LOG --log-prefix "=
CNOISE: "
>>> -A INPUT -m u32 --u32 "26&0xFFFF=3D0x800D" -j LOG --log-prefix "CNO=
ISE: "
>
> =C2=A0--u32 "28 >> 16 & 0xFFFF =3D 0x800D"
>
> or with the IPv4 header,
>
> =C2=A0--u32 "0 >> 22 & 0x3C @ 8 >> 16 & 0xFFFF =3D 0x800D"

Thanks for the response - I will get to try this out tomorrow again.
I really do not understand the difference between your rule and the
original though.  You are going to 28 and reading the next 2 bytes,
whereas I am starting at 26 and discarding the first 2 bytes right?

I thought I got it all from the __only__ tutorial out there  :)   And
I though I understood it as well, but hey - you never know.  Obviously
I do not.

I'll try it again tomorrow though.

Thanks!
