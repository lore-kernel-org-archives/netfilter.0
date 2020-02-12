From: "" <kfm@plushkava.net>
Subject: Re: [nftables 0.9.2] does jump require a kconf to be set to get it
 working?
Date: Wed, 12 Feb 2020 20:57:34 +0000
Message-ID: <da48838e-d67d-13a0-c349-b51ca3c050a7@plushkava.net>
References: <a581ac40-f8ad-c009-4c83-40f1833b6ddb@gmx.net>
 <c81185d7-ff7c-9df7-c61d-29ed7c541e31@plushkava.net>
 <c88a5ed6-abcf-3318-363c-2e187d4bf533@gmx.net>
 <82365710-b3eb-e738-a181-9b18219cbbfe@plushkava.net>
 <452a8200-536c-4457-d6b5-4591c7781e48@gmx.net>
 <7cd325dd-e028-9b98-9b15-ddfdad3845bf@plushkava.net>
 <17defc0c-6d30-f098-99ca-7594cc63071d@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=b
        o7LHSnVaWIz337J4wVsSoBBZDfiwyOtlYMkQxKiGgU=; b=rwq3II2Y+dB3yC0v+
        bIfh610dYw7ZpNH3d7uvA8UXGipnMDzRTxEbLqby5H1prTzQTJn3csoiW9XgJWkc
        FGEH34H7ecyYETg9KuXObpaUt3bVeydPpJ/UzMm8/LPHHJpagLFYaFdq8ZSIaa4b
        hfToA/4yqrYsjduwvE6ifq6MqDX3mc2cz+RV5kIeR1kP5PVU4rxU1U7+MHrQlHzw
        xliASYqDT32ZtGQjKntog6JRHm8kgnqrRQ4+xe9RB3VQ/wyqEMj415KyenM03RxN
        MdSqa08nNk8OKW7e68m6mKUBXHS6bBJE2d2XZ08aaAUYSwAW2cz48gCDJRZf9Ttz
        cn40g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=bo7LHSnVaWIz337J4wVsSoBBZDfiwyOtlYMkQxKiG
        gU=; b=KflEGAJFF4nhkmssA353l8rDLECPJ1RTLD3DB8iq6ffkEKe93ydjXior6
        tutSMX3Q30ssEbqU3eJkMYE2FvUxRpXyWHYRJkz5pDYyqfsiNGJX8pVCL4wmd9zH
        WtOy4H6xyWXPCp9y2Lve/aU6q5ViMxA13qbN4l0bRXkwQ+PWamUf4GoiuxD4nCDb
        7Wb0Xkd4riTxBbQobDnTWwRusZc/OmtGeTD6WBMrc4LodenQwvj1C3o/DLkeJUUt
        jl12onRKigxmccIfMcaxpg0EFqOg118VzNZSgP69YD2um+cYh6sERW5sDvRQCnd3
        Y5BdsvTgqCvh5AuMXk/mcwcDoa+wA==
