From: Patrick McHardy <kaber@trash.net>
Subject: Re: [Question] netfilter, xt_target->target and xt_target->checkentry
 locks
Date: Wed, 09 Jun 2010 15:26:44 +0200
Message-ID: <4C0F9694.1000303@trash.net>
References: <20100609122114.GB2825@psychotron.lab.eng.brq.redhat.com> <alpine.LSU.2.01.1006091434130.22105@obet.zrqbmnf.qr> <20100609130045.GC2825@psychotron.lab.eng.brq.redhat.com> <4C0F9117.9060801@trash.net> <20100609131310.GD2825@psychotron.lab.eng.brq.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100609131310.GD2825@psychotron.lab.eng.brq.redhat.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jiri Pirko <jpirko@redhat.com>
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org, bart.de.schuymer@pandora.be, davem@davemloft.net, shemminger@vyatta.com

Jiri Pirko wrote:
> Wed, Jun 09, 2010 at 03:03:19PM CEST, kaber@trash.net wrote:
>   
>> Jiri Pirko wrote:
>>     
>>> Wed, Jun 09, 2010 at 02:37:51PM CEST, jengelh@medozas.de wrote:
>>>   
>>>       
>>>> On Wednesday 2010-06-09 14:21, Jiri Pirko wrote:
>>>>
>>>>     
>>>>         
>>>>> Hi Patrick.
>>>>>
>>>>> Once module registers it's struct xt_target by xt_register_target and 
>>>>> ->target and ->checkentry funtions are called later, is there any lock 
>>>>> guaranteed to be held?
>>>>>       
>>>>>           
>>>> >From what I see for ->target it looks like rcu_read_lock is held, but 
>>>>     
>>>>         
>>>>> I'm not sure for all paths. There would be nice to put a comment into 
>>>>> struct xt_target definition regarding locks.
>>>>>       
>>>>>           
>>>> Though nf_hook_slow invokes rcu_read_lock, that should not be a formal
>>>> guarantee that Xtables extensions run with RCU. See xt_TCPMSS for 
>>>> example.
>>>>     
>>>>         
>>> A was afraid of it. Thanks.
>>>       
>> We actually assume this in all conntrack helpers, so I don't see anything
>> wrong with making the same assumption in xtables modules, as long as
>> its documented.
>>     
>
> Where this is documented please?
>   

In the spots relying on this ("/* rcu_read_lock()ed by nf_hook_slow */").
Actually its not the helpers, but other parts of conntrack.
