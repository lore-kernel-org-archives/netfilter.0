From: SBlaze <dagent.geo@yahoo.com>
Subject: NAT, MANGLE, and TOS
Date: Thu, 23 Oct 2003 10:56:34 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031023175634.87744.qmail@web40201.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: nf <netfilter@lists.netfilter.org>

Currently I run a very and common setup for my home network.

My Linux box acts as my router and gateway for my home network and simply NATs
everything out to the cable modem and onto the internet.

My question is this. I have read awhile ago that changing the TOS of packets
can be beneficial in ganing small performance. Logically I thought this would
pretty much be limited to a Point to Point systems. However by posting to some
forums for broadband, i hearf through the perverbial grapevine that my
ISP(Charter Communications) will honor user or application set TOS values
unless they are under network congestion. I can of course not verify this.

This is my quandry. Currently this is all I do..

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 68.119.49.97

Is it possible to mangle NAT in a way that all my nat traffic carries slightly
higher TOS values? Will this give me a slight to any boost in upstream?

As always thanks for any info in advance and hail to the open source community.
SBlaze

=====
In the absence of order there will be chaos.

__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com

