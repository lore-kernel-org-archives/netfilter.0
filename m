From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: netfilter performance dependent on arch
Date: Tue, 7 Feb 2012 20:48:49 +0100
Message-ID: <20120207204849.707a8a1f@catus>
References: <20120207183453.522fa74b@catus>
	<4F316C1C.5020400@hp.com>
	<20120207195411.05a70f67@catus>
	<20120207111120.1d9ab37a@nehalam.linuxnetplumber.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120207111120.1d9ab37a@nehalam.linuxnetplumber.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stephen Hemminger <shemminger@vyatta.com>
Cc: netfilter@vger.kernel.org, marek@piasta.pl

>That information is out of date.
>The bulk of the slow down in 64 bit was due to the fact that IOMMU
>(CONFIG_DMAR) was enabled. The IOMMU requires programming DMA registers
>on each packet which explains the extra overhead. After disabling
>DMA remapping, the 64 bit kernel is faster because the compiler has
>more registers and can generate better code.

Thanks a lot. That's very valuable info.

Best regards,
Marek Kierdelewicz
