From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nft and defined variables
Date: Mon, 14 Oct 2019 12:06:05 +0200
Message-ID: <20191014100605.d3lnyran2ygeroh3@salvia>
References: <7e6d4739-1877-c195-dc7b-95a111dd1cbc@tootai.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7e6d4739-1877-c195-dc7b-95a111dd1cbc@tootai.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Huhardeaux <tech@tootai.net>
Cc: netfilter@vger.kernel.org

On Sat, Oct 12, 2019 at 09:52:20PM +0200, Daniel Huhardeaux wrote:
> Hello,
> 
> I want to script nft rules using sh + nft. The sh script contains variables
> set for the host and passed to nft using include like eg include
> "/etc/nftables/local.conf"
> 
> It's OK for definition of IPs or port but not for alaphanumerical variables.
> For instance, I want to pass as variable icmp_limit (number) and
> icmp_measure (alpha) to include them in nft rule like blabla ... limit rate
> over $icmp_limit/$icmp_measure ...
> 
> define icmp_limit = { 20 }
> define icmp_measure = minute
> 
> but the result gives
> 
> In file included from ./ip4fw.nft:3:1-35:
> /etc/nftables/local.conf:10:23-28: Error: syntax error, unexpected minute
> define icmp_measure = minute
>                       ^^^^^^

Quotes are missing.

> ./ip4fw.nft:36:110-110: Error: syntax error, unexpected '$', expecting
> number
> add rule ip filter input iif $IFACE meta l4proto icmp icmp type {
> echo-reply, echo-request } limit rate over $icmp_limit/$icmp_measure counter
> drop
> 
> Same for KEEPSTATE variable but IFACE one is OK
> 
> define IFACE = ens3
> define KEEPSTATE = "state related, established"
> 
> ./ip4fw.nft:49:40-40: Error: syntax error, unexpected '$'
> add rule ip filter input iif $IFACE ct $KEEPSTATE counter accept

KEEPSTATE is not a variable here, what you describe works like a
macro. There is no macro support for nft yet. At this stage, you can
only define values through variable definitions.

> What is the way to define alphanumerical variables ? I tried to escape
> quotes with \ to remove them, to escape slash with \, no way to achieve my
> goal :(

Always quote values in your variable definitions.
