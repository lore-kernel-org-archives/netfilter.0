From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Time counter of connections (libnetfilter-conntrack?)
Date: Sat, 16 Oct 2010 20:09:14 +0200
Message-ID: <4CB9EA4A.3080501@netfilter.org>
References: <4CB924EC.3090906@dcc.ufba.br> <4CB960A8.3070001@netfilter.org> <alpine.LNX.2.01.1010161126330.2806@obet.zrqbmnf.qr> <4CB9A11F.5010906@dcc.ufba.br> <4CB9E7EC.6050101@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CB9E7EC.6050101@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Italo Valcy <italo@dcc.ufba.br>
Cc: netfilter@vger.kernel.org

On 16/10/10 19:59, Pablo Neira Ayuso wrote:
> On 16/10/10 14:57, Italo Valcy wrote:
>> Hi guys,
>>
>> Thank you Jan, Pablo, for the reply. It's like I imagined. One doubt:
>> the 'id' field of nf_conntrack struct is unique? (I'd like to use it as
>> index to the struct that I'll use to track the timestamps...)
> 
> Yes, it is.

Well, to be precise there have been lots of discussions in the past on
the uniqueness of the conntrack ID. Some situations in which we can find
two different conntracks with the same ID may occur due to race
conditions in the event delivery. To avoid problems I use the original
tuple and the id to identify one conntrack (part of the
conntrack-tools). I suggest you to do so.
