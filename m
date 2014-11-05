From: Karsten Hohmeier <karsten.hohmeier@tu-ilmenau.de>
Subject: conntrack + fragment retransmission: What are the basic assumptions?
Date: Wed, 05 Nov 2014 16:47:07 +0100
Message-ID: <545A467B.7060205@tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi everybody,

I looked into the behavior of conntrack when dealing with sequences of
fragmented ICMPv6 packets (echo requests).

From what I observed, conntrack seems to operate in the following manner:

1) Assume all fragments (of a single packet) will pass through this
network node
2) Try to collect all fragments
3) Apply filter/mangle rules based on the complete packet and
   the subsequent connection state
4) If packet is accepted, forward all the fragments in order,
   even if they were received out-of-order

This behavior changes when a fragment is retransmitted, while the node
still collects fragments:

1) Assume all fragments will pass through this network node
2) Try to collect all fragments
3) Observe retransmission of a fragment
4) Drop assumption 1), silently discard all previously collected fragments
5) Apply filter/mangle rules to retransmitted fragment only
6) Forward fragment if accepted

Are these observations correct?

Where does this behavior originate? Is it how IP defragmentation in the
kernel works or does conntrack explicitly define/trigger this behavior?

Do you know of any documentation covering this specific issue?

Best regards

Karsten Hohmeier

