From: Rich Wales <richw@richw.org>
Subject: Multiple MAC addresses for a single NIC using ebtables?
Date: Mon, 20 Oct 2008 21:54:31 -0700
Message-ID: <48FD6087.6050307@liberation.richw.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi.  I have four static IP addresses from my ISP.  I'm using a firewall
(Shorewall/Ubuntu) to connect my home LAN to the Internet, and various
of my home machines are associated with various external IP addresses.

Since the firewall has only one external NIC, all external traffic uses
a single MAC address.  This works -- but for various reasons, I would
like to try to configure the box so that each one of my four external
IP addresses will have its own separate MAC address.

Does anyone have a ready-made example for how to do this (presumably
using "ebtables")?  I've been playing around with ebtables on a test
system, but I can't seem to get all the pieces together to make this
multi-MAC setup work.

Thanks for any help or suggestions.

-- 
Rich Wales      ===      Palo Alto, CA, USA      ===     richw@richw.org
http://www.richw.org   ===   http://en.wikipedia.org/wiki/User:Richwales
