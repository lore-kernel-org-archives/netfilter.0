From: Daniel <tech@tootai.net>
Subject: Re: delete matching rule like it can be done in case of iptables
Date: Mon, 6 Dec 2021 14:47:49 +0100
Message-ID: <4bc86df1-3971-7729-6a41-477262879b90@tootai.net>
References: <5e5887f6-69f4-7aca-175c-d4b6faf90eb1@gmail.com>
 <Ya4L/rS/mCwzqt25@salvia> <af021a3d-b4d4-28d4-df66-12a16f7977f2@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1638798470; bh=YpKhYR0nYLiLPgTKj4ezdWlNp15EgDfOoMjvfgvYJFI=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=kEnECkWEt4uBiZQkccRvdzZBhkpeTKv3vtGOE+DcDTvZeQLbblrumApgCF5Ufwn2S
         fiQAEq0yUtCCIc9JSLZYph1GwmSK47WkxSWigCXA23x6k75+NJ+fHX6ldUDeCn2K+5
         BAtn8Lz8arGjrNPNNWeqG1NUpuVZUGWsgqjABWpk=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1638798469; bh=YpKhYR0nYLiLPgTKj4ezdWlNp15EgDfOoMjvfgvYJFI=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=vrzaYrQYfEvi4aGx5BOTQNPDkk2rn5SD6BiihLZjrKCMhGmAsVncFn7T9ThqBkIci
         igCVeLuPkgUVa1rCl5Gwz6pwn7T0s8sTyWbEv9wQ0Hh3sG6qlnMAt31WXyxcZZY58N
         2R0/8Q+ctz+HEqKzf3SFaqGPxrHuzjMlWWZRmDho=
In-Reply-To: <af021a3d-b4d4-28d4-df66-12a16f7977f2@gmail.com>
Content-Language: fr-FR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Netfilter list <netfilter@vger.kernel.org>

Hi Amish

Le 06/12/2021 à 14:30, Amish a écrit :
> On 06/12/21 18:41, Pablo Neira Ayuso wrote:
>> On Sun, Dec 05, 2021 at 05:25:29PM +0530, Amish wrote:
>>> Hello,
>>>
>>> nftables wiki [1] mentions this:
>>>
>>>> Note: There are plans to support rule deletion by passing:
>>>> % nft delete rule filter output ip saddr 192.168.1.1 counter
>>> Any idea when will this happen? Because I thought it was very important
>>> feature. (unless I missed an alternate way to do it)
>>>
>>> I want to migrate from iptables to nftables (from many years) but 
>>> deleting a
>>> rule via script is not as easy as in case of iptables.
>>>
>>> Obtaining the handle first and then deleting it is difficult
>>> programmatically.
>> You can use --echo and --handle options to fetch the rule handle.
>>
>>   # nft -e -a  add rule x y counter
>>   add rule ip x y counter packets 0 bytes 0 # handle 3
>>   # new generation 5 by process 91190 (nft)
>
> Well then I need to keep recording each rule addition somewhere so 
> that I can delete by handle in future.
>
> Some rules are added manually, some added by scripts. Scripts may want 
> to remove manually added rule.
>
> So its not as easy like in iptables.
In a script you can use eg

myhandle=$(echo `$nft -sa list chain ip mangle prerouting |grep -F "ct 
state new counter jump MAIN"|grep -oP '(# handle ).*'`|cut -d " " -f 3)
$fwtables delete rule ip mangle prerouting handle $myhandle

and you're done. ip, mangle prerouting and rule to delete could be 
sended as parameters in a bash function for instance.

[...]

-- 
Daniel
