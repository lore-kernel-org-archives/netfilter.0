From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: nf_conntrack_helper replacement?
Date: Wed, 21 Dec 2022 03:11:22 +0100
Message-ID: <a2cb3788-5027-ff14-b9d0-20a2ef370475@thelounge.net>
References: <518aeae6-e89b-62f0-0a5b-86264a51edde@zoho.com>
 <eff246c8-14b1-c0e9-15e1-0650afdd780c@thelounge.net>
 <f9f9e14c-fee3-b09f-a32b-876783e14feb@zoho.com>
 <38b6e874-69f9-dd0a-6b60-269502405d0c@thelounge.net>
 <a39f6206-cb82-d8e4-c8ae-ba56be27d7a4@zoho.com>
 <92e2e512-5d88-4146-6921-d365e8990ae7@thelounge.net>
 <6a09b9ef-49b3-74b7-21e4-7937bd3f84da@zoho.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <6a09b9ef-49b3-74b7-21e4-7937bd3f84da@zoho.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: ToddAndMargo <ToddAndMargo@zoho.com>, netfilter@vger.kernel.org



Am 20.12.22 um 23:55 schrieb ToddAndMargo:
> On 12/20/22 12:01, Reindl Harald wrote:
>> you need exactly ONE "-m conntrack --ctstate RELATED,ESTABLISHED -j 
>> ACCEPT" rule as the first of your ruleset which handles UDP and TCP 
>> (aka don't specify -p)
> 
> [!] -p, --protocol protocol
>        The  protocol of the rule or of the packet to check.
>        The specified protocol can be one of tcp, udp,
>        udplite, icmp, icmpv6,esp, ah,  sctp,  mh  or
>        the special keyword "all"
> 
> Is leavingf off the "-p xxx" the same and "-p all"?

surely

> If so, I am no sure tht I feel confortable opening
> up "udplite, icmp, icmpv6, esp, ah,  sctp,  mh"
> as well.

you do not open anything - when you don't even understand that 
"RELATED,ESTABLISHED" only hits RESPONSE packets and so there must have 
been any rule accepting the initial packet of a connection please 
refrain for setup fireall rules

how do you imagine a ESTABLISHED state packet can exist in a protocl you 
didn't accept the initial connect packet?
