From: "joe z" <securadd@hotmail.com>
Subject: attempting to transparently proxy with this script to no avail
Date: Tue, 01 Mar 2005 17:03:12 -0500
Message-ID: <BAY17-F386CBFC183CD40C68DFE19DC590@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

this script runs everything fine just the redirect doesn't. the proxy works 
fine when browser pointed at it.

/sbin/depmod -a
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_REDIRECT

iptables -F
iptables -t mangle -F
iptables -t nat -F
iptables -X

echo "1" > /proc/sys/net/ipv4/ip_forward
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -t mangle -P PREROUTING ACCEPT
iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -A PREROUTING -m tcp -p tcp --dport 80 -j REDIRECT --to-port 
8080

ifdown eth1
ifdown eth0
ifup eth0
ifup eth1
ifconfig eth1 192.168.11.8 netmask 255.255.255.0
ifconfig eth0 192.168.11.10 netmask 255.255.255.0
ifconfig eth0 promisc
ifconfig eth1 promisc
ifconfig eth1 arp
ifconfig eth0 arp

route add 192.168.11.2 dev eth1
route add default gw 192.168.11.2

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today - it's FREE! 
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/


