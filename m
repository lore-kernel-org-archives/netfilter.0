From: "Horton, Dave" <dhorton@pactolus.com>
Subject: dynamic manipulation of iptables from C++ for NAT-type scenario
Date: Wed, 14 Jul 2004 23:39:34 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2CC2CB3C95C3D311ABAC009027DCD77E01969057@flyhalf.pactolus.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>


First, let me give the standard newbie disclaimer -- if this question should
be posted elsewhere, or if the answer is readily available elsewhere, please
feel free to point me in that direction. 

I am building an application in C++ (RH 9.0) which does some fairly
straightforward packet forwarding, and it seems to me that, in some ways,
iptables is well-suited to exactly what I want, and being the lazy sort I
find that attractive.  On the other hand, it's not clear to me whether an
iptables approach will meet all my requirements -- specifically, high
performance and dynamic manipulation of large numbers of rules (potentially
thousands, changing at a rate of about 25 rules added or deleted per
second).  Here's the background:

My application will run on a server in my DMZ.  It will provide a dynamic
flavor of port forwarding between clients  accessing the application from
the internet, and a small number of servers inside my private network.  It
works like this:

A client (let's call this box A) sends a request via to my server (let's
call this box B) in the DMZ via an out-of-band method.  The nature of the
request is that the client wants to exchange UDP packets with my server (and
have them forwarded into my network).  My server application allocates a UDP
port on one of the local interfaces (e.g. eth0) and sends a response back to
the client indicating this port.  My application then allocates a second UDP
port on a different local interface (e.g., eth1) and sends a similar request
into a server in my network (let's call that box C).

My application at this point wants to simply forward packets between box A
and C; i.e., it is acting as a proxy of sorts for these UDP packets.  The
application has to do the following:

1. When it receives the very first packet from A on the port it advertised
to A, it takes note of the sending ip address and port the packet was sent
from.  All packets destined for A must be sent back to this remote
address/port.  Until a first packet is received from A no packets can be
sent to A.  The exact same procedure is followed with regards to handling
the first packet received from C.

2. When a packet is received from A, it is discarded if we have not yet
received a packet from C, since the destination ip/port for C will not yet
be known.  The same is true in the reverse direction.

3.  When a packet is received from A, it is forwarded to the destination
ip/port for C, if we have previously received packets from C.  The packet is
sent to C with the source address/port of my box that my application
previously advertised to C.  The same is true in reverse for packets
received from C: they are sent to A from the source ip/port on my box (B)
that my application previously advertised to A.

4. Either the client (A) or internal server (C) at some later time will send
an out of band request to terminate the session.  At this point the
forwarding terminates -- packets received from A or C are simply discarded.
This terminates the session that started with the initial request from the
client.

As currently written, my application manages the creation and termination of
these sessions (via means which are outside the scope of my question and not
relevant here), plus handles the packet forwarding via a very simple method:
it creates a pair of UDP sockets, one facing A and one facing B, and simply
reads packets from each socket and sends them out the other socket in the
pair.  This approach works fine, but does not scale as much as I would like.
I would like to be able to handle 1,000 or so sessions on my server but
currently can not reach that -- the server becomes CPU bound at lower number
of sessions.  The number of packets sent on each session can be about 50
packets per second with each packet containing maybe 160 bytes of UDP
payload.  A session during which these packets are exchanged might last 5
minutes on average.

It has occurred to me while looking at my code that a lot of inefficiency is
created by copying each packet into user space (and selecting on large
numbers of sockets), simply to turn around and send the packet unchanged
(payload anyways) back down the IP stack to remote side. I am wondering if
this piece of it could be done more efficiently for me by the iptables
mechanism.

It seems to me that what I am doing with the packet forwarding part of my
code is exactly what a PREROUTING nat table rule using DNAT could do -- i.e
match an incoming packet based on a local interface and destination port and
forward it to a specified remote server and port (and I guess I would need a
POSTROUTING rule as well with SNAT to change the source ip address/port to
my server instead of the remote sending box).  

Thus, I am left with the following questions:

1. First of all, is this feasible ?  Am I right in thinking an
iptables-based approach could offer efficiencies over the alternative
sockets-based approach ? 

2. Is it reasonable to manage the very large number of iptable routing rules
that would be required?  It seems like each session might require 1
PREROUTING nat rule (DNAT) and 1 POSTROUTING nat rule (SNAT) for each side
of the connection, which would equal 4,000 rules to support 1,000
simultaneous sessions.  If each session lasted 5 minutes on average I would
be adding or removing about 26 rules per second.  Am I going beyond what
iptables was designed for ?

3. Is there a way for me to dynamically manipulate the iptables rules I
would need create/delete from C or C++ code? The only examples I have seen
for manipulating iptables is via shell scripts or command line.

Thanks in advance for any help or suggestions.  Also please feel free to
wave me off this approach altogether if I'm completely miscontruing what
iptables is designed for and can do; it will save me time to know this
sooner than later if that's the case.

Dave



