From: "Collins, Kevin" <KCollins@nesbittengineering.com>
Subject: DNS/Router/Firewall question...
Date: Thu, 13 Mar 2003 10:36:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5DE7560BBF09D6119ED100B0D03D8426013923@MAIL-SERVER>
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

Hey All,

I've got a Red Hat 8.0 box with four network cards in it.  (See Diagram
below)  I've got BIND DNS 9.1 (updated via Red Hat's Red Hat Network)
running on the same machine.  I want this machine to act as my primary
internal DNS server for my Internal and WAN subnets.

When I have the machine running as a router (i.e. ip forwarding enabled, no
firewall rules in place) everything works fine.  When I start my firewall,
DNS slows down to a crawl.  It works, but it works so slow that it feels
like it's not.

I've attached my firewall script below.  It's a work in progress so comments
are welcome.

Here's the best ASCII art diagram I can give you.

----------
|Internet|
----------
    |               -----------
    |-------eth0----|Linux Box|
                    -----------
                     |   |   |
                  eth1 wan1  wan2
        -----------  |   |   |
        |Lexington|  |   |   |
        | Subnet  |---   |   |
        -----------      |   |
                         |   |
         --------        |   |
         |Hazard|        |   |
         |(Site |--------|   |
         |  1)  |            |
         --------            |
                             |
         --------            |
         |PBurg |            |
         |(Site |------------|
         |  2)  |           
         --------


I'm trying to find out why DNS is so slow after the firewall script is
started.

Second, I have an application that needs to communicate from Hazard to the
Internet via TCP port 9000.  It's a Web/Java front end to a state-run Oracle
database.  I've tried a few rules to allow the communication, but I'm just
not getting it.  Could someone provide help there?

Thanks in advance,

Kevin L. Collins, MCSE
Systems Manager
Nesbitt Engineering, Inc.



Firewall Script Follows:
============================================================================
=
# ===============================
# -- General Setup Information --
# ===============================
# Application locations
IPTABLES=/sbin/iptables
DEPMOD=/sbin/depmod
INSMOD=/sbin/insmod

# General known constants
EXTIF="eth0"                            # The External/Internet Interface
INTIF="eth1"                            # The Internal Interface
HAZIF="wan1"                            # The Hazard Interface
PBURGIF="wan2"                          # The Prestonsburg Interface
EXTIP="XXX.XXX.XXX.XXX"                 # External IP Address of the Router
INTIP="10.200.8.254"                    # Local IP Address of the Router
INT_NET="10.200.8.0/24"                 # The Local IP Subnet
HAZIP="10.200.11.9"                     # The "Local" Hazard IP
HAZ_NET="10.200.9.0/24"                 # Hazard's IP Subnet
PBURGIP="10.200.11.13"                  # The "Local" Prestonsburg IP
PBURG_NET="10.200.10.0/24"              # Pburg's IP Subnet
LOOP="lo"                               # The Loopback Interface
LOOP_IP="127.0.0.1"                     # The Loopback Address
LOOP_NET="127.0.0.0/8"                  # The Loopback Subnet
CLASS_A="10.0.0.0/8"                    # Private Class "A" Subnet
CLASS_B="172.16.0.0/12"                 # Private Class "B" subnet
CLASS_C="192.168.0.0/16"                # Private Class "C" subnet
CLASS_D_MULTICAST="224.0.0.0/4"         # Multicast IP subnet
CLASS_E_RESERVED_NET="240.0.0.0/5"      # Reserved Testing IP subnet
BROADCAST_SRC="0.0.0.0"                 # Source IP Address of Broadcasts
BROADCAST_DEST="255.255.255.255"        # Destination IP Address of
Broadcasts
PRIVPORTS="0:1023"                      # Priviledged Ports
UNPRIVPORTS="1024:65535"                # Unpriviledged Ports
TIME_SERVER="tick.usno.navy.mil"        # The NTP Time Server we use
ISP="QX.net"                            # Our ISP's name
ISP_NAMESERVER="208.235.88.10"          # Our ISP's Name Server (DNS)

