From: Lucas Willian Bocchi <challado@ampernet.com.br>
Subject: Re: Best Kernel QoS Parameters
Date: Fri, 16 Oct 2009 10:10:13 -0300
Message-ID: <4AD870B5.7060309@ampernet.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Dear Michelle

Even when you choose your shaper, you need to use the "granularity" of 
kernel to more exact QoS.

The preferences that I know is

1) Preemptible Kernel
2) Tickless System
3) 1000 HZ Kernel

With these parameters on, the shaper precision is very, very increased.
But I think that have another parameters that improve more the speed.

Un saluto a tutti italian.

I'm italian descendent. My father was bird in Napole and bring from 
Brazil very young.

Cheers.

Michele Petrazzo - Unipex escreveu:
> Lucas Willian Bocchi wrote:
>> Hello all!
>>
>
> Hi,
>
>> My question is simple: to a linux router, how are the kernel 
>> parameters (2.6 kernel tree) to set to make a good and responsive 
>> kernel to best QoS Shaping (HTB, HFSC, etc)?
>>
>
> From my point of view, into a  normal environment, the last problem is
> which packet scheduler choose. All those are so well builds that when
> your setup don't work like you want, the right question must be "where
> I'm wrong?" and not "can be the shaper wrong or there is a bug inside?"
>
> For me, for a newbie, the right one are htb. Simple and with a good
> documentation / cookbook.
>
>> Another question is: how are the effect of TX and RX Ring Buffer 
>> (hardware packet buffer) in QoS? The algoritms use these parameters 
>> in the QoS configuration? I presume that this parameters can affect 
>> the performance, because the hardware buffer can borrow the QoS 
>> configuration.
>
> I haven't read the sources and I'm not a kernel devel, so I don't know
> exactly how are the hw buffer use, but I can ensure you that I tried
> more than one type of ethernet cards into a heavy use systems (google
> for ml archives) and a good card it's one of the best buys that you 
> can do
>
> Michele
>


