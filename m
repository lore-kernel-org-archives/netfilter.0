From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: How to use NFT inet sets???
Date: Tue, 20 Oct 2015 13:46:17 +0200
Message-ID: <20151020114617.GA3501@salvia>
References: <56261C9A.3020902@sabitov.su>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56261C9A.3020902@sabitov.su>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "sabitov@sabitov.su" <sabitov@sabitov.su>
Cc: netfilter@vger.kernel.org

On Tue, Oct 20, 2015 at 04:51:06PM +0600, sabitov@sabitov.su wrote:
> Hi!
> 
> I try to build combined ipv4 and ipv6 firewall using NFT. But I cannot find
> any working example of nft's _INET_ set usage :(

There is no support inet sets (mixing IPv4 and IPv6 addresses) at this
moment. Several comments below.

> I try to do next:
> 
> /sbin/nft -i
> nft> list ruleset
> nft> flush ruleset
> nft> list ruleset
> nft> add table inet fw
> nft> add chain inet fw input { type filter hook input priority 10; }
> nft> add chain inet fw output { type filter hook output priority 10; }
> nft> add chain inet fw forward { type filter hook forward priority 10; }
> nft> add set inet fw admin_list { type inet_proto ; }
> nft> add set inet fw black_list { type inet_proto ; }

% nft describe ip protocol
payload expression, datatype inet_proto (Internet protocol) (basetype integer), 8 bits

inet_proto is a datatype defined for Internet protocol numbers.

> nft> add rule  inet fw  input    inet saddr @black_list log drop
> <cli>:1:29-32: Error: syntax error, unexpected inet
> add rule  inet fw  input    inet saddr @black_list log drop
>                             ^^^^
> nft> add rule  inet fw  input    ip saddr @black_list log drop
> <cli>:1:38-48: Error: datatype mismatch, expected IPv4 address, set has type
> Internet protocol
> add rule  inet fw  input    ip saddr @black_list log drop
>                             ~~~~~~~~ ^^^^^^^^^^^

This obviously doesn't work since:

% nft describe ip saddr
payload expression, datatype ipv4_addr (IPv4 address) (basetype integer), 32 bits

datatypes mismatch.

> nft> add rule  inet fw  input    ip6 saddr @black_list log drop
> <cli>:1:39-49: Error: datatype mismatch, expected IPv6 address, set has type
> Internet protocol
> add rule  inet fw  input    ip6 saddr @black_list log drop
>                             ~~~~~~~~~ ^^^^^^^^^^^

Same thing here.
