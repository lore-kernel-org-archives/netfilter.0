From: Florian Westphal <fw@strlen.de>
Subject: Re: Redirect bridged traffic
Date: Wed, 5 Feb 2020 20:35:17 +0100
Message-ID: <20200205193517.GL26952@breakpoint.cc>
References: <1561900038.672905.1580925866433.ref@mail.yahoo.com>
 <1561900038.672905.1580925866433@mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1561900038.672905.1580925866433@mail.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaga Doe <jaga.doe@aol.com>
Cc: netfilter@vger.kernel.org

Jaga Doe <jaga.doe@aol.com> wrote:
> table bridge tbrFilter {
>     chain cbrRedirect {
>       type filter hook prerouting priority 0;
>       log tcp dport $TPORT meta pkttype set host ether daddr set $MON_MAC counter
>     }
> }
> 
> table inet tlcRedirect {
>     chain clcRedirect {
>       type nat hook prerouting priority 0;
>       log tcp dport $TPORT counter redirect to $TPORT
>     }
> }
> 
> Using this configuration, the connection to PC0:3000 seems that it is captured by the nft but is not going to the local process.
> 
> What I am missing here?

I don't see anything wrong here, this should work and $TPORT should end
up in inet input hook.
Does it end up in forward instead or does it 'just disappear'?

Does 'nstat' show anything?
