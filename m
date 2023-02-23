From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: ipset: update timeout when IP matches
Date: Thu, 23 Feb 2023 14:39:13 +0100
Message-ID: <b0411942-d8d5-153b-19a4-f48e05381cc6@thelounge.net>
References: <f326e979-1506-1685-6858-8a1d9746cb93@gmx.ch>
 <20230223113406.ac79681eb436e15c44b0a6a2@plushkava.net>
 <455de480-98e8-026d-20ee-a5157f9be8b7@gmx.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <455de480-98e8-026d-20ee-a5157f9be8b7@gmx.ch>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Fourhundred Thecat <400thecat@gmx.ch>, netfilter@vger.kernel.org



Am 23.02.23 um 13:50 schrieb Fourhundred Thecat:
>  > On 2023-02-23 12:34, Kerin Millar wrote:
>> On Thu, 23 Feb 2023 12:04:44 +0100
>> Fourhundred Thecat <400thecat@gmx.ch> wrote:
>>
>> The following option is detailed by iptables-extensions(8).
>>
>> --exist
>>         when adding an entry if it already  exists,  reset  the  timeout
>>         value  to the specified one or to the default from the set defi‐
>>         nition
> 
> OK, thank you. But now I have this problem:
> 
> I want to:
> 
> 1) reset timeout if IP alredy in PORTSCAN
> 2) drop the packet
> 
> I wrote these 2 rules:
> 
> 1) -A INPUT -j SET --add-set PORTSCAN src --timeout 3600 --exist
> 2) -A INPUT -m set --match-set PORTSCAN src -j DROP
> 
> but the problem is, rule 1) matches everything, not just IPs already in
> PORTSCAN. This basically adds everything to PORTSCAN


what else should it do without a condition

"-A INPUT -j SET --add-set PORTSCAN src --timeout 3600 --exist" says 
"whatever it is, add it to the ipset"

