From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: Mark traffic on one machine, match on another machine?
Date: Fri, 30 Nov 2012 08:27:52 +0200
Message-ID: <50B851E8.8070107@ngtech.co.il>
References: <08eb317b-c614-4117-855b-66ade5d2244d@tahiti.vyatta.com> <3a947589368a2610486404839274d7cb@imap.netsecspec.co.uk> <50B84725.3080608@nottheoilrig.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50B84725.3080608@nottheoilrig.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jack Bates <uo4zau@nottheoilrig.com>
Cc: giles@coochey.net, Steven Kath <steven@vyatta.com>, netfilter@vger.kernel.org

You can do a connection marking\remarking based on the TOS of one packet.
This way you need to set it only on even one packet of the connection.

Regards,
Eliezer

On 11/30/2012 7:41 AM, Jack Bates wrote:
> Cool, thanks a lot for this advice Steven and Giles, our proxy server is
> Apache Traffic Server, so I started work on a simple "remap" plugin to
> set TOS/DSCP field: http://nottheoilrig.com/trafficserver/201211300/tos.cc
>
> It should enable something like the following, in the Traffic Server
> remap.config:
>
>    map http://gmail.com @plugin=tos.so @pparam=3
>    map http://facebook.com @plugin=tos.so @pparam=7
>
> But what about response traffic? Is there a way to copy the TOS/DSCP
> field to the response from the origin server?
