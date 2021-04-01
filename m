From: Florian Westphal <fw@strlen.de>
Subject: Re: nft show counter
Date: Thu, 1 Apr 2021 20:21:04 +0200
Message-ID: <20210401182104.GG13699@breakpoint.cc>
References: <trinity-08431e16-b4eb-4bb7-8b36-df2084481611-1617212862528@3c-app-gmx-bap62>
 <20210331214053.GB13699@breakpoint.cc>
 <d5770849-515b-5514-39ab-bb6907023ca2@fhmtech.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d5770849-515b-5514-39ab-bb6907023ca2@fhmtech.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Myhr <fmyhr@fhmtech.com>
Cc: Florian Westphal <fw@strlen.de>, Frank Wunderlich <frank-w@public-files.de>, netfilter@vger.kernel.org

Frank Myhr <fmyhr@fhmtech.com> wrote:
> On 2021/03/31 17:40, Florian Westphal wrote:
> > You could use a named counter and then fetch it via 'nft list counter
> > inet tablenam countername'.
> 
> This is the straightforward solution!
> 
> Florian, is it correct that *all* counters are stateful objects, they're
> just anonymous stateful objects if used in a rule without first declaring
> them with a name? The wiki reads as if they're 2 separate things (I'm happy
> to fix but want to check with you first):
> 
> https://wiki.nftables.org/wiki-nftables/index.php/Counters

The normal counters do not have a 'hidden' internal name.

Thats also the reason why simple counters do not show up in 'nft list counters',
they only exist in the context of the rule they are used in.
