From: Brent Clark <brentgclarklist@gmail.com>
Subject: Re: ROUTE
Date: Tue, 05 Feb 2008 14:38:00 +0200
Message-ID: <47A858A8.8000207@gmail.com>
References: <47A836FD.7060607@gmail.com> <000301c867ec$0d10d990$0b0ffe0a@NS006819>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <000301c867ec$0d10d990$0b0ffe0a@NS006819>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Rob Sterenborg wrote:
> 
> The module is removed some time ago and although I don't know the exact
> reason, I can imagine it has to do with maintaining it but of course
> there could be another reason.
> http://www.gossamer-threads.com/lists/iptables/devel/68781
> 
> You could mark the packets and route them using iproute2, but I don't
> know if that would satisfy your needs. Or, if it's of use for you,
> checkout the TEE target.
> http://www.spinics.net/lists/netfilter/msg42319.html
> http://dev.computergmbh.de/wsvn/misc_kernel/xt_TEE/
> 

Thank you for your reply.

Most odd / co-incidental.

root@zion:/usr/src/patch-o-matic-ng-20080130# ./runme --download
Successfully downloaded external patch geoip
Successfully downloaded external patch condition
Successfully downloaded external patch IPMARK
Successfully downloaded external patch ROUTE		<- And here it is.
Successfully downloaded external patch connlimit
Successfully downloaded external patch ipp2p
Successfully downloaded external patch time
./patchlets/ipv4options exists and is not external
./patchlets/TARPIT exists and is not external
Successfully downloaded external patch ACCOUNT
Successfully downloaded external patch pknock
Hey! KERNEL_DIR is not set.

But i still want to try your advised route. Will be fun.

Thanks again.

Brent Clark
