From: Georgi Alexandrov <tehlists@hotpop.com>
Subject: Re: is there a way to discriminate the ESTABLISHED traffic?
Date: Mon, 04 Apr 2005 15:11:14 +0300
Message-ID: <42512EE2.1090603@hotpop.com>
References: <4250ABAC.5010207@lorenzutti.com.ar> <4251022D.9090504@hotpop.com>
	<425124D1.3080501@lorenzutti.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <425124D1.3080501@lorenzutti.com.ar>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Guido Lorenzutti wrote:

> Georgi Alexandrov wrote:
>
>> Guido Lorenzutti wrote:
>>
>>> How can i discriminate the traffic that my firewall is answering 
>>> from a NEW request from a network from the ESTABLISHED traffic that 
>>> my firewall is making from a NEW request from him?
>>>
>>> In rules, to allow traffic TO my box from the lan 10.0.0.0/32
>>>
>>> 1 ipt -A INPUT -s 10.0.0.0/32 -m state --state NEW -j ACCEPT
>>> 2 ipt -A INPUT -s 10.0.0.0/32 -m state --state ESTABLISHED -j ACCEPT
>>> 3 ipt -A OUTPUT -d 10.0.0.0/32 -m state --state ESTABLISHED -j ACCEPT
>>>
>>> Now, to allow traffic FROM my box to the lan 10.0.0.0/32
>>>
>>> 4 ipt -A OUTPUT -d 10.0.0.0/32 -m state --state NEW -j ACCEPT
>>> 5 ipt -A OUTPUT -d 10.0.0.0/32 -m state --state ESTABLISHED -j ACCEPT
>>> 6 ipt -A INPUT -s 10.0.0.0/32 -m state --state ESTABLISHED -j ACCEPT
>>>
>>> The 3 and 5 rules are exactly the same. Is there a way to 
>>> discriminate this or the things are just like this and there is 
>>> nothing to do about it?
>>>
>>> Tnxs in advance.
>>>
>>>
>> btw 10.0.0.0/32 ?!
>>
>>
>
> Yeah.. what? I make my 10.0.0.0 subnet a class C :) It's Ok to do 
> that, try it!! :P
>
You probably mean 10.0.0.0/24 then ?

regards,
Georgi Alexandrov