In-Reply-To: <17defc0c-6d30-f098-99ca-7594cc63071d@gmx.net>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 12/02/2020 19:51, ѽ҉ᶬḳ℠ wrote:
> 
> On 12/02/2020 19:44, kfm@plushkava.net wrote:
>> On 12/02/2020 19:21, ѽ҉ᶬḳ℠ wrote:
>>>
>>> On 12/02/2020 19:01, kfm@plushkava.net wrote:
>>>> On 12/02/2020 18:52, ѽ҉ᶬḳ℠ wrote:
>>>>>
>>>>> On 12/02/2020 18:40, kfm@plushkava.net wrote:
>>>>>> On 12/02/2020 16:41, ѽ҉ᶬḳ℠ wrote:
>>>>>>> Have tried to some online guidance which NFT features require 
>>>>>>> which kernel config to be set to get them working and whether 
>>>>>>> jump is among such feature set.
>>>>>>>
>>>>>>> Because hitting:
>>>>>>>
>>>>>>> Error: Could not process rule: Not supported
>>>>>>>
>>>>>>> with:
>>>>>>>
>>>>>>> table inet filter  {
>>>>>>>   chain input  { type filter hook input priority 0; iifname 
>>>>>>> pppoe-wan jump wan_i }
>>>>>>> }
>>>>>>
>>>>>> As shown, this isn't quite valid nft syntax. Please post a minimal 
>>>>>> - but complete - ruleset that reproduces your issue in a form that 
>>>>>> is verbatim. Include the wan_i definition, even if it merely an 
>>>>>> empty chain.
>>>>>
>>>>> table inet filter {
>>>>>      chain input { type filter hook input priority 0; iifname 
>>>>> pppoe-wan jump wan_i; }
>>>>>      chain wan_i  { type filter hook input priority 0; }
>>>>> }
>>>>>
>>>>
>>>> You may not jump to the wan_i chain because it is hooked. It makes 
>>>> as little sense as trying to run iptables -I INPUT -j INPUT.
>>>>
>>>
>>> So jump and goto are only good with non-base chains and those can 
>>> only be utilised for:
>>>
>>>   * nft_immediate: loads an immediate value into a register.
>>>   * nft_cmp: compare a given data with data from a given register.
>>>   * nft_payload: set/get arbitrary data from packet headers.
>>>   * nft_bitwise: perform bit-wise math operations over data in a given
>>>     register.
>>>   * nft_byteorder: perform byte order operations over data in a given
>>>     register.
>>>   * nft_counter: a basic counter for packet/bytes that gets incremented
>>>     everything is evaluated for a packet.
>>>   * nft_meta: set/get packet meta information, such as related
>>>     interfaces, timestamps, etc.
>>>   * nft_lookup: search for data from a given register (key) into a
>>>     dataset. If the set is a map/dictionary, returns the value for 
>>> that key.
>>>
>>>
>>> then, that correct? I had hoped that I could organise the chain 
>>> structure for processing into something like WAN, LAN and WAN<>LAN.
>>
>> The obvious solution is to remove the hook from the wan_i chain. There 
>> is no apparent reason for it to have one. Also, you may find it useful 
>> to jump from your input chain to others by way of a verdict map.
> 
> If the hook is removed then packages are not processed in the chain, e.g.

I do not understand what is meant by "not processed". If the packet is 
directed to the wan_i chain, then it will be processed there.

> 
> table inet filter {
>      chain input                { type filter hook input priority 0; 
> iifname pppoe-wan jump wan_i; }
>      chain wan_i                { policy drop; ct state 1 drop; ct state 
> 2,4 accept; }
> }
> 
> which does not help with organising chains in the sense/way I had mind. 
> Looks like it requires a more circuitous route with more/different 
> tables and negating interfaces (iif = ! | oik = !) for each such table.
> 
Consider the following ruleset as a possible foundation (formatted to be 
somewhat post-friendly).

table ip filter {
   chain input {
     type filter hook input priority 0; policy drop;
     ct state vmap {
       established : accept,
       related     : accept,
       invalid     : drop,
       untracked   : drop }
     # At this point, the packet can only have a ct state of new
     iifname vmap {
       "lo"       : accept,
       "ppoe-wan" : jump wan_i,
       "eth0-lan" : jump lan_i }
   }
   chain wan_i {
     tcp dport 22 accept
   }
   chain lan_i {
     accept
   }
}

Here, you accept whatever you intend to accept in the wan_i and lan_i 
chains. If the packet isn't accepted then it will return to the input 
chain and fall through to its drop policy.

There are nuances that could stand to be altered. For example, you might 
want to accept lo up front, rather than subject it to the ravages of 
connection tracking, and ICMP isn't dealt with in any capacity, which 
would become pertinent in an inet table.

Still, from a basic structural standpoint, it's not clear to me why your 
ruleset would need to be markedly more circuitous than this.

--
Kerin Millar
