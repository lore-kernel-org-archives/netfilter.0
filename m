From: Alan Stern <stern@rowland.harvard.edu>
Subject: Is it possible to log SNAT mappings?
Date: Wed, 11 Jun 2008 10:25:07 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.0806111021350.2459-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Is there any setting in the kernel or in iptables that will enable
generation of a log of all SNAT mappings as they are created?  The log
should include the original source [IP, protocol, port] plus the mapped
[IP, port].

Thanks,

Alan Stern

