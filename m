From: Jack Bates <uo4zau@nottheoilrig.com>
Subject: Re: Mark traffic on one machine, match on another machine?
Date: Mon, 03 Dec 2012 06:32:47 -0800
Message-ID: <50BCB80F.4090208@nottheoilrig.com>
References: <08eb317b-c614-4117-855b-66ade5d2244d@tahiti.vyatta.com> <3a947589368a2610486404839274d7cb@imap.netsecspec.co.uk> <50B84725.3080608@nottheoilrig.com> <50B851E8.8070107@ngtech.co.il> <50BC6639.3090502@nottheoilrig.com> <50BC9297.3050507@ngtech.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nottheoilrig.com;
	s=mail; t=1354545175;
	bh=0nDHtRqLvYF+E1rpnCdUweYuzdlsSCd/lzMdJPZU8P4=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=DfvNQyGaJF3ojy3aXfmITxVymyuvs0pvscoS43DlEOvFwLfniH3npS5VHeZAf8Ngb
	 EIkgoLWxK5TU028HkIxzTfmXuoguoOdf8YHWNxvu8NSjThbF/mS4ECiqlwZ4hxUcjf
	 VuobThVcA0VrzBK1jGkee2cXAV1Vlliwl/8+y/Po=
In-Reply-To: <50BC9297.3050507@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Eliezer Croitoru <eliezer@ngtech.co.il>
Cc: giles@coochey.net, Steven Kath <steven@vyatta.com>, netfilter@vger.kernel.org

Thanks a lot for your help, how can I evaluate --restore-mark before I 
classify and shape response traffic from the origin server?

I think you mean something like:

   # Copy ctmart to nfmark (e.g. 1, 2)
   iptables -A PREROUTING -t mangle -i eth0.2 -j CONNMARK --restore-mark

   # Classify by nfmark (e.g. 1, 2), send unmarked traffic to class 2:2
   tc filter add dev eth0.2 parent ffff: protocol ip handle 1 fw flowid 
2:1 action mirred egress redirect dev ifb0
   tc filter add dev eth0.2 parent ffff: protocol ip handle 2 fw flowid 
2:3 action mirred egress redirect dev ifb0
   tc filter add dev eth0.2 parent ffff: protocol ip u32 match u32 0 0 
flowid 2:2 action mirred egress redirect dev ifb0

Just how can I get --restore-mark to evaluate before tc filter?

Another way I can imagine is with the CLASSIFY target:

   # Send unmarked traffic to class 2:2
   iptables -A PREROUTING -t mangle -i eth0.2 -m connmark --mark 1 -j 
CLASSIFY 2:1
   iptables -A PREROUTING -t mangle -i eth0.2 -m connmark --mark 2 -j 
CLASSIFY 2:3
   iptables -A PREROUTING -t mangle -i eth0.2 -j CLASSIFY 2:2

But I have the same challenge, how can I evaluate the CLASSIFY target 
before I shape traffic?

Or is there another way to classify and shape response traffic from the 
origin server based on the TOS/DSCP field of the request?

On 03/12/12 03:52 AM, Eliezer Croitoru wrote:
> You use iptables mark + restore mark based on connection tracking.
> you can mark the TOS on the outgoing postrouting table.
> you can take a look at the iptabes man pages:
> http://ipset.netfilter.org/iptables.man.html
> which has --restore-mark  exaple.
>
> Eliezer
>
> On 12/3/2012 10:43 AM, Jack Bates wrote:
>> I can imagine a couple ways of classifying traffic from our proxy server
>> based on the TOS/DSCP field, and also how to set the connection mark
>> based on this field. But how do I classify and shape response traffic
>> from the origin server based on the connection mark?
