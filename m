From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Question about xt_ipp2p module
Date: Wed, 27 Mar 2013 14:32:34 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1303271432150.12443@nerf07.vanv.qr>
References: <5151FCD4.8020901@stidia.com> <1364333332.1819.5.camel@andrew-desktop> <5152B9AE.4020901@stidia.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5152B9AE.4020901@stidia.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Korzhevin <dmitry.korzhevin@stidia.com>
Cc: netfilter@vger.kernel.org, andy@andybev.com

On Wednesday 2013-03-27 10:19, Dmitry Korzhevin wrote:
>
> 1 33  2970 ACCEPT     all  --  eth0   *       10.2.0.2   0.0.0.0/0      policy
> match dir in pol ipsec reqid 116 proto 50
> 2       26 10983 ACCEPT     all  --  *      eth0    0.0.0.0/0
>  10.2.0.2            policy match dir out pol ipsec reqid 116 proto 50
>
>
> But, this rules is inserted automaticaly by strongswan ipsec daemon, after my
> connection..

So turn it off in strongswan?
