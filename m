From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: proper ICMPv6 syntax for specific daddr
Date: Thu, 8 Sep 2022 16:23:58 +0200
Message-ID: <a161b909-8459-2450-f260-f846cd0f3eae@thelounge.net>
References: <dea61421-4ce1-bb68-2a74-88b6f42c299e@foscore.com>
 <22a53086-4479-c142-6415-06e1e42ebeca@foscore.com>
 <75d06629-de72-651f-4167-82d9a973b442@thelounge.net>
 <be7347ec-4aad-92ea-9c87-925f3cad8c62@foscore.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <be7347ec-4aad-92ea-9c87-925f3cad8c62@foscore.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tom <tom@foscore.com>
Cc: netfilter@vger.kernel.org



Am 08.09.22 um 15:31 schrieb Tom:
> On 2022-09-08 04:46, Reindl Harald wrote:
>> why do you make all that so complicated instead write a simple 
>> ratelimit rule for ping apply to everyone and *before* have a set 
>> which ACCEPTs a specific list of ip's if that's needed at all
> 
> OK, sounds good. Perhaps you're under the mistaken impression I'm a NFT 
> expert. Clearly I'm not. Perhaps you could suggest a resource where I 
> might find examples which solve my problem. Better yet, you could 
> provide a practical example. It would be appreciated

in a rulset any rule which is final (DROP, JEJECT, ACCEPT) skips 
anything below

so you have a chain where you send only ICMP, write first the specific 
rules and at last one the "everything else" decision not matter if it's 
ACCEPT/DROP/REJECT

i use iptables-nft because i hate the new syntax and have thousands of 
lines in scripts for configure and dispaly status of rulesets - but the 
principles are the same for every firewall
