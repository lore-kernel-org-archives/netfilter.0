From: Paolo Tezza <paolo.tezza@gmail.com>
Subject: Re: SNAT problem with alias IP
Date: Mon, 4 Aug 2014 09:26:57 +0200
Message-ID: <CAKvhcF-7yuQH+Da9uLeu_i+-PjmGX_uKoWrBaK_dXGACjQ7sUA@mail.gmail.com>
References: <CAKvhcF8_D8tC=qSUUb2Xa-Astu76KiDqakULYpk25uS6U1S8Vg@mail.gmail.com>
	<CAEzD07JYnmw2ty5r9KmaF57W78r_ULNUYv_h7iO9R1jyeZThgw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=+tGLrQzBVBD4X388pK2y4tJwQ2aPH4Hz6QEljO3gMks=;
        b=zMrEYknuVY/g0S5+zUDiiA+QydfPf3dGcBKi6M7VrZ2DuLSHwZFcMuKFoHshMujfjI
         2UyYz2//yxUmYg82FhTHtbZgRQZKYlnjTmoJQnIRCv35tnFelcN4mwD8v976bkzl99QU
         JFYEgvYwjYkgbTynAMiybtgkLxbmepw8sGN5H1e5SS9yUr01COaExIoGfYJXvWjTVtkU
         xkDUkU1ysCOY27v20833QSd/xehPriR69JX9L5NBBOuoceOOrMUi2HX8iUvh+9WkXQFi
         FYCaiIw+z2W/WFtdI2kgivsCaNr5UG+9MpRzO1539FK4+Edy3EZ1D9Z7rhHnwcPkS8I3
         btrQ==
In-Reply-To: <CAEzD07JYnmw2ty5r9KmaF57W78r_ULNUYv_h7iO9R1jyeZThgw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

you hit the point!!
thank you so much

2014-08-01 19:48 GMT+02:00 Anton Danilov <littlesmilingcloud@gmail.com>:
> Hello, Paolo.
>
> After adding of new nat rule, you should remove the existed conntrack
> entries of 192.168.1.201 flows. Otherwise this flows will keep use the
> existed entries with ...234 external address.
>
> 2014-08-01 12:00 GMT+04:00 Paolo Tezza <paolo.tezza@gmail.com>:
>> Hi all
>>
>> I have a a firewall with 3 phisical nic (LAN, WAN, DMZ)
>> I have 8 public IP I can use on WAN's nic (eth0)
>>
>> so I configured some alias on eth0:
>> eth0  x.x.x.234 Mask:255.255.255.248
>> eth0:0 x.x.x.235  Mask:255.255.255.248
>> eth0:1 x.x.x.237  Mask:255.255.255.248
>> eth0:2 x.x.x.238 Mask:255.255.255.248
>>
>> eth1  10.0.0.254  Bcast:10.0.0.255  Mask:255.255.255.0
>>
>> eth2  192.168.1.254  Bcast:192.168.1.255  Mask:255.255.255.0
>>
>>
>> I have added this iptables rule that work like a charm
>> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source x.x.x.234
>>
>> both my LAN (eth2) and my DMZ (eth1) surf internet with phisical IP
>>
>>
>> Now I need that one host 192.168.1.201 will be "masqueraded" with x.x.x.238
>> so I add the rule ABOVE the first one
>> iptables -t nat -A POSTROUTING -s 192.168.1.201 -o eth0 -j SNAT
>> --to-source x.x.x.238
>>
>>
>>
>> The issue is that 192.168.1.201 keep to use physical IP x.x.x.234 and
>> not x.x.x.238
>>
>> Some hint?
>>
>> thanks
>>
>>
>> Paolo
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
> --
> Anton.
