From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: ip_queue, libnetfilter_queue, and packet alteration
Date: Wed, 23 Jul 2008 12:02:53 +0200
Message-ID: <488701CD.1040509@netfilter.org>
References: <7915e7b50807221702m752d5b74y9283a28f4b9b1689@mail.gmail.com> <20080723094512.GA2250@khasse.inl.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080723094512.GA2250@khasse.inl.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
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
> 
>> I don't want to move to
>> libnetfilter_queue because I can't find a redhat rpm and I can't find
>> hardly any documentation on it.
> 
> Compilation is not really difficult but lack of documentation is a real
> problem. The only thing for now is too look at snort-inline or NuFW code
> to see how to use the library.

I remember that you have mentioned some libnetfilter_queue's
documentation during the RMLL? I'm willing to include it if that helps
users. Where is it?

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
