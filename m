From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: integers byte order in netlink/NETLINK_NETFILTER messages
Date: Thu, 30 Sep 2021 16:03:50 +0200
Message-ID: <YVXDxlfzEVybEn/W@salvia>
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

On Fri, Sep 17, 2021 at 10:45:30AM +0200, Cristian Constantin wrote:
> hi!
> 
> in general, how are the integers encoded in the attributes of the
> NETLINK_NETFILTER messages: host byte order or network byte order? is
> the same byte order supposed to be used by both user space tools and
> the kernel?

nfnetlink attribute data is exposed in network byte order.

> in particular, how is the chain policy attribute encoded by the kernel
> when it sends an reply to a NFT_MSG_GETCHAIN request?

Through the NFTA_CHAIN_POLICY attribute.
