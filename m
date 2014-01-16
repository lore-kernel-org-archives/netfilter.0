From: Daniel Miller <dmiller@amfes.com>
Subject: Perform routing using NAT
Date: Thu, 16 Jan 2014 11:28:09 -0800
Message-ID: <assp.10936facb6.52D832C9.20409@amfes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=amfes.com;
	h=Message-ID:From:Subject:To:MIME-Version:Content-Type; s=sep2012.mail;
	bh=0H09fpXrcByqv+eKMdZIRrq03gY=; b=SzpckkMs7RSggNTG7g/1xfGRMX/eGtd2t7ArI4b7GZ/ZR1g3nQavHDbvSLB5/DaEwPMjs7yTAYTWmlS6KAWQGvjDl0oapOovym4tnhjjLlUdf8k7fpuO78Ka9/Ko4drZo0oS7l1saSm+G2mNsF4kUkZRaXKPAptYUIgqgDfFGOg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I know there's a basic rule somewhere I'm just not grasping - please 
help me understand.

I have the following topology:
     1.  Windows PC on a LAN - for convenience assume is 192.168.1.x.  
Assume because this is a notebook and can/does connect from different 
points.
     2.  Windows PC has an OpenVPN connection to office Linux server.  
This is a routed connection - PC has address 10.59.97.8, and server is 
at 10.59.97.1.
     3.  There is a second VPN in place for customers.  This is 
172.27.x.x.  The server (same as 10.59.97.1) is at 172.27.0.1.
     4.  Customer has Linux server with VPN address of 172.27.0.10.

I need the Windows PC to reach the 172.27.0.10.  At this time, if I add 
a route to 172.27.0.0/16 via 10.59.97.1 on the Windows PC, and a route 
for 10.59.97.x via 172.27.0.1 on the remote customer's server - I can 
reach the remote server from the PC.  Interestingly - I can't ping the 
PC from the remote server.  I'd like to understand that - but it's not 
necessary communication as long as the PC can reach that remote server.

At this time, no iptables are running on either server.  But I'd like to 
be able to have the PC reach the remote server - without having to 
configure the routes as I've described.  What routing can I eliminate 
using NAT - and what combination of SNAT & DNAT is required?

-- 
Daniel

