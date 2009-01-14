From: Peter Renzland <peter@dancing.org>
Subject: Counting Connections
Date: Wed, 14 Jan 2009 03:28:05 -0500
Message-ID: <5E1140B1-A4E2-4D7B-937F-7CD1DA0966D0@dancing.org>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org

I can count packets and bytes, by LAN IP and direction, with something  
like this:


LAN="192.168.0"; Hosts="100 102 103 105 108 120 122 124 126 130 132"

for SD in s d; do
   iptables -N traffic_$SD
   iptables -I FORWARD -j traffic_$SD
   for IP in $HOSTS; do
     iptables -A traffic_$SD -$SD $LAN.$IP
   done
done


I would also like to count connections (those that have been tracked),  
just like the packets and bytes that have been moved.
Can someone please show me how that can be done?

I should mention that the routers I am working with are stuck with  
Netfilter 1.3.7 on Linux 2.4.20.


Thanks!

Peter
