From: =?iso-8859-1?Q?Carlos_Alberto_Pel=E1ez_Ayala?= <capa@cuao.edu.co>
Subject: Problems to access at my internal web server
Date: Fri, 21 Nov 2003 09:46:04 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <MJEBIAMBMKICAIHLFOICGENKCIAA.capa@cuao.edu.co>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Dear friends,
I have a IBM Netvista box with Red Hat Linux 9.0, kernel 2.4.20-8 and
iptables 1.2.7a.
I have a internal web server in the address 192.168.1.5 and i try to acce=
ss
at the page of this server from internet using the reverse nat properties=
 of
iptables across my firewall.
This is my schema:

|-------------|              |--------------|
|--------------|
|   INTERNET  |--------------|  FIREWALL    |------------------|  WEB SER=
VER
|
|-------------|              |--------------|
|--------------|
                   eth0=3D200.3.192.127   eth1=3D192.168.1.2     192.168.=
1.5

When i try to access to the web page of my internal web server, from
internet (http://200.3.192.127), the page never loads. i can see that the
nat and reverse nat not is in operation.


This is the script that i use for my firewall:


IPADDR=3D"200.3.192.127"
EXTERNAL_INTERFACE=3D"eth0"                       # Internet connected
interface
LOOPBACK_INTERFACE=3D"lo"                         # Your local naming
convention
LOCAL_INTERFACE_1=3D"eth1"                        # Your Internal LAN
interface
INTRANET=3D"192.168.1.0/24"                        # Your Private IP Addr
Range
PRIMARY_NAMESERVER=3D"200.3.192.20"                # Your Primary Name Se=
rver
SECONDARY_NAMESERVER=3D"200.3.192.18"              # Your Secondary Name
Server
INTERNAL_WEB=3D"192.168.1.5"
#INTERNAL_WEB1=3D"192.168.1.7"
#SYSLOG_SERVER=3D"***.**.**.*"                    # Your Syslog Internal
Server

LOOPBACK=3D"127.0.0.0/8"                          # Reserved loopback add=
ress
range
CLASS_A=3D"10.0.0.0/8"                            # Class A private netwo=
rks
CLASS_B=3D"172.16.0.0/12"                         # Class B private netwo=
rks
CLASS_C=3D"192.168.0.0/16"                        # Class C private netwo=
rks
CLASS_D_MULTICAST=3D"224.0.0.0/4"                 # Class D multicast add=
r
CLASS_E_RESERVED_NET=3D"240.0.0.0/5"              # Class E reserved addr
BROADCAST_SRC=3D"0.0.0.0"                         # Broadcast source addr
BROADCAST_DEST=3D"255.255.255.255"                # Broadcast destination=
 addr
PRIVPORTS=3D"0:1023"                              # Privileged port range
UNPRIVPORTS=3D"1024:"                             # Unprivileged port ran=
ge

# -----------------------------------------------------------------------=
---
--

# The SSH client starts at 1023 and works down to 513 for each
# additional simultaneous connection originating from a privileged port.
# Clients can optionally be configured to use only unprivileged ports.
SSH_LOCAL_PORTS=3D"1022:65535"                    # Port range for local
clients
SSH_REMOTE_PORTS=3D"513:65535"                    # Port range for remote
clients

# traceroute usually uses -S 32769:65535 -D 33434:33523
TRACEROUTE_SRC_PORTS=3D"32769:65535"
TRACEROUTE_DEST_PORTS=3D"33434:33523"

# -----------------------------------------------------------------------=
---
--

# -----------------------------------------------------------------------=
---
--

# Default policy is DENY
# Explicitly accept desired INCOMING & OUTGOING connections

    # Remove all existing rules belonging to this filter
    iptables -F
    iptables -F -t nat

    # Remove any existing user-defined chains.
    iptables -X

    # Set the default policy of the filter to deny.
    iptables -P INPUT   DROP
    iptables -P OUTPUT  DROP
    iptables -P FORWARD DROP

# -----------------------------------------------------------------------=
---
--

# LOOPBACK
# --------

    # Unlimited traffic on the loopback interface.

    iptables -A INPUT  -i $LOOPBACK_INTERFACE  -j ACCEPT
    iptables -A OUTPUT -o $LOOPBACK_INTERFACE  -j ACCEPT

# -----------------------------------------------------------------------=
---
--

# Unlimited traffic within the local network.

    # All internal machines have access to the fireall machine.

    iptables -A INPUT  -i $LOCAL_INTERFACE_1 -s $INTRANET -j ACCEPT
    iptables -A OUTPUT -o $LOCAL_INTERFACE_1 -d $INTRANET -j ACCEPT

# -----------------------------------------------------------------------=
---
--

# STATEFUL PART!
# --------------

    # Kill malformed XMAS packets
    iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
    iptables -A FORWARD -p tcp --tcp-flags ALL ALL -j DROP

    # Kill malformed NULL packets
    iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
    iptables -A FORWARD -p tcp --tcp-flags ALL NONE -j DROP

    # Block faked, or "spoofed," packets from getting through the firewal=
l.
    iptables -A FORWARD -i $LOCAL_INTERFACE_1 -s ! $INTRANET -j DROP

    # Allow all internal packets out of our network.
    iptables -A FORWARD -m state --state NEW,RELATED,ESTABLISHED \
             -i $LOCAL_INTERFACE_1 \
             -s $INTRANET -j ACCEPT

    # Allow the associated packets with those connections back in.
    iptables -A FORWARD -m state --state ESTABLISHED,RELATED \
             -i $EXTERNAL_INTERFACE -s ! $INTRANET -j ACCEPT

    # All internal traffic is masqueraded externally.
    iptables -A POSTROUTING -t nat -o $EXTERNAL_INTERFACE -j MASQUERADE

# Blocks any forwards that come from Internet connection. Uncomment only =
for
# users with modem device like "ppp0".

#    iptables -A FORWARD -i $EXTERNAL_INTERFACE -m state \
#    --state NEW,INVALID -j REJECT

# -----------------------------------------------------------------------=
---
--

# Network Ghouls

    # Deny access to jerks
    # --------------------
    # /etc/rc.d/rc.firewall.blocked contains a list of
    # iptables -A INPUT -i $EXTERNAL_INTERFACE -s address -j DROP
    # rules to block from any access.

    # Refuse any connection from problem sites
    if [ -f /etc/rc.d/rc.firewall.blocked ]; then
    deny_file=3D"/etc/rc.d/rc.firewall.blocked"
    temp_file=3D"/tmp/temp.ip.addresses"
    cat $deny_file | sed -n -e "s/^[ ]*\([0-9.]*\).*$/\1/p" \
    | awk ' $1 ' > $temp_file
    while read ip_addy
    do
      case $ip_addy in
        *) iptables -A INPUT -i $EXTERNAL_INTERFACE -s $ip_addy -j DROP
           iptables -A INPUT -i $EXTERNAL_INTERFACE -d $ip_addy -j DROP
           iptables -A OUTPUT -o $EXTERNAL_INTERFACE -s $ip_addy -j REJEC=
