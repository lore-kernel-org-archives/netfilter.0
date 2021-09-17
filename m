From: Florian Westphal <fw@strlen.de>
Subject: Re: integers byte order in netlink/NETLINK_NETFILTER messages
Date: Fri, 17 Sep 2021 11:44:28 +0200
Message-ID: <20210917094428.GC15906@breakpoint.cc>
References: <CANCV4NPXskt-r4RNfQJeacoOAmKFjuV6CSKtqEe=gyCbpiZMaQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANCV4NPXskt-r4RNfQJeacoOAmKFjuV6CSKtqEe=gyCbpiZMaQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cristian Constantin <const.crist@googlemail.com>
Cc: netfilter@vger.kernel.org

Cristian Constantin <const.crist@googlemail.com> wrote:
> in general, how are the integers encoded in the attributes of the
> NETLINK_NETFILTER messages: host byte order or network byte order?

Network byte order.

> the same byte order supposed to be used by both user space tools and
> the kernel?

Yes, all need to use network byte order.

> in particular, how is the chain policy attribute encoded by the kernel
> when it sends an reply to a NFT_MSG_GETCHAIN request?

Network byte order.
