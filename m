From: "Bruce, Paul" <Paul.Bruce@integratelecom.com>
Subject: Filtering inbound DNS traffic
Date: Thu, 25 Sep 2014 19:33:54 +0000
Message-ID: <6934F1F151D32B4383192F5ACCEFC2EE214970E1@IDCPRDMBX1.ads.integratelecom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I want to filter malicious inbound DNS traffic, specifically DNS requests with invalid opcodes.  Is anyone out there doing this?  Interested in your methodology.   I started experimenting with u32 but I'm not sure I'm on the right track, maybe there is a better way?

iptables --insert INPUT -p udp --dport 53 -m u32 --u32 "0x2a=0x35313020" -j logdrop -m comment --comment "dropping non-query opcode packets"  


I've been using packet captures to try and identify what I should be blocking but I don't have this pinned down correctly.  The relative position of the opcode is moving?



