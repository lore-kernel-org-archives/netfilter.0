From: Stephen Hemminger <shemminger@vyatta.com>
Subject: Re: netfilter performance dependent on arch
Date: Tue, 7 Feb 2012 11:11:20 -0800
Message-ID: <20120207111120.1d9ab37a@nehalam.linuxnetplumber.net>
References: <20120207183453.522fa74b@catus>
	<4F316C1C.5020400@hp.com>
	<20120207195411.05a70f67@catus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120207195411.05a70f67@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: Rick Jones <rick.jones2@hp.com>, netfilter@vger.kernel.org

On Tue, 7 Feb 2012 19:54:11 +0100
Marek Kierdelewicz <marek@piasta.pl> wrote:

> >> Can anyone point me to some performance comparison of netfilter on
> >> i686 and x86_64? I have a few linux routers doing a lot of
> >> firewalling and QoS. Currently those routers use i686 arch on 64-bit
> >> hardware. Would I notice any performance gain after moving to 64-bit
> >> kernel?
> 
> >Apart from the obvious "Try it on your workload and see." suggestion, 
> >you could I suppose make the assumption that a netfilter workload
> >looks similar to one or more components of something like 
> 
> Thanks for the response. Anyway moments ago I found answer to the first
> question on vyatta forum here:
> http://www.vyatta.org/forum/viewtopic.php?t=823&sid=3cec85f2cf7866ca26040ec491415ee1

That information is out of date.
The bulk of the slow down in 64 bit was due to the fact that IOMMU
(CONFIG_DMAR) was enabled. The IOMMU requires programming DMA registers
on each packet which explains the extra overhead. After disabling
DMA remapping, the 64 bit kernel is faster because the compiler has
more registers and can generate better code.

