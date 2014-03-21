From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: Understanding ebtables
Date: Fri, 21 Mar 2014 07:09:38 -0400
Message-ID: <CACuyg27c-wcY2xnMtYcHjOGX+cYv7PDDyAVDPhiDCzBTv5-g7Q@mail.gmail.com>
References: <!&!AAAAAAAAAAAYAAAAAAAAAOosgHnoPqdNlUO2DUrQ/DfCgAAAEAAAABe512YLINNJlCLD9myQIzgBAAAAAA==@manfbraun.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=0TvZ7ak/aLXhzdWc4B+JLYXXICh+pE/Arm+FwgHprH4=;
        b=irCj3xiv7eyVRZANQ/ZLJfDTSa/qBShViB+yWmiwd+ihTlpciGLDcghC/ONZeXt/3m
         y5Pe7Wyi/9h0BcE8jeiOjC9fbBbF3Lx/RbCZcYEgFi4pkfx336YIty4qzw+eiX5S5CUK
         FpeU57BAjpwtATXVHPCSGZkz/XlFrmzLhTlesYkh4TmDLxap+9+pO32FtGpiugoOX5LV
         nC4/zPaNWetkOKvFkhXJraKFgZip9NB9VB5TF7OvFL5Qj6hiYmhKf7f5jpJVXqCRtVj+
         MDkY8GMirsnlJdSmTmUenYry5QxxDVUdwK0hTFlQ0/PPsGO8g8VBJsnvJRlj1B8ceWzy
         wFrA==
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAOosgHnoPqdNlUO2DUrQ/DfCgAAAEAAAABe512YLINNJlCLD9myQIzgBAAAAAA==@manfbraun.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mabra@manfbraun.de
Cc: netfilter@vger.kernel.org

Hi,

Use broute table to control the traffic forwarded by your bridge.

ebtables -t broute -A BROUTING -i <if> ... -j DROP

Take a look:
http://eduunix.ccut.edu.cn/index2/html/linux/Prentice.Hall.PTR.Troubleshooting.Linux.Firewalls.Dec.2004.eBook-LiB/0321227239/ch11lev1sec3.html

With DROP target, the packet will be forwarded only by ip routing.
You can control which packets pass through your firewall using
iptables, either in bridge or routing (you probably work with
physdev):
http://net.doit.wisc.edu/~dwcarder/captivator/linux_l2_firewalling.txt

2014-03-20 20:34 GMT-04:00  <mabra@manfbraun.de>:
> Hello !
>
> I am on the road to learn to protect my server and I want
> to suppress the unrequested ARPs, coming from the
> WAN side of my linux router from the KabelBW network.
>
> I am using debian squeeze and I installed ebtables
> successfully [ebtables v2.0.9-2].
>
> I just started with a simple rule:
>
> ebtables -t filter -A INPUT -i eth1 -d ff:ff:ff:ff:ff:ff -j CONTINUE
>
>
> This is simply to allow me to see the counters. But nothing is shown:
>
>>>>
> [/ops/fw]ebtables -L --Lc
> Bridge table: filter
>
> Bridge chain: INPUT, entries: 1, policy: ACCEPT
> -d Broadcast -i eth1 -j CONTINUE , pcnt = 0 -- bcnt = 0
>
> Bridge chain: FORWARD, entries: 1, policy: ACCEPT
> -p ARP -i eth1 -j DROP , pcnt = 0 -- bcnt = 0
>
> Bridge chain: OUTPUT, entries: 0, policy: ACCEPT
> <<<
>
> I am running tcpdump and I am seeing a lot of this
> packets with the dest address like in the rule above.
>
> I do not have a separate bridge configured, just use
> my WAN interface.
>
> Any help would be really great!
>
> Thanks anyway and
> best regards,
>
> Manfred
>
> [Probably a second attempt - missed the message]
>
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
