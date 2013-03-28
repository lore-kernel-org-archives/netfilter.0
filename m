From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Question about xt_ipp2p module
Date: Thu, 28 Mar 2013 18:59:24 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1303281857530.32638@nerf07.vanv.qr>
References: <5151FCD4.8020901@stidia.com>  <1364333332.1819.5.camel@andrew-desktop> <5152B9AE.4020901@stidia.com>  <alpine.LNX.2.01.1303271432150.12443@nerf07.vanv.qr> <1364406741.1819.23.camel@andrew-desktop>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1364406741.1819.23.camel@andrew-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Beverley <andy@andybev.com>
Cc: Dmitry Korzhevin <dmitry.korzhevin@stidia.com>, netfilter@vger.kernel.org


On Wednesday 2013-03-27 18:52, Andrew Beverley wrote:
>> > 2       26 10983 ACCEPT     all  --  *      eth0    0.0.0.0/0
>> >  10.2.0.2            policy match dir out pol ipsec reqid 116 proto 50
>> >
>> >
>> > But, this rules is inserted automaticaly by strongswan ipsec daemon, after my
>> > connection..
>> 
>> So turn it off in strongswan?
>
>Or if you can't do that, then just delete the rules once they're in
>there, or reinsert your own rules at a higher priority.

Well, strongswan has this leftfirewall=yes option that probably causes this,
but I have not yet found a reason to use it, because you can just use -m policy
on your own. While you do not know the reqid, it probably does not matter
because strongswan would add ACCEPT rules for all of them anyway.
