From: "john bowers" <johnkbowers@hotmail.com>
Subject: Masquerade problems
Date: Mon, 15 Dec 2003 11:34:59 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY8-F102WSsKt3NwAY00036ab1@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi , I have a Nat/firewall box that  has worked beautifully for me for quite 
a while. The only thing I have not been able to fiigure out is that  I have 
never been able to initiate any kind of services from inside the firewall 
box to the local network. I can ssh from the local net into the firewall no 
problem, but if i try to ssh back into my local network it just disapears, 
but shows up in the iptables -v -L stats for the rules that would allow it 
as having passed the filter.  If I try to ping an address on my local 
private addressed network I just get the message "operation not allowed", or 
something of that sort.  I have a route for the local network entered in the 
routing table and actually routes for each of the individual host , but I 
don't know what is going on. Is this a routing problem or am I misusing the 
Masquerade function? when Any help would greatly be appreciated as I don't 
know where else to ask

Here is a abreviated portion of my Nat router rules.

iptables --flush
iptables -t nat --flush
iptables -t mangle --flush

iptables --delete-chain
iptables -t nat --delete-chain
iptables -t mangle --delete-chain

iptables --policy INPUT DROP
iptables --policy OUTPUT DROP
iptables --policy FORWARD DROP

iptables -t nat --policy POSTROUTING DROP

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
###############################################################################


iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE


################################################################################
# INPUT RULES

#RELATED & ESTABLISHED RULES
iptables -A INPUT -i ppp0 \
	-m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A OUTPUT -o ppp0 \
	-m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A OUTPUT -o eth0 \
	-m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A FORWARD -i ppp0 -o $LAN_INTERFACE \
	-m state --state ESTABLISHED,RELATED -j ACCEPT

###################################################################################
# Forward related, established rules

iptables -A FORWARD -i $LAN_INTERFACE -o ppp0 \
	-m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A FORWARD -o ppp0 \
	-m state --state ESTABLISHED,RELATED -j ACCEPT

_________________________________________________________________
Get holiday tips for festive fun. 
http://special.msn.com/network/happyholidays.armx


