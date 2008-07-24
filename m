From: Patrick McHardy <kaber@trash.net>
Subject: Re: ip_queue, libnetfilter_queue, and packet alteration
Date: Thu, 24 Jul 2008 12:22:06 +0200
Message-ID: <488857CE.3060406@trash.net>
References: <7915e7b50807221702m752d5b74y9283a28f4b9b1689@mail.gmail.com> <20080723094512.GA2250@khasse.inl.fr> <488766CB.9060102@trash.net> <20080724074144.GE2250@khasse.inl.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080724074144.GE2250@khasse.inl.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Eric Leblond <eric@inl.fr>, Patrick McHardy <kaber@trash.net>, Curtis Wyatt <zhackwyatt@gmail.com>, netfilter@vger.kernel.org, toady@inl.fr

Eric Leblond wrote:
> Hello,
> 
> On Wednesday, 2008 July 23 at 19:13:47 +0200, Patrick McHardy wrote:
>> Eric Leblond wrote:
>>> Hello,
>>>
>>> On Tuesday, 2008 July 22 at 17:02:14 -0700, Curtis Wyatt wrote:
>>>> I am using ip_queue.  I understand that is depreciated.
>>>>
>>>> I want to intercept a packet, alter it (change payload and source ip
>>>> address and destination ip address) and then do an NF_ACCEPT on it, to
>>>> have it continue on its way to another machine.  However it never
>>>> shows up at that other machine.  Is there anyway to do this without
>>>> doing an NF_DROP and then sending a new packet through?
>>>>
>>>> Will libnetfilter_queue do this for me?
>>> Yes, but you will have to compute the checksum of the modified packet by
>>> yourself.
>>>
>>> Someone should send a patch which adds helper functions to ease that
>>> task in a day or two.
>> That makes sense. It would also allow to take advantage of hardware
>> TX csumming.
> 
> You mean, doing this on kernel side ? That's seem nice but tha atch have
> been prepared for userspace.

Not necessarily, userspace could also get the partial checksums
if its aware of them (which could be indicated when configuring
the queue). But thats only one half of it, when modifying the
packet in a way that incremental checksum updates are not possible,
it has to be recalculated entirely. Thats where the hardware
could help.

> I will try to look into it. I know that kernel was automatically
> computing checksum if it was set to zero in packet vefore verdict but
> the feature seems to have disappear.

I'm not aware of this feature. Was it present in ip_queue?
