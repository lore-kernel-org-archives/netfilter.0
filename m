From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: limit module not working with drop policy
Date: Sun, 24 Jan 2010 11:27:27 +0100
Message-ID: <4B5C208F.9090108@chello.at>
References: <4B591A79.2030600@infoservices.in>	<4B5AC554.4040804@chello.at> <20100124121157.2ad8ecec@infoservices.in>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100124121157.2ad8ecec@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 24.01.2010 07:50, netfilter-owner@vger.kernel.org wrote:
> On Sat, 23 Jan 2010 10:45:56 +0100
> Mart Frauenlob <mart.frauenlob@chello.at> wrote:
> 
>> On 22.01.2010 04:25, netfilter-owner@vger.kernel.org wrote:
>>> Dear list,
>>>
>>> My firewall policy is default drop.  But the limit module is not
>>> working here. I have the following rules to defeat ping flood
>>>
>>> ``````````
>>> iptables -A INPUT  -p icmp -m limit --limit 3/minute -j ACCEPT
>>> iptables -A INPUT  -p icmp -j DROP
>>> ``````````````````
>>> and it is not working. The same rule set is working with default
>>> accept policy.  What modification should I need to make it working
>>> with drop policy firewall ?
>>>

>> Actually you should not need that '-A INPUT -i eth0 -p icmp -j DROP'
>> rule, as the DROP policy should catch it.
>> As i've been reading complains about the limit match being broken for
>> years, i suggest trying the 'hashlimit' match (maybe without the
>> --hashlimit-mode option).
>>
>
> Thanks for your suggestion and hint. Now I have modified the rule set as
> 
> ` ` `
> iptables -A INPUT  -p icmp  --icmp-type echo-request -m hashlimit \
> --hashlimit 3/minute --hashlimit-name secureping -j ACCEPT
> ` ` `
> 
> but no luck yet :-( Is there anything wrong in my config ?

What exactly are the error symptoms? What is not working?
Please provide more information like kernel, iptables version.
You could place LOG rules and/or TRACE rules to provide more information
on what's going on.

Best regards


Mart