T
           iptables -A OUTPUT -o $EXTERNAL_INTERFACE -d $ip_addy -j REJEC=
T
        ;;
     esac
    done < $temp_file
    rm -f $temp_file > /dev/null 2>&1
    unset temp_file
    unset deny_file
    fi

# -----------------------------------------------------------------------=
---
--

# SPOOFING & BAD ADDRESSES
# Refuse spoofed packets.
# Ignore blatantly illegal source addresses.
# Protect yourself from sending to bad addresses.

    # Refuse incoming packets pretending to be from the external address.
    iptables -A INPUT   -s $IPADDR -j DROP

    # Refuse incoming packets claiming to be from a Class A, B or C priva=
te
network
    iptables -A INPUT   -s $CLASS_A -j DROP
    iptables -A INPUT   -s $CLASS_B -j DROP
#    iptables -A INPUT   -s $CLASS_C -j DROP

    # Refuse broadcast address SOURCE packets
    iptables -A INPUT   -s $BROADCAST_DEST -j DROP
    iptables -A INPUT   -d $BROADCAST_SRC -j DROP

    # Refuse Class D multicast addresses
    # Multicast is illegal as a source address.
    # Multicast uses UDP.
    iptables -A INPUT   -s $CLASS_D_MULTICAST -j DROP

    # Refuse Class E reserved IP  addresses
    iptables -A INPUT   -s $CLASS_E_RESERVED_NET -j DROP

    # Refuse special addresses defined as reserved by the IANA.
    # Note:  The remaining reserved addresses are not included
    # filtering them causes problems as reserved blocks are
    # being allocated more often now. The following are based on
    # reservations as listed by IANA as of 2001/01/04. Please regularly
    # check at http://www.iana.org/ for the latest status.

    # Note:  this list includes the loopback, multicast, & reserved
