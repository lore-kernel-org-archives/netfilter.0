From: John Ratliff <john@bluemarble.net>
Subject: linux martian packets
Date: Wed, 7 Feb 2018 14:29:52 -0500
Message-ID: <62fbf8b2-9536-6bf4-9fb1-825307d29262@bluemarble.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

We have a couple of internal networks that we route between, 10.9/16 and 
10.246/16. But when I try to reply to ICMP requests coming into a 10.246 
IP on the host from a machine with a 10.9 IP, I can't seem to do that. I 
see the ICMP echo request packets in tcpdump, but I can't find anything 
in iptables. It seems like they're dropped before they come into the 
filter table.

Is there a way I can prevent this so that I can respond to traffic from 
another non-publicly routable IP?

Thanks.
