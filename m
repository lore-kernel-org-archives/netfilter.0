From: vivek rajagopalan <vivvek.r@gmail.com>
Subject: Re: Extracting info from frag packet in pre route hook
Date: Fri, 6 Jan 2012 18:36:29 -0800
Message-ID: <CAKbcA9JpK7z0CteJCDinY06Afmu2daT9EPygVcaPUjpjXjar9g@mail.gmail.com>
References: <CAKbcA9KrD4eR0tcHG4_g7JvfOZv0MH+UinESt+GNRJb4YiquRQ@mail.gmail.com>
	<alpine.LNX.2.01.1201052218330.26877@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=Sn1WTmp0p5KLCI/D2QO4Qyczu85iLSUckGT4yRvPAsY=;
        b=JNViYPSYi+CPLMznUTrZJly5/Rk32rq0R72Cy6DxF+Y6lSSRfINM08yQIDx7b/6d0g
         W8slsQYdYAWxFrGCqZAWE1KvI+oFgCOGXaL/OOP1iBG3PYVM/errWiN27Bz6fYYfBxnZ
         kMp73Gcn6fVa9crOyZzpXtHdsaS+mhraAZtNw=
In-Reply-To: <alpine.LNX.2.01.1201052218330.26877@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On Thu, Jan 5, 2012 at 1:21 PM, Jan Engelhardt <jengelh@medozas.de> wro=
te:
> You need
>
> =A0struct udphdr *udph =3D skb_header_pointer(...)
>

This solved the problem, what offset to use was not clear to me
initially but it eventually turned out to be 20. Thanks so much

Vivek
