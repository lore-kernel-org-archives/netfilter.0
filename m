From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: Interesting problems
Date: Tue, 5 Aug 2003 10:38:13 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0308051025320.21531-100000@localhost>
References: <3276876863.20030804234107@lf.lv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3276876863.20030804234107@lf.lv>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peteris Krumins <newsgroups@lf.lv>
Cc: Netfilter <netfilter@lists.netfilter.org>

Hi Peteris,

>   - there is a computer PII 266, now with 192mb ram, it's running
>     custom linux distribution with 1 user process - getty, as I log
>     in, a bash is spawned.
> 
>     Only ESTABLISHED,RELATED outbound connections are allowed, NEW and
>     INVALID inbound are REJECTed.
> 
>     All the traffic is routed via this computer - 8Mbit link
>     constant, - lots of users more than 300 - everyone does something
>     different.
> 
>     I set up max. 20000 conntrack entries unfortunately
>     after a day there already are already 15000 connection tracking entires
>     and the load of the computer each 5 minutes jumps up to 2 then goes
>     down to 0.3 and jumps to 2 again etc., 15 minute avg load keeps at
>     0.7. But unfortunately entries are growing and growing, more ram
>     is used, computer load grows and suddenly any traffic routed via
>     this computer is killed, nothing flows through.
>     Kernel shouts that conntrack table is full but a
>     `wc -l /proc/net/ip_conntrack' shows around 20000 entries.
>     A reboot helps.

This does not surprise me at all. You have a very old computer handling an 
enormous amount of traffic and you complain that it's slow? =)

For reference, we have a 350MHz Cyrix machine handling iptables with
stateful inspection for a medium-loaded 2Mb line with maybe 50 users/boxes
behind it, and it has about 3000 connections right now and a load of 0.04.  
50% of CPU time is used by the System, indicating netfilter.  Perhaps your
users are very busy?

When `wc -l /proc/net/ip_conntrack' shows around 20000 entries, and you 
have set the max to 20000, then no more connections can be added and the 
kernel prints the warning you saw.

>     The question is what could i do to avoid the growthy of connection
>     tracking entries? I guess the entries taking up space are already
>     established tcp connections which were not properly terminated, so
>     they are there to timeout.

Terminate some of your users, or tell them not to use the Internet so 
much! But a better solution would be to get a real powerful box or not use 
stateful inspection (or maybe run nf-hipac or BSD's ipf instead of 
iptables, as apparently both are faster).

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


