From: Kirk <whereisgui@gmail.com>
Subject: Confused about NAT and forwarding
Date: Tue, 22 Feb 2005 14:24:03 -0800
Message-ID: <48be50bb050222142429a5be8f@mail.gmail.com>
Reply-To: Kirk <whereisgui@gmail.com>
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

Hello,

I'm a bit confused about how NAT and forwarding works. Here's  the situation:

I have a proxy server and a web server behind a firewall/gateway. The
proxy and the web server now have private addresses but they used to
have public addresses. Since I can't make changes to the DNS server, I
added those two old addresses to the firewall's eth0 interface and
then I added the following rules to iptables:

*filter
#http requests
-A FORWARD -i eth0 -o eth1 -p tcp --syn -d 192.168.0.3 --dport 80 -j ACCEPT
-A FORWARD -i eth0 -o eth1 -p tcp --syn -d 192.168.0.3 --dport 443 -j ACCEPT

#Ezproxy
-A FORWARD -i eth0 -o eth1 -p tcp --syn -d 192.168.0.2 --dport 2048 -j ACCEPT
COMMIT

*nat
#forwarding and NAT
-A POSTROUTING -o eth0 -j SNAT --to FIREWALL_IP

#web server
-I PREROUTING -i eth0 -p tcp -d OLD_WEB_IP --dport  80  -j DNAT --to
192.168.0.3:80
-I PREROUTING -i eth0 -p tcp -d OLD_WEB_IP --dport  443 -j DNAT --to
192.168.0.3:443

#Ezproxy
-I PREROUTING -i eth0 -p tcp -d PROXY_IP --dport  2048 -j DNAT --to
192.168.0.2:2048
COMMIT

The proxy server authenticates users by connecting to a database
that's not behind the firewall. I looked at the log files of the
database server and I noticed that the firewall's IP address is the
one that's showing up instead of the address of the proxy server.

I just read the NAT howto from netfilter.org and I guess this line the
responsible for that behavior.
-A POSTROUTING -o eth0 -j SNAT --to FIREWALL_IP

Is it possible to make requests for PROXY_IP go out with the PROXY_IP
address instead of the FIREWALL_IP?
If so, how can I do that? Or where do I find info about what I want to do?

Thanks.

