From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: proxy_arp [resolved]
Date: Tue, 29 Apr 2014 16:49:18 +0530
Message-ID: <535F8AB6.10503@atc.tcs.com>
References: <20140425193531.55f41d258f184710b44487a2@lucassen.org> <535DD0BB.7050503@atc.tcs.com> <20140428190404.2786b822002cc5ad8f001ff7@lucassen.org> <535F18C4.5000803@atc.tcs.com> <20140429131333.60542255030542ac9fdd7456@lucassen.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20140429131333.60542255030542ac9fdd7456@lucassen.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: richard lucassen <mailinglists@lucassen.org>

On 04/29/2014 04:43 PM, richard lucassen wrote:
> On Tue, 29 Apr 2014 08:43:08 +0530
> Vigneswaran R <vignesh@atc.tcs.com> wrote:
>
>>> I just don't understand why srv1 is not arp-replying to the ip
>>> addresses it owns...
>> Did you check the rp_filter also? Try disabling the rp_filter on srv1
>> (if it is not disabled already) and check.
>> (Just in case the source IP of the arp request and the incoming
>> Interface are not matching according to the routing table entries).
>>
>> echo "0" > /proc/sys/net/ipv4/conf/eth1/rp_filter
> No, but echoing "2" (relaxed) did the job. Thnx! AFAIK this is still a
> bug: the 0 does not work anymore, 0 or 1, it's equal. I reported this a
> few years ago, but the error still remains.

Ok.

Regards,
Vignesh
