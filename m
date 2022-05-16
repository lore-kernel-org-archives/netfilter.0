From: Florian Westphal <fw@strlen.de>
Subject: Re: "nft --check" not warning about missing statement in rule
Date: Mon, 16 May 2022 15:31:04 +0200
Message-ID: <20220516133104.GA5118@breakpoint.cc>
References: <C928E2C92BFA9E4DA6068EBF01B2EC27A6DE31E9@tt-05.im.internett.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <C928E2C92BFA9E4DA6068EBF01B2EC27A6DE31E9@tt-05.im.internett.de>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Helmer <a.helmer@internett.de>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

Alexander Helmer <a.helmer@internett.de> wrote:
> Hi everyone!
> 
> I got my first nftables-based firewall in production after many years with iptables. I opted to use a nft-script to manage the ruleset. 
> A small bash wrapper does some checks first and then loads the new ruleset.
> 
> One of those checks is a syntax-check with:
> 	"nft -c -f #path-to-ruleset-file#"
> 
> For better readability I used newlines in some rules. Unfortunately at two places in the 2k lines script I failed to put a '\' at the end of a line which caused nftables to create two seperate rules instead of one.
> I do not understand how nftables interpreted the rules and why nft -c did not throw an error.
> 
> Both rules looked something like this (forward chain, drop policy):
> 
> ip saddr { xxxxx } \
> 	ip daddr { yyyyy }  		< missing \ here
> 	ct state new accept;
> 
> 
> Nftables created the rules like this:
> 
> 1. ip saddr { xxxxx } ip daddr { yyyyy }

Implict continue, just as yu guessed already.
