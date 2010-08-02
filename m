From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: firewall and squid running on the same box
Date: Mon, 2 Aug 2010 14:10:14 +0200
Message-ID: <20100802141014.240229f0@catus>
References: <AANLkTimOQQqE1jrNLGKZW3T-dCmAAJzYu8cUyRTR4bMY@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimOQQqE1jrNLGKZW3T-dCmAAJzYu8cUyRTR4bMY@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mamadou =?UTF-8?B?VG91csOp?= <e2ia.ci@gmail.com>
Cc: netfilter@vger.kernel.org

>Hi all,

Hi Mamadou,

>On my firewall box i also run squid in transparent mode.
>when users access http, they are redirect to the proxy. but the source
>ip address is change to the box ip address.
>Is there a mean to tell squid not  to change the source ip address ?

Look at tproxy solution:
http://wiki.squid-cache.org/Features/Tproxy4
With this feature source ip address is not changed. I think you may
experience some problems if you wanna do NAT on the very same box.

Regards,
Marek
