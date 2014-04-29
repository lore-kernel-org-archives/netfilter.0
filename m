From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: proxy_arp
Date: Tue, 29 Apr 2014 08:43:08 +0530
Message-ID: <535F18C4.5000803@atc.tcs.com>
References: <20140425193531.55f41d258f184710b44487a2@lucassen.org> <535DD0BB.7050503@atc.tcs.com> <20140428190404.2786b822002cc5ad8f001ff7@lucassen.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20140428190404.2786b822002cc5ad8f001ff7@lucassen.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: richard lucassen <mailinglists@lucassen.org>

On 04/28/2014 10:34 PM, richard lucassen wrote:
> On Mon, 28 Apr 2014 09:23:31 +0530
> Vigneswaran R <vignesh@atc.tcs.com> wrote:
>
>> It seems, iptable rules will not affect the ARP.
> No, it should not :)
>
>> By any chance you
>> have arptables or ebtables installed on srv1 which is causing the
>> problem?
> Nope:
>
> # ebtables -L
> Bridge table: filter
>
> Bridge chain: INPUT, entries: 0, policy: ACCEPT
>
> Bridge chain: FORWARD, entries: 0, policy: ACCEPT
>
> Bridge chain: OUTPUT, entries: 0, policy: ACCEPT
>
> # arptables -L
> Chain INPUT (policy ACCEPT)
>
> Chain OUTPUT (policy ACCEPT)
>
> Chain FORWARD (policy ACCEPT)
>
> I just don't understand why srv1 is not arp-replying to the ip
> addresses it owns...

Did you check the rp_filter also? Try disabling the rp_filter on srv1 
(if it is not disabled already) and check.
(Just in case the source IP of the arp request and the incoming 
Interface are not matching according to the routing table entries).

echo "0" > /proc/sys/net/ipv4/conf/eth1/rp_filter

regards,
Vignesh
