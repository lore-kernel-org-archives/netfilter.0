From: dhiraj.2.bhuyan@bt.com
Subject: RE: Packet Sniffing
Date: Tue, 15 Apr 2003 09:14:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7497DCA1C240C042B28F6657ADFD8E0926877C@i2km11-ukbr.domain1.systemhost.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
Content-Transfer-Encoding: 7bit
To: patrick@vikus.com, netfilter@lists.netfilter.org



I think using a sniffer on the firewall may not be a good idea (other than
for troubleshooting purpose) 
- as it will leave the box in promiscous mode

Use something like this -



		 -----------		    --------
 public    	|		|   	private  |		|----[Other
private machines/Hubs]
	------| firewall	|--------------|  HUB	|
 interface	|		|	network  |
|----[Machine with sniffer]
	 	 -----------		    --------		



Now all traffic flowing in and out of the private network can be sniffed by
using ethereal/tcpdump 
on the "Machine with sniffer".

Note that many of these so-called-HUB do switching between the 10 and 100
Mbps link. So you will
have to configure all the machines to use the same connectivity speed to be
able to see all traffic.


dhiraj


-----Original Message-----
From: Patrick Ahler [mailto:patrick@vikus.com]
Sent: 14 April 2003 19:30
To: netfilter EMAIL
Subject: Packet Sniffing


Using iptables as a firewall/gateway/router machine for my stub network.
Using snat and dnat to translate internal ip's to public and vice versa.

Want to setup a machine inside the network to packet sniff. I was hoping
iptables could do this. What I'd like is if iptables would route each
incoming packet to the correct machine, but also direct it to the packet
sniffer (in other words duplicate the packet and send to 2 destinations).

Just wondering if this is possible and if it is how can I set this up? I've
also tried doing all my packet sniffing off the firewall, but I've been
unsuccessful, can't seem to get ethereal to look at the forwarded packets.
If someone knows a way to successfully do setup either solutions please let
me know.

Thanks,
Patrick




