From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: set ipv4_addr interval timeout?
Date: Mon, 16 Jan 2017 17:28:56 +0100
Message-ID: <20170116162856.GA2479@salvia>
References: <186719b4-eedb-80aa-232c-11f07e4ebcc8@trackivity.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <186719b4-eedb-80aa-232c-11f07e4ebcc8@trackivity.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James <vger_tracker@trackivity.com>
Cc: netfilter@vger.kernel.org

On Fri, Jan 06, 2017 at 08:18:11PM -0500, James wrote:
> http://git.netfilter.org/nftables/tree/src/parser_bison.y#n1171 (and especially #n1206 and #n1213)
> 
> would seem to indicate that the following should work... *is* it supposed to work?
> 
> uname -a
> Linux pc 4.8.0-32-generic #34-Ubuntu SMP Tue Dec 13 14:30:43 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux
> nft --version
> nftables v0.7 (Scrooge McDuck)
> nft flush ruleset
> nft list ruleset
> nft add table inet firewall
> nft add set inet firewall v4timeoutintervals { type ipv4_addr\; flags interval\; timeout 1h\; }
> <cmdline>:1:1-89: Error: Could not process rule: Operation not supported
> add set inet firewall v4timeoutintervals { type ipv4_addr; flags interval; timeout 1h; }
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Either interval or timeout alone works but interval and timeout together don't.
> 
> Basically, it seems that you can't use timeouts for subnets.

Yes.

Combination of intervals and timeouts is not yet implemented. Please,
file a bug at netfilter's bugzilla so we can keep track of this
enhancement request:

        https://bugzilla.netfilter.org/

Thanks!
