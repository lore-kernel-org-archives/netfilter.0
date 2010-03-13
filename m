From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: transparent proxy
Date: Sat, 13 Mar 2010 22:58:58 +0100
Message-ID: <4B9C0AA2.1090100@chello.at>
References: <21B7BA85E0A248919216BC6546842EFB@sence> <857a760cf2ade9bdadec40329e2e010b@mail.treenet.co.nz> <4B9B4B03.7000708@chello.at> <20100313100504.GA10986@minipax> <4B9B804D.7070702@chello.at> <20100313164108.GB10986@minipax>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100313164108.GB10986@minipax>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 13.03.2010 17:41, rob0@gmx.co.uk wrote:
> On Sat, Mar 13, 2010 at 01:08:45PM +0100, Mart Frauenlob wrote:
>> On 13.03.2010 11:05, netfilter-owner@vger.kernel.org wrote:
> 
> NB, your MUA is changing the attribution to the envelope sender.
> Please don't blame the list owner for what I said! :) In a list
> reply, the attribution should be the header From: address, not the
> SMTP envelope sender address.
> 
hrm, yes I see that for a while. I use Mozilla Thunderbird on windowz
(stuck to it here). And it's the only Mailing list where I encounter
this problem. And it does not occur for all mails. I have no idea why.


>>> On Sat, Mar 13, 2010 at 09:21:23AM +0100, Mart Frauenlob wrote:
>>>> Amos Jeffries:
>>>>> Please read the Squid FAQ examples of how to configure policy 
>>>>> routing ...
>>>>>
>>>>> Router:
>>>>>  http://wiki.squid-cache.org/ConfigExamples/Intercept/IptablesPolicyRoute
>>>>>
>>>>> Squid box:
>>>>>  http://wiki.squid-cache.org/ConfigExamples/Intercept/LinuxDnat
>>>>
>>>> I'd like to ask, if in the above examples, the ACCEPT
>>>> rules need to be placed in the mangle table?
>>>> Is there a specific reason, couldn't it be done in the
>>>> filter table?
>>>> As that would be the intended/preferred use for filtering?
>>>> If so, don't the examples teach people 'bad manners'?
>>>
>>> I think Mart is misunderstanding the effect of ACCEPT in mangle.
>>> It does not override nor bypass the filter table. It merely
>>> means, "we are done mangling this packet."
>>
>> ACCEPT in mangle differs from ACCEPT in filter?
> 
> Strictly speaking, no, ACCEPT is ACCEPT. Look at no more rules,
> disregard the chain's policy, pass Go, collect $200.
> 
>> Where is that documented?
>> So you have to ACCEPT it twice? In mangle and in filter table?
> 
> And raw, and nat ... the packet hits all relevant chains/tables. Any
> of these could change a packet's fate. However, IIUC support for the
> DROP target in nat and mangle has been removed.
>


I see. Well thank you! 'Mart' really had some misunderstanding about the
ACCEPT effect.
Guess I've always thought about it as the 'opposite' of DROP.
The man page isn't very clear there.
'ACCEPT means to let the packet through.'
would need at least a 'the table' at the end of the sentence.

>>> The MARK target is one of those sneaky non-terminating targets.
>>> A mark is applied, and the packet continues in that particular
>>> chain. Further -j MARK rules could be applied. The ACCEPT rule
>>> prevents this.
>>
>> Don't we use the RETURN target for that? But yes, that implies a
>> problem, if you RETURN from a user-defined chain.
> 
> RETURN in a built-in means "go to the policy." In a user chain it
> means "go to the next rule in the calling chain". As you point out,
> there could be issues with that as the example. ACCEPT works. The
> only minor nitpick I can think of is that the example used -A,
> whereas -I would have covered more cases of crazy mangle rulesets.
> 
> But, -I would fall into the "bad manners" category you were asking
> about originally. :) If someone has crazy mangle rules, let's hope
> they understand those rules, because if they don't, they'll have
> other problems beyond getting their squid working. :)

Best regards

Mart
