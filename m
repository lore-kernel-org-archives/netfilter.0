From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables copy rule similar to PF's dup-to
Date: Sat, 15 Oct 2011 11:25:17 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1110151125030.4352@frira.zrqbmnf.qr>
References: <20111015014616.GA17750@WordOfMouf>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20111015014616.GA17750@WordOfMouf>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jon Schipp <jonschipp@gmail.com>
Cc: netfilter@vger.kernel.org

On Saturday 2011-10-15 03:46, Jon Schipp wrote:

>I was wondering if there's an iptables action/feature to copy traffic and forward it to a network monitoring system. 
>Similar to PF's dup-to which duplicates the traffic to a specified machine.

Utilizing -j TEE.
