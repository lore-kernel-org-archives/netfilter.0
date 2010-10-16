From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Time counter of connections (libnetfilter-conntrack?)
Date: Sat, 16 Oct 2010 19:47:37 +0200
Message-ID: <4CB9E539.9060102@netfilter.org>
References: <4CB924EC.3090906@dcc.ufba.br> <4CB960A8.3070001@netfilter.org> <alpine.LNX.2.01.1010161126330.2806@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1010161126330.2806@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Italo Valcy <italo@dcc.ufba.br>, netfilter@vger.kernel.org

On 16/10/10 11:28, Jan Engelhardt wrote:
> 
> On Saturday 2010-10-16 10:22, Pablo Neira Ayuso wrote:
>> On 16/10/10 06:07, Italo Valcy wrote:
>>> Hi guys!
>>>
>>> Is there an way to get time counter of the connections using
>>> libnetfilter-conntrack? I mean, I'd like to know how long a connection
>>> had taken (since the state NEW to DESTROY).
>>>
>>> Any ideias?
>>
>> The Linux kernel does not track this connection lifetime, so you would
>> have to listen to NEW events, put the ct objects into some structure
>> (hashtable, tree, list, etc) and calculate the difference by yourself
>> once you receive DESTROY events.
>>
>> It wouldn't be hard to extend the existing code to do this in kernel space.
> 
> One could just enhance the ct struct by a genesis timestamp,
> and calculate the delta once the destroy event is sent out.

Indeed, a small conntrack extension would be great. This can save lots
of memory for ulogd2 and it could be useful for IPFIX implementations.
