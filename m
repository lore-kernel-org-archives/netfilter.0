From: "Edmund Turner" <eturner@monash.edu.my>
Subject: MAtching packets
Date: Thu, 30 Oct 2003 09:34:02 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005e01c39e85$e687e310$de0018ac@admin.monash.edu.my>
Reply-To: <eturner@monash.edu.my>
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



Hey guys and girls, how ur day?
I got a slight problem configuring tc on my firewall (traffic control).
Before I get kicked out the door and sent to the LARTC forum, I would
like to add that the problem im facing is MARKING the packets via
iptables.

Situation is as such
LAN --> Firewall --> Router -->Internet
		|
		|
		--> DMZ

So much for the Ascii artist in me. :)
The firewall has 3 interfaces:
Eth0 = LAN --> 100Mbps NIC
Eth1 = DMZ --> 100Mbps NIC 
Eth2 = Internet --> 4MB link to internet

Background:
DMZ Zone Eth1: Web/FTP, and SMTP servers. (100Mbps switches and NICs) 
WEB/FTP server :10.100.1.1/24
SMTP server:10.100.1.2/24

I need to mark packets for the LAN (192.168.0.0/16) to the DMZ server
(10.100.1.1) to classify them in classes.

This is what I tried :
/sbin/iptables -A PREROUTING -i eth1 -d 10.100.1.1 -t mangle -j MARK
--set-mark 9
/sbin/iptables -A PREROUTING -i eth1 -s 10.100.1.1 -t mangle -j MARK
--set-mark 9


Traffic control does not seem to work when I mark the packets as above.
It appears that the 'tc' does not recognize the marked packets. I
eventually marked them like this :

Tc filter add dev eth2 parent 2:1 protocol ip prio 7 u32 match ip src
10.100.1.1 classid 2:1

I would hope someone could point out my error in marking the packets.

Another question, there shouldn't be any problem with marking different
IPs with the same numerical mark, right?
Eg:

/sbin/iptables -A PREROUTING -i eth1 -d 10.100.1.1 -t mangle -j MARK
--set-mark 9
/sbin/iptables -A PREROUTING -i eth1 -d 10.100.1.2 -t mangle -j MARK
--set-mark 9

Any help is appreciated!


Regards
edmund


