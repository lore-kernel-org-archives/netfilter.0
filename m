From: "Jeffrey D. Brower" <jeff@pointhere.net>
Subject: Re: real-time monitor question
Date: Tue, 5 Aug 2003 14:10:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <042501c35b7c$e3e565c0$0b02a8c0@pointhere.net>
References: <Pine.LNX.4.44.0308051013000.21531-100000@localhost>
Reply-To: "Jeffrey D. Brower" <jeff@pointhere.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Chris Wilson <chris@netservers.co.uk>
Cc: netfilter@lists.netfilter.org

> I think that ulogd, and the ULOG target which feeds it, are the best
> solution in this case.

Based on that statement I got more deeply into the ULOG and it looks good.
I found an extention in the CVS called ulogd_OPRINT.c which (although I can
not find the documentation on its use) LOOKS like it is almost exactly what
I need.  Can it be that my solution could be as simple as replacing the
_output_print() function with my own function that prints to the circuit
board?


> Why is that? It seems to be the best way to distinguish between packets
> being dropped in different places.

I was really refering to the horrors of a huge syslog as each packet gets
logged and reading that log file to drive the circuit board and all the
maintenance nightmares with it.


>  If you only want a graph of ALL packets
> accepted and ALL packets dropped, then just create a couple of chains:
>
>   iptables -N my_accept
>   iptables -A my_accept -j ULOG --ulog-prefix "ACCEPT"
>   iptables -A my_accept -j ACCEPT
>
>   iptables -N my_drop
>   iptables -A my_drop -j ULOG --ulog-prefix "DROP"
>   iptables -A my_drop -j DROP

This confused me until I realized that the ULOG returns the packets for
further processing.  I had (in error) thought that I would have to deal with
the packet resolution in userspace.


> > It occurs to me that there might be something I can do with the /proc
files.
>
> As far as I know there are no counters of ACCEPTed/DROPped packets in
/proc

Another suggestion that I got kind of steered me toward lookng at bytes
rather than packets and I wonder if I can't just read one of the /proc files
to see the number of bytes accepted and denyed - the assumption being that I
could log bytes to the board and let the log files watch for connections
keeping the size of the log file down while still presenting a real-time
interface for the operator via the circuit board.  As I understand it, I can
read a /proc file 10 times a second with little impact on the system (as
bizzare as that sounds to me).


> but you could run "iptables -L -n -v" and parse the output to see  the
number of
> packets dropped at each rule.

seems like a lot of overhead.


> Maybe have a process which fork()s with either end of a pipe(). One
> process reads from Netfilter and writes to the pipe every so often (with a
> non-blocking write), while the other process reads from the pipe and
> writes to the hardware.

Never having done a fork(), nor a pipe() nor reads from Netfilter - this
sounds like a lot of fun to me (but like a heck of a learning curve).  It
sounds like what I envisioned, but I wonder if the pipe won't get stuffed
too fast and halt the input side causing lost packets, etc.  It really seems
like this exactly what I need to code in the  _output_print() function of
the ulogd_OPRINT.c program - but again, how do I keep it from over-running
the pipe?


> Hope this helps!

Yes it did.