echo "   External Interface:         $EXTIF"
echo "   Internal Interface:         $INTIF"
echo "   Hazard's Interface:         $HAZIF"
echo "   Prestonsburg's Interface:   $PBURGIF"

#
============================================================================
=
# --                  No editing beyond this line is required
--
#
============================================================================
=
echo "Now loading modules: "

# Need to verify that all modules have all required dependencies
echo "   Verifying that all kernel modules are OK..."
$DEPMOD -a

# ===========================
# -- Load the main modules --
# ===========================
echo "   ip_tables..."
$INSMOD ip_tables

echo "   iptable filter..."
$INSMOD iptable_filter

echo "   ip_conntrack..."
$INSMOD ip_conntrack

echo "   ip_conntrack_ftp..."
$INSMOD ip_conntrack_ftp

echo "   ip_conntrack_irc..."
$INSMOD ip_conntrack_irc

echo "   iptable_nat..."
$INSMOD iptable_nat

echo "   ip_nat_ftp..."
$INSMOD ip_nat_ftp

# ==========================================================
# -- Enable IP forwarding since it is disabled by default --
# ==========================================================
echo "Enabling forwarding..."
echo "1" > /proc/sys/net/ipv4/ip_forward

# =====================================================
# -- Enable Static Routes to Hazaard and Prestonsburg --
# =====================================================
echo "Now enabling static routes to Hazard and Prestonsburg..."
# Route to Hazard
/sbin/route add -net 10.200.9.0 netmask 255.255.255.0 gw 10.200.11.10
# Route to Prestonsburg
/sbin/route add -net 10.200.10.0 netmask 255.255.255.0 gw 10.200.11.14


# ======================================
# -- Initialize the IPTABLES Firewall --
# ======================================
echo "Initializing the Firewall..."
# Set the default policy for all chains to DROP --
echo "   Flushing any current rules and setting the default policy..."
$IPTABLES --policy INPUT DROP
$IPTABLES -F INPUT
$IPTABLES --policy OUTPUT DROP
$IPTABLES -F OUTPUT
$IPTABLES --policy FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -t nat -F

# Let's be complete...
#$IPTABLES -t nat --policy PREROUTING DROP
#$IPTABLES -t nat --policy OUTPUT DROP
#$IPTABLES -t nat --policy POSTROUTING DROP
#$IPTABLES -t mangle --policy PREROUTING DROP
#$IPTABLES -t mangle --policy OUTPUT DROP

# ======================================================
# -- Allow unlimited access to the loopback interface --
# ======================================================
echo "   Allowing full access for the loopback interface..."
$IPTABLES -A INPUT -i $LOOP -j ACCEPT
$IPTABLES -A OUTPUT -o $LOOP -j ACCEPT
# Loopback to the Outside
#$IPTABLES -A FORWARD -i $LOOP -o $EXTIF -j ACCEPT
#$IPTABLES -A FORWARD -i $LOOP -o $INTIF -j ACCEPT
#$IPTABLES -A FORWARD -i $LOOP -o $HAZIF -j ACCEPT
#$IPTABLES -A FORWARD -i $LOOP -o $PBURGIF -j ACCEPT

# =========================================================
# -- Begin the Stateful Packet Inspection                --
# -- Allow the bypass of Established and Related streams --
# -- Provides a 'quicker' response to 'known' traffic    --
# =========================================================
echo "   Allowing the bypassing of rules for known traffic..."
$IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state
ESTABLISHED,RELATED \
          -j ACCEPT
$IPTABLES -A FORWARD -i $EXTIF -o $HAZIF -m state --state
ESTABLISHED,RELATED \
          -j ACCEPT
$IPTABLES -A FORWARD -i $EXTIF -o $PBURGIF -m state --state \
          ESTABLISHED,RELATED -j ACCEPT
