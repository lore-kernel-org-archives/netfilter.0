From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: netfilter/nftables: chain rule dumps
Date: Tue, 19 Jul 2016 15:55:03 +0200
Message-ID: <20160719135503.GA1568@salvia>
References: <578636F6.70802@toulouse.viveris.com>
 <20160713144036.GA1385@salvia>
 <578DEBF0.2090707@toulouse.viveris.com>
 <20160719102855.GA11848@salvia>
 <578E2F7D.2000604@toulouse.viveris.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <578E2F7D.2000604@toulouse.viveris.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jalvarez <jalvarez@toulouse.viveris.com>
Cc: netfilter@vger.kernel.org

On Tue, Jul 19, 2016 at 03:47:41PM +0200, jalvarez wrote:
> On 19/07/2016 12:28, Pablo Neira Ayuso wrote:
> >On Tue, Jul 19, 2016 at 10:59:28AM +0200, jalvarez wrote:
> >>My current changes might actually break the expected behavior if it was some
> >>kind of "rule id counter" instead of "iteration counter". If it is possible,
> >>I would rather not put the continues in the rules loop, as the goal of these
> >>changes is mostly to avoid looping through the whole ruleset.
> >>
> >>Again, I am very thankful for your help.
> >>
> >>Here is the patch
> >Just sent a patch to netfilter-devel, I've Cc'ed you. It would be good
> >if you can test it.
> >
> >Thanks.
> 
> Thank you.
> I'll be testing this as soon as my test environment is ready.
> 
> Would you like me to send the changes to the nft-rule-get.c example in
> libnftnl afterwards ?

Yes please, this also provides a good way to test this. Thanks.
