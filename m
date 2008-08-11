From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Target IP monitoring...
Date: Mon, 11 Aug 2008 13:51:35 -0500
Message-ID: <48A08A37.3050104@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

I'm going to be working on a project that will need to monitor what 
destination IPs traffic is sent to.  I was wondering if I could not use 
the ULOG in side of the nat table to do this.  I am really only wanting 
the target (and possibly the source) IP of each connection.  I do not 
want any of the IP payload or any of the packets, just the target IP.

I was hoping to exploit the fact that the nat table only sees the first 
packet in a connection to help reduce the likelihood that I would see 
the same target IP multiple times.

I am not doing any filtering with this so the fact that ULOG is a non 
terminating target is not a problem for me.



Grant. . . .
