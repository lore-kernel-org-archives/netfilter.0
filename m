From: "Chris Frederick" <cdf123@cdf123.com>
Subject: iptables port forwarding not working
Date: Fri, 27 Jun 2003 13:06:05 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EFC878D.50304@cdf123.com>
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

Hi,

I need some help with an iptables script.  I'm trying to forward port 80 
on the Firewall/NAT/Router to another machine inside the firewall.  I've 
googled for some scripts and found the PREROUTING lines that are needed, 
but it doesn't seem to work.  The port isn't open on the machine.  I've 
attached a sample script bellow that sums up what I'm doing.  Any 
sugestions?

FYI:  I copied the script I use for my Mandrake 9.0 server at home for a 
start point, but the script is actually running on a Slackware 9.0 box. 
The depmod and modprobes run fine so I'm assuming there's no difference 
between the two systems that concerns iptables.  Though I tried running 
the script at home too, and it didn't work there either.

On a side note, once I get this working, I'm planning on forwarding 
HTTPS to another machine, and also forwarding SSH on a non-standard port 
to another machine (e.g.  port 999 to 22).  Are there any issues with 
doing this?  Like, say the HTTPS or SSH certs looking like they're 
comming from a different ip and causing errors trying to connect?  Or 
will I get key change errors from the server (since I connect to SSH on 
22 and 999 on the same ip) every time I connect to the other one?   Or 
am I overthinking this, and it all just works?

Thanks in advance for any help.
Chris Frederick

--------------Script--------------
#!/bin/bash
INET_IP="1.1.1.1"
INET_IFACE="eth1"
INET_BROADCAST="1.1.1..255"

LAN_IP="2.2.2.2"
LAN_IP_RANGE="2.2.2.0/24"
LAN_BROADCAST_ADDRESS="2.2.2.255"
LAN_IFACE="eth0"

LO_IFACE="lo"
LO_IP="127.0.0.1"

DNAT_IP_PORT="2.2.2.3:80"

IPTABLES=/usr/sbin/iptables

/sbin/depmod -a
/sbin/modprobe ip_tables
/sbin/modprobe ip_conntrack
/sbin/modprobe iptable_filter
/sbin/modprobe iptable_mangle
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_limit
/sbin/modprobe ipt_state
/sbin/modprobe ip_nat_ftp

$IPTABLES -P INPUT DROP
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD

#Accept all LAN and LO trafic
$IPTABLES -A INPUT -p ALL -i $LAN_IFACE -s $LAN_IP_RANGE -j ACCEPT
$IPTABLES -A INPUT -p ALL -i $LO_IFACE -j ACCEPT

#Accept SSH and HTTP trafic from the net
$IPTABLES -A INPUT -p TCP -i $INET_IFACE -s 0/0 --dport 22 -j ACCEPT
$IPTABLES -A INPUT -p TCP -i $INET_IFACE -s 0/0 --dport 80 -j ACCEPT

#Route internal traffic to the net
echo "1" > /proc/sys/net/ipv4/ip_forward
$IPTABLES -A FORWARD -i $LAN_IFACE -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j MASQUERADE
$IPTABLES -A INPUT -p ALL -d $INET_IP -m state --state 
ESTABLISHED,RELATED -j ACCEPT

#Forward the HTTP trafice from the net to the server at 2.2.2.3
$IPTABLES -t nat -A PREROUTING -p tcp -i $INET_IFACE -d $INET_IP --dport 
80 -j DNAT --to $DNAT_IP_PORT
$IPTABLES -A FORWARD -p tcp -i $INET_IFACE -d $INET_IP --dport 80 -j ACCEPT

echo "Firewall Completed"
--------------End of Script--------------