#$IPTABLES -A FORWARD -i $EXTIF -o $LOOP -m state --state
ESTABLISHED,RELATED \
#          -j ACCEPT

# =====================================================================
# -- Provide both LAN and WAN traffic the ability to move unhindered --
# =====================================================================
# First access to the Internet
echo "Now allowing Internet and WAN traffic..."

# Now the WAN is to be unhindered
echo "   Allowing WAN traffic to flow unhindered..."
# Lexington first
$IPTABLES -A INPUT -s 10.200.8.0/24 -j ACCEPT
$IPTABLES -A OUTPUT -d 10.200.8.0/24 -j ACCEPT
# Now Hazard
$IPTABLES -A INPUT -s 10.200.9.0/24 -j ACCEPT
$IPTABLES -A OUTPUT -d 10.200.9.0/24 -j ACCEPT
# And Prestonsburg
$IPTABLES -A INPUT -s 10.200.10.0/24 -j ACCEPT
$IPTABLES -A OUTPUT -d 10.200.10.0/24 -j ACCEPT

# We gotta allow FORWARDing to happen from the LAN and the WAN for
# this box to act as a router.
echo "   Allowing FORWARDing of packets out to the Internet"
echo "   and WAN to happen..."
# Lexington first
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $HAZIF -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $PBURGIF -j ACCEPT
# Now Hazard
$IPTABLES -A FORWARD -i $HAZIF -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -i $HAZIF -o $INTIF -j ACCEPT
$IPTABLES -A FORWARD -i $HAZIF -o $PBURGIF -j ACCEPT
# And Prestonsburg
$IPTABLES -A FORWARD -i $PBURGIF -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -i $PBURGIF -o $INTIF -j ACCEPT
$IPTABLES -A FORWARD -i $PBURGIF -o $HAZIF -j ACCEPT

# That which will go outside shall be MASQed
echo "   Enabling MASQUERADEing functionality on $EXTIF"
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

# ==============================================
# -- Enable DNS Traffic To/From ISP to happen --
# ==============================================
echo "Allowing DNS activity to/from $ISP..."
$IPTABLES -A OUTPUT -o $EXTIF -p udp -s $EXTIP --sport $UNPRIVPORTS \
          -d $ISP_NAMESERVER --dport 53 -m state --state NEW -j ACCEPT
$IPTABLES -A INPUT -i $EXTIF -p udp -s $ISP_NAMESERVER --sport 53 \
          -d $EXTIP --dport $UNPRIVPORTS -j ACCEPT

# Just in case of a random TCP DNS transfer
echo "   Allowing the rare TCP DNS transfer..."
$IPTABLES -A OUTPUT -o $EXTIF -p tcp -s $EXTIP --sport $UNPRIVPORTS \
          -d $ISP_NAMESERVER --dport 53 -m state --state NEW -j ACCEPT
$IPTABLES -A INPUT -i $EXTIF -p tcp ! --syn -s $ISP_NAMESERVER --sport 53 \
          -d $EXTIP --dport $UNPRIVPORTS -j ACCEPT

# Allow DNS forwarding to take place
echo "   Allowing DNS Forwarding to take place..."
$IPTABLES -A OUTPUT -o $EXTIF -p udp -s $EXTIP --sport 53 \
          -d $ISP_NAMESERVER --dport 53 -m state --state NEW -j ACCEPT
$IPTABLES -A INPUT -i $EXTIF -p udp -s $ISP_NAMESERVER --sport 53 \
          -d $EXTIP --dport 53 -j ACCEPT

# ==============================================================
# -- ********* REQUIRED NETWORK SERVICES FOLLOW ************* --
# ==============================================================
echo "Setting up for the Required Network Services..."
# ===============================================
# -- Forward E-Mail through to the Mail Server --
# ===============================================
echo "   Allowing E-Mail to pass through to the Mail Server..."
$IPTABLES -t nat -A PREROUTING -i $EXTIF -p tcp --sport $UNPRIVPORTS \
          --dport 25 -j DNAT --to-destination 10.200.8.4:25
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -p tcp --sport $UNPRIVPORTS \
          -d 10.200.8.4 --dport 25 -m state --state NEW -j ACCEPT

