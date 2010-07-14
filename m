From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: libnetfilter_queue quick question
Date: Wed, 14 Jul 2010 15:13:29 +0200
Message-ID: <4C3DB7F9.9090709@chello.at>
References: <AANLkTinrAZdXVZhULjFkkDnEyiwo--NpwYWWc5eNLGfB@mail.gmail.com> <4C3D82FD.3030202@tana.it>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C3D82FD.3030202@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 14.07.2010 11:27, vesely@tana.it wrote:
> On 12/Jul/10 18:00, Edison Figueira wrote:
>> The absence of the verdict like<RETURN> on libnetfilter_queue is
>> because it
>> was not implemented or is not possible to implement?

the latter i think.

>
> Return what/where? Don't confuse tables with chains or queues...
>
>> Has something like of<RETURN> what can be make in the queue to have this
>> effect?
>
> Setting a mark and ACCEPT a packet from a table may be a handy way to
> return a value that can be tested by iptables rules of a further table.
>

A 'pass through' option for queued packets does not sound wrong to me.

... -j NFQUEUE
... next rule that may hit packets, which 'RETURN' from the queue

regards

Mart
