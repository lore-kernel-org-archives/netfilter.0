From: Daniel Huhardeaux <tech@tootai.net>
Subject: Re: IPv6 nft vs ip6tables - Local incompatibility ?
Date: Wed, 30 Oct 2019 19:04:28 +0100
Message-ID: <5e34ad10-a278-2c59-c075-2c19731bab3c@tootai.net>
References: <f696024b-d134-3470-ff70-27d7e00df9cd@tootai.net>
 <20191030171849.GG876@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1572458669; bh=Ckh3oHUUDgfGMVTZg5bJr8vH9PhQ9jZvSkQn9h9Ab0E=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=T8KGB8eZA63Mn3xtNK1ybOqq0ISRMbN/pmKrklipZUBCNsWgw43UNMT33LWaqNZ1q
         bxKoOWlmrawpTX2ln5zNf9TFY33uorwl3KAsRZPTBBtXhh89tcip6ED4FWfhyBNT8R
         gxUJeFFSNYTBmYG7vbYhOz7frEoAF4B9izPvAsT0=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1572458669; bh=Ckh3oHUUDgfGMVTZg5bJr8vH9PhQ9jZvSkQn9h9Ab0E=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=T8KGB8eZA63Mn3xtNK1ybOqq0ISRMbN/pmKrklipZUBCNsWgw43UNMT33LWaqNZ1q
         bxKoOWlmrawpTX2ln5zNf9TFY33uorwl3KAsRZPTBBtXhh89tcip6ED4FWfhyBNT8R
         gxUJeFFSNYTBmYG7vbYhOz7frEoAF4B9izPvAsT0=
In-Reply-To: <20191030171849.GG876@breakpoint.cc>
Content-Language: fr
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Le 30/10/2019 à 18:18, Florian Westphal a écrit :
> Daniel Huhardeaux <tech@tootai.net> wrote:
>> Hello,
>>
>> I use nftables in a network where stations are under Ubuntu 18 or Debian
>> 9/10.
>>
>> IPv6 networks are:
>> 2a01:YYY:ZZZ:10::9000/128
>> 2a01:YYY:ZZZ:10::/64
>>
>> ICMP rules on 2a01:YYY:ZZZ:10::4
>>
>> chain output {
>> 		type filter hook output priority 0; policy drop;
>> 		oif "lo" accept
>> 		oif "lan" meta l4proto ipv6-icmp counter packets 0 bytes 0 accept
>> 		oif "lan" ct state established,related,new counter packets 0 bytes 0
>> accept
>> 	}
>>
>> Pinging ipv6 addresses external to the network is working fine.
>>
>> Pinging a local machine, doesn't matter in which lan, I get "ping sendmsg:
>> operation not permitted".
>>
>> If I change policy to accept, I get
>>  From 2a01:YYY:ZZZ:10::4 icmp_seq=1 Destination unreachable: Address
>> unreachable
>>
>> If I switch to ip6tables
>>
>>   96 10892 ACCEPT     icmpv6    lan   *       ::/0 2a01:729:16e:10::4
>>      6  1008 ACCEPT     icmpv6    lan   *       ::/0 ::/0
>> ipv6-icmptype 134 HL match HL == 255
>>     31  2232 ACCEPT     icmpv6    lan   *       ::/0 ::/0
>> ipv6-icmptype 135 HL match HL == 255
>>     39  2496 ACCEPT     icmpv6    lan   *       ::/0 ::/0
>> ipv6-icmptype 136 HL match HL == 255
>>      0     0 ACCEPT     icmpv6    lan   *       ::/0 ::/0
>> ipv6-icmptype 137 HL match HL == 255
>>
>> I can ping machines from both lan.
>>
>> Any clue ?
> 
> It looks like nft ruleset tests output, whereas ip6tables checks
> input...
> 

My bad, I paste the wrong output :(

Anyway, I found the problem: flushing ip6tables rules is not enough to 
disable ip6tables, you have to unload modules too. All nftables machines 
where rebooted and now all is good.

Thanks for your help

-- 
TOOTAi Networks
