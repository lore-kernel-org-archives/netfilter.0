From: "David Wynter" <david@roamware.com>
Subject: RE: LAN to firewall difficulties
Date: Fri, 1 Nov 2002 12:22:38 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LPECIAHGIGJJHHELMIDLEEIGCPAA.david@roamware.com>
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
To: Netfilter list <netfilter@lists.netfilter.org>

Hi again,

I discovered something interesting. I can ping and FTP from my notebook on
the LAN to my firewall. That is from 10.0.0.5 to 10.0.0.1 but not from
10.0.0.6 to 10.0.0.1. The former is a Win98 notebook and the latter runs W2K
Server. I don't have a firewall or anything running on the W2K box that
would prevent these ping or FTP packets getting out (that I know of), and
the $LANSUBNET below in the script is set to "10.0.0.0/8" and the
$LAN_IF_ADDR is 10.0.0.1. The W2K box can ping/FTP to/HTTP to machines on
the other side of the firewall, so why not the firewall itself?

David

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of David Wynter
Sent: 01 November 2002 11:19
To: netfilter@lists.netfilter.org
Subject: LAN to firewall difficulties


Hi,

I have a W2K PC attached to my firewall Linux box (MDK 8.2). Also on the
Linux box is MySQL listening on port 3306 (netstat -tan). I have read the
How
To on Packet Filtering and am using a script given to me by someone on
Linuxquestions.org.

Nothing (FTP and ping also tried) from my LAN gets to the local processes on
my firewall, although the FORWARD chain works fine and I can FTP from
firewall to LAN PCs routed via the Internet. I can also ping th eLAN  PCs
from th efirewall.

I have turned on logging in the kernal but don't get any output for my LAN
to
firewall attempts at all (I restarted syslog after adding
"kern.=debug;kern.=info;kern.=notice /var/log/kernel/info" to my
syslog.conf)

Here are the relevant arts of my iptables script.

# INPUT jumps
        $ECHO " Input Jumps"
        #
        # Check for packet sanity
        $IPTABLES -A INPUT -i $EXT_IF -j sanity
        #
        # Check for banned addresses
        $IPTABLES -A INPUT -j banned
        #
        # Check for attacks
        $IPTABLES -A INPUT -j attack
        #
        # Local interface input
        $IPTABLES -A INPUT -i $EXT_IF -d $EXT_IF_ADDR -j ext-if
        $IPTABLES -A INPUT -i $LAN_IF -d $LAN_IF_ADDR -j lan-if
	#
	# A rule to allow INPUT from the LAN to get to the outside
	$IPTABLES -A INPUT -i $LAN_IF -d $EXT_IF_ADDR -j lan-if
        #
        # Deny and log all other traffic
        $IPTABLES -A INPUT -j blocked

# OUTPUT jumps
        $ECHO " Output Jumps"
        # Check for banned addresses
        $IPTABLES -A OUTPUT -j banned
        #
        # Local interface output
        $IPTABLES -A OUTPUT -o $EXT_IF -s $EXT_IF_ADDR -j if-ext
        $IPTABLES -A OUTPUT -o $LAN_IF -s $LAN_IF_ADDR -j if-lan
	#
	#
	$IPTABLES -A OUTPUT -o $LAN_IF -s $EXT_IF_ADDR -j if-lan
        #
        # Reject and log all other traffic
        $IPTABLES -A OUTPUT -j DROP

############################################################################
#
# $ECHO "Building LAN to LAN Interface Chain"
#
 ---------------------------------------------------------------------------
-
 #
# LANIF
#
# LAN to LAN interface restrictions:
#  - ftp - File transfer from the LAN to the firewall
#  - ssh - Secure shell access from the LAN to the firewall
#  - telnet - Shell access from the LAN to the firewall
#  - smtp - Shell access from the LAN to the firewall
#  - pop - Shell access from the LAN to the firewall
#  - sftp - Secure file transfer from the LAN to the firewall
#
# FTP - (21/TCP) Ftp access
        $IPTABLES -A lan-if -p tcp -s $LANSUBNET --dport ftp -j ACCEPT
        #
# SSH - (22/TCP) Secure shell access
        $IPTABLES -A lan-if -p tcp -s $LANSUBNET --dport ssh -j ACCEPT
        #
# TELNET - (23/TCP) Telnet access
        $IPTABLES -A lan-if -p tcp -s $LANSUBNET --dport telnet -j ACCEPT
        #
# SMTP - (25/TCP) SMTP access
        $IPTABLES -A lan-if -p tcp -s $LANSUBNET --dport mail -j ACCEPT
        #
# POP - (110/TCP) POP access
        $IPTABLES -A lan-if -p tcp -s $LANSUBNET --dport pop-3 -j ACCEPT
        #
# HTTP - (80) HTTP
        $IPTABLES -A lan-if -p tcp -s $LANSUBNET --dport www -j ACCEPT
        #
# SMB - (137/UDP) Netbios NS access
        $IPTABLES -A lan-if -p udp -s $LANSUBNET --dport 137 -j ACCEPT
        #
# SMB - (137/TCP) Netbios NS access
        $IPTABLES -A lan-if -p tcp -s $LANSUBNET --dport 137 -j ACCEPT
        #
# SMB - (138/TCP) Netbios DGM access
        $IPTABLES -A lan-if -p udp -s $LANSUBNET --dport 138 -j ACCEPT
        #
# SMB - (138/TCP) Netbios DGM access
        $IPTABLES -A lan-if -p tcp -s $LANSUBNET --dport 138 -j ACCEPT
        #
# SMB - (139/TCP) Netbios SSN access
        $IPTABLES -A lan-if -p tcp -s $LANSUBNET --dport 139 -j ACCEPT
        #
# MySQL JDBC - (3306/TCP) JDBC access
        $IPTABLES -A lan-if -p tcp -s $LANSUBNET --dport 3306 -j ACCEPT
        #
# Servlet - (8080/TCP) Servlet access
        $IPTABLES -A lan-if -p tcp -s $LANSUBNET --dport 8080 -j ACCEPT
        #
# Servlet - (8081/TCP) Servlet access
        $IPTABLES -A lan-if -p tcp -s $LANSUBNET --dport 8081 -j ACCEPT
        #
# SFTP - (115/TCP) Secure ftp (over ssh)
        $IPTABLES -A lan-if -p tcp -s $LANSUBNET --dport sftp -j ACCEPT
        #
# ICMP Chain Jump
        $IPTABLES -A lan-if -j icmp-acc
        #
# Allow related packets
        $IPTABLES -A lan-if -p tcp -m state --state ESTABLISHED,RELATED -j
ACCEPT
        #

        $IPTABLES -A lan-if -m limit --limit 3/minute --limit-burst 3 -j LOG
 \ --log-level DEBUG --log-prefix "IPT lan-if packet died: "
# Reject remaining traffic
        $IPTABLES -A lan-if -j blocked
        #
############################################################################
#
# $ECHO "Building LAN Interface to LAN Chain"
#
 ---------------------------------------------------------------------------
-
 #
# IFLAN
#
# This chain handles all traffic from the firewall to the rest of the LAN
#
# Accept all traffic
        $IPTABLES -A if-lan -j ACCEPT
        #
        $IPTABLES -A if-lan -m limit --limit 3/minute --limit-burst 3 -j LOG
 \ --log-level DEBUG --log-prefix "IPT if-lan packet died: "


All the $ variables are correct, I have checked them carefully. Can anyone
see what I am missing?

thanks

David

-------------------------------------------------------


