From: Strato <netfilter@p0w.org>
Subject: conntrack with protocol H.323
Date: Thu, 10 Jan 2008 16:33:36 +0100
Message-ID: <47863AD0.6080201@p0w.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,


I need help ton configure my firewall to accept and conntrack video 
stuff of msn from and to multiple machines into the LAN network.

I don't want to simply NAT incoming traffic to a particular machine of 
my LAN because I have multiple users using MSN, so NATing traffic will 
authorize only one machine to use webcam within MSN.

 - I talk about MSN but in fact, I have to permit gnomeeting/netmeeting, 
MSN and skype to be able to share incoming and outgoing webcam traffic 
through the firewall....
 - Before answering something like RTFM, I read this ml archives from 
January 2006 and don't found anything about iptables rules to do this,
 - I also read RFC's about H.323, searched over the web, and I know that 
maybe MSN/skype/netmeeting are not using H.323 protocol.
 - I also read some posts in the ml about l7-filter but it seems very 
unstable and I'm not sure that is the solution for me

 - I have a 2.6.22.1 kernel and iptables v1.3.8
 - I have loaded modules nf_nat_h323 and nf_conntrack_h323

Hope someone will help me dealing with this :)

Best regards,
Strato

