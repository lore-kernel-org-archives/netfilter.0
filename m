From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Minor language issues in documentation
Date: Wed, 17 Sep 2014 10:54:06 +0200
Message-ID: <20140917085406.GA5213@salvia>
References: <87vbon33nr.fsf@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87vbon33nr.fsf@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Gamari <ben@smart-cactus.org>
Cc: netfilter@vger.kernel.org

On Tue, Sep 16, 2014 at 12:56:24PM -0400, Ben Gamari wrote:
> 
> Hello all,
> 
> While browsing the nftables documentation I noticed that the word
> "performance" is often misused in a variety of ways. For instance,
> on the main page[1],
> 
>     Fast lookups through performance data structures: The new syntax
>     allows you to arrange you rule-set in a very performance way
>     contrary to purely linear-list based filtering policies.
> 
> The use in the first sentence might be acceptable as a colloquialism but
> really could be improved by replacing "performance" with "high
> performance".
> 
> The second sentence is a bit more serious as it uses "performance", a
> noun, as an adjective. You might consider replacing this with
> "performance-oriented" or a similar rewrite. I've found this same
> mix-up in a few other places as well[2].
> 
> I also noticed a couple other small issues,
> 
>   * [3] misspells "hybrid"
>   * The "Basic operational" section of the documentation ToC would be
>     named "Basic operation"
> 
> Otherwise thanks for the great packet mangling framework and thorough
> documentation!

I have fixed what you indicated in the nftables wiki. Thanks.
