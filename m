From: OTR Comm <otrcomm@isp-systems.com>
Subject: Virtual Interface & Ping Problem
Date: Sat, 08 Jun 2002 11:28:42 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D024CDA.F7A9F78E@isp-systems.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hello,

I am using iptables-1.2.6a on a Redhat Linux 7.3 system.

I am having problems pinging virtual interfaces with my firewall active.

I use ifconfig to create virtual interfaces on eth0, such as:

/sbin/ifconfig eth0:2 192.168.1.16 netmask 255.255.255.0

The IP for eth0 is 192.168.1.2 and I can ping this with the firewall
active.  However, when I try to ping 192.168.1.16, I get 'ping: sendto:
Operation not permitted'

...
$IPTABLES -N icmp_packets
...
$IPTABLES -A icmp_packets -p ICMP -s 0/0 -d 0/0 -j ACCEPT
...

Could somebody please let me know what I have forgotten in my firewall
or somewhere else?

I am not a member of the netfilter mail list, so if you could, please
reply directly vi eamil to otrcomm@isp-systems.com.

Thank you,
Murrah Boswell

