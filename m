From: Robert L Mathews <lists@tigertech.com>
Subject: Re: conntrack and ESTABLISHED / UNREPLIED connections
Date: Thu, 10 Jul 2008 17:45:55 -0700
Message-ID: <4876AD43.3020205@tigertech.com>
References: <486D31D9.9070900@tigertech.com> <4872A115.2030604@tigertech.com> <Pine.LNX.4.64.0807081130220.7417@blackhole.kfki.hu> <4873A605.1010209@tigertech.com> <Pine.LNX.4.64.0807090842270.11391@blackhole.kfki.hu> <4874E5AB.4070700@tigertech.com> <Pine.LNX.4.64.0807101247240.13027@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0807101247240.13027@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Jozsef Kadlecsik wrote:

> Client sends RST, which is out of (before) the window (left edge is at 
> 2354211889), thus ignored by the server.

That makes sense, but it seems like conntrack processes the RST and 
marks the original connection as closed, then treats the server resends 
as new outgoing connections, which doesn't seem right.

In other words, if the server's TCP stack is ignoring the RST, shouldn't 
conntrack ignore it, too?

It apparently doesn't -- I used the "conntrack -E" tool to show a log of 
these connections, and it definitely shows it handling the RST, then 
detecting a new connection in the other direction from the retried 
outgoing packets.

Here's an example of one:

  http://www.tigertech.net/20080710.txt

This includes the tcpdump, plus (at the end) the output of the 
"conntrack" tool used in both directions, showing how it incorrectly 
detected a new connection in the outbound direction. Unfortunately the 
conntrack output doesn't show timestamps, but I was watching it, and the 
spurious outbound "connection" was detected during the retries, within 
maybe 30 seconds after the incoming connection was DESTROYed.


> You wrote the client runs Mac OS X 10.4.11. I don't really know what's 
> wrong with it but it seems as a client related issue - or an ISP between 
> the client and server which tries to generate fake RST packets to tear 
> down connections.

Whatever it is, it's unfortunately quite common -- as I said, any of our 
reasonably-busy Web servers show thousands of such phantom connections 
from hundreds of unique IP addresses.

-- 
Robert L Mathews, Tiger Technologies
