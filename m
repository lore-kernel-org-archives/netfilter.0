From: Erik =?iso-8859-1?Q?Wikstr=F6m?= <eriwik@itstud.chalmers.se>
Subject: Proofreading
Date: Wed, 14 Jul 2004 00:40:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040713224025.GA34955@itstud.chalmers.se>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="/04w6evG8XlLl3ft"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org


--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

If you happen to feel like you've got nothing better to do or if you'd
like to help me out (and maybe get rid of me :) then I'd appreciate any
coments and suggestions to my script.

My goals with the script is as follows:
+ To allow the route to get an IP via DHCP for the WAN
+ To allow local hosts to get an IP from the router
+ To allow the router to comunicate with DNS-servers
+ To allow the router to connect to HTTP-servers
+ To allow the router to conect to FTP-servers
+ To allow SSH to the router from LAN on port 22
+ To allow SSH to the router from WAN on port 2070
+ Forward SSH from WAN to a computer on LAN
+ Forward a number of other ports/services to another computer on LAN
+ Allow access to WAN from LAN
And of cource maintain some level of security.

I've blocked NetBIOS-packages from leaving the LAN, is there any other
things that I should block? The LAN consists of both Windows and Linux
computers.

Thanks in advance.

--
Erik Wikstr=F6m

--/04w6evG8XlLl3ft
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="rc.iptables"

#!/usr/bin/bash

# --------------------
# |    Initialize    |
# --------------------

# Variables
IPT="/usr/sbin/iptables"
WAN="eth0"
LAN="eth1"
LOCAL_NET="192.168.10.0/24"

# Computers
Yorthen="192.168.10.2"
Ohm="192.168.10.10"

# Clear all rules and set policies
for table in filter mangle nat ; do
	$IPT -t $table -F # Flush all rules
	$IPT -t $table -X # Remove all non-builtin chains
	$IPT -t $table -Z # Reset all counters

	# Set policies
	for chain in FORWARD INPUT OUTPUT PREROUTING POSTROUTING ; do
		if [ $table == "filter" ] ; then
			$IPT -t $table -P $chain DROP # Default to filter out all packages
		else
			$IPT -t $table -P $chain ACCEPT
		fi
	done
done

# Add custom chains
$IPT -t filter -N bad_packets



# ---------------------
# |    bad_packets    |
# ---------------------

# Drop INVALID and other bad packets
$IPT -t filter -A bad_packets -m state --state INVALID -j DROP
$IPT -t filter -A bad_packets -p TCP --tcp-flags SYN,ACK SYN,ACK -m state --state NEW -j DROP
$IPT -t filter -A bad_packets -p TCP ! --syn -m state --state NEW -j DROP
# Drop spoofed addresses
$IPT -t filter -A bad_packets -i $WAN -s 192.168.0.0/16  -j DROP
$IPT -t filter -A bad_packets -s 172.16.0.0/12 -j DROP
$IPT -t filter -A bad_packets -s 127.0.0.0/8 -j DROP
$IPT -t filter -A bad_packets -i $LAN -s ! $LOCAL_NET -j DROP



# --------------
# |    LYRA    |
# --------------

