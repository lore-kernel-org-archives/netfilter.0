From: Johnoel Ancheta <johnoel@hawaii.edu>
Subject: PPTP server behind firewall
Date: Mon, 23 Jun 2003 14:38:33 -1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <b5413b5db8.b5db8b5413@hawaii.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-language: en
Content-Disposition: inline
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

hi all,

i am having some problems getting the pptp server working 
behind the firewall.

What i've done so far.

got the linux-2.4.20
got patch-o-matic-20030107 and patched with pptp
got iptables-1.8

compiled the kernel with GRE and PPTP support
recompiled iptables 1.8

set these rules: right now i don't care about security
/etc/iptables -P INPUT ACCEPT
/etc/iptables -F INPUT
/etc/iptables -P OUTPUT ACCEPT
/etc/iptables -F OUTPUT
/etc/iptables -P FORWARD ACCEPT
/etc/iptables -F FORWARD
/etc/iptables -t nat -F

#Note eth0 has public ip 
#          eth1  private network                                       
                                                                       
                                         
/etc/iptables -A FORWARD -i eth0 -o eth1 -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT
/etc/iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
                                                                       
                                                                       
             
/etc/iptables -t nat -A PREROUTING --dport 1723 -j LOG
/etc/iptables -t nat -A PREROUTING -p 47 -j LOG
/etc/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 1723 -j DNAT
--to-destination 192.168.0.2:1723
/etc/iptables -t nat -A PREROUTING -i eth0 -p 47 -j DNAT
--to-destination 192.168.0.2
                                                                       
                                                                       
             
/etc/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

/etc/echo "1" > /proc/sys/net/ipv4/ip_forward

so if i try the connection i get an Error 721 (Windows XP).  i checked
the vpn server and i doesn't get the request to login from
the Event log.  i'm sure the vpn server is working okay since
i can log in from inside the private network.

i think that the rules i used are wrong.



