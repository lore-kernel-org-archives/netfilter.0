From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: Re: Best Kernel QoS Parameters
Date: Fri, 16 Oct 2009 13:28:52 +0200
Message-ID: <4AD858F4.4050709@unipex.it>
References: <4AD48D3F.6000502@ampernet.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AD48D3F.6000502@ampernet.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lucas Willian Bocchi <challado@ampernet.com.br>
Cc: netfilter@vger.kernel.org

Lucas Willian Bocchi wrote:
> Hello all!
> 

Hi,

> My question is simple: to a linux router, how are the kernel 
> parameters (2.6 kernel tree) to set to make a good and responsive 
> kernel to best QoS Shaping (HTB, HFSC, etc)?
> 

 From my point of view, into a  normal environment, the last problem is
which packet scheduler choose. All those are so well builds that when
your setup don't work like you want, the right question must be "where
I'm wrong?" and not "can be the shaper wrong or there is a bug inside?"

For me, for a newbie, the right one are htb. Simple and with a good
documentation / cookbook.

> Another question is: how are the effect of TX and RX Ring Buffer 
> (hardware packet buffer) in QoS? The algoritms use these parameters 
> in the QoS configuration? I presume that this parameters can affect 
> the performance, because the hardware buffer can borrow the QoS 
> configuration.

I haven't read the sources and I'm not a kernel devel, so I don't know
exactly how are the hw buffer use, but I can ensure you that I tried
more than one type of ethernet cards into a heavy use systems (google
for ml archives) and a good card it's one of the best buys that you can do

Michele
