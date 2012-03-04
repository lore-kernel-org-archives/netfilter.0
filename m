From: iftikhar <iftikhar@aidentech.com>
Subject: MPLS
Date: Sun, 04 Mar 2012 21:38:14 +0500
Message-ID: <4F539A76.2080300@aidentech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Can someone please clarify why do we need a special MPLS patch for 
iptables to actually "see" the packet properly? I mean iptables is a 
layer above L2 and MPLS operates at Layer 2.5 & therefore the difference 
between an MPLS frame and another ethernet frame should be of no concern 
at the ip layer to iptables or for that matter any application operating 
at L3.

Please guide.

Regards,