addresses.

    # 0.*.*.*                   - Can't be blocked for DHCP users.
    # 127.*.*.*                 - LoopBack
    # 169.254.*.*               - Link Local Networks
    # 192.0.2.*                 - TEST-NET
    # 224-255.*.*.*             - Classes D & E, plus unallocated.

    iptables -A INPUT   -s 0.0.0.0/8 -j DROP
    iptables -A INPUT   -s 127.0.0.0/8 -j DROP
    iptables -A INPUT   -s 169.254.0.0/16 -j DROP
    iptables -A INPUT   -s 192.0.2.0/24 -j DROP
    iptables -A INPUT   -s 224.0.0.0/3 -j DROP

# -----------------------------------------------------------------------=
---
--

    # UDP TRACEROUTE
    # --------------

    # traceroute usually uses -S 32769:65535 -D 33434:33523

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p udp  \
             --source-port $TRACEROUTE_SRC_PORTS \
             -d $IPADDR --destination-port $TRACEROUTE_DEST_PORTS -j DROP

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p udp  \
             -s $IPADDR --source-port $TRACEROUTE_SRC_PORTS \
             --destination-port $TRACEROUTE_DEST_PORTS -j ACCEPT

# -----------------------------------------------------------------------=
---
--

    # ------------------------------------------------------------------

    # WWW-CACHE client
    # ----------------

#    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp ! --syn \
#             --source-port 3128 \
#             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT

#    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp  \
#             -s $IPADDR --source-port $UNPRIVPORTS \
#             --destination-port 3128 -j ACCEPT

    # ------------------------------------------------------------------

    # ------------------------------------------------------------------

    # SSH server (22)
    # ---------------

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp  \
             --source-port $SSH_REMOTE_PORTS \
             -d $IPADDR --destination-port 22 -j ACCEPT

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp ! --syn \
             -s $IPADDR --source-port 22 \
             --destination-port $SSH_REMOTE_PORTS -j ACCEPT


    # SSH cliente (22)
    # ---------------

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp ! --syn \
             --source-port 22 \
             -d $IPADDR --destination-port $SSH_LOCAL_PORTS -j ACCEPT

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp  \
             -s $IPADDR --source-port $SSH_LOCAL_PORTS \
             --destination-port 22 -j ACCEPT

    # ------------------------------------------------------------------

# -----------------------------------------------------------------------=
---
--
 # HTTP cliente (80)
    # ----------------

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp ! --syn \
             --source-port 80 \
             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp  \
             -s $IPADDR --source-port $UNPRIVPORTS \
             --destination-port 80 -j ACCEPT
    # -----------------
    # Opening HTTP (80)

    iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp \
             --source-port $UNPRIVPORTS \
             -d $IPADDR --destination-port 80 -j ACCEPT

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp ! --syn \
             -s $IPADDR --source-port 80 \
             --destination-port $UNPRIVPORTS -j ACCEPT

    # Internal HTTP (80)

    iptables -t nat -A PREROUTING -p tcp -i $EXTERNAL_INTERFACE \
                    -d $IPADDR --dport 80 -j DNAT --to-destination \
                    $INTERNAL_WEB


    iptables -A FORWARD -p tcp -i $EXTERNAL_INTERFACE -o $LOCAL_INTERFACE=
_1
\
             -d $INTERNAL_WEB --dport 80 -j ACCEPT

# -----------------------------------------------------------------------=
---
--

# -----------------------------------------------------------------------=
---
--

# -----------------------------------------------------------------------=
---
--
 # HTTP cliente (8100)
    # ----------------

   # iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp ! --syn \
             --source-port 8100 \
             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT

    #iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp  \
             -s $IPADDR --source-port $UNPRIVPORTS \
             --destination-port 8100 -j ACCEPT
    # -----------------
    # Opening HTTP (8100)

    #iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp \
             --source-port $UNPRIVPORTS \
             -d $IPADDR --destination-port 8100 -j ACCEPT

    #iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp ! --syn \
             -s $IPADDR --source-port 8100 \
             --destination-port $UNPRIVPORTS -j ACCEPT

    # Internal HTTP (8100)

    #iptables -t nat -A PREROUTING -p tcp -i $EXTERNAL_INTERFACE \
                    -d $IPADDR --dport 8100 -j DNAT --to-destination \
                    $INTERNAL_WEB1


    #iptables -A FORWARD -p tcp -i $EXTERNAL_INTERFACE -o $LOCAL_INTERFAC=
