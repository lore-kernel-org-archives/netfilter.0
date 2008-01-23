From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Howto capture first connection and redirect ???
Date: Thu, 24 Jan 2008 00:29:47 +0100
Message-ID: <4797CDEB.40502@rtij.nl>
References: <59420160801231515j3e5f71dao58d8a5f89c7114ec@mail.gmail.com> <59420160801231521n2f7d1459i9edf07c2d8c1a54a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <59420160801231521n2f7d1459i9edf07c2d8c1a54a@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Francisco Morales <francisco.morales.lopez.de.gamarra@gmail.com>
Cc: netfilter@vger.kernel.org

Francisco Morales wrote:
> Hello, I would like to know if does it possible to capture just the
> first connection og one user with a iptables rule and redirect to a
> specific ip/port address.
>
> I have a intranet with a proxy machine with squid on debian for to out
> to internet, and I would like that when I user connect for first time,
> a iptable rule redirect it to a welcome page.... but just the first
> time ..
>
> Does it possible to do this with a iptable rule??
>
> Thanks a lot
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   

This is probably possible with the recent match. Somthing along these 
lines (untested!):

-t mangle -A PREROUTING -p tcp -dport 80 ! -m recent --update --seconds 
3600 -j REDIRECT --to <welcome-page>

HTH,
M4

