From: "Kevin P. Fleming" <kpfleming@starnetworks.us>
Subject: Bizarre rule requirement
Date: Fri, 31 Dec 2004 12:29:00 -0700
Message-ID: <41D5A87C.4040508@starnetworks.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I have an application that needs an unusual rule, and I don't think I 
can construct it using standard netfilter targets (in 2.6 kernel series).

I have a Linux machine configured as a NATing firewall using 
iptables/netfilter; it has a public IP and a private IP on separate 
NICs, standard config.

On the private LAN, there is a node (at 10.1.1.2) that sends out UDP 
(from port 4000) to a public IP of 200.200.200.1 (made up <G>) at port 
number 5000.

When this passes through the NAT, the source IP address and port number 
change to 100.100.100.2 (the public IP of the NAT) and port 32450 
(random assignment).

Because we allow ESTABLISHED return traffic, UDP packets coming from 
200.200.200.1 sent to 100.100.100.2 port 32450 are accepted and 
de-NATted back to 10.1.1.2 port 4000. This is good :-)

However, I need to modify this a bit; I need to accept traffic from 
_any_ IP address/port to port 32450 on the NAT, and have it forwarded to 
10.1.1.2 port 4000, as long as 10.1.1.2 continues to send outbound 
packets and keep the "connection" alive. In other words, I need the 
"conntrack" data to be asymmetric:

Outbound: 10.1.1.2/32:4000 > 200.200.200.1:5000
Inbound: 0.0.0.0/0:(any) > 10.1.1.2/32:4000

Is something like this possible?

