From: Sharma Ganesh <ganesh.sharma@aalto.fi>
Subject: Netfilter performance test dnat and forwarding
Date: Mon, 10 Jul 2017 08:09:07 +0000
Message-ID: <8bb3c8216e5e4452b7621e4b43eaf8a0@aalto.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

hello,

I am doing connection tracking test with different ruleset in iptables for instance, NOTRACK, Forwarding only, DNAT, SNAT and DNAT/SNAT together.

I am using the tcpreplay and pcap-file which contains one millions packets to create connections in conntrack

I have seen that the DNAT is giving more performance in terms of packet per seconds (pps) than the simple Forwarding only. 
I think the performance of simple FORWARDING should be higher than DNAT, since the DNAT  has to modify the destination IP address and more procession of packets, 
while in simple forwarding, only routing is carried out.

Can anyone elaborate the what is the reason behind this?

Thank you.
Regards,
Ganesh Sharma
Departement of Communications and Networks
Aalto University, Finland.
Phone:+358401587773
