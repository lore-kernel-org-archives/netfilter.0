From: Florian Westphal <fw@strlen.de>
Subject: Re: Running nft --check as non-root
Date: Thu, 11 Aug 2022 18:15:00 +0200
Message-ID: <20220811161500.GF8667@breakpoint.cc>
References: <874jyiu661.fsf@hoeg.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <874jyiu661.fsf@hoeg.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Hoeg <peter@hoeg.com>
Cc: netfilter@vger.kernel.org

Peter Hoeg <peter@hoeg.com> wrote:
> as part of deploying nftables rules on NixOS, I want to check the syntax before actually trying to deploy them.
> 
> Now, nft --check --file works fine when run as root but the builder used does not have root permissions (or access to sudo or anything like that). Is there any particular reason why nft --check needs to run as root or any way to make it work as !root?

Yes, this not a syntax check. The ruleset is passed to the kernel.

The only difference is the lack of the final 'commit' instruction to
activate the ruleset, this makes the kernel abort/unwind the entire
transaction.
