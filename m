From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: Using variables in named sets
Date: Mon, 29 Aug 2016 18:04:29 +0200
Message-ID: <20160829160429.GA20024@salvia>
References: <97002fd1-5d03-64e7-37c0-3807c2c59d37@foteviken.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <97002fd1-5d03-64e7-37c0-3807c2c59d37@foteviken.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Hainke <andreas.hainke@foteviken.de>
Cc: netfilter@vger.kernel.org

Hi Andreas,

On Mon, Aug 29, 2016 at 01:37:20PM +0200, Andreas Hainke wrote:
> Hi,
> 
> I have a question regarding the definition of variables in nft. I have
> created two files rules.nft and definitions.nft. The file rules.nft 
> contains a ruleset as follows:
> 
> include "/opt/firewall/filter/definitions.nft"
> table inet forward {
> *	   set s-ext-2-int {**
> **		    type ipv4_addr . inet_service**
> **		    elements =	{ $s-ext-2-int }**
> **	    }*
> 
>	  chain segments {
>		  type filter hook forward priority 0; policy drop;
>		  ct state established, related accept
> 
>		  ip saddr $g_n_int ip daddr $n_dmz ct state new jump
> int-2-dmz
>		  ip saddr $n_dmz ip daddr $g_n_int ct state new jump
> dmz-2-int
>		  ip saddr $g_n_int ip daddr $n_ext ct state new jump
> int-2-ext
>		  ip saddr $n_ext ip daddr $g_n_int ct state new jump
> ext-2-int

Not related, but you can represent this is a more performance way
using maps, just a simplification of the ruleset above:

define g_n_int = 1.1.1.1
define n_dmz = 2.2.2.2
define n_ext = 3.3.3.3

table inet forward {
	chain int-2-dmz {
	}
	chain dmz-2-int {
	}
	chain int-2-ext {
	}
	chain ext-2-int {
	}

	chain segments {
		ct state new ip saddr . ip saddr vmap { \
			$g_n_int . $n_dmz : jump int-2-dmz, \
			$n_dmz . $g_n_int : jump dmz-2-int, \
			$g_n_int . $n_ext : jump int-2-ext, \
			$n_ext . $g_n_int : jump ext-2-int
		}
	}
}

This is very fast as we use concatenations and maps to find the
destination chain to jump in O(1), this is scales up nicely.

[...]
> I can use the variables as expected, except for named sets. Using only
> one element in s-ext-2-int is working properly, but as soon as I add a
> second element to the variable definition like this:*
> *
> 
> *define s-ext-2-int = 10.10.10.10 . 25, 10.10.10.10 . 143*
> 
> I receive the following error while loading the rules using nft -f:
> 
> 
> In file included from /opt/firewall/filter/ruleset.nft:2:1-41:
> /opt/firewall/filter/rules.nft:9:38-38: Error: syntax error, unexpected
> comma, expecting newline or semicolon
> n_int tcp dport 22 ct state new accept
>				       ^
> In file included from /opt/firewall/filter/ruleset.nft:2:1-41:
> /opt/firewall/filter/rules.nft:19:32-42: Error: unknown identifier
> 's-ext-2-int'
>	  elements =  { $s-ext-2-int }
>				 ^^^^^^^^^^^
> 
> Is it possible to use variables for named sets, maps, etc. or is this
> currently not possible?

I've submitted a patch for nft that I have tested with:

	define s-ext-2-int = { 10.10.10.10 . 25, 10.10.10.10 . 143 }

	table inet forward {
	        set s-ext-2-int {
	                type ipv4_addr . inet_service
	                elements = $s-ext-2-int
	        }
	}

http://patchwork.ozlabs.org/project/netfilter-devel/list/

Thanks for reporting.
