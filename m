From: Florian Westphal <fw@strlen.de>
Subject: Re: nft script file, using include with wildcards
Date: Thu, 9 Jan 2020 16:04:16 +0100
Message-ID: <20200109150416.GD795@breakpoint.cc>
References: <AM0PR0102MB35540D625A4D1072683C6E1F9B390@AM0PR0102MB3554.eurprd01.prod.exchangelabs.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <AM0PR0102MB35540D625A4D1072683C6E1F9B390@AM0PR0102MB3554.eurprd01.prod.exchangelabs.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alberto Spin <a.spin@datawatt.nl>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Alberto Spin <a.spin@datawatt.nl> wrote:
> I'm using nftables 0.7 (rocko branch)
> 
> I've got a nft script file that contains the following line:
> 
> # include all rule files (alphabetical order)
> include "*.rules"
> 
> When I execute this script I get the following error:
> 
> ./firewall.nft:25:1-18: Error: Could not open file "*.rules": No such file or directory
> include "*.rules"
> ^^^^^^^^^^^^^^^^^^

Wildcard support was added in 0.8.
