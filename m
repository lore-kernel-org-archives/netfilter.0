From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: real-time monitor question
Date: Wed, 6 Aug 2003 10:27:08 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0308061022320.21531-100000@localhost>
References: <042501c35b7c$e3e565c0$0b02a8c0@pointhere.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <042501c35b7c$e3e565c0$0b02a8c0@pointhere.net>
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

> Based on that statement I got more deeply into the ULOG and it looks good.
> I found an extention in the CVS called ulogd_OPRINT.c which (although I can
> not find the documentation on its use) LOOKS like it is almost exactly what
> I need.  Can it be that my solution could be as simple as replacing the
> _output_print() function with my own function that prints to the circuit
> board?

It could certainly be that easy, but I'm not familiar with the code in 
question.

> Another suggestion that I got kind of steered me toward lookng at bytes
> rather than packets and I wonder if I can't just read one of the /proc files
> to see the number of bytes accepted and denyed

Unfortunately I don't think there are any counters for this either in 
/proc. You would still have to use libiptc or parse the output of 
iptables -L -n -v.

> Never having done a fork(), nor a pipe() nor reads from Netfilter - this
> sounds like a lot of fun to me (but like a heck of a learning curve).  It
> sounds like what I envisioned, but I wonder if the pipe won't get stuffed
> too fast and halt the input side causing lost packets, etc.

If you set the O_NONBLOCK option on your end of the pipe, then if the pipe 
is full the operating system will just return an EAGAIN error immediately, 
instead of waiting for the pipe to empty. In any case, it doesn't matter 
much if the input process blocks, since packet processing will continue 
anyway without interference from your process.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |



