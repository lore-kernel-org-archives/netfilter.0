From: Stefan Hartmann <stefanh@hafenthal.de>
Subject: Re: nftables carefully open the related-flow: ct state related ct
 helper "ftp-21" ...
Date: Mon, 8 Mar 2021 10:24:21 +0100
Message-ID: <1b961364-e014-57c9-5849-eb67c05b3a76@hafenthal.de>
References: <ae754fef-dbae-6a71-b7d5-b730bc21c363@hafenthal.de>
 <052d6523-bf4b-fadf-b95d-15bd63457cef@fhmtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <052d6523-bf4b-fadf-b95d-15bd63457cef@fhmtech.com>
Content-Language: de-DE
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Frank Myhr <fmyhr@fhmtech.com>, netfilter@vger.kernel.org

On 07.03.21 21:06, Frank Myhr wrote:
> On 2021/03/07 10:12, Stefan Hartmann wrote:
>> Hi,
>>
>> I want to carefully open the related-flow and noticed that I cannot 
>> concatenate the two ct expressions:
>>
>>          ct state related ct helper "HELPER" ... accept
>>
>>
>> Simple example with ftp-helper:
>> ...
>> chain INPUT4 { vom VPN-Peer,
>>          type filter hook input priority 0; policy drop;
>>
>>
>>      ct state established counter accept
>>
>>      # would be nice to match on state related AND applied helper
>>      ct state related ct helper "ftp-21" tcp dport {1024-65535} 
>> counter accept
> 
> Hi Stefan,
> 
> I guess the problem is that input tcp packets with dport {1024-65535} 
> that are matched by "ftp-21" ct helper are by definition related packets 
> (to the original connection to tcp/21), so the explicit "ct state 
> related" match in your INPUT4 chain rule is redundant. You didn't show 
> your "ftp-21" ct helper (stateful object) definition, I suppose it is 
> something like those at:
> 
> https://wiki.nftables.org/wiki-nftables/index.php/Setting_packet_connection_tracking_metainformation 

Thank you Frank for your prompt reply!

Sorry, I should have mention it. I tried the snooping of the master 
connection with different approaches, which all worked as espected, eg

chain PREROUTING-FILTER4 {  # After CT, Prio 0, filter
         type filter hook prerouting priority 0; policy accept;
	tcp dport 21 counter ct helper set "ftp-21"

or

chain INPUT4 { vom VPN-Peer,
         type filter hook input priority 0; policy drop;
	
	...
	tcp dport 21 ip daddr $IF1_IP4 counter ct helper set "ftp-21" accept		# 
initial traffic AND snooping


> 
> Then you'd have something like (warning, untested):
> 
> table my_table {
> 
>    ct helper ftp-21 {
>      type "ftp" protocol tcp;
>    }
> 
>    chain ct_helper_assign {
>      type filter hook prerouting priority filter;
> 
>        ct state new tcp dport 21 ct helper set "ftp-21"
>    }
> 
>    chain INPUT4 {
>      type filter hook input priority filter; policy drop;
>      ...
>      ct helper "ftp-21" tcp dport {1024-65535} counter accept
>      ...
>    }
>    ...
> }
> 
> In the above ruleset "ftp-21 related" packets are accepted in a 2-step 
> process:
> 
> 1) In the prerouting hook such packets receive "ftp-21 related" status 
> when the "ftp-21" "ftp" helper recognizes them as matching expectations 
> it created based on recent packets to tcp/21;
> 
> 2) In the input hook such packets are matched (with additional tcp dport 
> restriction), counted, and accepted by the rule in your INPUT4 chain.
> 
> This explicit 2-step process differs from the way ct helpers worked 
> using iptables, for example:
> https://home.regit.org/netfilter-en/secure-use-of-helpers/
> 
> 
> Best Wishes,
> Frank


In chain INPUT4 {

	your mentioned rule
	ct helper "ftp-21" tcp dport {1024-65535} counter accept

did not match in my test.

Eventually the ct helper "ftp-21" matches only on the master connection 
and not for the expects?
I should have to dig into the source code, but because of time 
constraints this is not yet possible.

I will go now with this simple approach, which is only an example:
	ct state established counter accept 

         ct state related tcp dport {1024-65535} ip saddr $SITE-S18_NET4 
counter accept

The goal is to carefully open the related flows to different SIP ITSPs.

-- 
Cheers, Stefan Hartmann


