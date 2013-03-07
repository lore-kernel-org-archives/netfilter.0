From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Connection tracking counters increasing
Date: Thu, 7 Mar 2013 18:16:24 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1303071816090.23717@nerf07.vanv.qr>
References: <5138BC91.9060903@amfes.com> <alpine.LNX.2.01.1303071726260.2529@nerf07.vanv.qr> <assp.0778ebbb31.5138C95B.1080405@amfes.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <assp.0778ebbb31.5138C95B.1080405@amfes.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Daniel L. Miller" <dmiller@amfes.com>
Cc: Netfilter-Users <netfilter@vger.kernel.org>

On Thursday 2013-03-07 18:07, Daniel L. Miller wrote:

> On 3/7/2013 8:29 AM, Jan Engelhardt wrote:
>> On Thursday 2013-03-07 17:13, Daniel L. Miller wrote:
>>
>>> I've noticed that my connection tracking counters keep increasing -
>> Which counters?
>>
> /proc/sys/net/netfilter/nf_conntrack_count
>
> and when it reaches /proc/sys/net/netfilter/nf_conntrack_max things break.

Could it be you are being DDoSed?
