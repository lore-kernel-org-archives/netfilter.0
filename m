From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: nft @nh segfault
Date: Fri, 4 Apr 2014 11:55:33 +0200
Message-ID: <20140404095533.GA4413@localhost>
References: <1396179281.15058.469.camel@pc2>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1396179281.15058.469.camel@pc2>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent GUERBY <laurent@guerby.net>
Cc: netfilter@vger.kernel.org

On Sun, Mar 30, 2014 at 01:34:41PM +0200, Laurent GUERBY wrote:
> Hi,
> 
> While trying to use @nh I got nft to segfault:
> 
> root@h7:~# nft --version
> nftables v0.100 (keith-alexander-filter)
> root@h7:~# cat /proc/version 
> Linux version 3.14-rc7-amd64 (debian-kernel@lists.debian.org) (gcc
> version 4.8.2 (Debian 4.8.2-16) ) #1 SMP Debian 3.14~rc7-1~exp1
> (2014-03-17)
> root@h7:~# nft add rule filter output @nh,16,4 8.8.8.8 counter
> Segmentation fault

that shouldn't crash indeed. Please, retry with latest git snapshot
and if the problem is still there file a bug to netfilter's bugzilla.
Thanks.

> I infered the syntax from src/parser.y:
> 
> payload_raw_expr	:	AT	payload_base_spec	COMMA	NUM	COMMA	NUM
> payload_base_spec	:	LL_HDR		{ $$ = PAYLOAD_BASE_LL_HDR; }
> 			|	NETWORK_HDR	{ $$ = PAYLOAD_BASE_NETWORK_HDR; }
> 
> 
> But may be I made a mistake, I could not find documentation.

Have a look at http://wiki.nftables.org

Let me know if you find some missing information, I'll schedule time
to expand/enhance it.
