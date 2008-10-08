From: "Servers 4you" <servers4you@gmail.com>
Subject: Re: block packet by size
Date: Wed, 8 Oct 2008 14:03:24 -0300
Message-ID: <98f5d92c0810081003p67913c73tf89e93147b4d3bef@mail.gmail.com>
References: <98f5d92c0810080921t6232cebai52c6128cf655e731@mail.gmail.com>
	 <20081008165852.GA25766@khasse.inl.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=JoFeERMuy+Srw9np62vbHfRC8wYFA9I7zuZqgh2zmek=;
        b=hto+7LMlsOxJxc6U1ljMgkH7JgqxiD2Rr/Z/pc72T+TYs2I8zLVEsUTWkM+4ioBaUB
         vjzfjEVG+RMwUb7MDI7z3l50SOV2wtKZ1mgsOTpFqc0Fik6Cl4AKiONshS1l9iFqd4H/
         ZiEeWbrX49UfBi7HDvmaHeUc5zSBoGunbzs58=
In-Reply-To: <20081008165852.GA25766@khasse.inl.fr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@inl.fr>, Servers 4you <servers4you@gmail.com>, netfilter@vger.kernel.org

yes i try see man page, but they dont explain if the size its: the
full packet size or the data part.

i have a packet with diffent total size (becouse the header change)
but always with 14bytes on data.


2008/10/8 Eric Leblond <eric@inl.fr>:
> Hello,
>
> On Wednesday, 2008 October  8 at 13:21:35 -0300, Servers 4you wrote:
>> I need block every packet with 14bytes size.
>>
>> what can i do?
>
> man iptables :
>
>   length
>          This module matches the length of the layer-3 payload (e.g.
>          layer-4 packet) f a packet against a specific value or range
>          of values.
>
>   [!] --length length[:length]
>
> BR,
> --
> Eric Leblond
> INL: http://www.inl.fr/
> NuFW: http://www.nufw.org/
>
