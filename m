From: Florian Westphal <fw@strlen.de>
Subject: Re: Bug report DNAT destination not work
Date: Thu, 2 Mar 2023 11:43:37 +0100
Message-ID: <20230302104337.GA23204@breakpoint.cc>
References: <CALidq=VJF36a6DWf8=PNahwHLJd5FKspXVJfmzK3NFCxb6zKbg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CALidq=VJF36a6DWf8=PNahwHLJd5FKspXVJfmzK3NFCxb6zKbg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Zaharinov <micron10@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>, netfilter <netfilter@vger.kernel.org>, netfilter-devel@vger.kernel.org

Martin Zaharinov <micron10@gmail.com> wrote:
> iptables -t nat -A PREROUTING -d 100.91.1.238/32 -i bond0 -p tcp --dport
> 7878 -j DNAT --to-destination 10.240.241.99:7878
> iptables v1.8.9 (legacy): unknown option "--to-destination"
> Try `iptables -h' or 'iptables --help' for more information.

Looks like a problem with your iptables installation which can't find
libxt_DNAT.so?  In v1.8.9 this should be a symlink to libxt_NAT.so.

If you run 'iptables -j DNAT --help' and it doesn't say

"DNAT target options:" at the end then it very much looks like a
problem with your iptables installation and not the kernel.

> try with kernel 6.1.11 6.1.12 6.1.13

Tested iptables-nft and iptables-legacy on 1.8.9 with kernel 6.1.14, no problems.

There were no significant kernel changes in this area that I know of in
6.1 either.
