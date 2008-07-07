From: Robert L Mathews <lists@tigertech.com>
Subject: Re: conntrack and ESTABLISHED / UNREPLIED connections
Date: Mon, 07 Jul 2008 16:04:53 -0700
Message-ID: <4872A115.2030604@tigertech.com>
References: <486D31D9.9070900@tigertech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <486D31D9.9070900@tigertech.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Forgive me for replying to my own message, but I didn't get any replies 
from the list, and I've found out more info.

Summary of the previous problem: On our Web servers, conntrack shows 
many ESTABLISHED / UNREPLIED connections, like this:

tcp      6 426339 ESTABLISHED src=64.62.209.98 dst=96.221.109.137 
sport=443 dport=50465 packets=2 bytes=178 [UNREPLIED] src=96.221.109.137 
dst=64.62.209.98 sport=50465 dport=443 packets=0 bytes=0 mark=0 
secmark=0 use=1

These are not real connections (they don't appear in netstat), and they 
linger for five days before they go away. This can cause serious 
problems when using connlimit, because it incorrectly counts these 
phantom connections as valid.

After much debugging, I now see exactly how these "connections" are 
getting created. What's happening is this (I think):

A client makes an HTTP connection and sends a request. The client 
decides to close that connection, sending a FIN packet. However, just 
before the server receives the FIN packet, it sent a data packet with 
the ack bit set. When that data packet arrives at the client, the client 
considers the connection to be closed, so it replies with a RST.

On the server, conntrack sees that RST and marks the connection as state 
CLOSEd, then DESTROYed. But there's a problem -- the server is still 
repeatedly trying to resend that final data packet because it was never 
ACKed.

So conntrack sees the resent outgoing packet with the ack bit set, but 
it doesn't know about an established connection (that connection was 
destroyed by the RST). This makes conntrack create a new outgoing 
ESTABLISHED "connection" that doesn't really exist, but which lingers 
for 5 days. This appears to happen because the TCP state transition 
table for the original direction of nf_conntrack_proto_tcp.c assumes 
that sNO -> sES is automatically a valid, established connection.

This is a problem. On each of my Web servers, there are thousands of 
such phantom "outgoing source port 80/443" connections being tracked by 
netfilter, and it causes incorrect matches of my connlimit rule.

Is this a known issue? How do other people work around it? Assuming this 
is normal behavior, what I really want is for conntrack to ignore any 
bogus outgoing packets that appear to be "from" port 80 or 443 on the 
server -- my servers never open new outgoing connections with those 
source ports -- but I can't figure out how to do that, despite much 
playing around with the "raw" table.

Something like this sounds like it should work:

  iptables -t raw -I OUTPUT -p tcp --sport 80 -j NOTRACK

But in practice that breaks the normal conntrack reply tracking for an 
incoming connection.

Any suggestions? Thanks for your time!

-- 
Robert L Mathews, Tiger Technologies
