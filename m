From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: real-time monitor question
Date: Tue, 5 Aug 2003 10:20:05 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0308051013000.21531-100000@localhost>
References: <030101c35aae$37e83500$0b02a8c0@pointhere.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <030101c35aae$37e83500$0b02a8c0@pointhere.net>
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
To: "Jeffrey D. Brower" <jeff@pointhere.net>
Cc: netfilter@lists.netfilter.org

Hi Jeffrey,

> I have a circuit board (hooked up to a box running netfilter/iptables) which
> counts and displays the data sent to it via the parallel port.  The object
> is to display, in real-time, the packets on each interface that are accepted
> and denied on a packet by packet basis.
> 
> I trust netfilter and I don't want to interfere with its operation in any
> way and try to duplicate it's logic anywhere and it looks like the userspace
> options might force me to do this to get what I need, but I don't really
> know if it will or even if this is an option.  I am not eager to actually
> queue packets myself - since I am sure to not be nearly as efficient.
> 
> I found a gnumonks.org project called ulogd that seems like it _could_ be a
> solution for me but I know nothing about it, including if I can get ACCEPT
> and DENY, by interface, by packet, buffered from it.

I think that ulogd, and the ULOG target which feeds it, are the best 
solution in this case.

> It seemed to me that I can jump to tables for ACCEPT1 - ACCEPTn and the same
> for DENY1 - DENYn for each of the interfaces and use the log function in
> some way - but using the log for each packet seems nightmarish to me.

Why is that? It seems to be the best way to distinguish between packets 
being dropped in different places. If you only want a graph of ALL packets 
accepted and ALL packets dropped, then just create a couple of chains:

  iptables -N my_accept
  iptables -A my_accept -j ULOG --ulog-prefix "ACCEPT"
  iptables -A my_accept -j ACCEPT

  iptables -N my_drop
  iptables -A my_drop -j ULOG --ulog-prefix "DROP"
  iptables -A my_drop -j DROP

Then you can change ACCEPT and DROP in your firewall rules to my_accept 
and my_drop resppectively. From your user-space application, which could 
most easily be based on ulogd, you can read the log prefix of each packet 
you receive to determine whether that packet was accepted or dropped.

> It occurs to me that there might be something I can do with the /proc files.

As far as I know there are no counters of ACCEPTed/DROPped packets in 
/proc, but you could run "iptables -L -n -v" and parse the output to see 
the number of packets dropped at each rule.

> It also seems to me that any program I write that gets the info from the
> firewall might have to do a sleep to await the logic in the board to process
> and so I might have to buffer the information from the firewall to avoid
> slowing it down or do some kind of round-robin sort of stack as long as the
> stack is larger than the potential input flood.  It may be that I do not
> need to actually keep track of every single solitary ACCEPT but I surely
> need every DENY.

Maybe have a process which fork()s with either end of a pipe(). One 
process reads from Netfilter and writes to the pipe every so often (with a 
non-blocking write), while the other process reads from the pipe and 
writes to the hardware.

Hope this helps!

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


