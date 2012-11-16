From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Can't add ff::/8 to ip6tables.
Date: Fri, 16 Nov 2012 14:35:58 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1211161432210.9788@nerf07.vanv.qr>
References: <09f201cdc3e6$91ffb080$b5ff1180$@telsatbb.vu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <09f201cdc3e6$91ffb080$b5ff1180$@telsatbb.vu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Steve (Telsat Broadband)" <steve@telsatbb.vu>
Cc: netfilter@vger.kernel.org

On Friday 2012-11-16 11:38, Steve (Telsat Broadband) wrote:

>Hi All,
>
>For one of my filtering rules, I'm trying to add the following rules:
>
>ip6tables -t mangle -I AuthCheck 1 -d ff::/8 -j RETURN ip6tables -t mangle
>-I AuthCheck 1 -d fc::/7 -j RETURN
>
>However, when I check the rule entries they show up as ::/7, ::/8 [...]
>Which obviously doesn't catch the packets as ::/7 or ::/8 is not fc::/7 or
>ff::/8

ip6tables is absolutely correct.

  00ff:0000:0000:0000 :0000:0000:0000:0000   (ff::)
& ff00:0000:0000:0000 :0000:0000:0000:0000   (/8)
= 0000:0000:0000:0000 :0000:0000:0000:0000   (::(/8))

  00fc:0000:0000:0000 :0000:0000:0000:0000   (fc::)
& fe00:0000:0000:0000 :0000:0000:0000:0000   (/7)
= 0000:0000:0000:0000 :0000:0000:0000:0000   (::(/7))
