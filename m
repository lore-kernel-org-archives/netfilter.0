From: Ronny Fauth <jadefalkner@imperium-noctem.de>
Subject: Re: Problems with Portforwarding
Date: Mon, 15 Mar 2004 23:31:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40562EC9.5050604@imperium-noctem.de>
References: <405624A2.60906@imperium-noctem.de> <200403152159.27405.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403152159.27405.Antony@Soft-Solutions.co.uk>
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

Antony Stone wrote:

> 1. How are you testing these rules?
>
>  
>
Well, i'm trying to connect via the Inet to one of these Ports.... how 
else can i test something like that?

> 2. What does "iptables -L -nvx; iptables -L -t nat -nvx" show for 
> these rules - do the packet/byte counters show that any packets are 
> being processed?
>  
>
yes, the counter gets higher after every refused connection

here's a bigger part of the Firewallscript and the the "iptables -L 
-nvx; iptables -L -t nat -nvx"

#
#  Rule 0(NAT)
#
#
$IPTABLES -t nat -A POSTROUTING -o ppp0  -s 192.168.0.0/16 -j MASQUERADE
#
#


$IPTABLES -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

#
# Rule 0(global)
#
# SSH Zugang zur Firewall
#
$IPTABLES -A INPUT -p tcp  -d $interface_ppp0  --destination-port 22  -m 
state --state NEW  -j ACCEPT
$IPTABLES -A INPUT -p tcp  -d 160.0.0.1  --destination-port 22  -m state 
--state NEW  -j ACCEPT
$IPTABLES -A INPUT -p tcp  -d 192.168.0.1  --destination-port 22  -m 
state --state NEW  -j ACCEPT
#

# TEST Zugang zum BOT
#
$IPTABLES -A INPUT -p tcp  -d $interface_ppp0  --destination-port 4662  
-m state --state NEW  -j ACCEPT
$IPTABLES -A INPUT -p tcp  -d 160.0.0.1  --destination-port 4662  -m 
state --state NEW  -j ACCEPT
$IPTABLES -A INPUT -p tcp  -d 192.168.0.1  --destination-port 4662  -m 
state --state NEW  -j ACCEPT
#

# Rule 1(global)
#
# 'masquerading' Regel
#
$IPTABLES -A INPUT  -s 192.168.0.0/16  -m state --state NEW  -j ACCEPT
$IPTABLES -A OUTPUT  -s 192.168.0.0/16  -m state --state NEW  -j ACCEPT
$IPTABLES -A FORWARD  -s 192.168.0.0/16  -m state --state NEW  -j ACCEPT
#
# Rule 2(global)
#
# 'catch all' Regel
#
$IPTABLES -N RULE_2
$IPTABLES -A OUTPUT  -m state --state NEW  -j RULE_2
$IPTABLES -A INPUT  -m state --state NEW  -j RULE_2
$IPTABLES -A FORWARD  -m state --state NEW  -j RULE_2
#$IPTABLES -A RULE_2  -j LOG  --log-level info --log-prefix "RULE 2 -- 
ACCEPT "
$IPTABLES -A RULE_2  -j ACCEPT
#
$IPTABLES -t nat -A PREROUTING -j DNAT -p tcp -s 0/0 --dport 4662 -i 
ppp0 --to-destination 192.168.0.2
$IPTABLES -A FORWARD -j ACCEPT -m state --state NEW,ESTABLISHED,RELATED 
-p tcp -s 0/0 -d 192.168.0.2

$IPTABLES -t nat -A PREROUTING -j DNAT -p tcp -s 0/0 --dport 4711 -i 
ppp0 --to-destination 192.168.0.2
$IPTABLES -A FORWARD -j ACCEPT -m state --state NEW,ESTABLISHED,RELATED 
-p tcp -s 0/0 -d 192.168.0.2

$IPTABLES -t nat -A PREROUTING -j DNAT -p tcp -s 0/0 --dport 4712 -i 
ppp0 --to-destination 192.168.0.3
$IPTABLES -A FORWARD -j ACCEPT -m state --state NEW,ESTABLISHED,RELATED 
-p tcp -s 0/0 -d 192.168.0.3

#
echo 1 > /proc/sys/net/ipv4/ip_forward
----------------------------------------------------------------------------------------------------------------------------- 




[test@Warhawk /]# iptables -L -nvx

Chain INPUT (policy DROP 0 packets, 0 bytes)
   pkts      bytes target     prot opt in     out     
source               destination
    170     9620 ACCEPT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0          state RELATED,ESTABLISHED
      0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            
80.135.234.34      tcp dpt:22 state NEW
      0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            
160.0.0.1          tcp dpt:22 state NEW
      0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            
192.168.0.1        tcp dpt:22 state NEW
      0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            
80.135.234.34      tcp dpt:4662 state NEW
      0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            
160.0.0.1          tcp dpt:4662 state NEW
      0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            
192.168.0.1        tcp dpt:4662 state NEW
      0        0 ACCEPT     all  --  *      *       192.168.0.0/16       
0.0.0.0/0          state NEW
      0        0 RULE_2     all  --  *      *       0.0.0.0/0            
0.0.0.0/0          state NEW

Chain FORWARD (policy DROP 0 packets, 0 bytes)
   pkts      bytes target     prot opt in     out     
source               destination
    239    87991 ACCEPT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0          state RELATED,ESTABLISHED
      9      432 ACCEPT     all  --  *      *       192.168.0.0/16       
0.0.0.0/0          state NEW
      2       96 RULE_2     all  --  *      *       0.0.0.0/0            
0.0.0.0/0          state NEW
      0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            
192.168.0.2        state NEW,RELATED,ESTABLISHED
      0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            
192.168.0.2        state NEW,RELATED,ESTABLISHED

Chain OUTPUT (policy DROP 0 packets, 0 bytes)
   pkts      bytes target     prot opt in     out     
source               destination
    147    14316 ACCEPT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0          state RELATED,ESTABLISHED
      0        0 ACCEPT     all  --  *      *       192.168.0.0/16       
0.0.0.0/0          state NEW
      0        0 RULE_2     all  --  *      *       0.0.0.0/0            
0.0.0.0/0          state NEW

Chain RULE_2 (3 references)
   pkts      bytes target     prot opt in     out     
source               destination
      2       96 ACCEPT     all  --  *      *       0.0.0.0/0            
0.0.0.0/0

-------------------------------------------------------------------------------------- 



[test@Warhawk /]# iptables -L -t nat -nvx
Chain PREROUTING (policy ACCEPT 54819 packets, 3278426 bytes)
   pkts      bytes target     prot opt in     out     
source               destination
      5      264 DNAT       tcp  --  ppp0   *       0.0.0.0/0            
0.0.0.0/0          tcp dpt:4662 to:192.168.0.2
      0        0 DNAT       tcp  --  ppp0   *       0.0.0.0/0            
0.0.0.0/0          tcp dpt:4711 to:192.168.0.2
      0        0 DNAT       tcp  --  ppp0   *       0.0.0.0/0            
0.0.0.0/0          tcp dpt:4712 to:192.168.0.3

Chain POSTROUTING (policy ACCEPT 5561 packets, 306745 bytes)
   pkts      bytes target     prot opt in     out     
source               destination
     63     3024 MASQUERADE  all  --  *      ppp0    
192.168.0.0/16       0.0.0.0/0

Chain OUTPUT (policy ACCEPT 2162 packets, 135099 bytes)
   pkts      bytes target     prot opt in     out     
source               destination

Sorry Antony, don't know why my mailclient sent the first mail only to you

