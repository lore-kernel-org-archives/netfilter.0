From: Peter Renzland <peter@dancing.org>
Subject: Questions about Conntrack Timeouts
Date: Mon, 19 Jan 2009 11:21:25 -0500
Message-ID: <D7222E61-D1B6-4D68-B391-C0CDF97C2B3E@dancing.org>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org

[Netfilter v1.3.7, Linux 2.4.20, Tomato 1.23, Busybox v1.12.3,  
embedded in a WRT54GL router]

Connection storms -- attempts to set up thousands of (mostly UDP)  
outgoing connections in a few seconds, almost all of which remain  
unreplied -- are a hazard to router stability.

Two possible counter-measures are:

1. Using connlimit to limit  the "connections" that go in the  
conntrack table,
2. Using timeouts to limit the time they stay in the CT.


Are there any risks in reducing the following timeouts down to 10  
seconds?:

TCP Timeout:
10 SYN Sent	
10 Time Wait	
10 Close	

UDP Timeout:
10 Unreplied	(this timeout (apparently) also applies to UDP  
connections that are neither Unreplied nor Assured.)
10 Assured

Thanks.

Peter Renzland
