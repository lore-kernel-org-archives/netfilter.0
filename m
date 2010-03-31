From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: memory leak after enabling bridge-netfilter
Date: Wed, 31 Mar 2010 11:09:18 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1003311106570.7837@obet.zrqbmnf.qr>
References: <k2w33dc67851003310202w5edcccdegf9c633174e2cc098@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <k2w33dc67851003310202w5edcccdegf9c633174e2cc098@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ram Krishna <rkr393@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2010-03-31 11:02, Ram Krishna wrote:

>I am running my linux box as a bridge. The kernel version is 2.6.18-3
>I have enabled bridge-netfilter and iptables. I am seeing a memory
>leak in the slab "size-64", even when I have not set any iptables
>rules.
>If I dont enable the bridge-netfilter and iptables kernel options then
>there is no memory leak in bridge mode.
>
>Is there any patch known to fix this memory leak? Appreciate any inputs 
>on this.

2.6.18 is 3 1/2 years old and long past maintenance. You are encouraged 
to try a recent kernel at the very least - the problem might have been 
fixed already.
