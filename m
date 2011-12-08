From: Susan Hinrichs <shinrich@network-geographics.com>
Subject: Re: nfqueue vs. tproxy
Date: Wed, 07 Dec 2011 19:43:41 -0600
Message-ID: <1323308622.17564.190.camel@kiki>
References: <201112080025.pB80PGIe091691@medusa.blackops.org>
Reply-To: shinrich@network-geographics.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201112080025.pB80PGIe091691@medusa.blackops.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: msk@cloudmark.com
Cc: netfilter@vger.kernel.org

You could do that, but the second recipient of the code would lose the
original destination address and port information.

This would be more like the REDIRECT target in iptables.

On Wed, 2011-12-07 at 16:25 -0800, msk@cloudmark.com wrote:
> I've been reading up on tproxy and nfqueue.  Just to confirm my understanding
> of the two:
> 
> Could one write a layer of code that uses the nfq_*() functions to basically
> implement what tproxy can do by simply adjusting the destination information
> and checksum, and then returning NF_REPEAT verdicts for each?
> 
> Thanks,
> -MSK
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


