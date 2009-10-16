From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: Re: Pre-routing re-write
Date: Fri, 16 Oct 2009 13:13:30 +0200
Message-ID: <4AD8555A.1080301@unipex.it>
References: <20091014231016.GA4580@retriever.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20091014231016.GA4580@retriever.dyndns.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Kevin Bailey <ke-linux@retriever.dyndns.org>

Kevin Bailey ha scritto:
> I'm trying to get a re-write rule to occur after routing has occured.
>  My host has the address 192.168.10.1 and a gateway of 192.168.10.2 
> to 192.168.11.0/24.
> 

Sorry, but this can be possible. The gw for a network class must be
inside the _same_ class!

> The re-write rule I have is:
> 
> # Map 11 net to 10 net iptables -t nat -A OUTPUT -d 192.168.11.0/24 
> -j NETMAP --to 192.168.10.0/24
> 
> It does the re-write but, as far as I can tell, isn't using the 
> default gateway to 192.168.11.0/24.
> 
> I assume a POSTROUTING rule might do this, but when I use the 
> POSTROUTING queue, it doesn't do the translation. Using mangle or 
> DNAT produce an error, not surprisingly.
> 
> Is there any way to do this ?


Where the packet starts? If you use nat + output you are saying to the
kernel to do a thing when a packet are generated locally.
Are you the gateway for another network (lan)?
However, It's not so well explained what you want to achieve.

Michele
