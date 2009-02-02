From: "Sussman, Scott" <ssussman@starentnetworks.com>
Subject: ip6tables/netfilter question
Date: Mon, 2 Feb 2009 12:49:43 -0500
Message-ID: <7CCD07160348804497EF29E9EA5560D705159182@exchtewks2.starentnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hi,

I have created an ip tables rule using the ip6tables command that captures all IPv6 packets with a specific source prefix and places the packets into the NFQUEUE queue 0. This appears to be working properly from the ip6tables -L -nv point of view. But when I cat the nfnetlink_queue file it doesn't show any packets being queue'd. The application reading the queue also does not report any incoming packets from the queue. I have been using this same setup for IPv4 for some time now and am familiar with the process. I just recently started with IPv6 and would appreciate any thoughts/help anyone might have.

Thanks,

Scott

Chain OUTPUT (policy ACCEPT 30607 packets, 41M bytes)
 pkts bytes target     prot opt in     out     source               destination         
   10   720 NFQUEUE    tcp      *      *       dddd::/16            ::/0                NFQUEUE num 0


messy24:/localdisk/callgen# cat /proc/net/netfilter/nfnetlink_queue 
    0  28763     0 2 65535     0     0        0  1


messy24:/localdisk/stargen-2.00# cat /proc/net/ip6_tables_targets 
ERROR
NFQUEUE


This email and any attachments may contain legally privileged and/or confidential information of Starent Networks, Corp. and is intended only for the individual or entity named in the message.  The information transmitted may not be used to create or change any contractual obligations of Starent Networks, Corp.  Any review, retransmission, dissemination or other use of, or taking of any action in reliance upon this e-mail and its attachments by persons or entities other than the intended recipient is prohibited. If you are not the intended recipient, please notify the sender immediately -- by replying to this message or by sending an email to postmaster@starentnetworks.com -- and destroy all copies of this message and any attachments without reading or disclosing their contents. Thank you.
 
