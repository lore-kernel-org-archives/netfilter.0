From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: blocking only https access
Date: Mon, 8 Jun 2009 19:17:42 +0200
Message-ID: <20090608191742.58ddfe8a@catlap>
References: <4A2D43F6.3000309@veltrac.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A2D43F6.3000309@veltrac.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Leonardo Carneiro <lscarneiro@veltrac.com.br>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

>Hi everyone,

Hi,

>I have readed a lot here in the list and in other places that i SHOULD 
>NOT use domain names in iptables, cause it will result in a dns
>request to every packet that reachs that rule.

Not really. Domainname is resolved at the time of rule addition to a
ruleset. Netfilter stores the destination address in numerical form.

You can use CRON to restart firewall every night or even every hour.
This would allow you to have the current server addresses in a
ruleset.

Cheers,
Marek Kierdelewicz
