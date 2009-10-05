From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: Re: tc and CONNMARK
Date: Mon, 05 Oct 2009 18:22:45 +0200
Message-ID: <4ACA1D55.1020304@unipex.it>
References: <4AC9BD2E.301@duet.it> <4AC9FF4E.5010307@unipex.it> <4ACA04DF.3030006@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ACA04DF.3030006@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Fabio Marcone <fabio.marcone@duet.it>
Cc: netfilter@vger.kernel.org

Fabio Marcone ha scritto:
> Thanks for your reply,
> 
>> A first idea, without saw your rules, it's that you limit the wrong
>>  side of communication, however no one can help you without 
>> understand better your environment.
> it's not possible because if I test only download flow or upload 
> flow, limit rate is ok.
> 
>> Post your tc/iptables rules and commands.
> 
> I'm developing a firewall/router with some services and configuration
>  it's not so easy to understand.
> 

Ok, but at least an environment where we can test or understand it's need!

>> 
>> P.s. Use two different mark for different update/download traffic
> I'm using connmark so both flow of connection are marked with same 
> mark (CONNMARK) but shaper rule are set on different interfaces: mark
>  10 on eth0 -> classid 1:6 mark 10 on eth1 -> classid 2:6

For me it's better if you use different marks.

After, where do you mark the packets (in iptables)? iptables/kernel
version?

> 
> where classes are build with these commands: tc class add dev eth0 
> parent 1:1 classid 1:6 htb rate 600kbit ceil 600kbit burst 6k cburst 
> 64k quantum 1600 tc class add dev eth0 parent 2:1 classid 2:6 htb 
> rate 600kbit ceil 600kbit burst 6k cburst 64k quantum 1600
> 
> and filters are: tc filter add dev eth0 parent 1: protocol ip handle 
> 10 fw flowid 1:6 tc filter add dev eth1 parent 2: protocol ip handle 
> 10 fw flowid 2:6
> 
> do you think is a connmark problem?

Normally I don't use connmark because when I try some time ago to use
it, I found some "not marked" problems, so I switch to classid. Better
and cleaner for me.

Michele
