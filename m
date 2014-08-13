From: lejeczek <peljasz@yahoo.co.uk>
Subject: Re: [Bulk] Re: a missing rule / incomplete routing
Date: Wed, 13 Aug 2014 11:21:15 +0100
Message-ID: <53EB3C1B.60702@yahoo.co.uk>
References: <53E8946F.2070403@yahoo.co.uk> <53E8AEE0.60800@atc.tcs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s2048; t=1407925276; bh=iFvd8ydYebM7xgATiIz0vqywKWbgBexmBdnRVP+KHPc=; h=Received:Received:Received:DKIM-Signature:X-Yahoo-Newman-Id:X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:Message-ID:Date:From:User-Agent:MIME-Version:To:CC:Subject:References:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=IxawKWmSkmAhbxkXJZuzEhKxCEb6n8SBKxWakDsu+mP/4HDHIKWcKLdYKeQyHwIQKkRAMMRlmFSoz+zg+rmeVJAQi/sGqUgBkFsAoEIpLF4B4mzQLyRi3bJgdJdLK/ebSVMaZWMasmaO+KFUkwKos47xl/vzwmRrta2xg8aFgZ68a0OP+VLYGepZfjyxlYFW+2OmP3vGRhH/HPiyF9WFFqzqgb8J92uXTlhw4VOfgJQoW0R+S1W+orBmMhf/Z0Eu/+nlITB5h4DR1gXfrZdrWZ6Y6XrucWL4ZM1QN+jNKnNhd/foaabBxd/yp8268oFHtOg9tj8h5MRnkSEivjucjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s1024; t=1407925276; bh=iFvd8ydYebM7xgATiIz0vqywKWbgBexmBdnRVP+KHPc=; h=X-Yahoo-Newman-Id:X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:Message-ID:Date:From:User-Agent:MIME-Version:To:CC:Subject:References:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=J9kEA4tMLKKQo6GlWF8p9rG6qqzhWZg5Q7Lgq4ZaiKOJjXhJWcU9APAjg40u60wVAitWa83s44H9n/n2CPcpF+48Vvn5uJGKua5EwOlwKpgx+WEAFUQyYLCNl7pHhNAffx04LqvG59cUsZgWBtB+yU3Cka0JaD0eZka34EGvOv4=
In-Reply-To: <53E8AEE0.60800@atc.tcs.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vigneswaran R <vignesh@atc.tcs.com>
Cc: netfilter <netfilter@vger.kernel.org>

I have had:
-A FORWARD -i em1 -o em2 -m state --state NEW -j ACCEPT
-A FORWARD -i em2 -o em1 -m state --state NEW -j ACCEPT
besides, also usual
-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -p icmp -j ACCEPT

one strange thing is that when I tracepath on box B I see 
traffic (to box A 172.17.167.x) wants to go out via 
em3(another psyh interface)

if it might be routing, then
I have 3 man made routing tables, one for each interface
private 192.xxxx
internal 172.xxx
external a public IP

I've left out private (empty, no rules no routes) for I 
thought kernel would take care of it,
which it does (well, to certain extent) eg. 172.25.12.x net 
get to box B's 192.168.2.100 and behind (this is internal 
table route rules)
but eg. 172.17.x.x  which essentially goes through the same 
phys0 cannot get to box B's 192.168.2.100 (but can to box 
B's 172.25.12.101)

there are router(s) between 172.x.x.x (not mine) but then as 
above they all can get to box B's psyh0 172.25.12.101

it's all a bit weird to me


On 11/08/14 12:54, Vigneswaran R wrote:
> On 08/11/2014 03:31 PM, lejeczek wrote:
>> dear experts
>>
>> I'm looking for ideas/suggestion why the following does 
>> not work
>>
>> there is a:
>> * box A - 172.17.166.199 --  then there is 172./8 net -- 
>> box B - 172.25.12.101 (phys0), 192.168.2.100 (phys1) -- 
>> and one more net behind 192.168.2.100
>>
>> a 192.168.2.81 from behind box B can ping172.17.166.199
>> but not the other way around, box A cannot get to box B's 
>> phys1 but it does get to phys0
>>
>> I can control box A but have no control over the nets 
>> between it and box B's phys0
>> I can control box B
>>
>> I thought my route rules on box B are complete, box A is 
>> a winbox
>> I though box B' firewall is ready
>> but I obviously miss something
>>
>> there is no masquerading for phys0 nor phys1 one box B
>
> It looks like  the firewall (FORWARD chain) in B is not 
> allowing NEW connections from phys0 to phys1; only 
> allowing ESTABLISHED connections, which made the ICMP 
> reply packets through.
>
>
> Regards,
> Vignesh
>
>

