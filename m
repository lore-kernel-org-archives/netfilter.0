From: Christian Recktenwald <netfilter-dist@citecs.de>
Subject: MASQ,FTP,portbased routing
Date: Fri, 25 Oct 2002 17:24:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021025172417.A19907@MrFabulous.citecs>
Reply-To: Christian Recktenwald <netfilter-dist@citecs.de>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org
Cc: Christian Recktenwald <netfilter-dist@citecs.de>

I have two wan links:
	line 1 (attached to $IF_EXT) has to carry things like dns, ssh, etc
	line 2 (attached to $IF_EXT2) has to be used by http and ftp (!)

Setup:
 1		default route points to line 1
 2		# for both lines we need masquerading:
 3		iptables -t nat -p tcp -A POSTROUTING -j MASQUERADE -s $NET_INT -d $ANYWHERE -o $IF_EXT
 4		iptables -t nat -p tcp -A POSTROUTING -j MASQUERADE -s $NET_INT -d $ANYWHERE -o $IF_EXT2
 5		# enable forwarding
 6		iptables -A FORWARD -j ACCEPT -m state --state ESTABLISHED,RELATED
 7		# mark http packets:
 8		iptables -t mangle -A PREROUTING -j MARK --set-mark 1 -p tcp -s $WWW_PROXY --dport 80
   
 9		echo 201 http.out >> /etc/iproute2/rt_tables
10		ip rule add fwmark 1 table http.out
11		ip route add default via $PROVIDER_GW2 dev $IF_EXT2 table http.out
12		ip route flush cache
   
13		echo 0 > /proc/sys/net/ipv4/conf/$IF_EXT2/rp_filter
        
ip_conntrack_ftp and ip_net_ftp are loaded

Works fine. Now FTP:
	(just need to change lines 6+7)
 6  # mark ftp packets:
 7  iptables -t mangle -A PREROUTING -j MARK --set-mark 1 -p tcp -s $FTP_PROXY --dport 21

Works fine for control session, but not for FTP-DATA.
The FTP control connection transmits "PORT 80,138,185,5,13,29".
80.138.185.5 is the address of $IF_EXT2. -> NAT works.
13,29 means port 3357. Now, the FTP server connects back:
	129.69.2.131 20 > 80.138.185.5 3357 S - ok
NAT backconnect:
	129.69.2.131 3357 > 10.0.1.2 20 S - ok
Client answers:
	10.0.1.2 20 > 129.69.2.131 3357 SA - ok
after NAT:
	 80.138.185.5 3357 > 129.69.2.131 20 SA - ok
*BUT*: this comes from $IF_EXT. So we would have asymmetric
routing which is not suitable here.

Source address based routing doesn't help as the routing decision
has already taken place (POSTROUTING).

So my question is:
	How to set up port based routing for FTP?

TIA, Chris

-- 
Christian Recktenwald      :                         :
citecs GmbH                : netfilter-dist@citecs.de:
Unternehmensberatung fuer  : voice +49 711 601 2090  : Burgstallstrasse 54
EDV und Telekommunikation  : fax   +49 711 601 2092  : D-70199 Stuttgart