# Allow already established connections
$IPT -t filter -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -t filter -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# Allow traffic on loopback interface
$IPT -t filter -A INPUT -i lo -j ACCEPT
$IPT -t filter -A OUTPUT -o lo -j ACCEPT
# Drop bad_packages
$IPT -t filter -A INPUT -j bad_packets
# Allow firewall to get WAN-IP from DHCP
$IPT -t filter -A OUTPUT -o $WAN -p UDP --dport 67 --sport 68 -j ACCEPT
$IPT -t filter -A INPUT -i $WAN -p UDP --sport 67 --dport 68 -j ACCEPT
# Allow computers on LAN to get IP from DHCP
$IPT -t filter -A INPUT -i $LAN -p UDP --dport 67 --sport 68 -j ACCEPT
$IPT -t filter -A OUTPUT -o $LAN -p UDP --sport 67 --dport 68 -j ACCEPT
# Allow SSH-connections from both LAN and WAN
$IPT -t filter -A INPUT -i $LAN -p TCP --syn -s $LOCAL_NET --dport 22 -j ACCEPT
$IPT -t filter -A INPUT -i $WAN -p TCP --syn --dport 2070 -j ACCEPT
# Allow DNS-requests
$IPT -t filter -A OUTPUT -o $WAN -p UDP --dport 53 -j ACCEPT
# Allow HTTP-requests
$IPT -t filter -A OUTPUT -o $WAN -p TCP --dport 80 -j ACCEPT
# Allow FTP-requests
$IPT -t filter -A OUTPUT -o $WAN -p TCP --dport 21 -j ACCEPT
# Allow SSH to LAN
$IPT -t filter -A OUTPUT -o $LAN -d $LOCAL_NET -p TCP --dport 22 -j ACCEPT
# Reject Ident-requests
$IPT -t filter -A INPUT -i $WAN -p TCP --dport 113 -j REJECT --reject-with tcp-reset



# -------------------
# |    LOCAL_NET    |
# -------------------

# Allow already established connections through
$IPT -t filter -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
# Drop bad_packages
$IPT -t filter -A FORWARD -j bad_packets
# Drop SMB-packages
$IPT -t filter -A FORWARD -p TCP --sport 137:139 -j DROP
$IPT -t filter -A FORWARD -p UDP --sport 137:139 -j DROP
$IPT -t filter -A FORWARD -p TCP --sport 445 -j DROP
$IPT -t filter -A FORWARD -p UDP --sport 445 -j DROP
# Allow traffic from LAN to WAN
$IPT -t filter -A FORWARD -i $LAN -o $WAN -s $LOCAL_NET -j ACCEPT
$IPT -t nat -A POSTROUTING -o $WAN -s $LOCAL_NET -j MASQUERADE
# Forward SSH to Ohm
$IPT -t nat -A PREROUTING -i $WAN -p TCP --syn --dport 22 -j DNAT --to $Ohm
$IPT -t filter -A FORWARD -i $WAN -d $Ohm -p TCP --dport 22 -j ACCEPT
# Forward DC++ to Yorthen
$IPT -t nat -A PREROUTING -i $WAN -p TCP --syn --dport 1436 -j DNAT --to $Yorthen
$IPT -t filter -A FORWARD -i $WAN -d $Yorthen -p TCP --dport 1436 -j ACCEPT
$IPT -t nat -A PREROUTING -i $WAN -p UDP --dport 1436 -j DNAT --to $Yorthen
$IPT -t filter -A FORWARD -i $WAN -d $Yorthen -p UDP --dport 1436 -j ACCEPT
# Forward FTP to Yorthen
$IPT -t nat -A PREROUTING -i $WAN -p TCP --syn --dport 1045:1050 -j DNAT --to $Yorthen
$IPT -t filter -A FORWARD -i $WAN -d $Yorthen -p TCP --dport 1045:1050 -j ACCEPT
$IPT -t nat -A PREROUTING -i $WAN -p TCP --syn --dport 2069 -j DNAT --to $Yorthen
$IPT -t filter -A FORWARD -i $WAN -d $Yorthen -p TCP --dport 2069 -j ACCEPT
# Forward DCC to Yothen
$IPT -t nat -A PREROUTING -i $WAN -p TCP --syn --dport 59 -j DNAT --to $Yorthen
$IPT -t filter -A FORWARD -i $WAN -d $Yorthen -p TCP --dport 59 -j ACCEPT



# ----------------
# |    SYSCTL    |
# ----------------
echo "1" > /proc/sys/net/ipv4/ip_forward
echo "1" > /proc/sys/net/ipv4/ip_dynaddr
echo "1" > /proc&sys/net/ipv4/conf/eth0/rp_filter
echo "1" > /proc/sys/net/ipv4/conf/eth1/rp_filter

--/04w6evG8XlLl3ft--

