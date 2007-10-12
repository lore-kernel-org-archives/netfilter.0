From: Jorch <news-groups@jorch.net>
Subject: Packet marking in user queue with VWMARK
Date: Fri, 12 Oct 2007 21:30:50 +0300
Message-ID: <470FBD5A.2070504@jorch.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

Can somebody please give me an example how to mark & match packets
with vwmark and iptables in user queue.

I have patched the kernel (2.6.18) and iptables (1.3.8) to support
vwmark. Both progs compiles and installs ok and queue works normaly with
ipq_set_verdict but not with ipq_set_vwmark.

If vwmark is not recommended style to mark packets in user space, what is???

Regs.
-jori
