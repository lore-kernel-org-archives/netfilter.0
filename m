From: Yuwen Dai <yuwend@gmail.com>
Subject: internal host can not access hotmail
Date: Mon, 21 Feb 2005 20:58:49 +0800
Message-ID: <f7e5481105022104583d0d3b19@mail.gmail.com>
Reply-To: Yuwen Dai <yuwend@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Dear All,

As an ADSL dialup user, I setup a linux box as my home gateway. Other
computers can access the
internet via the gateway, but can not visit www.hotmail.com. When
opening www.hotmail.com in a web browser, the status bar of the
browser is "wait for loginpassport....", and no page shows up.

But I can successfully browse www.hotmail.com on the linux
gateway itself. This is /etc/ppp/ip-up.d/firewall:

EXTIF="ppp0"
INTIF="eth1"

/sbin/depmod -a
/sbin/insmod ip_tables 
/sbin/insmod ip_conntrack
/sbin/insmod ip_conntrack_ftp
/sbin/insmod ip_conntrack_irc
/sbin/insmod iptable_nat
/sbin/insmod ip_nat_ftp

echo "1" > /proc/sys/net/ipv4/ip_forward
echo "1" > /proc/sys/net/ipv4/ip_dynaddr

echo "   clearing any existing rules and setting default policy.."
       
$IPTABLES -P INPUT ACCEPT
$IPTABLES -F INPUT 
       
$IPTABLES -P OUTPUT ACCEPT 
$IPTABLES -F OUTPUT 
       
$IPTABLES -P FORWARD DROP 
       
$IPTABLES -F FORWARD

$IPTABLES -t nat -F 

echo "   FWD: Allow all connections OUT and only existing and related ones IN" 
       
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state \
ESTABLISHED,RELATED -j  ACCEPT
#$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT

$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT                              
       
$IPTABLES -A FORWARD -j LOG --log-level info

echo "   Enabling SNAT (MASQUERADE) functionality on $EXTIF"
       
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE 
       
echo -e "\nrc.firewall-2.4 v$FWVER done.\n" 

This is a very simple rule set that I copied from IPCHAINS-HOWTO.
System info:
# uname -a
Linux sarge 2.4.27-1-386 #1 Wed Dec 1 19:43:08 JST 2004 i686 GNU/Linux
# iptables --version
iptables v1.2.11

# ifconfig
eth0      Link encap:Ethernet  HWaddr 52:54:AB:57:87:9E  
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:771 errors:0 dropped:0 overruns:0 frame:0
          TX packets:799 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:298340 (291.3 KiB)  TX bytes:81617 (79.7 KiB)
          Interrupt:5 Base address:0xe400 

eth1      Link encap:Ethernet  HWaddr 00:0A:EB:7B:94:BB  
          inet addr:192.168.1.254  Bcast:192.168.1.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)
          Interrupt:11 Base address:0xe800 

ppp0      Link encap:Point-to-Point Protocol  
          inet addr:61.171.9.149  P-t-P:218.1.1.252  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1492  Metric:1
          RX packets:377 errors:0 dropped:0 overruns:0 frame:0
          TX packets:388 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:3 
          RX bytes:263828 (257.6 KiB)  TX bytes:47792 (46.6 KiB)


Furthermore, I installed Debian Woody on the same PC, and use the same
iptables rules.  Everything is OK. The Debian woody info:

Linux yuwen 2.4.18-686 #1 Sun Apr 14 11:32:47 EST 2002 i686 unknown
iptables v1.2.6a

Any advice to diagnose this problem?  I once thought maybe something
wrong with the FORWARD rules, and tried to log the blocked
packages. But there's no log info.

Thanks in advance.

Dai Yuwen

