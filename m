From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: Re: Best Kernel QoS Parameters
Date: Fri, 16 Oct 2009 15:04:14 +0200
Message-ID: <4AD86F4E.90301@unipex.it>
References: <4AD48D3F.6000502@ampernet.com.br> <4AD858F4.4050709@unipex.it> <4AD86551.4050201@ampernet.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AD86551.4050201@ampernet.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Lucas Willian Bocchi <challado@ampernet.com.br>

Lucas Willian Bocchi wrote:
> Dear Michelle
> 

Ciao,
Lucas

(I think you forgot to include the netfilter address into the sent)

> Even when you choose your shaper, you need to use the "granularity" of
> kernel to more exact QoS.
> 
> The preferences that I know is
> 
> 1) Preemptible Kernel
> 2) Tickless System
> 3) 1000 HZ Kernel
> 
> With these parameters on, the shaper precision is very, very increased.
> But I think that have another parameters that improve more the speed.
> 

If you talk with hard precision in mind, I'm with you. But into a real
systems like mine, where p.e. if a user as 1Mb bw and the shaper wrong
for 1 or 2 kb, for me it's not a real problem. (admitting that the shape
wrong by a simple 1/2%)

However I didn't know the exists of those parameters... No one doc or
books that I study mentioned them. Also on this ml, if I remember
correctly, no one say to use them.
Seeing like now the default .config found on
arch/x86/configs/x86_64_defconfig anyway the 1000hz and preemptible are
already set. So I'm feeling like!
Next time I'll upgrade my kernel I'll take care to enable also the
tickless parameter!


> Un saluto a tutti italian.
> 

You forgot the last "i" into "italiani". Italian are in English :)

> I'm italian descendent. My father was bird in Napole and bring from
> Brazil very young.
> 

I'm a bit far from Napole, talking with Italian distances, about 1k km.
For understand, near Austria.

Michele
