From: Florian Westphal <fw@strlen.de>
Subject: Re: Is it possible to change a chains default policy when rules are
 already present?
Date: Fri, 14 Aug 2020 15:40:00 +0200
Message-ID: <20200814134000.GG1660@breakpoint.cc>
References: <AM0PR06MB4628C196EBABF0FD53AA8006C5430@AM0PR06MB4628.eurprd06.prod.outlook.com>
 <20200814110749.GA30331@salvia>
 <c0afef4e-7276-a368-226a-cb315ea1ab69@tootai.net>
 <1ed447f1-da05-38c7-e86e-4451f8040c88@thelounge.net>
 <2b96d288-50d9-b64b-f5ac-3343d3b9f631@tootai.net>
 <20200814130842.GF1660@breakpoint.cc>
 <VI1PR06MB4639D0AB412AA72F75A96A06C5400@VI1PR06MB4639.eurprd06.prod.outlook.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <VI1PR06MB4639D0AB412AA72F75A96A06C5400@VI1PR06MB4639.eurprd06.prod.outlook.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com>
Cc: Florian Westphal <fw@strlen.de>, Daniel <tech@tootai.net>, Reindl Harald <h.reindl@thelounge.net>, Pablo Neira Ayuso <pablo@netfilter.org>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com> wrote:
> > Daniel <tech@tootai.net> wrote:
> > > dh@peech:~$ sudo nft add chain ip6 mangle prerouting "{ type nat hook 
> > > prerouting priority -350 ; policy accept ; }"
> > > Error: Could not process rule: Operation not supported add chain ip6 
> > > mangle prerouting { type nat hook prerouting priority -350; policy 
> > > accept; }
> > 
> > Historic artifact, try a value larger than -200, e.g. -199.
> > I've sent a patch to zap this outdated check.
> 
> Didn't work for me either:
> #nft add chain ip6 x y {type filter hook input priority \-100\;}
> nft: invalid option -- '1'

Different problem.  Just follow Daniels example and quote everything,
i.e.  nft add chain ip6 x y "{ type filter hook input priority -100; }"
