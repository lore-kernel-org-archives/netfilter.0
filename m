From: Joshua Cragun <jcragun@apothecaryproducts.com>
Subject: Can't get DNS forwarded
Date: Wed, 25 Sep 2002 13:32:26 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <76135A08B685D411A40F00A0C9D7C941CFF165@FS02>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

	I am new to iptables (an relatively new to Linux), so please be
patient with me. I am sure this is something relatively simple. Anyways, I
am attempting to configure an iptables firwall using the script listed
below, and I can HTTP requests and echo packets through, but I can't seem to
get any names to resolve from inside hosts.  It is a dual-homed box running
RedHat 7.3. eth0 is connected to my private network, and eth1 is internet. 

	I'm frankly lost at this point, and any help would be most
appreciated.

Josh Cragun
Developer
Apothecary Products, Inc.


The script (after enabling IP forwarding):

# Flush all rules
echo -n "Flushing rules...."
iptables -F
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD
iptables -t nat -F
echo " DONE"

# Delete any user-defined chains
echo -n "Deleting any user-defined chains..."
iptables -X
echo " DONE"

# Set default policies
echo -n "Setting default policies..."
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -t nat -P POSTROUTING DROP
echo " DONE"

# Set up Network Address Translation:
echo -n "Setting up NAT..."
# a) Masquerade
iptables  -t nat -A POSTROUTING -o eth1 -j MASQUERADE
# b) forward WWW to FS02
iptables -t nat -A PREROUTING -i eth0 -p tcp -d 208.250.60.72 -j DNAT
--to-destination 192.168.100.2:80
# c) forward SMTP to FS02
iptables -t nat -A PREROUTING -i eth0 -p tcp -d 208.250.60.72 --dport 25 -j
DNAT --to-destination 192.168.100.2:25
echo " DONE"

# Add access for loopback device

# Deny traffic from WAN containing internal source IPs

# Deny traffic from LAN containing non-internal source IPs

# Allow ICMP echo (ping)
echo -n "Allowing ICMP echo (ping)..."
iptables -A FORWARD -i eth0 -s 192.168.100.0/24 -p icmp --icmp-type 8 -j
ACCEPT
iptables -A FORWARD -i eth1 -d 192.168.100.0/24 -p icmp --icmp-type 0 -j
ACCEPT
echo " DONE"

# Allow DNS requests from LAN
echo -n "Allowing DNS requests..."
#iptables -A FORWARD -i eth0 -s 192.100.0/24 -p tcp --sport 1023:65535
--dport 53 -j ACCEPT
#iptables -A FORWARD -i eth1 -d 192.100.0/24 -p tcp --sport 53 --dport
1023:65535 -j ACCEPT
#iptables -A FORWARD -i eth0 -s 192.100.0/24 -p udp --sport 1023:65535
--dport 53 -j ACCEPT
#iptables -A FORWARD -i eth1 -d 192.100.0/24 -p udp --sport 53 --dport
1023:65535 -j ACCEPT
iptables -A FORWARD -p udp --sport 53 -j ACCEPT
iptables -A FORWARD -p udp --dport 1023:65535 -j ACCEPT
iptables -A FORWARD -p tcp --sport 53 -j ACCEPT
iptables -A FORWARD -p tcp --dport 1023:65535 -j ACCEPT
echo " DONE"

# Allow Web traffic out
echo -n "Allowing outgoing WWW traffic..."
iptables -A FORWARD -i eth0 -s 192.168.100.0/24 -p tcp --sport 1023:65535
--dport 80 -j ACCEPT
iptables -A FORWARD -i eth1 -d 192.168.100.0/24 -p tcp --sport 80 --dport
1023:65535 --tcp-flags ACK ACK -j ACCEPT
echo " DONE"

