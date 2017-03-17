From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Suggestion: Default (else) value for maps, dictionaries, and
 Verdicts
Date: Fri, 17 Mar 2017 11:14:25 +0100
Message-ID: <20170317101425.GA1850@salvia>
References: <b32fd2e4-d3e5-8519-6b6c-e218781a813f@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b32fd2e4-d3e5-8519-6b6c-e218781a813f@pobox.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert White <rwhite@pobox.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thu, Mar 16, 2017 at 11:55:35PM +0000, Robert White wrote:
> Being able to set (and preferably modify at runtime) a default value to be
> returned/evaluated/executed for the various search-and-do lists (sets) would
> be extremely helpful.

I guess you refer to some sort of catch-all case, if we find no
matching in the set.

> You can kind of fake it with a verdict set of goto(s) and a subsequent
> unconditional goto but that's branchtastically elaborate.
> 
> So the existence of a possible default would be value-attached flag (just
> like timeout is a flag with a value).
> 
> I don't have the familiarity with the whole stack (nft, library, and kernel
> state machine) necessary to offer a patch at this time since it would take a
> nudge of all three to be able to test it all.

Please, add an entry to the netfilter's bugzilla, so we can keep an
eye on this.

Thanks!
