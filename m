From: Patrick McHardy <kaber@trash.net>
Subject: Re: 2.6.16-rc3 panic related to IP Forwarding and/or Netfilter
Date: Wed, 15 Feb 2006 07:52:38 +0100
Message-ID: <43F2CFB6.9030106@trash.net>
References: <20060214173455.GA19355@ranger.taprogge.wh>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-net-owner@vger.kernel.org>
In-Reply-To: <20060214173455.GA19355@ranger.taprogge.wh>
Sender: linux-net-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Taprogge <jlt_kernel@shamrock.dyndns.org>
Cc: linux-kernel@vger.kernel.org, linux-net@vger.kernel.org, netfilter@lists.netfilter.org

Jens Taprogge wrote:
> Hello.
> 
> After upgrading from 2.6.13 an IP Masquerading router panics as soon as
> soon as packages are forwarder (or rather should be).  As long as IP
> Masquerading is disabled (and thus no forwarding occurs) the box runs
> stable.
> 
> A picture of the panic ouput can be found at:
> http://shamrock.dyndns.org/~ln/kernel/2.6.16rc3_panic/panic.jpg
> The config is at:
> http://shamrock.dyndns.org/~ln/kernel/2.6.16rc3_panic/config-2.6.16-rc3-g51d6aa16-dirty
> 
> The kernel was patched to support SIP-contrack however the extra files
> have not been compiled and should thus have no influence.
> 
> Please cc me on replies as I am not subscribed to the lists.

Known problem, I'll submit a fix tonight. Until then you can avoid
the crash by making sure your masquerade rules don't change packets
which matched an IPsec policy so they don't match anymore.