E_1
\
             -d $INTERNAL_WEB1 --dport 8100 -j ACCEPT

# -----------------------------------------------------------------------=
---
--
 # HTTP cliente (8500)
    # ----------------

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp ! --syn \
             --source-port 8500 \
             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp  \
             -s $IPADDR --source-port $UNPRIVPORTS \
             --destination-port 8500 -j ACCEPT
    # -----------------
    # Opening HTTP (8500)

    iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp \
             --source-port $UNPRIVPORTS \
             -d $IPADDR --destination-port 8500 -j ACCEPT

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp ! --syn \
             -s $IPADDR --source-port 8500 \
             --destination-port $UNPRIVPORTS -j ACCEPT

    # Internal HTTP (8500)

    iptables -t nat -A PREROUTING -p tcp -i $EXTERNAL_INTERFACE \
                    -d $IPADDR --dport 8500 -j DNAT --to-destination \
                    $INTERNAL_WEB


    iptables -A FORWARD -p tcp -i $EXTERNAL_INTERFACE -o $LOCAL_INTERFACE=
_1
\
             -d $INTERNAL_WEB --dport 8500 -j ACCEPT

# -----------------------------------------------------------------------=
---
--
 # Windows Media cliente (1755)
    # ----------------

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp ! --syn \
             --source-port 1755 \
             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp  \
             -s $IPADDR --source-port $UNPRIVPORTS \
             --destination-port 1755 -j ACCEPT
    # -----------------
    # Opening Windows Media (1755)

    iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp \
             --source-port $UNPRIVPORTS \
             -d $IPADDR --destination-port 1755 -j ACCEPT

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp ! --syn \
             -s $IPADDR --source-port 1755 \
             --destination-port $UNPRIVPORTS -j ACCEPT

    # Internal Windows Media (1755)

    iptables -t nat -A PREROUTING -p tcp -i $EXTERNAL_INTERFACE \
                    -d $IPADDR --dport 1755 -j DNAT --to-destination \
                    $INTERNAL_WEB


    iptables -A FORWARD -p tcp -i $EXTERNAL_INTERFACE -o $LOCAL_INTERFACE=
_1
\
             -d $INTERNAL_WEB --dport 1755 -j ACCEPT

# -----------------------------------------------------------------------=
---
--
 # Windows Media cliente (1755)
    # ----------------

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p udp ! --syn \
             --source-port 1755 \
             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p udp  \
             -s $IPADDR --source-port $UNPRIVPORTS \
             --destination-port 1755 -j ACCEPT
    # -----------------
    # Opening Windows Media (1755)

    iptables -A INPUT -i $EXTERNAL_INTERFACE -p udp \
             --source-port $UNPRIVPORTS \
             -d $IPADDR --destination-port 1755 -j ACCEPT

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p udp ! --syn \
             -s $IPADDR --source-port 1755 \
             --destination-port $UNPRIVPORTS -j ACCEPT

    # Internal Windows Media (1755)

    iptables -t nat -A PREROUTING -p udp -i $EXTERNAL_INTERFACE \
                    -d $IPADDR --dport 1755 -j DNAT --to-destination \
                    $INTERNAL_WEB


    iptables -A FORWARD -p udp -i $EXTERNAL_INTERFACE -o $LOCAL_INTERFACE=
_1
\
             -d $INTERNAL_WEB --dport 1755 -j ACCEPT
 # HTTP client (8900)
    # ----------------

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp ! --syn \
             --source-port 8900 \
             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp  \
             -s $IPADDR --source-port $UNPRIVPORTS \
             --destination-port 8900 -j ACCEPT
    # -----------------
    # Opening HTTP (8900)

    iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp \
             --source-port $UNPRIVPORTS \
             -d $IPADDR --destination-port 8900 -j ACCEPT

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp ! --syn \
             -s $IPADDR --source-port 8900 \
             --destination-port $UNPRIVPORTS -j ACCEPT

    # Internal HTTP (8900)

    iptables -t nat -A PREROUTING -p tcp -i $EXTERNAL_INTERFACE \
                    -d $IPADDR --dport 8900 -j DNAT --to-destination \
                    $INTERNAL_WEB


    iptables -A FORWARD -p tcp -i $EXTERNAL_INTERFACE -o $LOCAL_INTERFACE=
