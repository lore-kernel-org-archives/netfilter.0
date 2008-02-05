From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: ROUTE
Date: Tue, 5 Feb 2008 13:51:35 +0100
Message-ID: <000f01c867f5$d762bd40$0b0ffe0a@NS006819>
References: <47A836FD.7060607@gmail.com> <000301c867ec$0d10d990$0b0ffe0a@NS006819> <47A858A8.8000207@gmail.com>
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47A858A8.8000207@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> Most odd / co-incidental.
>
> root@zion:/usr/src/patch-o-matic-ng-20080130# ./runme --download
> Successfully downloaded external patch geoip
> Successfully downloaded external patch condition
> Successfully downloaded external patch IPMARK
> Successfully downloaded external patch ROUTE	<- And here it is.

Yes, but it won't work if your kernel is recent: when pom-ng starts, you
will not be asked to patch the kernel for ROUTE.

> Successfully downloaded external patch connlimit
> Successfully downloaded external patch ipp2p
> Successfully downloaded external patch time
> ./patchlets/ipv4options exists and is not external
> ./patchlets/TARPIT exists and is not external
> Successfully downloaded external patch ACCOUNT
> Successfully downloaded external patch pknock
> Hey! KERNEL_DIR is not set.

Try:
IPTABLES_DIR="/path/to/iptables-source" \
KERNEL_DIR="/path/to/kernel-source" \
./runme --download

> But i still want to try your advised route. Will be fun.

Good luck. :-)


Grts,
Rob


