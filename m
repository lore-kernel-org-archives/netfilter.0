From: Barry Skidmore <skidmore@worldvenue.org>
Subject: iptables and smtp
Date: Fri, 07 May 2004 12:10:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083949806.710.239.camel@worldvenue.org>
Reply-To: skidmore@worldvenue.org
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
To: netfilter@lists.netfilter.org

I am experimenting with Trustix-2.1 Linux on a home machine connected
directly to the Internet.  I am using Postfix as the MTA and mutt as the
email client.

The problem is that I am not able to receive mail, although I can send,
when the iptables rules below are implemented.  I have tried a couple of
rules (see below) to open port 25, but these have not helped.

Thanks,
Barry Skidmore

====================================================================

# Set up iptables firewall
#clean up existing rules to start with a clean slate.
 #flush existing rules
iptables -t filter -F
iptables -t nat -F
iptables -t mangle -F
 #delete custom chains.
iptables -X
 #reset packet counters.
iptables -t filter -Z
iptables -t nat -Z
iptables -t mangle -Z
 #set default policies.
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

#INPUT rules.
 #drop all invalid incoming packets regardless of source or interface.
iptables -A INPUT -m state --state INVALID -j DROP
 #accept all input from the loopback device.
iptables -A INPUT -i lo -j ACCEPT
 #accept traffic from all other interfaces only if it's already
established.
 #or related to existing connections.
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
 #drop everything else.
iptables -A INPUT -j DROP

#FORWARD rules
 #drop all invalid forward packets regardless of source or destination.
iptables -A FORWARD -m state --state INVALID -j DROP
 #forward all from the loopback device.
iptables -A FORWARD -i lo -j ACCEPT
 #forward traffic from all other interfaces only if it's already
established
 #or related to existing connections.
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
 #drop everything else.
iptables -A FORWARD -j DROP

#OUTPUT rules
 #drop all outgoing invalid packets.
iptables -A OUTPUT -m state --state INVALID -j DROP
 #outgoing traffic is allowed without restriction.
iptables -A OUTPUT -j ACCEPT
#===============================================================
# The following uncommented did not help
#Set up smtp server and client
 #server
#iptables -A INPUT -p TCP --dport 25 -j ACCEPT
#iptables -A OUTPUT -p TCP --sport 25 -j ACCEPT
 #client
#iptables -A OUTPUT -p TCP --dport 25 -j ACCEPT 
#
#===============================================================
# The following uncommented did not help
#iptables -A INPUT -p tcp -m tcp --dport smtp -m state --state
NEW,ESTABLISHED -j ACCEPT
#iptables -A INPUT -p tcp -m tcp --sport auth -m state --state
ESTABLISHED -j ACCEPT



