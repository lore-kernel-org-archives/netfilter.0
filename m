From: Askar <askarali@gmail.com>
Subject: firewall on dns server
Date: Wed, 19 Jan 2005 10:52:44 +0500
Message-ID: <a0f69e50501182152e8fce13@mail.gmail.com>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

Greetings, I'm pasting my firewall script which is running on our
company cache only dns server (serving more then 700+ users), this
server uses one of our company primary dns server as "Forwarder".
what I want gurus in this list give a look to it and let me know if im
missing something or doing any mistake.
OS: slackware kernel 2.6.10, netfilter compiled in kernel.
###script 
# Remove any existing rules from all chains
# traceroute usually uses -S 32769:65535 -D 33434:33523
TRACEROUTE_SRC_PORTS="32769:65535"
TRACEROUTE_DEST_PORTS="33434:33523"

#Clear \ Flush all the rules from the different chains and tables

iptables --flush
iptables --flush INPUT            #Flush the INPUT chain
iptables --flush OUTPUT           #Flush the OUTPUT chain
iptables --flush FORWARD          #Flush the FORWARD chain
iptables -t nat --flush           #Flush the nat table
iptables -t mangle --flush        #Flush the mangle table
iptables --delete-chain           #Delete any pre-existing chains
iptables -t nat --delete-chain    #Delete any pre-existing chains from nat table
iptables -t mangle --delete-chain #Delete any pre-existing chains from
the mangle table

#Setting the default Policies for the chains
iptables --policy INPUT DROP      #Setting the default policy for INPUT chain
iptables --policy FORWARD DROP    #Setting the default plicy for FORWARD chain
iptables --policy OUTPUT DROP     #Setting the default policy for the
OUTPUT chain

# Unlimited traffic on the loopback interface
# Do immediately in case of firewall script errors!
iptables -A INPUT  -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# furtive port scan
iptables -A INPUT -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit
--limit 1/s -j ACCEPT
###############################################################
# Using Connection State to By-pass Rule Checking

iptables -A INPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
###############################################################
# Source Address Spoofing and Other Bad Addresses
# Refuse packets claiming to be from the loopback interface (martian)
iptables -A INPUT    -s 127.0.0.1 -j DROP
iptables -A FORWARD  -s 127.0.0.1 -j DROP
###############################################################
iptables -A INPUT -m state --state INVALID -j LOG --log-prefix "INVALID input: "
iptables -A INPUT -m state --state INVALID -j DROP
iptables -A OUTPUT -m state --state INVALID -j LOG --log-prefix
"INVALID output: "
iptables -A OUTPUT -m state --state INVALID -j DROP

##################################################################################
## allow ssh from trusted IPs
iptables -A INPUT -i eth0 -s xxx.xxx.xxx.x -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A INPUT -i eth0 -s xxx.xxx.xxx.x -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A INPUT -i eth0 -s xxx.xxx.xxx.x -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A INPUT -i eth0 -s xxx.xxx.xxx.x -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A INPUT -i eth0 -s xxx.xxx.xxx.x -p tcp -m tcp --dport 22 -j ACCEPT
#################################################################
iptables -A INPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p tcp --dport 53 -j ACCEPT
################################################################
iptables -A OUTPUT -s 0/0 -d 0/0 -p tcp --dport 53 -j ACCEPT
iptables -A OUTPUT -s 0/0 -d 0/0 -p udp --dport 53 -j ACCEPT
########### Allow Traceroute
iptables -A OUTPUT -o eth0 -p udp --sport $TRACEROUTE_SRC_PORTS
--dport $TRACEROUTE_DEST_PORTS -m state --stat
e NEW -j ACCEPT
########### Allow WHOIS
iptables -A OUTPUT -o eth0 -p tcp --dport 43 -m state --state NEW -j ACCEPT

### End script

regards
Askar
-- 
(after bouncing head on desk for days trying to get mine working, I'll make
your life a little easier)

