From: Matteo Croce <technoboy85@gmail.com>
Subject: Re: nft error
Date: Wed, 26 Feb 2014 11:27:21 +0100
Message-ID: <CAFnufp3m2OOYs=pdOhTO4t-N1Hy3ZvHJDgJy7fMVqPXNME-NDg@mail.gmail.com>
References: <CAFnufp3Wzw9fLk2SU16kR1vfAbwaFQfhAo9dwNqk_80LVUfx4g@mail.gmail.com>
 <CAFpD06QcWdVkfM1wdA_neoLreewAvR65h5yvmHNX8nvB2h80ow@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=GMChap8JLmlNkMvW9RfH8sUyB0Yu568J0hdJ1dWYBYo=;
        b=ypQZaYR6H3gBAyQhqltedpNXIyGlydAulHC8YkijajHUBMjy9+H/C4lbPYVkqaIrN3
         DdkE8cmgPy1qGkKm7crog5hV4OYLOrEwErqGESiWNE4aL41kB9GqZm6Lovk0RnNmW/Ye
         5xZ6ggcdNJIeeKwbo3V56BWnuC2ITqtUXU1WhmEv5PoHRoyndXGbwESjmVqNVSC5mWF9
         41WB2Zhc4fm3NKQj6U06KmwQK8TZaArwEulfu9P/hYgpfAMpKNKbEztvFBQW3lOQecFG
         gnpx3/xoXUTiY4PyGEWgkAqD6anRfT+4yKhkOiYoLtazCL8JeiTQL1rsAhKorDxZvzwe
         xOgw==
In-Reply-To: <CAFpD06QcWdVkfM1wdA_neoLreewAvR65h5yvmHNX8nvB2h80ow@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giuseppe Longo <giuseppelng@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

if I create the filter chain I can see it as empty.

Actually I'm using iptables-nftables to use my old firewall, and it works.
Is there any way to see the iptables-nftables chains?

2014-02-26 11:23 GMT+01:00 Giuseppe Longo <giuseppelng@gmail.com>:
> Hi Matteo,
>
> try to run: nft -f files/example/ipv4-filter
>
> (into nftables directory)
>
> BR



-- 
Matteo Croce
OpenWrt Developer
  _______                     ________        __
 |       |.-----.-----.-----.|  |  |  |.----.|  |_
 |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
 |_______||   __|_____|__|__||________||__|  |____|
          |__| W I R E L E S S   F R E E D O M
 -----------------------------------------------------
 BARRIER BREAKER
 -----------------------------------------------------
  * 1/2 oz Galliano         Pour all ingredients into
  * 4 oz cold Coffee        an irish coffee mug filled
  * 1 1/2 oz Dark Rum       with crushed ice. Stir.
  * 2 tsp. Creme de Cacao
 -----------------------------------------------------
