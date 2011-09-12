From: Mike <ipso@snappymail.ca>
Subject: Re: v2.6.16 to v2.6.38 breaks routing?
Date: Mon, 12 Sep 2011 07:59:18 -0700
Message-ID: <4E6E1E46.1030504@snappymail.ca>
References: <4E6D3F01.4060807@snappymail.ca> <4E6DCFBB.6060401@oracle.com>
Reply-To: ipso@snappymail.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E6DCFBB.6060401@oracle.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: John Haxby <john.haxby@oracle.com>
Cc: netfilter@vger.kernel.org

I currently have rp_filter set to 0 on all interfaces, which is the same 
as I had it on the old server (v2.6.16). Would having it disabled 
completely still cause problems for my setup?

Thanks.

On 11-09-12 02:24 AM, John Haxby wrote:
> On 12/09/11 00:06, Mike wrote:
>> I'm in the process of upgrading an older Linux router from Mandriva
>> running kernel v2.6.16 to Ubuntu running v2.6.38 kernel, however my
>> moderately complex firewall/routing script doesn't quite work the same
>> way on the newer system. The basic idea is that I have three routes to
>> three different ISPs, and one to the internal network. I then mark
>> packets to go out a specific ISP depending on the type of traffic.
>> This all works fine if the packets are initiated from the router
>> itself or from a computer on the intenral network with packets
>> destined out the default ISP, but it fails completely if the packets
>> are initiated from a computer on the internal network destined out an
>> non-default route.
>>
>> What I don't understand is I diff'd the routing tables and all
>> iptables commands they are virtually identical between the two
>> servers, yet the newer server doesn't work as expected.
> You might be running afoul of the change in behaviour of rp_filter that
> happened around 2.6.32.
>
> Previously (as in your 2.6.16 kernel) setting
> net.ipv4.conf.default.rp_filter=1 in /etc/sysctl.conf (or wherever your
> distro puts that file would give you what is now termed "loose reverse
> path filtering".  Now, however, that value gives you strict reverse path
> filtering and 2 gives you loose reverse path filtering.
>
> Strict reverse path filtering discards incoming packets whose source
> address would not be routed to the interface that the packets originated
> from; loose reverse path filtering merely checks that the source address
> is routable.   In Documentation/networking/ip-sysctl.txt is says that
> you might want loose reverse path filtering for complicated routing set
> ups (like yours).
>
> In some cases you can mess with the routing tables dynamically so that a
> source address appearing on an interface will cause outgoing packets for
> that address to use that interface.   I haven't really looked into this
> yet: setting rp_filter=2 was enough to get over my immediate problem,
> although I would still like to get rid of the asymmetric routing at some
> stage.   If you do go down that path though, I would be very interested
> to see what you do.
>
> jch
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Mike

