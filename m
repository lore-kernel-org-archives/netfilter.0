From: Whit Blauvelt <whit@transpect.com>
Subject: Re: Could Cogent be doing packet mangling that would confuse
 Netfilter about interfaces?
Date: Mon, 15 Aug 2011 17:25:54 -0400
Message-ID: <20110815212553.GA32552@black.transpect.com>
References: <20110723003617.GA17279@black.transpect.com>
 <20110725000139.GA10041@black.transpect.com>
 <20110815171353.GA15638@black.transpect.com>
 <097A5326-A354-436E-9932-91D3A912494A@shorewall.net>
 <20110815203335.GB27440@black.transpect.com>
 <1313442633.20254.7.camel@sami.shorewall.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1313442633.20254.7.camel@sami.shorewall.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Eastep <teastep@shorewall.net>
Cc: netfilter@vger.kernel.org

On Mon, Aug 15, 2011 at 02:10:33PM -0700, Tom Eastep wrote:

> I don't have time ATM to give you detailed help, but
> http://www.shorewall.net/FoolsFirewall.html#id36131257 explains what
> happens when two firewall interfaces are effectively connected to the
> same ethernet network. That may help you figure out where the problem
> is.

Tom,

I appreciate all suggestions. I'm pretty sure the guy in charge of our
switch-and-cable infrastructure hasn't connected any switch to more than one
zone - because I've specifically asked him before, he gave me that
assurance, and he's a smart guy. But I'll ask again.

Meanwhile, if anyone else here has a suggestion, the working assumption is
that we don't have an example of the "Fool's Firewall" (as it is very
clearly explained on Tom's page) so other suggestions will also be
appreciated.

Thanks,
Whit

