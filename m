From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: WTF, over
Date: Sun, 24 May 2020 13:09:03 +0200
Message-ID: <20200524110903.GA4481@salvia>
References: <f8b2b366-356a-cca8-ccc5-58a561904dad@satchell.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f8b2b366-356a-cca8-ccc5-58a561904dad@satchell.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Satchell <list@satchell.net>
Cc: Linux Netfilter Users List <netfilter@vger.kernel.org>

On Sat, May 23, 2020 at 03:02:14PM -0700, Stephen Satchell wrote:
> This statement works with --check, but this is what I get when I try to
> insert the rule:
> 
> > [root@fiber-fw Desktop]# nft add rule inet filter output meta oif enp1s0 jump wan_output
> > Error: Could not process rule: Operation not supported
> > add rule inet filter output meta oif enp1s0 jump wan_output
> > ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Doing a "list ruleset", I find this present in inet filter:
> 
> > 	chain wan_output {
> > 		fib saddr . iif type broadcast counter packets 0 bytes 0 drop
> > 		fib saddr . iif type multicast counter packets 0 bytes 0 drop
> > 		fib saddr . iif type blackhole counter packets 0 bytes 0 drop
> > 		fib saddr . iif type unreachable counter packets 0 bytes 0 drop
> > 		fib saddr . iif type prohibit counter packets 0 bytes 0 drop
> > 	}
> 
> Interestingly, a similar expression works just file in the input context:
> 
> > 	chain input {
> > 		type filter hook input priority 0; policy drop;
> > 		iif "enp1s0" jump wan_input
> > 		iif "enp2s0" jump lan_input
> 
> 
> Documentation provides NO clue as to what is wrong with the first statement
> statement.
> 
> Can anyone tell me what is going on?

fib address type with...

* iff can only be used in prerouting, input and forward.
* oif can only be used in output, postrouting and forward.

I assume your 'output' chain is something like:

        type filter hook output priority 0; policy drop;

Anyway, I agree error reporting and documentation can do better there.