# =======================================
# -- Allow FTP Downloads to take place --
# =======================================
echo "   Allowing External access to FTP site..."
# Data Channel - TCP Port 20
$IPTABLES -A INPUT -i $EXTIF -p tcp --sport 20 -d $EXTIP --dport
$UNPRIVPORTS \
          -m state --state NEW -j ACCEPT
$IPTABLES -A INPUT -i $EXTIF -p tcp --sport 20 -d $EXTIP --dport
$UNPRIVPORTS \
          -j ACCEPT
$IPTABLES -A OUTPUT -o $EXTIF -p tcp ! --syn -s $EXTIP --sport $UNPRIVPORTS
\
          --dport 20 -j ACCEPT

# Control Channel - TCP Port 21
$IPTABLES -A OUTPUT -o $EXTIF -p tcp -s $EXTIP --sport $UNPRIVPORTS \
          --dport 21 -m state --state NEW -j ACCEPT
$IPTABLES -A OUTPUT -o $EXTIF -p tcp -s $EXTIP --sport $UNPRIVPORTS \
          --dport 21 -j ACCEPT
$IPTABLES -A INPUT -i $EXTIF -p tcp ! --syn --sport 21 -d $EXTIP \
          --dport $UNPRIVPORTS -j ACCEPT

# =======================================================
# -- Allow External WWW traffic requests to take place --
# =======================================================
echo "   Allowing External access to Web sites..."
# mail.nesbittengineering.com - XXX.XXX.XXX.XXX:80 -->
echo "      mail.nesbittengineering.com..."
$IPTABLES -A INPUT -i $EXTIF -p tcp --sport $UNPRIVPORTS -d $EXTIP \
          --dport 80 -m state --state NEW -j ACCEPT
$IPTABLES -A INPUT -i $EXTIF -p tcp --sport $UNPRIVPORTS -d $EXTIP \
          --dport 80 -j ACCEPT
$IPTABLES -A OUTPUT -o $EXTIF -p tcp ! --syn -s $EXTIP --sport 80 \
          --dport $UNPRIVPORTS -j ACCEPT

# www.nesbittengineering.com - XXX.XXX.XXX.XXX:80 -->
echo "      www.nesbittengineering.com..."
$IPTABLES -A INPUT -i $EXTIF -p tcp --sport $UNPRIVPORTS -d XXX.XXX.XXX.XXX
\
          --dport 80 -m state --state NEW -j ACCEPT
$IPTABLES -A INPUT -i $EXTIF -p tcp --sport $UNPRIVPORTS -d XXX.XXX.XXX.XXX
\
          --dport 80 -j ACCEPT
$IPTABLES -A OUTPUT -o $EXTIF -p tcp ! --syn -s XXX.XXX.XXX.XXX --sport 80 \
          --dport $UNPRIVPORTS -j ACCEPT

# ===============================================
# -- Provide access to the Network Time Server --
# ===============================================
echo "   Providing access to the NTP Server..."
$IPTABLES -A OUTPUT -o $EXTIF -p udp -s $EXTIP --sport $UNPRIVPORTS \
          -d $TIME_SERVER --dport 123 -m state --state NEW -j ACCEPT
$IPTABLES -A OUTPUT -o $EXTIF -p udp -s $EXTIP --sport $UNPRIVPORTS \
          -d $TIME_SERVER --dport 123 -j ACCEPT
$IPTABLES -A INPUT -i $EXTIF -p udp -s $TIME_SERVER --sport 123 \
           --dport $UNPRIVPORTS -j ACCEPT

echo "Router and Firewall loading complete."
=============================================================
End Firewall Script

