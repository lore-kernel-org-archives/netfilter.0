From: Amish <anon.amish@gmail.com>
Subject: Re: delete matching rule like it can be done in case of iptables
Date: Wed, 8 Dec 2021 07:29:01 +0530
Message-ID: <3d3d820b-fdae-954d-2e59-c64d5b5980e8@gmail.com>
References: <5e5887f6-69f4-7aca-175c-d4b6faf90eb1@gmail.com>
 <Ya4L/rS/mCwzqt25@salvia> <af021a3d-b4d4-28d4-df66-12a16f7977f2@gmail.com>
 <4bc86df1-3971-7729-6a41-477262879b90@tootai.net>
 <742f7f1d-a182-c1a1-7f7e-788f51fb03fb@gmail.com>
 <72cffe4b-aee3-abd4-042b-83f576f4be13@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=rIOs1M2qsx5opymGJJ/o5NF53MjtUyEiLg+U54gaqas=;
        b=QPhaOi03NQuI3Fhd+OF8QueebxBnNOqFUpRUuajXGi2L59HNVbk4x2MwVZdlqRRv7U
         vukn94UioSToAbg5YsjI/zasqWg1I1K6/UgEJgLqinHERBKLD67Fp16dDSEVQI6AmQwR
         kXX8hNdbJbhrzCkLgy2mqalbEaCrpxAI3sb7RRNZWvna9alstjFOYCYEGjNmaBGVCP/T
         1pVaQQzjrt2u/ltcS8uUhOq8sqIJq2omrLRXpaAGpTydwqOVe/OcHii5XmnwCMKdOTha
         ZOGMgikutmkEHcjqWQigC/IzHJcaIjpmV1/o+pvK2NPucn7tvR0F6bplW7m6vaRAVi2I
         IiEA==
Content-Language: en-US
In-Reply-To: <72cffe4b-aee3-abd4-042b-83f576f4be13@tootai.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Daniel <tech@tootai.net>, Netfilter list <netfilter@vger.kernel.org>


On 07/12/21 14:02, Daniel wrote:
> Amish
>
> Le 07/12/2021 à 06:29, Amish a écrit :
>>
>> On 06/12/21 19:17, Daniel wrote:
>>> Hi Amish
>>>
>>> Le 06/12/2021 à 14:30, Amish a écrit :
>>>> On 06/12/21 18:41, Pablo Neira Ayuso wrote:
>>>>> On Sun, Dec 05, 2021 at 05:25:29PM +0530, Amish wrote:
>>>>>> Hello,
>>>>>>
>>>>>> nftables wiki [1] mentions this:
>>>>>>
>>>>>>> Note: There are plans to support rule deletion by passing:
>>>>>>> % nft delete rule filter output ip saddr 192.168.1.1 counter
>>>>>> Any idea when will this happen? Because I thought it was very 
>>>>>> important
>>>>>> feature. (unless I missed an alternate way to do it)
>>>>>>
>>>>>> I want to migrate from iptables to nftables (from many years) but 
>>>>>> deleting a
>>>>>> rule via script is not as easy as in case of iptables.
>>>>>>
>>>>>> Obtaining the handle first and then deleting it is difficult
>>>>>> programmatically.
>>>>> You can use --echo and --handle options to fetch the rule handle.
>>>>>
>>>>>   # nft -e -a  add rule x y counter
>>>>>   add rule ip x y counter packets 0 bytes 0 # handle 3
>>>>>   # new generation 5 by process 91190 (nft)
>>>>
>>>> Well then I need to keep recording each rule addition somewhere so 
>>>> that I can delete by handle in future.
>>>>
>>>> Some rules are added manually, some added by scripts. Scripts may 
>>>> want to remove manually added rule.
>>>>
>>>> So its not as easy like in iptables.
>>
>>> In a script you can use eg
>>>
>>> myhandle=$(echo `$nft -sa list chain ip mangle prerouting |grep -F 
>>> "ct state new counter jump MAIN"|grep -oP '(# handle ).*'`|cut -d " 
>>> " -f 3)
>>> $fwtables delete rule ip mangle prerouting handle $myhandle
>>>
>>> and you're done. ip, mangle prerouting and rule to delete could be 
>>> sended as parameters in a bash function for instance.
>>>
>>> [...]
>>>
>> Hi Daniel
>>
>> Thank you for your reply.
>>
>> This actually is my basic problem. Rules are complex. They are not as 
>> simple as above example.
>>
>> Hence the parsing (grepping) is not straight forward like in above 
>> example.
>>
>> state may not always be "new". (can be established or related or both)
>>
>> There may not always be counter in rule.
>>
>> Some rules may have anonymous sets.
>>
>> Some rules may have TCP port redirection.
>>
>> So on ...
>>
>> I can not write a script for each and every combination to detect the 
>> handle.
>>
>> In case of iptables I can delete the rule by giving exact same 
>> expression except instead of giving -A, I just have to give -D.
>
> You don't understand the purpose of the abvoe exemple. More clear:
>
> #!/bin/bash
>
> MyFct {
>
> myhandle=$(echo `$nft -sa list chain $1 $2 $3 |grep -F $4|grep -oP '(# 
> handle ).*'`|cut -d " " -f 3)
> $fwtables delete rule $1 $2 $3 handle $myhandle
>
> }
>
> MyFct ip mangle prerouting "ct state new counter jump MAIN"
>
> or
>
> MyFct ip6 filter input "iif \"lan\" ct state invalid drop"
>
> or whatever rule you want to delete


Thank you but problem with this is that you need to know order of 
strings in nft output.

i.e. if ct state will be first or iif "lan" will be first. What will be 
quoted and what will not be quoted?

In above examples it looks easy to grep but when your rule gets complex 
(src, dst, ports etc. multiple checks), you dont really know the exact 
output order is expected when grepping the full string.

What if nft changes output format (order) slightly in future, all my 
scripts will start breaking.

Hence this approach is not an elegant one.

Regards,

Amish.

