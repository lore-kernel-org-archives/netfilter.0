From: Patrick McHardy <kaber@trash.net>
Subject: Re: ip_queue, libnetfilter_queue, and packet alteration
Date: Wed, 23 Jul 2008 19:13:47 +0200
Message-ID: <488766CB.9060102@trash.net>
References: <7915e7b50807221702m752d5b74y9283a28f4b9b1689@mail.gmail.com> <20080723094512.GA2250@khasse.inl.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080723094512.GA2250@khasse.inl.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Eric Leblond <eric@inl.fr>, Curtis Wyatt <zhackwyatt@gmail.com>, netfilter@vger.kernel.org

Eric Leblond wrote:
> Hello,
> 
> On Tuesday, 2008 July 22 at 17:02:14 -0700, Curtis Wyatt wrote:
>> I am using ip_queue.  I understand that is depreciated.
>>
>> I want to intercept a packet, alter it (change payload and source ip
>> address and destination ip address) and then do an NF_ACCEPT on it, to
>> have it continue on its way to another machine.  However it never
>> shows up at that other machine.  Is there anyway to do this without
>> doing an NF_DROP and then sending a new packet through?
>>
>> Will libnetfilter_queue do this for me?
> 
> Yes, but you will have to compute the checksum of the modified packet by
> yourself.
> 
> Someone should send a patch which adds helper functions to ease that
> task in a day or two.

That makes sense. It would also allow to take advantage of hardware
TX csumming.
