From: Dimitris Kounalakis <dcoun@galinos.med.uoc.gr>
Subject: NAT in a special case
Date: Fri, 09 Apr 2004 14:56:36 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40768F74.2050005@fammed.med.uoc.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

I need a special case and I am not sure it can exist with NAT (SNAT or DNAT)

I have two lan networks with IP range : 10.10.1.1/24 and 10.10.2.1/24. 
The connection between then is done with a linux machine with two 
ethernet cards.
The first network has a mix of computer and VoIp devices and and the 
second only computers.
In the second network a pptp vpn server providing internet access (the 
first nat) is in action and selected computers from both networks are 
connected and take a 192.168.0.1/24 address in a virtual interface and 
have Internet access.
I want to give access to the internet to some VoIP and other hardware 
that can not use the pptp vpn server in the first network (10.10.1.1/24).
I have the idea to configure the linux machine to connect to the pptp 
vpn server and then have it acting as a NAT machine for the machines in 
the first network (10.10.1.1/24) using the same IP address range. In 
other words, the linux machine has to simply route ip traffic to the 
ethernet interface with destination the subnet 10.10.2.1/24 and acting 
as NAT if the destination is the internet.
Is that possible? Do you know where I can find an examlple close to that 
to start with ?

Thank you in advance
Dimitris

