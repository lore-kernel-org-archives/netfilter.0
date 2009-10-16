From: Lucas Willian Bocchi <challado@ampernet.com.br>
Subject: Re: Best Kernel QoS Parameters
Date: Fri, 16 Oct 2009 10:25:52 -0300
Message-ID: <4AD87460.2010201@ampernet.com.br>
References: <4AD48D3F.6000502@ampernet.com.br> <4AD858F4.4050709@unipex.it> <4AD86551.4050201@ampernet.com.br> <4AD86F4E.90301@unipex.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AD86F4E.90301@unipex.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Cc: netfilter@vger.kernel.org

Yep. I forgot to include netfilter really. I resend the message to 
netfilter to see this.

The documentation, really, is very poor in this question.

I think that
1) Preemptible Kernel - Hability to the kernel "interrupt" a process to 
insert the scheduler in the processor again (more accuracy)
2) Tickless System - Generate a "timer interrupt" when it is more 
needed. In the scheduler case, make it more "fast".
3) 1000 HZ Kernel - Generate more granularity, inserting a 1ms max 
latency to the tick.

I think that, in the newest version of the kernel, these are the more 
important parameters.

Now, about the hardware: I have, for example:
 ~#~ ethtool -g eth0
Ring parameters for eth0:
Pre-set maximums:
RX:             4096
RX Mini:        0
RX Jumbo:       0
TX:             4096
Current hardware settings:
RX:             256
RX Mini:        0
RX Jumbo:       0
TX:             80

My preocupation is: the Shaper (htb, hfsc, etc) use this parameters in 
your configuration? The programmers have in mind that this buffer can 
affect the eficiency of shaper?
Because if I can enqueue/dequeue packets in the hardware, obviously that 
the Kernel won't have any acknowledgement about these packets. But it 
will affect the QoS in slow lines, such ADSL and others, when the one, 
two or three packets inserted in the hardware layer and ignored by the 
QoS can borrow all the configuration, inserting unknown latencies and 
other problems.

To me, it's very important the precision, because I have clients with 1 
or more MB of link and 56, 48 kbps clients too, and I need to have these 
in mind.

Thanks a lot for all help!




Michele Petrazzo - Unipex escreveu:
> Lucas Willian Bocchi wrote:
>   
>> Dear Michelle
>>
>>     
>
> Ciao,
> Lucas
>
> (I think you forgot to include the netfilter address into the sent)
>
>   
>> Even when you choose your shaper, you need to use the "granularity" of
>> kernel to more exact QoS.
>>
>> The preferences that I know is
>>
>> 1) Preemptible Kernel
>> 2) Tickless System
>> 3) 1000 HZ Kernel
>>
>> With these parameters on, the shaper precision is very, very increased.
>> But I think that have another parameters that improve more the speed.
>>
>>     
>
> If you talk with hard precision in mind, I'm with you. But into a real
> systems like mine, where p.e. if a user as 1Mb bw and the shaper wrong
> for 1 or 2 kb, for me it's not a real problem. (admitting that the shape
> wrong by a simple 1/2%)
>
> However I didn't know the exists of those parameters... No one doc or
> books that I study mentioned them. Also on this ml, if I remember
> correctly, no one say to use them.
> Seeing like now the default .config found on
> arch/x86/configs/x86_64_defconfig anyway the 1000hz and preemptible are
> already set. So I'm feeling like!
> Next time I'll upgrade my kernel I'll take care to enable also the
> tickless parameter!
>
>
>   
>> Un saluto a tutti italian.
>>
>>     
>
> You forgot the last "i" into "italiani". Italian are in English :)
>
>   
>> I'm italian descendent. My father was bird in Napole and bring from
>> Brazil very young.
>>
>>     
>
> I'm a bit far from Napole, talking with Italian distances, about 1k km.
> For understand, near Austria.
>
> Michele
>
>   

