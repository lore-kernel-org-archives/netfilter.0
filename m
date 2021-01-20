From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Migrate ipsets to nftables
Date: Wed, 20 Jan 2021 15:48:50 +0100
Message-ID: <1d88d970-47ea-8093-8cba-39f1d30a661a@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: david@hajes.org
Cc: netfilter@vger.kernel.org

but it comments out everything it can't translate, ipset as example adn 
way too much other things here on our datacenter firewall

i also wouldn't know how to get output like below which is easy based on 
"iptables -L" with a little grep/sed and bash magic

12M   12M   0  100   100   0   ALL
6.9M  6.9M  0  56.6  56.6  0   ACCEPT
5.3M  5.3M  0  43.4  43.4  0   DENY
4.5M  4.5M  0  36.4  36.4  0   DENY SCAN
4.1M  4.1M  0  33.6  33.6  0   DENY IPSET
3.5M  3.5M  0  28.6  28.6  0   ACCEPT OUT
3.4M  3.4M  0  28    28    0   ACCEPT IN
478K  478K  0  3.9   3.9   0   RL + CL
477K  477K  0  3.9   3.9   0   RATELIMIT
392K  392K  0  3.2   3.2   0   HONEYPOT
261K  261K  0  2.1   2.1   0   INVALID
43K   43K   0  0.3   0.3   0   OUT RESTRICT
1.2K  1.2K  0  0     0     0   OUT DENY
552   552   0  0     0     0   CONNLIMIT

Am 20.01.21 um 15:07 schrieb david@hajes.org:
> iptables-translate if I recall correctly. It converts iptables to nft if possible. I started from scratch though.On Jan 20, 2021 13:41, Reindl Harald <h.reindl@thelounge.net> wrote:
>>
>>
>>
>> Am 20.01.21 um 11:41 schrieb Nikolai Lusan:
>>> Hi all,
>>>
>>> I am in the process of migrating from iptables+ipsets to nftables. Is
>>> there an easy way to migrate exisiting ipsets to nftables sets.
>>
>> not really but you can use iptables-nft which is nearly 100% compatible,
>> can use ipset unchanged and behind the scenes uses nft
