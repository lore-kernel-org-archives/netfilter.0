From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Kernel 6.0.0 bug pptp not work
Date: Thu, 6 Oct 2022 14:57:29 +0200
Message-ID: <Yz7QuaHF1P7oDAUN@salvia>
References: <3D70BC1B-A19E-45E3-B6BC-6B2719BA9B46@gmail.com>
 <20221006111811.GA3034@breakpoint.cc>
 <0DF040F3-ACC8-447E-99DA-BB77FEE03C7E@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0DF040F3-ACC8-447E-99DA-BB77FEE03C7E@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Zaharinov <micron10@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, Paolo Abeni <pabeni@redhat.com>, netfilter-devel@vger.kernel.org, netfilter <netfilter@vger.kernel.org>

On Thu, Oct 06, 2022 at 03:46:37PM +0300, Martin Zaharinov wrote:
> Huh
> Very strange in kernel 6.0.0 i not found : net.netfilter.nf_conntrack_helper
> 
> 
> in old kernel 5.19.14 in sysctl -a | grep net.netfilter.nf_conntrack_helper 
> 
> net.netfilter.nf_conntrack_helper = 1

Yes, default conntrack helper attachment was disabled 10 years ago,
and this option was disabled 6 years ago by default.

See: https://github.com/regit/secure-conntrack-helpers/blob/master/secure-conntrack-helpers.rst
