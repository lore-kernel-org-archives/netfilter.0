From: andrey <andrey@cs.dal.ca>
Subject: pcap files reading with iptables
Date: Fri, 17 Jun 2011 11:44:33 -0300
Message-ID: <9ac1a49b24c19951f264d6bee409fef9@cs.dal.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

 Hello,

 I have tried to classify pcap files using layer7 userspace filter.
 In order to do that I need to set a rule in iptables that QUEUE the 
 traffic.
 Since iptables does not read pcap files, I have used tcpreplay to 
 replay the traffic form the pcap file.
 tcpreplay is replaying the data from the pcap file on the interface 
 card.
 I have checked with wireshark if the packets get through and they do.
 My problem is that iptables seems to not receive the packets.
 What could be the problem? Do the packets get dropped somewhere?
 I do not have much knowledge in this field, please help me.

 I am using:
 Ubuntu 10.10 (Maverick)
 Linux kernel 2.6.35-28-generic
 iptables
 iptables v1.4.4

 Regards,
 Andrey
