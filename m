From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: conntrack and ESTABLISHED / UNREPLIED connections
Date: Tue, 8 Jul 2008 11:42:07 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0807081130220.7417@blackhole.kfki.hu>
References: <486D31D9.9070900@tigertech.com> <4872A115.2030604@tigertech.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4872A115.2030604@tigertech.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert L Mathews <lists@tigertech.com>
Cc: netfilter@vger.kernel.org

On Mon, 7 Jul 2008, Robert L Mathews wrote:

> Summary of the previous problem: On our Web servers, conntrack shows 
> many ESTABLISHED / UNREPLIED connections, like this:
> 
> tcp      6 426339 ESTABLISHED src=64.62.209.98 dst=96.221.109.137 sport=443
> dport=50465 packets=2 bytes=178 [UNREPLIED] src=96.221.109.137
> dst=64.62.209.98 sport=50465 dport=443 packets=0 bytes=0 mark=0 secmark=0
> use=1
> 
> These are not real connections (they don't appear in netstat), and they linger
> for five days before they go away. This can cause serious problems when using
> connlimit, because it incorrectly counts these phantom connections as valid.
> 
> After much debugging, I now see exactly how these "connections" are getting
> created. What's happening is this (I think):
> 
> A client makes an HTTP connection and sends a request. The client decides to
> close that connection, sending a FIN packet. However, just before the server
> receives the FIN packet, it sent a data packet with the ack bit set. When that
> data packet arrives at the client, the client considers the connection to be
> closed, so it replies with a RST.

If the data packet sent by the server is valid, the client should send an 
ACK and not a RST packet. If the data packet is invalid, the client should 
send an ACK again and not a RST. 
 
> On the server, conntrack sees that RST and marks the connection as state
> CLOSEd, then DESTROYed. But there's a problem -- the server is still
> repeatedly trying to resend that final data packet because it was never ACKed.

If the server receives the RST packet (and it's valid) it should never 
ever send unsent data but destroy the connection.

Something is definitely wrong at the client, the server or between.
 
> So conntrack sees the resent outgoing packet with the ack bit set, but it
> doesn't know about an established connection (that connection was destroyed by
> the RST). This makes conntrack create a new outgoing ESTABLISHED "connection"
> that doesn't really exist, but which lingers for 5 days. This appears to
> happen because the TCP state transition table for the original direction of
> nf_conntrack_proto_tcp.c assumes that sNO -> sES is automatically a valid,
> established connection.
> 
> This is a problem. On each of my Web servers, there are thousands of such
> phantom "outgoing source port 80/443" connections being tracked by netfilter,
> and it causes incorrect matches of my connlimit rule.

Disable picking up connections and you get rid of those stale connections:

# echo 0 > /proc/sys/net/netfilter/nf_conntrack_tcp_loose

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
