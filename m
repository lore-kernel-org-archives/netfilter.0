From: "Nikolay S. Rybaloff" <nowhere@hakkenden.ath.cx>
Subject: Re: Why --syn on tcp connlimit?
Date: Fri, 23 Jan 2009 22:45:42 +0300
Message-ID: <0480E545460F44EFB088107C1013F354@Hakkenden>
References: <1FDE2549-3F21-4BD7-BB37-06C971D32052@dancing.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: Peter Renzland <peter@dancing.org>, netfilter@vger.kernel.org

I always place the rule to accept established/related on the first line, so 
that kernel matches most of the packets by the first rule. If you do the 
same, first example is meaningless, IMHO

--------------------------------------------------
From: "Peter Renzland" <peter@dancing.org>
Sent: Friday, January 23, 2009 10:24 PM
To: <netfilter@vger.kernel.org>
Subject: Why --syn on tcp connlimit?

> I have often seen rules such as:
>
> iptables -I FORWARD -p tcp --syn -m iprange --src-range 
> 192.168.1.10-192.168.1.250 -m connlimit --connlimit-above 150 -j DROP
>
> How is this, in effect, different from?:
>
> iptables -I FORWARD -p tcp       -m iprange --src-range 
> 192.168.1.10-192.168.1.250 -m connlimit --connlimit-above 150 -j DROP
>
> It's seems at best redundant, and at worst risky.  But I am very new  at 
> this and must be missing something. :-)
>
> Thanks.
>
> Peter
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
