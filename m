From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Matching streaming services
Date: Wed, 6 Jan 2021 20:15:18 +0100
Message-ID: <7ea6241b-57f6-2204-a6a0-c245f1fe7521@thelounge.net>
References: <34e8a6b25cd0886dc6f5d8757e64d1846b29d7cd.camel@lusan.id.au>
 <43dc8a26-faa8-a0b7-bd2d-065e2e29aa96@hajes.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <43dc8a26-faa8-a0b7-bd2d-065e2e29aa96@hajes.org>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "david@hajes.org" <david@hajes.org>, netfilter@vger.kernel.org



Am 06.01.21 um 19:44 schrieb david@hajes.org:
> On Mikrotik routers there is possibility of burst rate setting that 
> determines whether it is simple web surfing or continuos data stream.

and how do you imagine distinct between a large download which can 
finished one hour later and nobody cares or streaming?

and whenever you manage it - it's something that need to be fixed and 
changed ASAP sou will have a moving target

> I think it is possible also in iptables and may be also in 
> nftables...unsure, whether you need some additional modules or not.
> 
> 
> On 06/01/2021 19:05, Nikolai Lusan wrote:
>> Hi,
>>
>> I have been looking for a way to differentiate traffic from streaming
>> services (Netflix, Amazon Prime, <insert_locally_available_service>)
>> from other https traffic, with not much luck. The goal is to add rules
>> to nftables and tc to ensure quality while allowing the rest of the
>> link to function normally.
>>
>> I tried using tcpdump to see if there was something in the packets that
>> I could use, but they look like any other bit of https traffic.
>>
>> Does anyone have a method for determining which http/https traffic is
>> streaming video, and which is not?
