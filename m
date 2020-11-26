From: Florian Westphal <fw@strlen.de>
Subject: Re: mistakes on wiki
Date: Thu, 26 Nov 2020 23:13:44 +0100
Message-ID: <20201126221344.GH2730@breakpoint.cc>
References: <DBBPR07MB7402FA99F0836910743FEB76A3F90@DBBPR07MB7402.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DBBPR07MB7402FA99F0836910743FEB76A3F90@DBBPR07MB7402.eurprd07.prod.outlook.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bbmt <bbmt@hotmail.fr>
Cc: netfilter@vger.kernel.org

bbmt <bbmt@hotmail.fr> wrote:
> hi,
> sorry for my english.
> during my research, i saw two mistake on the wiki.
> in this page: https://wiki.nftables.org/wiki-nftables/index.php/Matching_packet_metainformation
> the ibridgename and obridgename don't exist. The name is now ibrname and
> obrname.
> (http://git.netfilter.org/nftables/commit/?h=v0.9.0&id=4787edad132c30ae0f6bb00135ae5d970b0ccb74)

Right, updated.

> On this page:
> https://wiki.nftables.org/wiki-nftables/index.php/Bridge_filtering
> we can read "There is currently no connection tracking available for bridge
> filtering. "

I've removed it, thanks for pointing this out.
