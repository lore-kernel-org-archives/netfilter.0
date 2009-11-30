From: rebeca.martinez-garcia@estudiant.upc.edu
Subject: help with ip-conntrack-sip
Date: Mon, 30 Nov 2009 11:12:40 +0100
Message-ID: <20091130111240.99076n70fhvr62sk@ek2pim.upc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: netfilter@vger.kernel.org
Cc: vhuertas@indra.es

Hi all,

I am trying to set up a gateway to communicate SIP clients as this:

Client A                                      Client B
Private IP  <---------- Gateway ---------->   Public IP

Due to some requirements, it is necessary that the gateway makes  
masquerade which provokes problems when the communication is set up  
(RTP streams), because Client B try to send the messages to a private  
IP.
I have read that the module ip_conntrack_nat solves the problem... but  
I tried several times and it has been impossible to install it. I  
tried also with nf_conntrack_sip and nf_nat_sip with the same result.
The Gateway is running Ubuntu 9.10 with 2.6.31 kernel.

Please, can you tell me which patches I have to install for the  
gateway to support NAT of the data streams and also how to install  
them or a link with this information?
Does the module conntrack-tools incorporate them?

Thanks in advance,
Rebeca Martinez

