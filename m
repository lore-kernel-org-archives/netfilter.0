From: Florian Westphal <fw@strlen.de>
Subject: Re: NFTables: Can not add logs
Date: Tue, 29 Sep 2020 12:05:23 +0200
Message-ID: <20200929100523.GA20140@breakpoint.cc>
References: <VI1PR06MB4639FCC3DB3457BD9B067E82C5320@VI1PR06MB4639.eurprd06.prod.outlook.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <VI1PR06MB4639FCC3DB3457BD9B067E82C5320@VI1PR06MB4639.eurprd06.prod.outlook.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com> wrote:
> Hi 
> 
> I am trying to figure out why I sometimes lose connection during some test activites.
> Therefore I would like to use the logging option to see what has been dropped.
> 
> But I get:
> nft add rule x y log
> Error: Could not process rule: No such file or directory
> add rule x y log
^^^^^^^^^^^^^^^^^
> CONFIG_NFT_LOG=y

Missing CONFIG_NF_LOG_IPV4?
