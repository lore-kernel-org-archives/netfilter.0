From: Peter Poulsen <peter_poulsen@stofanet.dk>
Subject: Redirect on first encounter
Date: Sat, 14 Feb 2004 09:57:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <402DE2EF.2010605@stofanet.dk>
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

I'm very new to netfilter and firewalls.

I have to set up a firewall that allows people to go on the Internet 
(dooh). The first time they go through it on port 80 I would like to 
redirect to the firewall itself (it also runs a webserver) which shows 
who is proveding the Internet access.

I have almost got it working. The first time I tries to request a page I 
get redirect, and all other pages gets delivered as expected. The only 
problem is that if my first request is "www.google.com" all other 
requests to "www.google.com" also gets redirect to the firewall. I only 
planed for the first one to get redirected.

Can anybody tell how to fix this.


This is my script so far:

EXTIF="eth0"
INTIF="eth1"
INTNET="192.168.100.0/24"
EXTIP="192.168.1.48"
INTIP="192.168.100.1"

echo "1" > /proc/sys/net/ipv4/ip_forward

/sbin/iptables -P INPUT DROP
/sbin/iptables -F INPUT
/sbin/iptables -P OUTPUT DROP
/sbin/iptables -F OUTPUT
/sbin/iptables -P FORWARD DROP
/sbin/iptables -F FORWARD
/sbin/iptables -F -t nat

/sbin/iptables -F log-and-accept
/sbin/iptables -t nat -F log-and-accept
/sbin/iptables -F log-and-drop

/sbin/iptables -X
/sbin/iptables -t nat -X
/sbin/iptables -Z

# Everything should be clear now

/sbin/iptables -N log-and-accept
/sbin/iptables -A log-and-accept -j LOG --log-level info
/sbin/iptables -A log-and-accept -j ACCEPT

/sbin/iptables -t nat -N log-and-accept
/sbin/iptables -t nat -A log-and-accept -j LOG --log-level info
/sbin/iptables -t nat -A log-and-accept -j ACCEPT

/sbin/iptables -N log-and-drop
/sbin/iptables -A log-and-drop -j LOG --log-level info
/sbin/iptables -A log-and-drop -j DROP


# SSH
/sbin/iptables -A INPUT -i $EXTIF -p tcp -s 0.0.0.0/0 -d 0.0.0.0/0 
--dport 22 -j log-and-accept

# Ping
#/sbin/iptables -A INPUT -i $EXTIF -p ICMP -s 0.0.0.0/0 -d $EXTIP -j 
log-and-accept 


# Allow this machine to get on the internet
/sbin/iptables -A INPUT -i $EXTIF -s 0.0.0.0/0 -d $EXTIP -m state 
--state  ESTABISHED,RELATED -j log-and-accept

# Input
/sbin/iptables -A INPUT -i lo -s 0.0.0.0/0 -d 0.0.0.0/0 -j log-and-accept
/sbin/iptables -A INPUT -i $INTIF -s $INTNET -d 0.0.0.0/0 -j log-and-accept
/sbin/iptables -A INPUT -i $EXTIF -s $INTNET -d 0.0.0.0/0 -j log-and-drop
/sbin/iptables -A INPUT -s 0.0.0.0/0 -d 0.0.0.0/0 -j log-and-drop

# Output
/sbin/iptables -A OUTPUT -o lo -s 0.0.0.0/0 -d 0.0.0.0/0 -j log-and-accept
/sbin/iptables -A OUTPUT -o $INTIF -s $EXTIP -d $INTNET -j log-and-accept
/sbin/iptables -A OUTPUT -o $INTIF -s $INTIP -d $INTNET -j log-and-accept
/sbin/iptables -A OUTPUT -o $EXTIF -s 0.0.0.0/0 -d $INTNET -j log-and-drop
/sbin/iptables -A OUTPUT -o $EXTIF -s $EXTIP -d 0.0.0/0/0 -j log-and-accept

/sbin/iptables -A OUTPUT -s 0.0.0.0/0 -d 0.0.0.0/0 -j log-and-drop

# Forwarding ans Masqurading
/sbin/iptables -t nat -A PREROUTING -i $INTIF -p tcp --dport 80 -m state 
--state NEW --tcp-flags SYN,RST,ACK SYN -m limit --limit 1/hour 
--limit-burst 1 -j REDIRECT

/sbin/iptables -A FORWARD -i $EXTIF -o $INTIF -m state --state 
ESTABLISHED,RELATED -j log-and-accept
/sbin/iptables -A FORWARD -i $INTIF -o $EXTIF -j log-and-accept
/sbin/iptables -A FORWARD -j log-and-drop

/sbin/iptables -t nat -A POSTROUTING -o $EXTIF -j SNAT --to $EXTIP

