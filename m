From: Michael Gale <mgale@utilitran.com>
Subject: Solution -- Access internal servers with public address - PLEASE
 READ
Date: Thu, 11 Dec 2003 09:25:17 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031211092517.52d16e85.mgale@utilitran.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

	Ok I have seen this question asked so many times:

"I have a internal server that listens on port X. There is a firewall rule the forwards all connections from my public IP on port X to my internal server."

"This works fine from external but not from internally"

This works fine from externally because the IP address of the client machine is a external public IP address. The packet comes in and then is forwarded to your internal server. The internal server response back to the IP address of the client. This goes back out through the firewall.

When you use a internal client the IP address that the server sees in your internal clients IP address. So the packet path goes from client -> Firewall -> back to internal server. Now the internal server replies directly to your internal client. 

You now have a circle affect -- in order for the TCP connection to work the packet would have to make it back to the server with the public IP - because that is the IP you tried to connect to. Instead when the sever response directly to the client the client sees the servers internal IP which it did not try and make a connection too.

The proper solution to this is:

1. DMZ or SSN -- what ever you prefer to call it. It works as follows:

   EXT 

--------------
|  Firewall     |   SSN / DMZ network - Here you place any server that 
|  		|			requires access from external
-------------				connections (mail, http,VPN....)

   INT

All internal servers / desktops go on the internal network.


2. TWO DNS servers 

	Now you two DNS servers, one that handles external request and points to the external IP address ONLY. Then you have a second DNS that runs on the internal network, it only provides DNS for internal servers and DMZ IP address (which are usually a separate private network)

So from out side mail.domain.com would point to a external IP - the firewall would take this IP and DNAT the traffic to the DMZ / SSN mail servers IP.

From internally mail.domain.com would resolve directly to the IP address of the mail server on the DMZ. So the internal client would contact the DMZ directly -- not NATing of any kind.

You can NAT the connection from the internal to the DMZ -- some commercial firewalls does this .. in case a DMZ machine is compromised (IIS box) then a attacker can not map out your internal network.

Also you should NOT allow a machine on the DMZ to initiate a connection to the internal machine.

-- 
Michael Gale
Network Administrator
Utilitran Corporation

