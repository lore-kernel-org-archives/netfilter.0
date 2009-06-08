From: Leonardo Carneiro <lscarneiro@veltrac.com.br>
Subject: Re: blocking only https access
Date: Mon, 08 Jun 2009 14:23:06 -0300
Message-ID: <4A2D48FA.1070503@veltrac.com.br>
References: <4A2D43F6.3000309@veltrac.com.br> <20090608191742.58ddfe8a@catlap>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090608191742.58ddfe8a@catlap>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Marek Kierdelewicz escreveu:
>> Hi everyone,
>>     
>
> Hi,
>
>   
>> I have readed a lot here in the list and in other places that i SHOULD 
>> NOT use domain names in iptables, cause it will result in a dns
>> request to every packet that reachs that rule.
>>     
>
> Not really. Domainname is resolved at the time of rule addition to a
> ruleset. Netfilter stores the destination address in numerical form.
>
> You can use CRON to restart firewall every night or even every hour.
> This would allow you to have the current server addresses in a
> ruleset.
>
>   
Ok, tks Marek. I'll try this.

> Cheers,
> Marek Kierdelewicz
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   
