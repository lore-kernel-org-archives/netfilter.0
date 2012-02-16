From: Azfar Hashmi <azfar.hashmi@cloudways.com>
Subject: Re: How to restrict torrent download  ?
Date: Thu, 16 Feb 2012 21:07:04 +0500
Message-ID: <4F3D29A8.8020402@cloudways.com>
References: <20120216160904.2ea59e26@shiva.selfip.org>  <1329389715.3296.12.camel@ns014530.dcyb.net>  <4F3CE276.4010500@cloudways.com> <20120216171502.78212a3e@shiva.selfip.org>  <20120216171909.3a3cd4c1@shiva.selfip.org> <1329393715.3296.18.camel@ns014530.dcyb.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1329393715.3296.18.camel@ns014530.dcyb.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Cc: netfilter@vger.kernel.org

Hi,

I use shorewall as iptables frontend hence my configurations are totally
different.

On 2/16/2012 5:01 PM, Rob Sterenborg (lists) wrote:
> On Thu, 2012-02-16 at 17:19 +0530, J. Bakshi wrote:
>> Ok, there is xtables-addons-common in my debian box.
>> Could you please share your config to block p2p bandwidth ?
> I think
>
> # man xtables-addons, Section ipp2p
> and/or
> # iptables -m ipp2p --help
>
> will help you.
>
> You have to specify at least one ipp2p protocol to match:
>
> $ipt -A FORWARD -m ipp2p --bit [...etc...]
>
>
> --
> Rob
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

