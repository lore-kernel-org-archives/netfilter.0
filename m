From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: Iptables NAT with two external Interfaces
Date: Thu, 3 May 2012 20:17:21 -0400
Message-ID: <CACuyg27u3_1+3hrEmtkwMVTXHiCxMcyuuaysZ30SLNVhTepK=g@mail.gmail.com>
References: <4FA24C69.4000607@ngs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=nEFzPpGhBPMkGUZmUiHCWtfDURjL4AK2RrEvm1czZTw=;
        b=St7s9lEQNZNaFYSnVuqyC3rJWOXygeGFU06dDfULcjE38eXAdMzVwkawIby8oKx/c9
         y3uklVoALV+T21tN5QmqxIzqakcNDVPAjFN0sndqLaYoGVD0D6etTTjQF8EzI13kuW00
         EkosjmRSir6ClZRajo71akn0XltTundyLu3GNSNcKhzhXyUG43X/lwokA2Yd4jJBJYsd
         T2PCkQPqpkymVtd121XrXwpxdn5Gpx8PptHsK9Vbfkp7yz+PWwOPZEEBV1JHbf5PV1L+
         3raH8zT3sEzcN3xrPJrPt1r9DM5ETW5PvFg5S3h8pfe1shGyxInk1cqHSTU9pqxq0jBV
         b7wQ==
In-Reply-To: <4FA24C69.4000607@ngs.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: "Ellad G. Yatsko" <eyatsko@ngs.ru>
Cc: netfilter@vger.kernel.org

Hello,

It was quite confusing ... a diagram would greatly help.

1. What is the prefix size of your AS? (/24 or /20).
    If your IP block is "/20", you can make "/24" announcements per BGP=
 peer.

2. The one link is based on static routing and the other by BGP? This
was confusing.

3. How was your routing table (fib)?
    route -n or ip route ls
    ip rule ls

4. Your firewall is configured to accept this asymmetric routing?

What exactly do you want?

2012/5/3 Ellad G. Yatsko <eyatsko@ngs.ru>:
> Hello!
>
> May you help me in one very specific issue?
>
> - I have Ubuntu router with several interfaces with Quagga/BGP workin=
g on
> it, and of course IPTables with NAT for internal users;
>
> - One interface is used to connect to ISP, it has ISP's IP-address. F=
or
> definiteness it is 89.222.233.165. Ubuntu connects to ISP's network v=
ia this
> IP;
>
> - Another interface - DMZ with own IP-address (delegated by RIPE NCC)=
 of own
> Autonomous System: 91.223.181.1;
>
> - DMZ is terminated on Cisco 2821 (one subinterface 91.223.181.2) =9A=
which is
> connected to second ISP (via second subinterface with IP from second =
ISP:
> 188.35.132.79).
>
> - There is specific routing: each of my "borders" marks a part of pre=
fixes
> received from corresponding ISP by higher LocalPref: Ubuntu marks pre=
fixes
> 0.0.0.0-127.0.0.0, and Cisco marks prefixes 128.0.0.0 up to 224.0.0.0=
=2E
> That is if destination IP is more than 128.0.0.0 Ubuntu prefers to se=
nd the
> current packet to directly connected ISP, if it is less than 128.0.0.=
0
> Ubuntu prefers =9Ato route the packet through DMZ. It is made to util=
ize both
> uplinks evenly.
> I need to explain one important detail: both of my ISPs are connected=
 to the
> same higher-level ISP, which uses the only ISP from the pair of mine =
to
> direct incoming traffic into my AS. So there is no other opportunity =
to make
> balancing except egress traffic.
>
> - Ubuntu has internal interfaces to give to its internal users access=
 to
> Internet. Internal users have "private" IPs which are "NATted" on ext=
ernal
> Ubuntu's interfaces.
>
> - Actually the question: with probability 50% a packet from internal =
users
> can be sent through one external Ubuntu's interface and reply can ret=
urn
> through another. In that case NAT is not working. Here my relevant pa=
rt of
> configuration:
> $IPTABLES -t nat -A POSTROUTING -o $EXT_IF -s $INTERNAL -d $EXTERNAL =
-j SNAT
> --to $DMZ_IP
> $IPTABLES -t nat -A POSTROUTING -o $DMZ_IF -s $INTERNAL -d $EXTERNAL =
-j SNAT
> --to $DMZ_IP
>
> What can I do except:
> $IPTABLES -t nat -A POSTROUTING -o $EXT_IF -s $INTERNAL -d $EXTERNAL =
-j SNAT
> --to $EXT_IP
> $IPTABLES -t nat -A POSTROUTING -o $DMZ_IF -s $INTERNAL -d $EXTERNAL =
-j SNAT
> --to $DMZ_IP
>
> Difference with above two is "$EXT_IP" in the first line. In that cas=
e all
> works fine. But I need to hide ISP's IP from External World. I need t=
o show
> to others my own IPs only. It's the highest priority. Again, may you =
help me
> to find an answer? Are there some "secret commands" for IPTables to m=
ake NAT
> to ignore ingress interface to de-NAT replies? For example, FreeBSD's=
 PF can
> do correct "back" translations independently from interface where
> reply-packet has come on. Ubuntu has changed FreeBSD on the place of =
central
> router due to rank of reasons (one of them is stability), but now I h=
ave big
> trouble! :-)
>
> He-e-e-lp!...
>
> Kind regards,
> Ellad
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =9Ahttp://vger.kernel.org/majordomo-info.html
