From: jobhunts02@aol.com
Subject: IPv6 Connection Tracking Excess CPU usage
Date: Thu, 28 Jul 2011 17:07:37 -0700
Message-ID: <9A0A4A86-B4FE-4BF1-BCA0-204D7975320D@aol.com>
Mime-Version: 1.0 (iPhone Mail 8L1)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I am running Linux 2.6.26 on my board.  When I enable IPv6 connection tracking support, i.e., CONFIG_NF_CONNTRACK_IPV6=y, and send 3 megabits of data to the board, the CPU usage according to top for events/0 goes up to 99-100%.  Without CONFIG_NF_CONNTRACK_IPV6 enabled, the CPU usage for events/0 is 17-18%.

Has anyone else seen this issue?  Is there a fix?