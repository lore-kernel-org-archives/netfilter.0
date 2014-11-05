From: Karsten Hohmeier <karsten.hohmeier@tu-ilmenau.de>
Subject: conntrack + fragmentation: What are the timeouts?
Date: Wed, 05 Nov 2014 16:11:31 +0100
Message-ID: <545A3E23.2060506@tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi everybody,

I'm currently playing around with stateful packet filtering/mangling and
fragmented IPv4/IPv6 traffic.

I was wondering if the conntrack timeouts for collecting all fragments
of an IP packet are these values from sysctl:

net.ipv4.ipfrag_time = 30
net.ipv6.ip6frag_time = 60

Or does it have separate timeouts somewhere else?

Best regards

Karsten Hohmeier

