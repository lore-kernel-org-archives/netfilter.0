From: Laura Garcia <nevola@gmail.com>
Subject: Re: use numgen to create address in rule
Date: Fri, 6 Mar 2020 20:10:58 +0100
Message-ID: <CAF90-WgexWAQJR5QYRbUjV_OJrsfFyuqCJFndL=CfxqwSsjeGg@mail.gmail.com>
References: <CAD8My5xdrceMzRr_z4gaCsc1fWgr+5scJbprFpXny30a8k2+Lw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qB9ImAR6F/MnHPHG1bOY6IDghn/jRpOStpM2xCIL+Ss=;
        b=FgNmjwByKgl6BJ9+/JxDzox1DTffmU4y4pcaxrdfJApQp/LwkRHXCWspE4xLqUkMCP
         mUO0Dz4sty8NCICEf02Kh9+HcdFGS5VQl/O11G5s8soemgDHtu61hz5FgZsppS7aGwmE
         YYNnSExbevyqtBPu1SLTbM7lipVB5PCmFLkYRac4qcoweKLq/cbusWOa04hY0mTGtdUB
         io2DGoVSphU7vrBV95YIUv3S+QUTdLOgFxl+4qniyCjNNw1e19Onmyv7kFejYo0mZp1Q
         3p6KwsqOmCpae88SffxQu7iqDezslCwz5DKqPs1ygdwt3v7iKzY6O3MBe+tETTc6CpOZ
         /puQ==
In-Reply-To: <CAD8My5xdrceMzRr_z4gaCsc1fWgr+5scJbprFpXny30a8k2+Lw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dennett Ingram <d@epicup.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Fri, Mar 6, 2020 at 6:11 PM Dennett Ingram <d@epicup.com> wrote:
>
> So I currently see no way of doing this.  But I figured I'd just write
> out to verify.
>
> Is there anyway to have a statement "evaluated" for each packet?
>
> https://wiki.nftables.org/wiki-nftables/index.php/Load_balancing
>
> shows the use of:
>
> % nft add rule nat prerouting dnat to numgen inc mod 2 map { \
>                0 : 192.168.10.100, \
>                1 : 192.168.20.200 }
>
>
> which is great, to be able to generate a random number and use that to
> find one of X items from the Map.  What would be really nice is if
> there was some way you could do:
>
> % nft add rule nat prerouting dnat to 192.168.10.(100+numgen inc mod 20)
>
> which would then do the same type of mapping as before, but going from
> 192.168.10.100-192.168.10.120, without needing to create a map and
> iterate through every value.
>

Hi,

An offset can be added to the numgen and hash expressions. [0]

The range is a good idea to avoid maps but is not very flexible. If a
backend is down, you'll need to split the range somehow.

[0] https://wiki.nftables.org/wiki-nftables/index.php/Math_operations


> Being able to do simple math in there as well, you could have
> 100+2*(numgen inc mod 20) or whatever to have it skip every two.  or
> 2000:2000:A356::( numgen inc mod  65,536).ToHex() to have it generate
> an IPv6 address in that /64 block randomly.  The ToHex() is just
> something I put out there, I figure there would be some way to write
> it in hex, or write the IPv6 address as a double, that could be
> accepted.
>
> I know this is a very niche situation, and not something supported,
> but just thought I'd bring it up.
