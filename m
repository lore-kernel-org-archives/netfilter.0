From: Uwe Eisner <Uwe.Eisner@globit.com>
Subject: SNAT does not work
Date: Thu, 06 Jun 2002 15:27:03 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CFF6327.5020306@globit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

Hi @ all,

I'm using a internal ip-range, wherefor I need NAT to connecting to the 
internet..

My problem is, that this rule does not work. When I start a Perl-code at 
the www, witch shows me my ip-address, it showes me the IP-address of 
the external interface of the router/firewall. I can not find the 
problem. If I set no POSTROUTING rule, it is the same game...

Is it possible, that NAT is not activeted at my kernel. How can I test it?

Hier a snippet of my roules:

# Delete all Rules (not the standard policy)
iptables -F

# --> SET ALL INPUT FLAGS <--
iptables -P INPUT DROP                                          # DROP 
all, if no rule matches
iptables -A INPUT -i eth0 -j ACCEPT                             # Every 
request, from the internal interface is allowed
iptables -A INPUT -s 141.12.0.0/16 -j ACCEPT                    # Every 
request, from the GMD-LAN is allowed

# --> SET ALL FORWARD FLAGS <--
iptables -P FORWARD DROP                                        # DROP 
all, if no rule matches
iptables -A FORWARD -s 192.168.0.0/16 -j ACCEPT
iptables -A FORWARD -d 192.168.0.0/16 -m state --state 
ESTABLISHED,RELATED -j ACCEPT

# --> SET ALL OUTPUT FLAGS <--
iptables -P OUTPUT ACCEPT                                       # ACCEPT 
all, if no rule matches

# --> MASQUARDING <--
iptables -A POSTROUTING -t nat -o eth1 -j SNAT --to-source 141.12.218.99

# 141.12.218.3 => 192.168.1.3 ==> MAIL.globit.com (DA-WEB01)
# ========================================================================
iptables -A PREROUTING -t nat -d 141.12.218.3 -j DNAT --to-destination 
192.168.1.3
iptables -A FORWARD -p tcp -d 192.168.1.3/32 --dport 25 -j ACCEPT       
## SMTP Port
iptables -A FORWARD -p tcp -d 192.168.1.3/32 --dport 110 -j ACCEPT      
## POP3 Port
iptables -A FORWARD -p tcp -d 192.168.1.3/32 --dport 143 -j ACCEPT      
## IMAP Port


Hope sameone can help me.

Thx and best regards
Uwe Eisner


