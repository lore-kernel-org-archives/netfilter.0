From: Florian Westphal <fw@strlen.de>
Subject: Re: Nftables + ALG + Linux =?utf-8?B?Ni4x?=
 =?utf-8?B?LjAtMTAtYW1kNjQg4oCmPy4uLg==?= is it a kown Problem?
Date: Thu, 3 Aug 2023 15:47:12 +0200
Message-ID: <20230803134712.GD30550@breakpoint.cc>
References: <51c40f7943609435e914c4f1fd43a98e6c579b83.camel@mail>
 <20230731133608.GA21425@breakpoint.cc>
 <b47e1dc20a97eb4e6972d5cbfd2cf9dcaaab7e06.camel@mail>
 <20230801201148.GB32288@breakpoint.cc>
 <76311f64eb31224c7e750279a62fa8bd8257dba1.camel@mail>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <76311f64eb31224c7e750279a62fa8bd8257dba1.camel@mail>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: toml <toml@thlu.de>
Cc: netfilter@vger.kernel.org

toml <toml@thlu.de> wrote:
> Am Dienstag, dem 01.08.2023 um 22:11 +0200 schrieb Florian Westphal:
> 
> > Sounds about right, helper assignment looks correct to me.
> 
> Unfortunately, the example from my previous post does not work, when I tighten the filter to prevent unwanted traffic. For outgoing FTP I always get the message:
> "Could not open data connection to port nnnnn: Connection refused".

The helper is not active for that connection.

>         chain output {
>                 type filter hook output priority 0; policy accept;
>                 oifname "lo" accept
>                 ct state 0x2,0x4 accept
>                 meta pkttype { 0, 1, 2 } accept
>                 ip protocol 1 accept
>                 ct state 0x8 tcp dport 21 ct helper set "ftp-helper"

adding a 'counter' after set "ftp-helper" will show that its never set.

I suspect packets are eaten by the preceeding pkttype rule.
You can test via

nft insert rule ip filter output tcp flags syn tcp dport 21 meta nftrace set 1

then run 'nft monitor' and try to connect to a tcp server.

