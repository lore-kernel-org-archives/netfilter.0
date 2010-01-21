From: "Dennis J." <dennisml@conversis.de>
Subject: Selective disabling of martian filtering?
Date: Thu, 21 Jan 2010 03:52:59 +0100
Message-ID: <4B57C18B.4040108@conversis.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
I'm trying to set up a gateway to also serve as a LVS-DR load-balancer. 
This works except for the problem that on their way back from the 
realservers to the client the packets have a "suspicious" source IP (the IP 
of the service which is also configured as a real interface on the 
gateway). The result is that the gateway will classify the packet as a 
martian and throw it away.
Is there a way the tell the system with iptables or any other way to not 
apply the martian check on packets arriving on a certain interface with a 
certain source IP?

Regards,
   Dennis
