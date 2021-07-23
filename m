From: Stephen Satchell <list@satchell.net>
Subject: Re: OK, IPv4 vs IPv6 is driving me crazy
Date: Fri, 23 Jul 2021 09:01:16 -0700
Message-ID: <1146d9a1-418f-baaf-3a11-e89ba6779f90@satchell.net>
References: <957e7c3e-1494-1688-8074-d0ae68716a29@satchell.net>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <957e7c3e-1494-1688-8074-d0ae68716a29@satchell.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

OK, I think I've answered my own question, at least in part.  Thank GHU 
for virtual machines.  I found an ip6tables.sh, ran it through the 
process of conversion, loaded the result, and did nft list ruleset and 
save that output.  I now have a reference, and the nft translation.

I think I can go from here.  Learning, learning, learning...

On 7/23/21 8:09 AM, Stephen Satchell wrote:
> At one point, a member here -- when asked what the difference in 
> defining rules in nftables between the two systems -- said "they are the 
> same."
> 
> As I read the documentation on wiki.nftables.org:  NO!
> 
> The hooker here is the requirement thatt IPv6 header examination 
> requires "nexthdr" to examine tcp, udp, and icmp packets.  How about 
> other protocols: do I need to do something like this?
> 
>> nexthdr inet protocol {gre, esp, ah} jump other_protocols
> 
> If this is the case, than the "inet" combined table is useless, as my 
> filters will need to be in separate "ip" and "ip6" tables.
> 
> Fortunately, I'm building a parameter-based firewall generator, so 
> details like this can be hidden from the person specifying the pinholes 
> for the firewall, if this is the case.
> 
> Or does nft(8) do the smart thing and, for IPv6, put the "nexthop" in 
> the v6 rules for you?
> 
> Maybe this excerpt from wiki.nftables.org answers my question:
> 
>> inet
>> Tables of this family see both IPv4 and IPv6 traffic/packets, 
>> simplifying dual stack support.
>>
>> Within a table of inet family, both IPv4 and IPv6 packets traverse the 
>> same rules. Rules for IPv4 packets don't affect IPv6 packets. Rules 
>> for both L3 protocols affect both.
>>
>> Examples:
>>
>> # This rule affects only IPv4 packets:
>> add rule inet filter input ip saddr 1.1.1.1 counter accept
>>
>> # This rule affects only IPv6 packets:
>> add rule inet filter input ip6 daddr fe00::2 counter accept
>>
>> # These rules affect both IPv4 and IPv6 packets:
>> add rule inet filter input ct state established,related counter accept
>> add rule inet filter input udp dport 53 accept
