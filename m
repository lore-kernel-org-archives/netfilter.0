From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: help,i have a problem with nftable redirect
Date: Thu, 10 Dec 2015 12:45:16 +0100
Message-ID: <CAOkSjBhuM3+fpp3_YZB-zzKMtYpFZTyBOHkLqnRk6KkXPXG+gQ@mail.gmail.com>
References: <20151210020004.4CA232A09CE@webmail.sinamail.sina.com.cn> <20151210111734.GA1582@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=Y2JedCJxXGml1wUxH/9+dEW0HzfZCeOLj5r91DxYv1g=;
        b=i74LsP/enbgi9LEVWQIlCWq5hvqiSdPznSwSX3Os+UU5VMfDNMhuKnoKWmpX+6z/YP
         FZO8VIRMdNZ0xBrqX5tUhFnodDvWECddpzGr1WX9I3JoMqCaQX+pHqm8BJ6uCkZqFfC0
         pcu/GBw4CM3CLp2IQuGP3/lNZD+gaeArCzuc4DDXAwz1eEl2hhd9qp95XqQG0UeBVSNY
         3lHESSREamhpzkIttjXE5xuXyVV4wTcBCaMtEEICIwqmsNXqsAXlV9FZdc4GkxWohWQu
         kINRZBYLeYLM4TblSzT1YlKw6JvjKw4x8N773ywoQtJ6XJTs2rL4JLfG7j1U73ihOFsn
         r6gA==
In-Reply-To: <20151210111734.GA1582@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Jack Lin <helloworldjack@sina.com>
Cc: netfilter <netfilter@vger.kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>

On 10 December 2015 at 12:17, Pablo Neira Ayuso <pablo@netfilter.org> w=
rote:
>
> I don't see the nft_redir_ipv4 module here, does your kernel support
> this?
>

Hi Jack,

it seems you are using Debian with kernel 4.2.

These modules were left uncompiled [0]. Updating to a newer Debian
kernel should fix your issue.

regards.

[0] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D803370

--=20
Arturo Borrero Gonz=C3=A1lez
