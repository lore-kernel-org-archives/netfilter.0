From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: transparent proxy
Date: Sat, 13 Mar 2010 13:08:45 +0100
Message-ID: <4B9B804D.7070702@chello.at>
References: <21B7BA85E0A248919216BC6546842EFB@sence> <857a760cf2ade9bdadec40329e2e010b@mail.treenet.co.nz> <4B9B4B03.7000708@chello.at> <20100313100504.GA10986@minipax>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100313100504.GA10986@minipax>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 13.03.2010 11:05, netfilter-owner@vger.kernel.org wrote:
> On Sat, Mar 13, 2010 at 09:21:23AM +0100, Mart Frauenlob wrote:
>> Amos Jeffries:
>>> Please read the Squid FAQ examples of how to configure policy 
>>> routing ...
>>>
>>> Router:
>>>  http://wiki.squid-cache.org/ConfigExamples/Intercept/IptablesPolicyRoute
>>>
>>> Squid box:
>>>  http://wiki.squid-cache.org/ConfigExamples/Intercept/LinuxDnat
>>
>> I'd like to ask, if in the above examples, the ACCEPT rules need
>> to be placed in the mangle table?
>> Is there a specific reason, couldn't it be done in the filter
>> table?
>> As that would be the intended/preferred use for filtering?
>> If so, don't the examples teach people 'bad manners'?
> 
> I think Mart is misunderstanding the effect of ACCEPT in mangle. It
> does not override nor bypass the filter table. It merely means, "we
> are done mangling this packet."
> 

ACCEPT in mangle differs from ACCEPT in mangle?
Where is that documented?
So you have to ACCEPT it twice? In mangle and in filter table?

> The MARK target is one of those sneaky non-terminating targets. A
> mark is applied, and the packet continues in that particular chain.
> Further -j MARK rules could be applied. The ACCEPT rule prevents
> this.

Don't we use the RETURN target for that? But yes, that implies a
problem, if you RETURN from a user-defined chain.


Best regards

Mart

