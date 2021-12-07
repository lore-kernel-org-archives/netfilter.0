From: Amish <anon.amish@gmail.com>
Subject: Re: delete matching rule like it can be done in case of iptables
Date: Tue, 7 Dec 2021 10:59:14 +0530
Message-ID: <742f7f1d-a182-c1a1-7f7e-788f51fb03fb@gmail.com>
References: <5e5887f6-69f4-7aca-175c-d4b6faf90eb1@gmail.com>
 <Ya4L/rS/mCwzqt25@salvia> <af021a3d-b4d4-28d4-df66-12a16f7977f2@gmail.com>
 <4bc86df1-3971-7729-6a41-477262879b90@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=AdKUMkN8mm9qpDiK0h1RehgGwfCCGQqZbut8oHTpCBI=;
        b=a+Uyog7xLLs0/ReYJQciVyrb1SgmhkiJp2mK9zqB+Tb1E9rdjQiVgnkURMG4s6xxso
         2LM9TlhBl4hU9wOIIOySCSXfyb2JpemVMqkmj/Sk1DvaT9JWv1vZ6v85S1ypTAknxgST
         gg/dqZ9ie7Lt3mJweiGhrRqvWRlIVFL4YGS3Vc17G9RPXfvInfiCcfkA5YWb3o3tsK2l
         V52WElprog/E+cNd6dpdIdBxh0kJ+QCYY+ZVmfe23MTWVgKk46M4JPEXVCPAHNDNLZQL
         FB2xoyD5vxNQ4HmgcyvVFzaGotZx1Crkf3ORAJb7VUFCtvdGXph02O5+jkayjC07CISg
         NWmw==
Content-Language: en-US
In-Reply-To: <4bc86df1-3971-7729-6a41-477262879b90@tootai.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Daniel <tech@tootai.net>, Netfilter list <netfilter@vger.kernel.org>


On 06/12/21 19:17, Daniel wrote:
> Hi Amish
>
> Le 06/12/2021 à 14:30, Amish a écrit :
>> On 06/12/21 18:41, Pablo Neira Ayuso wrote:
>>> On Sun, Dec 05, 2021 at 05:25:29PM +0530, Amish wrote:
>>>> Hello,
>>>>
>>>> nftables wiki [1] mentions this:
>>>>
>>>>> Note: There are plans to support rule deletion by passing:
>>>>> % nft delete rule filter output ip saddr 192.168.1.1 counter
>>>> Any idea when will this happen? Because I thought it was very 
>>>> important
>>>> feature. (unless I missed an alternate way to do it)
>>>>
>>>> I want to migrate from iptables to nftables (from many years) but 
>>>> deleting a
>>>> rule via script is not as easy as in case of iptables.
>>>>
>>>> Obtaining the handle first and then deleting it is difficult
>>>> programmatically.
>>> You can use --echo and --handle options to fetch the rule handle.
>>>
>>>   # nft -e -a  add rule x y counter
>>>   add rule ip x y counter packets 0 bytes 0 # handle 3
>>>   # new generation 5 by process 91190 (nft)
>>
>> Well then I need to keep recording each rule addition somewhere so 
>> that I can delete by handle in future.
>>
>> Some rules are added manually, some added by scripts. Scripts may 
>> want to remove manually added rule.
>>
>> So its not as easy like in iptables.

> In a script you can use eg
>
> myhandle=$(echo `$nft -sa list chain ip mangle prerouting |grep -F "ct 
> state new counter jump MAIN"|grep -oP '(# handle ).*'`|cut -d " " -f 3)
> $fwtables delete rule ip mangle prerouting handle $myhandle
>
> and you're done. ip, mangle prerouting and rule to delete could be 
> sended as parameters in a bash function for instance.
>
> [...]
>
Hi Daniel

Thank you for your reply.

This actually is my basic problem. Rules are complex. They are not as 
simple as above example.

Hence the parsing (grepping) is not straight forward like in above example.

state may not always be "new". (can be established or related or both)

There may not always be counter in rule.

Some rules may have anonymous sets.

Some rules may have TCP port redirection.

So on ...

I can not write a script for each and every combination to detect the 
handle.

In case of iptables I can delete the rule by giving exact same 
expression except instead of giving -A, I just have to give -D.

Regards,

Amish.

