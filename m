From: Florian Westphal <fw@strlen.de>
Subject: Re: Kernel 6.0.0 bug pptp not work
Date: Thu, 6 Oct 2022 15:43:40 +0200
Message-ID: <20221006134340.GA31481@breakpoint.cc>
References: <3D70BC1B-A19E-45E3-B6BC-6B2719BA9B46@gmail.com>
 <20221006111811.GA3034@breakpoint.cc>
 <0DF040F3-ACC8-447E-99DA-BB77FEE03C7E@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0DF040F3-ACC8-447E-99DA-BB77FEE03C7E@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Zaharinov <micron10@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, pablo@netfilter.org, Paolo Abeni <pabeni@redhat.com>, netfilter-devel@vger.kernel.org, netfilter <netfilter@vger.kernel.org>

Martin Zaharinov <micron10@gmail.com> wrote:
> Huh
> Very strange in kernel 6.0.0 i not found : net.netfilter.nf_conntrack_helper
> 
> 
> in old kernel 5.19.14 in sysctl -a | grep net.netfilter.nf_conntrack_helper 
> 
> net.netfilter.nf_conntrack_helper = 1

Yes, so this is expected -- 6.0.0 should behave like 5.19.14 with
net.netfilter.nf_conntrack_helper=0.

You need something like:

table inet foo {
        ct helper pptp {
                type "pptp" protocol tcp
                l3proto ip
        }

        chain prerouting {
                type filter hook prerouting priority filter; policy accept;
                tcp dport 1723 ct helper set "pptp"
        }
}

... so that the helper will start processing traffic on the pptp control port.
You might want to refine the rule a big, e.g.
'iifname ppp*' or similar, to restrict/limit the helper to those clients that need
it.
