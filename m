From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Clarification on connections in the ESTABLISHED state...
Date: Thu, 04 Oct 2007 16:11:01 -0500
Message-ID: <470556E5.5090008@riverviewtech.net>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

I need a little bit of clarification on what packets in a connection are 
considered to be the ESTABLISHED state.

"... ESTABLISHED meaning that the packet is associated with a connection 
which has seen packets in both directions, ..."

In short, does the response packet to the first outgoing request packet 
qualify as ESTABLISHED or is it just NEW because there has not already 
been in the past packets that have gone both directions?

So if you consider the three way TCP handshake, if the current packet 
counts the states would be as such:

Outgoing SYN		NEW
Incoming SYN, ACK	ESTABLISHED
Outgoing ACK, ACK	ESTABLISHED

Or if you only consider the previous packets and not the current packet, 
the states would be as such:

Outgoing SYN		INVALID
Incoming SYN, ACK	NEW
Outgoing ACK,ACK	ESTABLISHED

So, would someone please educate me here and tell me which it is?  Does 
state count only previous packets and not the current packet or does it 
count all packets including the current packet?



Grant. . . .
