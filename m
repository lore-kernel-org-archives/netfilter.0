From: "Sharon Tal" <shatal@websplanet.com>
Subject: RE: UNTRACKED packets are identified as INVALID
Date: Sun, 30 Mar 2008 12:55:41 +0300
Message-ID: <1CC06B0BC1268241BC180DFCBE7F5CA81773CD@wpsbs2003.webplanet.local>
References: <004b01c88f45$79bcf080$0a00a8c0@webplanet.local> <47EBBF6C.9050302@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

 
Hi,

> Allow me to guess what happens.

> A SYN packet starting a new connection is received by the
load-balancer. 
> It contains no data, so it cannot match the NOTRACK rule. The
conntrack
> creates a new entry for that connection. Then the packet - and the
whole
> connection - is DNATed to one web server, and the conntrack entry is
updated
> accordingly. This means that all subsequent incoming packets
identified by the
> conntrack as belonging to that connection will be DNATed to the same
web server.

> The 3-way TCP handshake (SYN/ACK from the server, ACK from the client)
completes.
> Then comes the packet carrying the HTTP request containing the string.
This packet is
> UNTRACKED, so it is not DNATed and reaches the TCP layer of the load
balancer.
> But it is not a SYN packet, and it does not match any local socket
because the local
> TCP layer did not see the 3-way handshake. So it is dropped, maybe
triggering a TCP
> RST packet back to the client (not sure about that).

You are absolutely right (including the RST part).

Thanks.
