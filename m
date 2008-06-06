From: Vincent Arniego <vincent_arniego@yahoo.com>
Subject: [libnetfilter_queue] Load Balancing using multiple queues
Date: Thu, 5 Jun 2008 18:49:17 -0700 (PDT)
Message-ID: <305732.3074.qm@web58309.mail.re3.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


Hi Everyone,

We did a setup using libnetfilter_queue that examines the http headers of http packets.
In the setup, the firewall redirects packets in port 80 (source and destination) to an application listening on queue 0.
This box is acting as a router, so we setup the NFQUEUE rule in the forward chain

Somehow we were able to make it work after some adjustments in the kernel (sysctl net.core.rmem_max and rmem_default)

Assuming we are facing around 66 Mbps or around 11000 packets per second of traffic (from iptraf):
1. Is there a way to compute the correct optimized settings for net.core.rmem_max and rmem_default? Like a formula?
2.
Is there a way to automatically load balance the incoming packets to
multiple applications using multiple queues? This is assuming we cannot
segregate the packets by its source IP and/or destination IP.

Thanks!


      
