From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: Bittorrent blocking
Date: Wed, 20 Feb 2013 07:22:55 -0400
Message-ID: <CACuyg2506HY+FudxuN4yaPKrOdetJ6M6ejv-bdL87916gtZgiQ@mail.gmail.com>
References: <51249E58.1080307@stidia.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=DryZWikuxYkufXoJHxnNbZEVsM6oL+kUkx8S2ZwRSK0=;
        b=xVu4HKdIUDSLiahwLTnOuDlr27h8evLIM5OHhR4kROcCmUg5lKpmdBIhcbJ28281ca
         l9ZPxfWkW5uECpjR4ofDW5ygehDqKDFSPcmpdhupWNwRa26BVR0ukldBqkvuuy8Yk9aP
         isxdSLmD+CX6x7YOqhhQ6DjyrkydOCobMXMPIKrhCirvBcPjaRdiw1Kep/Nu9NmylBKq
         xp8H+MZrVam7MtmunHxCjRfORYJcGlukSBTGtC/ZJyTWI3WDonww1+E1yx4I6aWIuI2q
         +gYw2MF2r9tFJS9TGeqU0CTJO4b4IKT0CIa24ihDx6oWXYKmjaWAgHIknzYEEa/Xcq62
         u/vQ==
In-Reply-To: <51249E58.1080307@stidia.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmitry.korzhevin@stidia.com
Cc: netfilter@vger.kernel.org

Hi,

I usually set a policy "default drop" - It's what I prefer.
Keeping the range of high ports (UDP) closed, many P2P clients will crash.

There are alternatives like "l7filter" or "opendpi-netfilter for nDPI"
but the processing cost can be quite high in larger networks.
Particularly, it is something that i avoid doing.
https://github.com/ewildgoose/ndpi-netfilter

The snort can help too. You can use a signature like this (local.rules):
alert tcp $HOME_NET any -> $EXTERNAL_NET any (msg:"RST P2P BitTorrent
transfer"; flow:to_server; content:"|13|BitTorrent protocol";
depth:20; metadata:policy security-ips drop;
classtype:policy-violation; sid:1000000; rev:4; resp:rst_all;)

In this example i set flexresp reaction, but the result is more
efficient in "inline mode".


2013/2/20 Dmitry Korzhevin <dmitry.korzhevin@stidia.com>:
> Hello,
>
> Guys, i understand, that this is too frequent question, and i'm already made
> solid investigation in google, but.. mabe you already have good iptables
> rules to block such type of traffic (Bittorrent), or maby you can give
> advice.
>
> For now i use snort with bittorrent-related detection rules, but seems it is
> not best solution.
>
>
> Best Regards,
> Dmitry
>
> ---
> Dmitry KORZHEVIN
> System Administrator
> STIDIA S.A. - Luxembourg
>
> e: dmitry.korzhevin@stidia.com
> m: +38 093 874 5453
> w: http://www.stidia.com
>
