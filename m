From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: How to configure "full cone" NAT using iptables
Date: Tue, 16 May 2023 16:48:32 +0200
Message-ID: <167f2029-5978-dffa-3cf2-0ede9ade4fdf@thelounge.net>
References: <85A81DAD-299F-4B08-8F5F-4D8D0BAB042B@jcm.me>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <85A81DAD-299F-4B08-8F5F-4D8D0BAB042B@jcm.me>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Joshua Moore <j@jcm.me>, "Kevin P. Fleming" <lists.netfilter@kevin.km6g.us>
Cc: netfilter@vger.kernel.org



Am 16.05.23 um 16:32 schrieb Joshua Moore:
> ﻿“Full cone” NAT simply means that there is no longer a strict connection tracking or enforcement of what IPs can connect back to the ports that are associated with the internal IP.
> 
> Traditional NAT:
> - TCP connection to 1.1.1.1 from 192.168.1.10 over outside translated TCP source port 45619. All packets destined to port 45619 MUST come from 1.1.1.1.
> 
> Full cone NAT:
> - TCP connection to 1.1.1.1 from 192.168.1.10 over outside translated TCP source port 45619. All packets destined to port 45619 are allowed from ANY IP.
> 
> Another word for this behavior is “endpoint independent” NAT/filtering.

but it can not work like that which don't make any sense:
iptables -t nat -A PREROUTING -i eth0 -j DNAT --to-destination 10.0.0.1
iptables -t nat -A PREROUTING -i eth0 -j DNAT --to-destination 10.0.0.2

offlist the OP pointed me to 
https://github.com/Chion82/netfilter-full-cone-nat where i ask myself 
who needs that nonsense which sounds to be written by someone which 
hasn't more clues about networking/NAT the the OP

Implementation of RFC3489-compatible full cone SNAT
https://www.rfc-editor.org/rfc/rfc3489 = STUN

 >> iptables -t nat -A POSTROUTING -o eth0 -j FULLCONENAT
 >> #same as MASQUERADE

so who needs that module?

 >> iptables -t nat -A PREROUTING -i eth0 -j FULLCONENAT
 >> #automatically restore NAT for inbound packets

restore WHAT based on WHAT for new packets?

it's simple: when you only have a single public IP there is no way to 
accept NEW incoming packets to different local machines without explicit 
port-forwarding

and ESTABLISHED/RELATED is the job of conntrack

>> On May 16, 2023, at 4:46 AM, Kevin P. Fleming <lists.netfilter@kevin.km6g.us> wrote:
>>
>> ﻿On Tue, May 16, 2023, at 07:07, Shane Wang wrote:
>>> Thanks for your reply.
>>> I think the "--to-destination 10.0.0.1" rule will be matched, and the
>>> "--to-destination 10.0.0.2" rule will never be matched.
>>> Does iptables unsupported "full cone" NAT for multiple internal IP addresses?
>>
>> Does *any* platform support such a configuration? Based on my understanding of what 'full cone' means, every internal address needs a separate external address to be fully mapped to it. Your example shows that you have one external address, 
