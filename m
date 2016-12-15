From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: masquerade sets wrong source address
Date: Thu, 15 Dec 2016 22:29:30 +0100
Message-ID: <20161215212930.GA13769@salvia>
References: <CAEvi_o9_SJNGH-RWq6Kt+UiXVY4ozaMy3yJ2rPdV0Rbk1QrRZw@mail.gmail.com>
 <20161214222856.GA3797@salvia>
 <CAEvi_o-B50n-qZyRxHC9cmpsjiweidcufFifB0SYsp515THwzQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAEvi_o-B50n-qZyRxHC9cmpsjiweidcufFifB0SYsp515THwzQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Hacohen <tom@stosb.com>
Cc: netfilter@vger.kernel.org

Hi Tom,

On Thu, Dec 15, 2016 at 11:34:57AM +0000, Tom Hacohen wrote:
> Hey,
> 
> Thanks for your reply.
> 
> I'm sorry, but I don't have access to older kernels. Furthermore,
> this worked with iptables on the same kernel version using the same
> rules as far as I can tell.

Hm, this is working with the same kernel version in iptables? What
kernel version are you using?

> I therefore suspect (without knowing the code) that maybe nftables is trying
> to masquerade all packets while iptables maybe has a noop when there was no
> NAT applied, or if the address is already set correctly? That is the best
> explanation that comes to mind given your assertion about them sharing the
> masquerade code.

Both nft and iptables share the same codebase for NAT/masquerade, so
if this works with iptables, it shoud work with nft too in the same
way.

Please, confirm this, it would be good if we get to the core of the
problem. If the behaviour differs, or started to differ from some
kernel version on, then this is a bug.

Thanks.
