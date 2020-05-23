From: Stephen Satchell <list@satchell.net>
Subject: WTF, over
Date: Sat, 23 May 2020 15:02:14 -0700
Message-ID: <f8b2b366-356a-cca8-ccc5-58a561904dad@satchell.net>
Reply-To: list@satchell.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

This statement works with --check, but this is what I get when I try to 
insert the rule:

> [root@fiber-fw Desktop]# nft add rule inet filter output meta oif enp1s0 jump wan_output
> Error: Could not process rule: Operation not supported
> add rule inet filter output meta oif enp1s0 jump wan_output
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Doing a "list ruleset", I find this present in inet filter:

> 	chain wan_output {
> 		fib saddr . iif type broadcast counter packets 0 bytes 0 drop
> 		fib saddr . iif type multicast counter packets 0 bytes 0 drop
> 		fib saddr . iif type blackhole counter packets 0 bytes 0 drop
> 		fib saddr . iif type unreachable counter packets 0 bytes 0 drop
> 		fib saddr . iif type prohibit counter packets 0 bytes 0 drop
> 	}

Interestingly, a similar expression works just file in the input context:

> 	chain input {
> 		type filter hook input priority 0; policy drop;
> 		iif "enp1s0" jump wan_input
> 		iif "enp2s0" jump lan_input


Documentation provides NO clue as to what is wrong with the first 
statement statement.

Can anyone tell me what is going on?
