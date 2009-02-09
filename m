From: Ralf <rm@amitrader.com>
Subject: NAT port forwarding works only for the local net?
Date: Mon, 09 Feb 2009 03:29:52 +0100
Message-ID: <gmo4f1$gsg$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I made NAT port forwarding rules. It has following effect:
Packets coming from the local net get forwarded as expected,
but connects to that port coming from other nets just "hang"
on the client-side.

I want all packets, regardless of the source IP/net/port,
coming to that port be forwarded to another machine:port.
Does iptables port forwarding work only for one source net (the local net) ?

