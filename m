From: Anton Danilov <littlesmilingcloud@gmail.com>
Subject: Re: SNAT problem with alias IP
Date: Fri, 1 Aug 2014 21:48:18 +0400
Message-ID: <CAEzD07JYnmw2ty5r9KmaF57W78r_ULNUYv_h7iO9R1jyeZThgw@mail.gmail.com>
References: <CAKvhcF8_D8tC=qSUUb2Xa-Astu76KiDqakULYpk25uS6U1S8Vg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=9tXgcFoxbNHbG6yIJ118RiNV/G8vmMIPrNP2sQmfMDI=;
        b=BBEKJxwR9nC/9OpcLNvOMNyFrRusv9RHBZW1yeWkWiJnfrCDdY/8XvAus7hmYeuQxT
         njDE+cGZvoH5NFNzUgKCGzfOkiUUeHYZeXpXPeVGmcLHNlPPwVYQQDx7FKFkxBvPjYea
         SyOB6u8+ku5HffkqElaX/AIka/waJkLzmwh2guW/wRFpMdHaeqsSzycMfPx0AFy9TMMh
         ujdaleoDRtcrsJVucCFaVc4GOk629G5oOmdkBaTmJapRjq+ujQqoBB01ShvrSoVv2Jey
         655e06Uw9T4HS8g9VxKmHhEDj28xqDvOJplhcgTrEDKrHmfHCi2O7mfhIHqfj4QLjPEe
         h6qw==
In-Reply-To: <CAKvhcF8_D8tC=qSUUb2Xa-Astu76KiDqakULYpk25uS6U1S8Vg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Tezza <paolo.tezza@gmail.com>
Cc: netfilter@vger.kernel.org

Hello, Paolo.

After adding of new nat rule, you should remove the existed conntrack
entries of 192.168.1.201 flows. Otherwise this flows will keep use the
existed entries with ...234 external address.

2014-08-01 12:00 GMT+04:00 Paolo Tezza <paolo.tezza@gmail.com>:
> Hi all
>
> I have a a firewall with 3 phisical nic (LAN, WAN, DMZ)
> I have 8 public IP I can use on WAN's nic (eth0)
>
> so I configured some alias on eth0:
> eth0  x.x.x.234 Mask:255.255.255.248
> eth0:0 x.x.x.235  Mask:255.255.255.248
> eth0:1 x.x.x.237  Mask:255.255.255.248
> eth0:2 x.x.x.238 Mask:255.255.255.248
>
> eth1  10.0.0.254  Bcast:10.0.0.255  Mask:255.255.255.0
>
> eth2  192.168.1.254  Bcast:192.168.1.255  Mask:255.255.255.0
>
>
> I have added this iptables rule that work like a charm
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source x.x.x.234
>
> both my LAN (eth2) and my DMZ (eth1) surf internet with phisical IP
>
>
> Now I need that one host 192.168.1.201 will be "masqueraded" with x.x.x.238
> so I add the rule ABOVE the first one
> iptables -t nat -A POSTROUTING -s 192.168.1.201 -o eth0 -j SNAT
> --to-source x.x.x.238
>
>
>
> The issue is that 192.168.1.201 keep to use physical IP x.x.x.234 and
> not x.x.x.238
>
> Some hint?
>
> thanks
>
>
> Paolo
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Anton.
