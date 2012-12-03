From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: Mark traffic on one machine, match on another machine?
Date: Mon, 03 Dec 2012 13:52:55 +0200
Message-ID: <50BC9297.3050507@ngtech.co.il>
References: <08eb317b-c614-4117-855b-66ade5d2244d@tahiti.vyatta.com> <3a947589368a2610486404839274d7cb@imap.netsecspec.co.uk> <50B84725.3080608@nottheoilrig.com> <50B851E8.8070107@ngtech.co.il> <50BC6639.3090502@nottheoilrig.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50BC6639.3090502@nottheoilrig.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jack Bates <uo4zau@nottheoilrig.com>
Cc: giles@coochey.net, Steven Kath <steven@vyatta.com>, netfilter@vger.kernel.org

You use iptables mark + restore mark based on connection tracking.
you can mark the TOS on the outgoing postrouting table.
you can take a look at the iptabes man pages:
http://ipset.netfilter.org/iptables.man.html
which has --restore-mark  exaple.

Eliezer

On 12/3/2012 10:43 AM, Jack Bates wrote:
> I can imagine a couple ways of classifying traffic from our proxy server
> based on the TOS/DSCP field, and also how to set the connection mark
> based on this field. But how do I classify and shape response traffic
> from the origin server based on the connection mark?

-- 
Eliezer Croitoru
https://www1.ngtech.co.il
sip:ngtech@sip2sip.info
IT consulting for Nonprofit organizations
eliezer <at> ngtech.co.il
