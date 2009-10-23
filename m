From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: Re: Best Kernel QoS Parameters
Date: Fri, 23 Oct 2009 15:53:30 +0200
Message-ID: <4AE1B55A.30802@unipex.it>
References: <4AD48D3F.6000502@ampernet.com.br> <4AD858F4.4050709@unipex.it> <4AD86551.4050201@ampernet.com.br> <4AD86F4E.90301@unipex.it> <4AD87460.2010201@ampernet.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AD87460.2010201@ampernet.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Lucas Willian Bocchi <challado@ampernet.com.br>
Cc: netfilter@vger.kernel.org

Lucas Willian Bocchi ha scritto:

(sorry for late reply, I was so busy)

> 
> The documentation, really, is very poor in this question.
> 

well said!

> Now, about the hardware: I have, for example: ~#~ ethtool -g eth0 
> Ring parameters for eth0: Pre-set maximums: RX:             4096 RX 
> Mini:        0 RX Jumbo:       0 TX:             4096 Current 
> hardware settings: RX:             256 RX Mini:        0 RX Jumbo: 0
>  TX:             80
> 

I have the same data here, more or less

> My preocupation is: the Shaper (htb, hfsc, etc) use this parameters 
> in your configuration?

I don't know if directly the shaper or the kernel take advantage of
them, but I can say that I tried to use a low card and the result was
so...miserable. Of course with the same programming.

> The programmers have in mind that this buffer can affect the 
> eficiency of shaper?

I think that the best ml for ask this is directly to lkml.org.

> To me, it's very important the precision, because I have clients with
>  1 or more MB of link and 56, 48 kbps clients too, and I need to have
>  these in mind.
> 

Sorry, but have you already tried a setup like that? Before starts I try
here, in office, my server and after seen that worked perfect with about
ten clients, I put it in production and now it's shaping perfectly about
1k htb classes!

Michele
