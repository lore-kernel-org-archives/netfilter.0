From: "Servers 4you" <servers4you@gmail.com>
Subject: Re: block packet by size
Date: Wed, 8 Oct 2008 16:38:05 -0300
Message-ID: <98f5d92c0810081238t38d7aa89je8cf9a977986517c@mail.gmail.com>
References: <98f5d92c0810080921t6232cebai52c6128cf655e731@mail.gmail.com>
	 <20081008165852.GA25766@khasse.inl.fr>
	 <98f5d92c0810081003p67913c73tf89e93147b4d3bef@mail.gmail.com>
	 <20081008181952.GA21177@outback.rfc2324.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=q1+MDCyoleq7bKPQuWoMFPsmfQMPCri+kShrl4fwCDw=;
        b=MLgShaqjknxPHiej4wd6j4P1K5fsOJAe5X5NJqB1+JtyukNZOJJVoC/f7QirVY92vI
         eLD/8Ha++rgbDPZsQ5VqlqDL1SjDIhnAtmlRxkz94Ssc/MJM92bLwDj9WjeU6hkgeoLx
         MnBOF4xwAcVo5rtjoFQvQx+3jRQnP6fpLtxjc=
In-Reply-To: <20081008181952.GA21177@outback.rfc2324.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Well wireshark separate the packet in 5 part:

frame -> all the packet
ethernet II -> len: 14
internet protocol -> len 20
transmission control protocol -> change
data -> my packet always have len = 14


0000   00 30 48 97 47 07 00 1b 0d e6 57 c0 08 00 45 00
0010   00 36 c4 c9 40 00 70 06 1b 5b 45 a2 42 a5 43 e4
0020   5e 72 07 20 94 df 5f da e3 e0 db a8 f2 5e 50 18
0030   45 10 dd 91 00 00 f7 6f 3f 47 c5 8b 18 91 64 19
0040   8a a8 b1 26

this its the complete packet, i want block the data part.

i means this:

0000   f7 6f 3f 47 c5 8b 18 91 64 19 8a a8 b1 26


then waht i want is:

block every single packet with DATA part len = 14.

thanks




2008/10/8 Maximilian Wilhelm <max@rfc2324.org>:
> Anno domini 2008 Servers 4you scripsit:
>
>> 2008/10/8 Eric Leblond <eric@inl.fr>:
>
>> > man iptables :
>> >
>> >   length
>> >          This module matches the length of the layer-3 payload (e.g.
>                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> >          layer-4 packet) f a packet against a specific value or range
>> >          of values.
>> >
>> >   [!] --length length[:length]
>
>> yes i try see man page, but they dont explain if the size its: the
>> full packet size or the data part.
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> i have a packet with diffent total size (becouse the header change)
>> but always with 14bytes on data.
>
> Which parts of the header changes in your setup?
> What do you in general want to accomplish?
>
> Ciao
> Max
> --
>        Follow the white penguin.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
