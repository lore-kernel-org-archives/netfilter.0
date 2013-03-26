From: Andrew Beverley <andy@andybev.com>
Subject: Re: Question about xt_ipp2p module
Date: Tue, 26 Mar 2013 21:28:52 +0000
Message-ID: <1364333332.1819.5.camel@andrew-desktop>
References: <5151FCD4.8020901@stidia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5151FCD4.8020901@stidia.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1364333340;
	bh=Y9DDCQl+97Gfz/f0F+0G3mE9K7jXVKCUM2Kr9h1u2hY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=F2LiNXZzr8bUxCsBN1F5coDPqcIdwC8m+gKMlY/wkjFxEB5jyq6+ti+QGmr2KYrKI
	 7S/TPppB32FTXSRm5HMyl8xGuJfedq8ivJC0zt43cxjbBcNmotQpUKnmYYgMJE5Eme
	 AgSYzBJ5Qb7V9vGtZYXPrpc9h735qlDqFejaOIaE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dmitry.korzhevin@stidia.com
Cc: netfilter@vger.kernel.org

On Tue, 2013-03-26 at 21:53 +0200, Dmitry Korzhevin wrote:
> Hi,
> 
> I'm using Debian 6.0.7 x86_64. I have installed xtables with xt_ipp2p 
> and seems i did something wrong, because my rules doesn't drop 
> bittorrent traffic.

My gut instinct is it's not working because ipp2p is old software and
may not match the bittorrent stream that you are using.

> 1       33  2970 ACCEPT     all  --  eth0   *       10.2.0.2 
>   0.0.0.0/0           policy match dir in pol ipsec reqid 116 proto 50
> 2       26 10983 ACCEPT     all  --  *      eth0    0.0.0.0/0 
>   10.2.0.2            policy match dir out pol ipsec reqid 116 proto 50
> 3        0     0 DROP       all  --  *      *       0.0.0.0/0 
>   0.0.0.0/0           ipp2p --bit

Nonetheless, given that the default policy is ACCEPT, why not just
delete rules 1 and 2 to check whether that is the problem?

Are you forwarding the bittorrent traffic to another machine or
downloading it locally? I see that you are using rules in both the INPUT
and FORWARD chains.

Andy


