From: Brian Austin - Standard Universal <brian@standarduniversal.com.au>
Subject: Re: load balancing between ppp0 and ppp1, private IPs
Date: Mon, 13 Apr 2009 16:50:54 +1000
Message-ID: <49E2E0CE.8010203@standarduniversal.com.au>
References: <op.usa60utux1lyi3@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.usa60utux1lyi3@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lloyd Standish <lloyd@crnatural.net>
Cc: netfilter@vger.kernel.org

yes, it will.

b


Lloyd Standish wrote:
> Hello,
>
> I want to use load balancing to allow simultaneous use of 2 relatively slow GPRS (ppp over GSM cellular phone) modems.  I have a custom-compiled Ubuntu kernel 2.6.20.3 with Debian Etch, iptables v1.3.8.
>
> The modems are seen by the system as regular serial modems, ppp0 and ppp1.  I also have a LAN (eth0). 
>
> My interfaces, ppp0 and ppp1 have dynamically assigned *private* IP numbers.  For example:
>
> ppp0: 10.60.32.71
> ppp1: 10.40.89.42
>
> My strategy for load balancing is to use conntrack to save the mark of the *first* packet, and mark all subsequent packets for that connection the same way.  Two custom routing tables are set up, each set to push traffic to one of the 2 interfaces, according to the packet mark:
>
> TABLE    INTERFACE    MARK
> rt_link1   ppp0                1
> rt_link2   ppp1                2
>
> My efforts to do load balancing between the 2 interfaces have not been successful.  Before I go into details, a major question:  Will load balancing work without public, routable IP numbers for my outward-facing interfaces?
>
> --
> Lloyd
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   
