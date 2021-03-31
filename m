From: Florian Westphal <fw@strlen.de>
Subject: Re: nft show counter
Date: Wed, 31 Mar 2021 23:40:53 +0200
Message-ID: <20210331214053.GB13699@breakpoint.cc>
References: <trinity-08431e16-b4eb-4bb7-8b36-df2084481611-1617212862528@3c-app-gmx-bap62>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <trinity-08431e16-b4eb-4bb7-8b36-df2084481611-1617212862528@3c-app-gmx-bap62>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Wunderlich <frank-w@public-files.de>
Cc: netfilter@vger.kernel.org

Frank Wunderlich <frank-w@public-files.de> wrote:
> Hi,
> 
> i want to read counters defined in nftables, but have not found a solid way to do this
> 
> nft list table ip filter
> 
> shows me the rules from specific table with all chains, rules and counters, e.g.
> 
> 	chain voip1 {
> 		counter packets 3226 bytes 780864 accept
> 	}
> 
> 	chain voip2 {
> 		counter packets 1640 bytes 119449 accept
> 	}
> 
> this needs to be parsed with grep/sed/awk, so maybe there is an easier way to read the counters. found nothing in manpage or google, so i just ask here. maybe there is a way to show the last x min traffic. i need this to check if connections is "alive"

You could use a named counter and then fetch it via 'nft list counter
inet tablenam countername'.
