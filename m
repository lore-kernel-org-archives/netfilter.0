From: cable linux <cablelinux@yahoo.com>
Subject: plz convert that script in iptables format
Date: Sat, 21 Jun 2003 20:48:05 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030622034805.6854.qmail@web14403.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

Q1. How can i implement below scanerio through
iptables?

### Flush previous rules
ipchains -F

### Deny input and forward policies
ipchains -P input ACCEPT
ipchains -P forward ACCEPT

### Check on incomming packets

ipchains -N ppp-in
ipchains -A input  -i ppp0  -j ppp-in

#Now, no packets coming in ppp0 should be claiming a
source address of 192.168.1.*,
#so we log and deny them
ipchains -A ppp-in -s 192.168.1.0/24 -l -j DENY

#UDP Packets Forward my Localip to DNS
ipchains -A ppp-in -p udp -s ip-dns domain -d $LOCALIP
domain -j ACCEPT
ipchains -A ppp-in -p udp -s ip-dns1 domain -d
$LOCALIP domain -j ACCEPT


ipchains -A ppp-in -p TCP -s proxy 8080 -d $LOCALIP 
-j ACCEPT
ipchains -A ppp-in -p TCP -s proxy 8080 -d $LOCALIP 
-j ACCEPT
ipchains -A ppp-in -p TCP -d $LOCALIP ftp -j ACCEPT

ipchains -A ppp-in -p TCP -s
gateway.messenger.hotmail.com 1863 -t 0x01 0x10
ipchains -A ppp-in -p TCP -s
gateway.messenger.hotmail.com 1863 -t 0x01 0x02




ipchains -A ppp-in -p icmp -s 0.0.0.0/0      -d
$LOCALIP -j ACCEPT


### Allow incoming tcp packets which are not sync
ipchains -A ppp-in -p TCP ! -y -j ACCEPT

### /sbin/ipchains -N lan-in
ipchains -N lan-in
ipchains -A input  -i eth0  -j lan-in
ipchains -A lan-in        -s 192.168.1.0   -d 0/0     
 -j ACCEPT
ipchains -A lan-in -p TCP -s 192.168.1.0/24 -d !
192.168.1.1 80 -j DENY
ipchains -A lan-in -p TCP  -s 192.168.1.0/24 -d 0/0   
   -j ACCEPT
ipchains -A lan-in -p icmp -s 192.168.1.0/24 -j ACCEPT
ipchains -A lan-in -p UDP  -s 192.168.1.0/24 -j ACCEPT
ipchains -A lan-in  -p TCP -s 192.168.1.0/24  -d
202.63.200.0/0      -j ACCEPT
ipchains -A lan-in  -p TCP -s 192.168.1.0/24  -d
202.63.192/0      -j ACCEPT
ipchains -A lan-in  -p UDP -s 192.168.1.0/24  -d
202.63.200.0/0      -j ACCEPT
ipchains -A lan-in  -p UDP -s 192.168.1.0/24  -d
202.63.192/0      -j ACCEPT
ipchains -A input -i lo -j ACCEPT


ipchains -A forward -p tcp -s 192.168.1.0/24 -d 0/0 
-t 0x01 0x10 -j MASQ
ipchains -A forward -p tcp -s 192.168.1.0/24 -d 0/0 
-t 0x01 0x02 -j MASQ
ipchains -A forward -s 192.168.1.0/24 -j MASQ


ipchains -A ppp-in -p  TCP -d 0/0 ssh -t 0x01 0x10
ipchains -A ppp-in  -p TCP -d 0/0 ssh -t 0x01 0x02



Q2. how can i implement below scanerio?

To configure your network for instant messaging and
file transfer

For instant messaging

To allow your network users to have a direct
connection to instant 
messaging services, you will need to: 

Open outgoing TCP connections to Port 1863 on your
proxy servers. 
Let your network users know which kind of proxy server
your network 
uses (HTTP, SOCKS4, or SOCKS5) and provide them with
the corresponding 
details (server name, port number, and so forth) so
they can enter that 
information on the Connection tab of the Options
dialog box (Tools, 
Options). Make sure the internal local area network
has access to the 
Domain Name System (DNS) servers to resolve the names
of external 
hosts such as messenger.msn.com.

For file transfer

Both incoming and outgoing TCP connections use this
range of 
ports: 6891 to 6900. This allows up to 10 simultaneous
file transfers 
per sender. If you open only Port 6891, users will be
able to do only 
one file transfer at a time.

The TCP ports need to be configured so that sockets on
a port remain 
open for extended periods of time.



__________________________________
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
http://sbc.yahoo.com

