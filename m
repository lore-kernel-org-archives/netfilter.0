From: Florian Westphal <fw@strlen.de>
Subject: Re: NAT translation problem - leakage of packets with original
 source address
Date: Thu, 10 Mar 2022 13:08:09 +0100
Message-ID: <20220310120809.GD26501@breakpoint.cc>
References: <0e142c6e43516aa01a9bcf6f6df9b31d@smarthost.pl>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0e142c6e43516aa01a9bcf6f6df9b31d@smarthost.pl>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcin Kabiesz <marcin.kabiesz@smarthost.pl>
Cc: netfilter@vger.kernel.org

Marcin Kabiesz <marcin.kabiesz@smarthost.pl> wrote:
> is it possible that with the OpenVPN interface tun0 every now and then some
> packets with a private source address are visible and forwarded to the
> router?

Yes, NAT is only applied to packets that conntrack considers sane/valid.

You can e.g. add a drop rule for INVALID packets.
