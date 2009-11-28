From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: conntrack/state with QUEUE target
Date: Sat, 28 Nov 2009 10:49:48 +0100
Message-ID: <4B10F23C.4010208@chello.at>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Udo Schneider wrote:
> All,
>
>> This worked fine. Now however we have the requirement for more 
>> granular "stateful" Rules. I though it should be possible to combine 
>> state/conntrack with the QUEUE target ... but this doesn't seem to work.
>>
>> -t mangle -A FORWARD -p tcp --dport 80 -m state --state 
>> NEW,ESTABLISHED -j QUEUE
>
> I think I got it.
>
> -t mangle -A FORWARD -p tcp --dport 80 -m state --state 
> NEW,ESTABLISHED -j QUEUE
> -t mangle -A FORWARD -p tcp --sport 80 -m state --state ESTABLISHED
> -j QUEUE
>
> This combination seems to work. Coming from a Check Point Background I 
> assumed that the statefulness provided by state/conntrack means that I 
> only have to specify the initiating connection - replies are 
> accepted/queued automagically based on connection data.
>
> However I seem to be wrong - or did I completely miss the point?
>
Hello,

the connection tracking itself will never do anything with a packet, 
than tracking it.
What is done with the state information, that is put onto the packet, is 
totally up to the user.
NO automagic is done.
i.e. what if you don't want replies in your queue, etc...

Also take care about state 'INVALID' and 'UNTRACKED' packets, your queue 
will not see them...
btw: NFQUEUE is the successor of QUEUE.

Regards

Mart


