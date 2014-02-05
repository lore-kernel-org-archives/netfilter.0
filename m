From: Alex Bligh <alex@alex.org.uk>
Subject: iptables: Distinguishing packets from bridge-nf-call-iptables
Date: Wed, 5 Feb 2014 11:24:27 +0000
Message-ID: <BC2A25BE-4E4F-4270-855A-E0D092F4A7C0@alex.org.uk>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter list <netfilter@vger.kernel.org>
Cc: Alex Bligh <alex@alex.org.uk>

I am trying to run two pieces of software X and Y on a linux box.

X assumes /proc/sys/net/bridge/bridge-nf-call-iptables is set to 1. I am not able to modify this.

Y assumes /proc/sys/net/bridge/bridge-nf-call-iptables is set to 0. This is my software and I can modify it.

I want to adapt my rules for Y so that it copes with /proc/sys/net/bridge/bridge-nf-call-iptables=1 by ignoring (in the iptables rule) any traffic which is purely bridged, and simply doing the ebtables rules on these packets.

In the iptables rules, how do I differentiate ip forwarded traffic from bridged traffic? The bridge interfaces may or may not carry IP addresses.

-- 
Alex Bligh




