From: Andrew Walrond <andrew@walrond.org>
Subject: Re: Iptables-1.2.9/10 compile failure with linux 2.6.7 headers
Date: Fri, 18 Jun 2004 17:21:47 +0100
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <200406181721.47968.andrew@walrond.org>
References: <200406181611.37890.andrew@walrond.org> <40D313DC.7000202@blue-labs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org-S266139AbUFRQc2@vger.kernel.org>
In-Reply-To: <40D313DC.7000202@blue-labs.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Ford <david+challenge-response@blue-labs.org>
Cc: netfilter@lists.netfilter.org, linux-kernel@vger.kernel.org

Hi David,

On Friday 18 Jun 2004 17:10, David Ford wrote:
> Iptables should be using linux-libc-headers headers instead of kernel
> headers.

Is this acquired knowledge, or new Netfilter policy?
How dependant are the iptables tools on the specifc kernel running?

Ie
Can I build iptables for use on 2.6.7 kernel with 2.6.6 linux-libc-headers? 
(probably)

But could I build iptables for 2.6.7 kernel with 2.4.20 linux-libc-headers? 
(probably not?)

The INSTALL file states specifically to use 
KERNEL_DIR=<<where-you-built-your-kernel>>

Andrew
