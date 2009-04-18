From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: Learning iptables
Date: Sun, 19 Apr 2009 11:34:32 +1200
Message-ID: <49EA6388.6010406@treenet.co.nz>
References: <49E9C87A.1030509@veltrac.com.br> <20090418125916.GA14236@internet24.de> <49E9D3AC.5030801@veltrac.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49E9D3AC.5030801@veltrac.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Leonardo Carneiro <lscarneiro@veltrac.com.br>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Leonardo Carneiro wrote:
> Tks Thomas and Brian. It was very helpful.
> Now i'll follow with my jorney _o/
> 
> tks again! =)

People rarely mention this but I've found it extremely helpful for 
groking some of the tutorials:
   http://l7-filter.sourceforge.net/PacketFlow.png

AYJ

> 
> Thomas Jacob escreveu:
>> On Sat, Apr 18, 2009 at 09:32:58AM -0300, Leonardo Carneiro wrote:
>>  
>>> Is there any good reason why someone would set an ACCEPT policy for 
>>> all  chains first to withdraw some later? What the benefit of doing 
>>> this?
>>>     
>>
>> If I'd have to guess at the ruleset authors intentions, I'd say
>> s/he wanted to prevent service disruptions when reloading the
>> firewall scripts.
>>
>> Loading a lot of rules without iptables-restore can take quite some time,
>> and if you have a DROP policy during the rule loading time,
>> some packets that your final ruleset would pass thru will be dropped.
>> Also, if your scripts terminate prematurely, you might not be able
>> to remote access your machine anymore.
>>
>> But then again, you should load your ruleset before you bring up
>> your network, so the first reason should be irrelevant. And the
>> second shouldn't really matter after the initial testing phase.
>>
>>   
> 
> 


-- 
Please be using
   Current Stable Squid 2.7.STABLE6 or 3.0.STABLE14
   Current Beta Squid 3.1.0.7
