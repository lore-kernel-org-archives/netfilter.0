From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Want to "plug in" a link-level protocol into IP stack
Date: Tue, 17 Jun 2008 09:05:34 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806170904540.6620@fbirervta.pbzchgretzou.qr>
References: <27cb3ada0806162003l3f8d4ee0y7db0306ddb1de9e0@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <27cb3ada0806162003l3f8d4ee0y7db0306ddb1de9e0@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Len Gross <sandiegobiker@gmail.com>
Cc: netfilter@vger.kernel.org


On Tuesday 2008-06-17 05:03, Len Gross wrote:

>I have used FreeBSD's Netgraph to successfully develop a unique link-level
>protocol.  I would like to do a similar thing in Linux and would like to do
>the initial implementation in userland.  I use Ethernet packets on a
>LAN and embed
>the protocol inside them.  I have to modify outgoing packets and strip out
>header/trailers from incoming packets.  IP frames need to be passed-up
>the stack.
>
>Would Netfilter be the best way to approach this? If not, what other
>LINUX tools make sense\?

Netfilter is a kernel component, but you wanted to do an userspace thing.
Programs that directly play with the link layer, such as dhcpd,
use a PF_PACKET socket.
