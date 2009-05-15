From: Robert L Mathews <lists@tigertech.com>
Subject: conntrack and RSTs received during CLOSE_WAIT
Date: Fri, 15 May 2009 15:10:33 -0700
Message-ID: <4A0DE859.7000209@tigertech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I'm using Linux kernel 2.6.26 with conntrack/connlimit to prevent people 
from DOSing our Web servers by opening up too many simultaneous 
connections from one IP address. This is mostly for protection against 
unintentional DOSes from broken proxy servers that try to open up 
literally hundreds of simultaneous connections; we DROP their syn 
packets if they already have 40 connections open.

This is generally working well (and thanks to folks on this list for the 
hard work that makes this possible).

However: Some clients send evil TCP RSTs that confuse conntrack and 
break connlimit in a way that I'll detail below. First, here's a sample 
recreation:

  client > server [SYN] Seq=0 Len=0
  server > client [SYN,ACK] Seq=0 Ack=1 Len=0
  client > server [ACK] Seq=1 Ack=1 Len=0
  client > server [PSH,ACK] Seq=1 Ack=1 Len=420 (HTTP GET request)
  server > client [ACK] Seq=1 Ack=421 Len=0
  server > client [ACK] Seq=1 Ack=421 Len=1448    (HTTP response)
  server > client [ACK] Seq=1449 Ack=421 Len=1448 (more HTTP response)
  server > client [ACK] Seq=2897 Ack=421 Len=1448 (more HTTP response)
  client > server [FIN,ACK] Seq=421 Ack=1449 Len=0
  server > client [ACK] Seq=4345 Ack=422 Len=1448 (more HTTP response)
  server > client [ACK] Seq=5793 Ack=422 Len=1448 (more HTTP response)
  client > server [RST] Seq=421 Len=0
  server > client [ACK] Seq=2897 Ack=421 Len=1448 (retr HTTP response)
  server > client [ACK] Seq=2897 Ack=421 Len=1448 (retr HTTP response)
  server > client [ACK] Seq=2897 Ack=421 Len=1448 (retr HTTP response)
  server > client [ACK] Seq=2897 Ack=421 Len=1448 (retr HTTP response)
  server > client [ACK] Seq=2897 Ack=421 Len=1448 (retr HTTP response)
  server > client [ACK] Seq=2897 Ack=421 Len=1448 (retr HTTP response)
  server > client [ACK] Seq=2897 Ack=421 Len=1448 (retr HTTP response)
  server > client [ACK] Seq=2897 Ack=421 Len=1448 (retr HTTP response)
  server > client [ACK] Seq=2897 Ack=421 Len=1448 (retr HTTP response)
  server > client [ACK] Seq=2897 Ack=421 Len=1448 (retr HTTP response)

Everything up to and including the "RST" takes place in under a tenth of 
a second. The remaining ten retransmits take place over 5 minutes.

As soon as the client received the first packet of the HTTP response, it 
decided to close the connection. This appears to be due to a SonicWall 
firewall on the client end, which examines the Content-Type of the HTTP 
reply and immediately shuts down the connection if it's a "forbidden" 
type. This is apparently common.

 From the server's TCP stack point of view, this connection enters the 
CLOSE_WAIT state when the FIN is received. The stack then waits for 
Apache to close() the socket. However, Apache doesn't close the socket 
for five minutes. That's because it's blocked waiting for a socket write 
to complete, and it doesn't notice the end-of-input on the socket until 
the write times out. (Yes, according to netstat, the connection remains 
in CLOSE_WAIT even after the RST packet, which surprised me, but that's 
how Linux works, apparently.)

If the client opens up hundreds of these connections within five 
minutes, it can use up hundreds of Apache process slots. I want 
connlimit to prevent that, and it looks like it should, because 
conntrack should be tracking the CLOSE_WAIT connections just like any 
other connections. To make sure it tracks them long enough, I've set 
ip_conntrack_tcp_timeout_close_wait to 5 minutes.

However, the RST packet screws things up. As I said, the kernel ignores 
the RST packet and leaves the connection in CLOSE_WAIT. But when 
conntrack sees the RST packet, it marks the connection CLOSEd, and then 
forgets about it 10 seconds later.

What happens next depends on whether nf_conntrack_tcp_loose is set. If 
it's set to 1, the server's retransmitted packets cause a new, "fake" 
connection to be ESTABLISHED in conntrack, which lingers for five 
days(!). We originally had it set that way, but a couple of legitimate 
customers were complaining about still being blocked from our servers 
for five days after they'd actually closed all their connections.

So we set nf_conntrack_tcp_loose to 0. That solved the "blocked for five 
days" problem.... but now the CLOSE_WAIT connections quickly go to CLOSE 
in conntrack when the RST arrives and are totally forgotten ten seconds 
later. A rogue client can quickly get 40 connections into the CLOSE_WAIT 
state, then wait ten seconds and open 40 more, etc., occupying up to 
1200 Apache process slots within five minutes.

What we really want is for conntrack to match what the kernel does: to 
ignore the RST packet for CLOSE_WAIT connections, leaving the connection 
to remain in the conntrack CLOSE_WAIT state until 
ip_conntrack_tcp_timeout_close_wait expires. That looks easy to do with 
a change to nf_conntrack_proto_tcp.c:

-/*rst*/    { sIV, sCL, sCL, sCL, sCL, sCL, sCL, sCL, sCL, sIV },
+/*rst*/    { sIV, sCL, sCL, sCL, sCL, sCW, sCL, sCL, sCL, sIV },

... but I'd rather not maintain a custom compiled kernel just for that.

So I've considered other solutions:

1. Set nf_conntrack_tcp_loose to 1, but change 
ip_conntrack_tcp_timeout_established to 1 hour (instead of 5 days). This 
would make sure that people aren't blocked for more than an hour after 
they close all their connections. However, that's still not ideal -- and 
it would also allow someone to intentionally bypass connlimit by opening 
40 connections, then leaving them idle for an hour, then opening 40 
more, and so on.

2. Set nf_conntrack_tcp_loose to 0, and change 
nf_conntrack_tcp_timeout_close to 5 minutes (instead of 10 seconds). 
This would only block people for the 5 minutes that they're still taking 
up an Apache process slot, but would also block anyone who sends 40 TCP 
RSTs within 5 minutes for any reason. You wouldn't think that this would 
be a problem, but RSTs actually seem quite common on a busy Web server 
with a fairly low HTTP keepalive value.

Does anyone have any other suggestions about how to make conntrack 
remember these connections during (and only during) the five-minute 
period netstat shows them as CLOSE_WAIT?

-- 
Robert L Mathews, Tiger Technologies     http://www.tigertech.net/
