From: "joe z" <securadd@hotmail.com>
Subject: attempting to transparently proxy with this script to no avail
Date: Mon, 07 Mar 2005 13:23:04 -0500
Message-ID: <BAY17-F37FBD7C9A60728124BBCE4DC5F0@phx.gbl>
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

hello all,
im attempting to run a transparent proxy with the iptables script below... 
to no avail. this box sits inline between the firewall and internal switch 
and everything works except the transparent proxy part. the box routes 
traffic properly and when i point the browser at the proxy on 8080, all 
good. proxy goes dansguardian -> squid -> privoxy. additionally i have snort 
inline running as well and that works. the box is fc2 and squid is installed 
via yum. 11.10 is internal and 11.8 faces the firewall. so far i have tried 
multiple combinations; when i comment out all rules except INPUT, OUTPUT, 
and FORWARD ACCEPT, all good; when i comment out the nat table lines and 
uncomment the mangle table and use the queue and snort, all good; when i 
comment out the mangle table and queue and uncomment the nat redirect 
(leaving commented the -j DROP) everything works, just not the proxy... in 
other words http passes through the box but it doesn't get sent to/through  
the proxy(i confirmed this with tcpdump) and, most interestingly, when i 
comment the redirect and uncomment the -j DROP, it doesn't drop http or 
anything for that matter(?). below is the script and the relevant squid.conf 
entries. any thoughts? am i missing something(obvious?) here?

/sbin/depmod -a
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_REDIRECT
#/sbin/modprobe ip_queue
iptables -F
iptables -t mangle -F
iptables -t nat -F
iptables -X

echo "1" > /proc/sys/net/ipv4/ip_forward

iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -t nat -P PREROUTING ACCEPT
#iptables -t mangle -P PREROUTING ACCEPT
#iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DROP
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT 
--to-port 8080
#iptables  -t mangle -A PREROUTING -j QUEUE



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

#and squid.conf=

httpd_accel_host virtual
httpd_accel_port 80
httpd_accel_single_host off
httpd_accel_with_proxy on
httpd_accel_uses_host_header on

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today - it's FREE! 
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/


