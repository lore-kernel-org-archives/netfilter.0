From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables and performance
Date: Tue, 13 May 2008 11:24:54 -0500
Message-ID: <4829C0D6.6070703@riverviewtech.net>
References: <1210661080.5829.225.camel@localhost.localdomain> <1210661965.5829.227.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1210661965.5829.227.camel@localhost.localdomain>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 05/13/08 01:59, Eli Hadad wrote:
> 1. Is there a limit to the number of rules I can add to specific 
> chain? I need to have around 20000 rules.

Not that I'm aware of.

Do you need to have 20,000 rules to be processed linearly or could they 
be broken out in to user-defined chains that are jumped to in a tree 
like structure to make the number of tests smaller (than 20,000)?

> 2. What is the performance implications of using this large number of 
> rules? Is there any numbers people can share.

Well, any time you use an unoptimized list to compare against things 
will not be as good as they can be.

However I think if you intelligently design your (user defined) chains 
and use IP Sets where you can, things should be fine.

I find it very unlikely that you need a list of rules to be processed 
linearly one after the other looking for a match.  In that list there 
should be a way to sub-divide and jump to smaller user defined chains to 
make the next decision and eventually (after a few chains and decisions 
there in) get to the final rule *MUCH* faster than processing each and 
every single rule for each and every single packet.

> 3. I also saw the HIPAC project which claim to have much better 
> performance. Is there any work done to integrate same type of 
> functionality into iptables?

I have yet to see any evidence one way or the other as to whether or not 
stock NetFilter and / or HIPAC are better.  (Though I have not been 
looking either.)



Grant. . . .