_1
\
             -d $INTERNAL_WEB --dport 8900 -j ACCEPT
# chat client (4445)
    # ----------------

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp ! --syn \
             --source-port 4445 \
             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp  \
             -s $IPADDR --source-port $UNPRIVPORTS \
             --destination-port 4445 -j ACCEPT
    # -----------------
    # Opening chat (4445)

    iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp \
             --source-port $UNPRIVPORTS \
             -d $IPADDR --destination-port 4445 -j ACCEPT

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp ! --syn \
             -s $IPADDR --source-port 4445 \
             --destination-port $UNPRIVPORTS -j ACCEPT

    # Internal chat (4445)

    iptables -t nat -A PREROUTING -p tcp -i $EXTERNAL_INTERFACE \
                    -d $IPADDR --dport 4445 -j DNAT --to-destination \
                    $INTERNAL_WEB


    iptables -A FORWARD -p tcp -i $EXTERNAL_INTERFACE -o $LOCAL_INTERFACE=
_1
\
             -d $INTERNAL_WEB --dport 4445 -j ACCEPT

# -----------------------------------------------------------------------=
---
--
 #  WhiteBoard (4568)
    # ----------------

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp ! --syn \
             --source-port 4568 \
             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp  \
             -s $IPADDR --source-port $UNPRIVPORTS \
             --destination-port 4568 -j ACCEPT
    # -----------------
    # Abriendo el WhiteBoard (4568)

    iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp \
             --source-port $UNPRIVPORTS \
             -d $IPADDR --destination-port 4568 -j ACCEPT

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp ! --syn \
             -s $IPADDR --source-port 4568 \
             --destination-port $UNPRIVPORTS -j ACCEPT

    # WhiteBoard interno (4568)

    iptables -t nat -A PREROUTING -p tcp -i $EXTERNAL_INTERFACE \
                    -d $IPADDR --dport 4568 -j DNAT --to-destination \
                    $INTERNAL_WEB


    iptables -A FORWARD -p tcp -i $EXTERNAL_INTERFACE -o $LOCAL_INTERFACE=
_1
\
             -d $INTERNAL_WEB --dport 4568 -j ACCEPT

# -----------------------------------------------------------------------=
---
--

# -----------------------------------------------------------------------=
---
--
 # WhiteBoard (4567)
    # ----------------

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p udp ! --syn \
             --source-port 4567 \
             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p udp  \
             -s $IPADDR --source-port $UNPRIVPORTS \
             --destination-port 4567 -j ACCEPT
    # -----------------
    # Abriendo WhiteBoard (4567)

    iptables -A INPUT -i $EXTERNAL_INTERFACE -p udp \
             --source-port $UNPRIVPORTS \
             -d $IPADDR --destination-port 4567 -j ACCEPT

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p udp ! --syn \
             -s $IPADDR --source-port 4567 \
             --destination-port $UNPRIVPORTS -j ACCEPT

    # WhiteBoard Interno (4567)

    iptables -t nat -A PREROUTING -p udp -i $EXTERNAL_INTERFACE \
                    -d $IPADDR --dport 4567 -j DNAT --to-destination \
                    $INTERNAL_WEB


    iptables -A FORWARD -p udp -i $EXTERNAL_INTERFACE -o $LOCAL_INTERFACE=
_1
\
             -d $INTERNAL_WEB --dport 4567 -j ACCEPT

# -----------------------------------------------------------------------=
---
--

    # FTP client (21)
    # ---------------

    # outgoing request
    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp  \
             -s $IPADDR --source-port $UNPRIVPORTS \
             --destination-port 21 -j ACCEPT

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp ! --syn \
             --source-port 21 \
             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT


    # PORT mode data channel
    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp  \
             --source-port 20 \
             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp ! --syn \
             -s $IPADDR --source-port $UNPRIVPORTS \
             --destination-port 20 -j ACCEPT

    # Internal FTP (21)

    iptables -t nat -A PREROUTING -p tcp -i $EXTERNAL_INTERFACE \
                    -d $IPADDR --dport 21 -j DNAT --to-destination \
                    $INTERNAL_WEB


    iptables -A FORWARD -p tcp -i $EXTERNAL_INTERFACE -o $LOCAL_INTERFACE=
