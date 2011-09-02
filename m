From: "Julio A. Romero" <julioarr@fisica.uh.cu>
Subject: DHCP request behavior in my particular FORWARD configuration
Date: Thu, 1 Sep 2011 21:55:32 -0400
Message-ID: <001A9DB93A594CC4B78CC0951AEB1E8A@poweredge1800>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

Hi all, what happen with DHCP requests trying to forward below?



Thanks,

julio





##################################################################

# ipv4 - policies configuration - zero all - flush all chains - delete 
defined chains #
#################################################################
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP
iptables -t raw -P OUTPUT ACCEPT
iptables -t raw -P PREROUTING ACCEPT
iptables -t mangle -P INPUT ACCEPT
iptables -t mangle -P FORWARD ACCEPT
iptables -t mangle -P OUTPUT ACCEPT
iptables -t mangle -P PREROUTING ACCEPT
iptables -t mangle -P POSTROUTING ACCEPT
iptables -Z
iptables -F
iptables -X
iptables -t nat -Z
iptables -t nat -F
iptables -t nat -X
iptables -t raw -Z
iptables -t raw -F
iptables -t raw -X
iptables -t mangle -Z
iptables -t mangle -F
iptables -t mangle -X
#######
# END #
#######


##########################
# ipv4 - FILTER - srcnetfilter  #
#########################
# SRCNETFILTER RULES
#
# Create srcnetfilter
iptables -N srcnetfilter
# Return to back the connections from trust networks
iptables -A srcnetfilter -s $NETWORKS -j RETURN
# Deny all other traffic
iptables -A srcnetfilter -j DROP
#######
# END #
#######

##########################
# ipv4 - FILTER - dstnetfilter  #
#########################
# DSTNETFILTER RULES
#
# Create dstnetfilter
iptables -N dstnetfilter
# Return to back the connections toward trust networks
iptables -A dstnetfilter -d $NETWORKS -j RETURN
# Deny all other traffic
iptables -A dstnetfilter -j DROP
#######
# END #
#######

########################
# ipv4 - FILTER - average   #
#######################
# AVERAGE RULES
#
# Create average
iptables -N average
# Maximum limit of global connections
iptables -A average -m connlimit --connlimit-mask 0 \
--connlimit-above $GLOBAL_CONNECTIONS -j LOG --log-prefix 
"FW:average:GCs>LIMIT "
iptables -A average -m connlimit --connlimit-mask 0 \
--connlimit-above $GLOBAL_CONNECTIONS -j REJECT
# Restrict the number of parallel connections per client IP
iptables -A average -m connlimit --connlimit-mask 32 \
--connlimit-above $CONNECTIONS_PER_IP -j LOG --log-prefix 
"FW:average:CCs>LIMIT "
iptables -A average -m connlimit --connlimit-mask 32 \
--connlimit-above $CONNECTIONS_PER_IP -j REJECT
# Global traffic rate average
iptables -A average -m fuzzy --lower-limit $LOWER_LIMIT \
--upper-limit $UPPER_LIMIT -j LOG --log-prefix "FW:average:GTRA:REJECT "
iptables -A average -m fuzzy --lower-limit $LOWER_LIMIT \
--upper-limit $UPPER_LIMIT -j REJECT
# Traffic rate control above the lower limit per client IP
iptables -A average -m connlimit --connlimit-mask 32 \
! --connlimit-above $CONNECTIONS_PER_IP -m fuzzy \
--lower-limit $LOWER_LIMIT_PER_IP --upper-limit $UPPER_LIMIT_PER_IP \
-j LOG --log-prefix "FW:average:TRC_PIP:REJECT "
iptables -A average -m connlimit --connlimit-mask 32 \
! --connlimit-above $CONNECTIONS_PER_IP -m fuzzy \
--lower-limit $LOWER_LIMIT_PER_IP --upper-limit $UPPER_LIMIT_PER_IP -j 
REJECT
# Allow the traffic below the lower limit per client IP
iptables -A average -m hashlimit --hashlimit-mode srcip --hashlimit-srcmask 
32 \
--hashlimit-upto $FREE_PACKETS --hashlimit-burst $BURST \
--hashlimit-name average -j ACCEPT
#######
# END #
#######

############################
# ipv4 - FILTER - netfilter_fwd  #
###########################
# NETFILTER_FWD RULES
#
# Create netfilter_fwd
iptables -N netfilter_fwd
# LOG and DROP untrue connections
iptables -A netfilter_fwd -s $GW_NETWORKS -j LOG --log-prefix "FW:FWD:BOX->* 
"
iptables -A netfilter_fwd -s $GW_NETWORKS -j DROP
iptables -A netfilter_fwd -d $GW_NETWORKS -j LOG --log-prefix "FW:FWD:*->BOX 
"
iptables -A netfilter_fwd -d $GW_NETWORKS -j DROP
iptables -A netfilter_fwd -i $INT_IFACEs -o $EXT_IFACEs -d $INT_NETWORKS -j 
LOG \
--log-prefix "FW:FWD:I->E:dst:INT_NET "
iptables -A netfilter_fwd -i $INT_IFACEs -o $EXT_IFACEs -d $INT_NETWORKS -j 
DROP
iptables -A netfilter_fwd -i $EXT_IFACEs -o $INT_IFACEs -s $INT_NETWORKS -j 
LOG \
--log-prefix "FW:FWD:E->I:src:INT_NET "
iptables -A netfilter_fwd -i $EXT_IFACEs -o $INT_IFACEs -s $INT_NETWORKS -j 
DROP
# Send outgoing traffic to dstnetfilter for validation of the destination
iptables -A netfilter_fwd -i $INT_IFACEs -o $EXT_IFACEs -s $INT_NETWORKS -g 
dstnetfilter
# Send incoming traffic to srcnetfilter for validation of the source
iptables -A netfilter_fwd -i $EXT_IFACEs -o $INT_IFACEs -d $INT_NETWORKS -g 
srcnetfilter
# LOG and DROP all other traffic
iptables -A netfilter_fwd -j LOG --log-prefix "FW:FWD:netfilter_fwd:? "
iptables -A netfilter_fwd -j DROP
#######
# END #
#######

... more chains of filter table... (udpport, tcpport, icmpfilter, tcpfilter, 
udpfilter, netfilter_out, netfilter_in, INPUT, OUTPUT)

###########################
# ipv4 - FILTER - FORWARD  #
##########################
# FORWARD RULES
#
# Forward all traffic to netfilter_fwd
iptables -A FORWARD -j netfilter_fwd
# Allow (established|related) connections in returned traffic of 
netfilter_fwd
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
# Send all other ICMP returned packets to icmpfilter
iptables -A FORWARD -p icmp -g icmpfilter
# Send all other UDP returned packets to udpport
iptables -A FORWARD -p udp -g udpport
# Send all other TCP returned packets to tcpport
iptables -A FORWARD -p tcp -g tcpport
# Send all other returned fragmented packets to average
iptables -A FORWARD -f -j average
# Log for debugger
iptables -A FORWARD -j LOG --log-prefix "FW:FWD:? "
#######
# END #
####### 

