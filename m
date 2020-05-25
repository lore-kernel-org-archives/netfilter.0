From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Raw Expression for DNS name?
Date: Mon, 25 May 2020 03:44:45 +0200
Message-ID: <198ba667-0ebc-ba8b-bbb1-6faf095cbcc7@thelounge.net>
References: <CAPdGaa3XsTm1rjUFjUoqKG=fO+9w+xOWvxTuQRL8D+3QXk73fA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAPdGaa3XsTm1rjUFjUoqKG=fO+9w+xOWvxTuQRL8D+3QXk73fA@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ad^2 <adsquaired@gmail.com>, netfilter@vger.kernel.org



Am 25.05.20 um 03:02 schrieb ad^2:
> Does anyone have examples showing the use of a raw expression to
> filter DNS domain name information?
> 
> I'm trying to DNAT a packet to a specific DNS server's IP address when
> the domain name in the query is a match.
> 
> Ex. if the domain in the query is yahoo.com then redirect to 8.8.8.8
> 
> I am not sure on the hex syntax.
> 
> What is not working:
> 
>     add rule mytable prerouting meta l4proto udp udp dport 53
> @th,160,120 0x057961686f6f03636f6d00 dnat 8.8.8.8
> 
> and
> 
> add rule mytable prerouting meta l4proto udp udp dport 53 @th,160,120
> 0x057961686f6f03636f6d dnat 8.8.8.8
> 
> I used the hex values directly from the packet capture.

a terrible idea to even consider on netfilter level

that has to be done on the dns resolver and the only job of netfilter is
forbid outside nameservers at all