_1
\
             -d $INTERNAL_WEB --dport 21 -j ACCEPT

    # Internal FTP (21)

    iptables -t nat -A PREROUTING -p tcp -i $EXTERNAL_INTERFACE \
                    -d $IPADDR --dport 20 -j DNAT --to-destination \
                    $INTERNAL_WEB


    iptables -A FORWARD -p tcp -i $EXTERNAL_INTERFACE -o $LOCAL_INTERFACE=
_1
\
             -d $INTERNAL_WEB --dport 20 -j ACCEPT

# ICMP

    #    To prevent denial of service attacks based on ICMP bombs, filter
    #    incoming Redirect (5) and outgoing Destination Unreachable (3).
    #    Note, however, disabling Destination Unreachable (3) is not
    #    advisable, as it is used to negotiate packet fragment size.

    # For bi-directional ping.
    #     Message Types:  Echo_Reply (0),  Echo_Request (8)
    #     To prevent attacks, limit the src addresses to your ISP range.
    #
    # For outgoing traceroute.
    #     Message Types:  INCOMING Dest_Unreachable (3), Time_Exceeded (1=
1)
    #     default UDP base: 33434 to base+nhops-1
    #
    # For incoming traceroute.
    #     Message Types:  OUTGOING Dest_Unreachable (3), Time_Exceeded (1=
1)
    #     To block this, deny OUTGOING 3 and 11

    #  0: echo-reply (pong)
    #  3: destination-unreachable, port-unreachable, fragmentation-needed=
,
etc.
    #  4: source-quench
    #  5: redirect
    #  8: echo-request (ping)
    # 11: time-exceeded
    # 12: parameter-problem

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p icmp  \
             --icmp-type echo-reply \
             -d $IPADDR -j ACCEPT

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p icmp  \
             --icmp-type destination-unreachable \
             -d $IPADDR -j ACCEPT

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p icmp  \
             --icmp-type source-quench \
             -d $IPADDR -j ACCEPT

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p icmp  \
             --icmp-type time-exceeded \
             -d $IPADDR -j ACCEPT

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p icmp  \
             --icmp-type parameter-problem \
             -d $IPADDR -j ACCEPT


    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p icmp  \
             -s $IPADDR --icmp-type fragmentation-needed -j ACCEPT

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p icmp  \
             -s $IPADDR --icmp-type source-quench -j ACCEPT

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p icmp  \
             -s $IPADDR --icmp-type echo-request -j ACCEPT

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p icmp  \
             -s $IPADDR --icmp-type parameter-problem -j ACCEPT

# -----------------------------------------------------------------------=
---
--

# Enable logging for selected denied packets

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp  -j DROP

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p udp  \
             --destination-port $PRIVPORTS -j DROP

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p udp  \
             --destination-port $UNPRIVPORTS -j DROP


    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p icmp  \
             --icmp-type 5 -j DROP

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p icmp  \
             --icmp-type 13/255 -j DROP

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE  -j REJECT

    iptables -A INPUT -p tcp ! --syn -m state --state NEW -j LOG \
             --log-prefix "NEW not syn:"

# -----------------------------------------------------------------------=
---
--

        ;;
  stop)
        echo -n "Shutting Firewalling: "

    # Remove all existing rules belonging to this filter
    iptables -F

    # Delete all user-defined chain to this filter
    iptables -X

    # Reset the default policy of the filter to accept.
    iptables -P INPUT   ACCEPT
    iptables -P OUTPUT  ACCEPT
    iptables -P FORWARD ACCEPT

        ;;
  status)
        status iptables
        ;;
  restart|reload)
        $0 stop
        $0 start
        ;;
  *)
        echo "Usage: iptables {start|stop|status|restart|reload}"
        exit 1
esac
echo "done"

exit 0






When i execute the command  #iptables --list, this show me the rules...


