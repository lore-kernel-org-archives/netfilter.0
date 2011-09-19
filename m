From: Brian Schang <netfilter@lists.schang.net>
Subject: iptables problem: conntrack rev 2 does not support port ranges
Date: Mon, 19 Sep 2011 07:20:57 -0400
Message-ID: <4E772599.80602@lists.schang.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello:

Last night I upgraded from 'iptables 1.4.10' to 'iptables 1.4.12.1'. 
When doing so, I encountered a possible regression: Extended Connection 
Tracking Match Support within shorewall was "Available" with v1.4.10, 
but is "Not available" with v1.4.12.1. Note that I am using 'shorewall 
4.4.23.3' and openSuSE 11.4 with its stock kernal 2.6.37.6-0.7-default.

I dug into this a little bit and discovered:
# iptables -A test -m conntrack -p tcp --ctorigdstport 22 -j ACCEPT
iptables v1.4.12.1: conntrack rev 2 does not support port ranges
Try `iptables -h' or 'iptables --help' for more information.

With some Googling, I discovered that Tom Eastep had encountered the 
same issue. He submitted a patch for iptables and Jan Engelhardt 
ultimately released 'iptables 1.4.12.1'.

For some reason, iptables v1.4.12.1 does not seem to have fixed the 
issue for me. Has anyone else seen this problem? Any suggestions?

Thanks.

-- 
Brian
