From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Time counter of connections (libnetfilter-conntrack?)
Date: Sat, 16 Oct 2010 11:28:45 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010161126330.2806@obet.zrqbmnf.qr>
References: <4CB924EC.3090906@dcc.ufba.br> <4CB960A8.3070001@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CB960A8.3070001@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Italo Valcy <italo@dcc.ufba.br>, netfilter@vger.kernel.org


On Saturday 2010-10-16 10:22, Pablo Neira Ayuso wrote:
>On 16/10/10 06:07, Italo Valcy wrote:
>> Hi guys!
>> 
>> Is there an way to get time counter of the connections using
>> libnetfilter-conntrack? I mean, I'd like to know how long a connection
>> had taken (since the state NEW to DESTROY).
>> 
>> Any ideias?
>
>The Linux kernel does not track this connection lifetime, so you would
>have to listen to NEW events, put the ct objects into some structure
>(hashtable, tree, list, etc) and calculate the difference by yourself
>once you receive DESTROY events.
>
>It wouldn't be hard to extend the existing code to do this in kernel space.

One could just enhance the ct struct by a genesis timestamp,
and calculate the delta once the destroy event is sent out.