[root@arquimedes root]# iptables --list
Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  192.168.1.0/24       anywhere
DROP       tcp  --  anywhere             anywhere           tcp
flags:FIN,SYN,RST,PSH,ACK,URG/FIN,SYN,RST,PSH,ACK,URG
DROP       tcp  --  anywhere             anywhere           tcp
flags:FIN,SYN,RST,PSH,ACK,URG/NONE
DROP       all  --  200.3.192.127        anywhere
DROP       all  --  10.0.0.0/8           anywhere
DROP       all  --  172.16.0.0/12        anywhere
DROP       all  --  255.255.255.255      anywhere
DROP       all  --  anywhere             0.0.0.0
DROP       all  --  224.0.0.0/4          anywhere
DROP       all  --  240.0.0.0/5          anywhere
DROP       all  --  0.0.0.0/8            anywhere
DROP       all  --  127.0.0.0/8          anywhere
DROP       all  --  169.254.0.0/16       anywhere
DROP       all  --  192.0.2.0/24         anywhere
DROP       all  --  224.0.0.0/3          anywhere
DROP       udp  --  anywhere             200.24.107.21      udp
spts:32769:65535 dpts:traceroute:33523
ACCEPT     tcp  --  anywhere             200.24.107.21      tcp
spts:login:65535 dpt:ssh
ACCEPT     tcp  --  anywhere             200.24.107.21      tcp spt:ssh
dpts:1022:65535 flags:!SYN,RST,ACK/SYN
ACCEPT     tcp  --  anywhere             200.24.107.21      tcp spt:http
dpts:1024:65535 flags:!SYN,RST,ACK/SYN
ACCEPT     tcp  --  anywhere             200.24.107.21      tcp
spts:1024:65535 dpt:http
ACCEPT     tcp  --  anywhere             200.24.107.21      tcp spt:8500
dpts:1024:65535 flags:!SYN,RST,ACK/SYN
ACCEPT     tcp  --  anywhere             200.24.107.21      tcp
spts:1024:65535 dpt:8500
ACCEPT     tcp  --  anywhere             200.24.107.21      tcp spt:1755
dpts:1024:65535 flags:!SYN,RST,ACK/SYN
ACCEPT     tcp  --  anywhere             200.24.107.21      tcp
spts:1024:65535 dpt:1755
ACCEPT     udp  --  anywhere             200.24.107.21      udp
spts:1024:65535 dpt:1755
ACCEPT     tcp  --  anywhere             200.24.107.21      tcp spt:8900
dpts:1024:65535 flags:!SYN,RST,ACK/SYN
ACCEPT     tcp  --  anywhere             200.24.107.21      tcp
spts:1024:65535 dpt:8900
ACCEPT     tcp  --  anywhere             200.24.107.21      tcp spt:4445
dpts:1024:65535 flags:!SYN,RST,ACK/SYN
ACCEPT     tcp  --  anywhere             200.24.107.21      tcp
spts:1024:65535 dpt:4445
ACCEPT     tcp  --  anywhere             200.24.107.21      tcp spt:4568
dpts:1024:65535 flags:!SYN,RST,ACK/SYN
ACCEPT     tcp  --  anywhere             200.24.107.21      tcp
spts:1024:65535 dpt:4568
ACCEPT     udp  --  anywhere             200.24.107.21      udp
spts:1024:65535 dpt:4567
ACCEPT     tcp  --  anywhere             200.24.107.21      tcp spt:ftp
dpts:1024:65535 flags:!SYN,RST,ACK/SYN
ACCEPT     tcp  --  anywhere             200.24.107.21      tcp spt:ftp-d=
ata
dpts:1024:65535
ACCEPT     icmp --  anywhere             200.24.107.21      icmp echo-rep=
ly
ACCEPT     icmp --  anywhere             200.24.107.21      icmp
destination-unreachable
ACCEPT     icmp --  anywhere             200.24.107.21      icmp
source-quench
ACCEPT     icmp --  anywhere             200.24.107.21      icmp
time-exceeded
ACCEPT     icmp --  anywhere             200.24.107.21      icmp
parameter-problem
DROP       tcp  --  anywhere             anywhere
DROP       udp  --  anywhere             anywhere           udp dpts:0:10=
23
DROP       udp  --  anywhere             anywhere           udp
dpts:1024:65535
DROP       icmp --  anywhere             anywhere           icmp redirect
DROP       icmp --  anywhere             anywhere           icmp type 13
code 255
LOG        tcp  --  anywhere             anywhere           tcp
flags:!SYN,RST,ACK/SYN state NEW LOG level warning prefix `NEW not syn:'

Chain FORWARD (policy DROP)
target     prot opt source               destination
DROP       tcp  --  anywhere             anywhere           tcp
flags:FIN,SYN,RST,PSH,ACK,URG/FIN,SYN,RST,PSH,ACK,URG
DROP       tcp  --  anywhere             anywhere           tcp
flags:FIN,SYN,RST,PSH,ACK,URG/NONE
DROP       all  -- !192.168.1.0/24       anywhere
ACCEPT     all  --  192.168.1.0/24       anywhere           state
NEW,RELATED,ESTABLISHED
ACCEPT     all  -- !192.168.1.0/24       anywhere           state
RELATED,ESTABLISHED
ACCEPT     tcp  --  anywhere             192.168.1.5        tcp dpt:http
ACCEPT     tcp  --  anywhere             192.168.1.5        tcp dpt:8500
ACCEPT     tcp  --  anywhere             192.168.1.5        tcp dpt:1755
ACCEPT     udp  --  anywhere             192.168.1.5        udp dpt:1755
ACCEPT     tcp  --  anywhere             192.168.1.5        tcp dpt:8900
ACCEPT     tcp  --  anywhere             192.168.1.5        tcp dpt:4445
ACCEPT     tcp  --  anywhere             192.168.1.5        tcp dpt:4568
ACCEPT     udp  --  anywhere             192.168.1.5        udp dpt:4567
ACCEPT     tcp  --  anywhere             192.168.1.5        tcp dpt:ftp
ACCEPT     tcp  --  anywhere             192.168.1.5        tcp dpt:ftp-d=
ata

Chain OUTPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             192.168.1.0/24
ACCEPT     udp  --  200.3.192.127        anywhere           udp
spts:32769:65535 dpts:traceroute:33523
ACCEPT     tcp  --  200.3.192.127        anywhere           tcp spt:ssh
dpts:login:65535 flags:!SYN,RST,ACK/SYN
ACCEPT     tcp  --  200.3.192.127        anywhere           tcp
spts:1022:65535 dpt:ssh
ACCEPT     tcp  --  200.3.192.127        anywhere           tcp
spts:1024:65535 dpt:http
ACCEPT     tcp  --  200.3.192.127        anywhere           tcp spt:http
dpts:1024:65535 flags:!SYN,RST,ACK/SYN
ACCEPT     tcp  --  200.3.192.127        anywhere           tcp
spts:1024:65535 dpt:8500
ACCEPT     tcp  --  200.3.192.127        anywhere           tcp spt:8500
dpts:1024:65535 flags:!SYN,RST,ACK/SYN
ACCEPT     tcp  --  200.3.192.127        anywhere           tcp
spts:1024:65535 dpt:1755
ACCEPT     tcp  --  200.3.192.127        anywhere           tcp spt:1755
dpts:1024:65535 flags:!SYN,RST,ACK/SYN
ACCEPT     udp  --  200.3.192.127        anywhere           udp
spts:1024:65535 dpt:1755
ACCEPT     tcp  --  200.3.192.127        anywhere           tcp
spts:1024:65535 dpt:8900
ACCEPT     tcp  --  200.3.192.127        anywhere           tcp spt:8900
dpts:1024:65535 flags:!SYN,RST,ACK/SYN
ACCEPT     tcp  --  200.3.192.127        anywhere           tcp
spts:1024:65535 dpt:4445
ACCEPT     tcp  --  200.3.192.127        anywhere           tcp spt:4445
dpts:1024:65535 flags:!SYN,RST,ACK/SYN
ACCEPT     tcp  --  200.3.192.127        anywhere           tcp
spts:1024:65535 dpt:4568
ACCEPT     tcp  --  200.3.192.127        anywhere           tcp spt:4568
dpts:1024:65535 flags:!SYN,RST,ACK/SYN
ACCEPT     udp  --  200.3.192.127        anywhere           udp
spts:1024:65535 dpt:4567
ACCEPT     tcp  --  200.3.192.127        anywhere           tcp
spts:1024:65535 dpt:ftp
ACCEPT     tcp  --  200.3.192.127        anywhere           tcp
spts:1024:65535 dpt:ftp-data flags:!SYN,RST,ACK/SYN
ACCEPT     icmp --  200.3.192.127        anywhere           icmp
fragmentation-needed
ACCEPT     icmp --  200.3.192.127        anywhere           icmp
source-quench
ACCEPT     icmp --  200.3.192.127        anywhere           icmp
echo-request
ACCEPT     icmp --  200.3.192.127        anywhere           icmp
parameter-problem
REJECT     all  --  anywhere             anywhere           reject-with
icmp-port-unreachable





I can=B4t see the problem. Please, something can help me with this.
Dear friends, thanks for help me and sorry for my english.


Carlos Alberto


