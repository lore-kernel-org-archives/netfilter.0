From: "William Olbrys" <william_olbrys@student.uml.edu>
Subject: netfilter and Active Directory
Date: Tue, 18 Feb 2003 20:59:39 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4f51249b6c.49b6c4f512@student.uml.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Language: en
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Currently I have all my iptables rules turn on by default and MASQUERADE
shut off. I'm trying to let a win2k domain controller keep it's ip
address while changing the gateway to a linux box running iptables. the
controller's gateway is the IP of an inbound nic. The inbound's gateway
is the nic of a second nic on the linux box, which connects to my
network.  All of the ips have the same first three octets and the mask
is 255.255.255.0.

The controller is connected to a hub which connects to the firewall.
I've put other computers on the hub and can connect and play nicely with
the controller. But nothing on the hub can ping or use NetBIOS anything
after the firewall. 

I thought this was an alias problem but when i set an alias on the
outbound nic the domain controller complains of duplicate IP addresses. 

If I try using internal network addresses and DNAT/SNAT it really screws
with the WINS/NetBIOS/Domain Controller's Settings.  What can I do?

thanks

will.



 E2-O: The presence of this footer indicates the message has been scanned for viruses by the WebShield e500.



