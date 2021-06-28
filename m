From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: IP Addresses Changed to Hostnames in IPTables
Date: Mon, 28 Jun 2021 23:06:13 +0200
Message-ID: <ebd2e4e4-0fb1-77bf-3e5d-373d4c61d85f@thelounge.net>
References: <bda96448-fbd7-0c99-1bff-c3776bdfafff.ref@att.net>
 <bda96448-fbd7-0c99-1bff-c3776bdfafff@att.net>
 <20210628213643.468805a4c8f262984ee530a6@plushkava.net>
 <cb8649b5-a2aa-8101-7701-9fc13e2f5db0@att.net>
 <20210628215811.55a87828961dcd87ae1f4612@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20210628215811.55a87828961dcd87ae1f4612@plushkava.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kerin Millar <kfm@plushkava.net>, slow_speed@att.net
Cc: netfilter@vger.kernel.org



Am 28.06.21 um 22:58 schrieb Kerin Millar:
> On Mon, 28 Jun 2021 16:47:46 -0400
> slow_speed@att.net wrote:
> 
>> On 6/28/21 4:36 PM, Kerin Millar wrote:
>>> On Mon, 28 Jun 2021 15:57:30 -0400
>>> slow_speed@att.net wrote:
>>>
>>>> I created a ruleset in iptables and it was saved in
>>>> /etc/iptables.up.rules as expected.  However, when viewing the file, all
>>>> IP addresses had been translated to hostnames.
>>>>
>>>> Why would it ever do such a thing, when I had entered them as IP
>>>> addresses and they would have to be converted to IP addresses anyway?
>>>
>>> Here's how it works. One may supply hostnames to iptables/iptables-restore but they will be resolved at the point that the rule/ruleset is loaded into the kernel. If using `iptables -L` to list the currently loaded ruleset, reverse DNS lookups will be performed upon IP addresses before displaying. This behaviour can be suppressed by also using the -n option. As for `iptables -S` and `iptables-save`, neither of these will perform reverse DNS lookups.
>>>
>>> In summary, it's not at all clear how you ended up with hostnames in your iptables.up.rules file. Can you reduce this phenomonen to a simple, well-defined test case?
>>>
>>
>> Okay, I was incorrect.  The viewing of the file showed just numbers.  It
>> was the iptables -L that caused the misinformation.  It should
>> definitely default to -n.  That is a big issue to the new person in this
>> area.  Bad programming strikes again.
>>
>> Thank you so much for pointing that out.  I will add that to my
>> instructions.
> 
> The -L format is deficient in several respects. About the only thing it's good for is displaying counters (with -v), yet iptables-save already does this. My suggestion would be to avoid -L outright. If you want to list rules with iptables instead of iptables-save, the -S option is much more useful.
> 
> Also, please use Reply All next time. I am adding the list back to the CC field

the real problem is talking about "However, when viewing the file" when 
doing "iptables -L" in fact

"iptables --list --numeric --line-numbers --verbose" is no rocket 
science, documented and that you need "-n" is not that uncommon

see "netstat-nat" or "route" as example
