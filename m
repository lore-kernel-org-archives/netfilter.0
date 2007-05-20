From: William Perry <wlperry@williamperry.com>
Subject: no connection
Date: Sat, 19 May 2007 19:53:55 -0700
Message-ID: <464FB843.5030605@williamperry.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I am using the following iptables script:
# eth0 is the Local network
# eth1 is the External network
 
*filter
:INPUT   DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT  DROP [0:0]
 
#allow traffic from the firewall to go out
-A FORWARD -i eth0 -o eth1 -j ACCEPT
-A FORWARD -i eth1 -o eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
 
# allow local loopback connections
-A INPUT -i lo -j ACCEPT
-A OUTPUT -o lo -j ACCEPT
 
# Allow all connections to the local network
-A INPUT -i eth0 -s 123.123.123.0/24 -j ACCEPT
-A OUTPUT -o eth0 -d 123.123.123.0/24 -j ACCEPT
 
# drop INVALID connections
-A INPUT   -m state --state INVALID -j DROP
-A OUTPUT  -m state --state INVALID -j DROP
-A FORWARD -m state --state INVALID -j DROP
 
# allow all established and related
-A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
-A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
 
# allow connectionsto my ISP's DNS servers
-A OUTPUT   -d 206.13.31.12 -m state --state NEW -p udp --dport 53 -o 
eth1 -j ACCEPT
-A FORWARD  -d 206.13.31.12 -m state --state NEW -p udp --dport 53 -i 
eth0 -o eth1 -j ACCEPT
 
-A OUTPUT   -d 206.13.28.12 -m state --state NEW -p udp --dport 53 -o 
eth1 -j ACCEPT
-A FORWARD  -d 206.13.28.12 -m state --state NEW -p udp --dport 53 -i 
eth0 -o eth1 -j ACCEPT
 
# allow outgoing conections web servers
-A OUTPUT  -d 0/0 -m state --state NEW,ESTABLISHED,RELATED -p tcp 
--dport http -o eth1 -j ACCEPT
-A FORWARD -d 0/0 -m state --state NEW,ESTABLISHED,RELATED -p tcp 
--dport http -o eth1 -i eth0 -j ACCEPT
 
-A OUTPUT  -d 0/0 -m state --state NEW,ESTABLISHED,RELATED -p tcp 
--dport https -o eth1 -j ACCEPT
-A FORWARD -d 0/0 -m state --state NEW,ESTABLISHED,RELATED -p tcp 
--dport https -o eth1 -i eth0 -j ACCEPT
 
# allow outgoing conections ntp
-A OUTPUT  -d 0/0 -m state --state NEW,ESTABLISHED,RELATED -p tcp 
--dport 123 -o eth1 -j ACCEPT
-A FORWARD -d 0/0 -m state --state NEW,ESTABLISHED,RELATED -p tcp 
--dport 123 -o eth1 -i eth0 -j ACCEPT
 
# Log all other attempts to out-going connection
-A OUTPUT   -o eth1 -j LOG --log-level info --log-prefix "[ATTEMPTED] "
-A FORWARD  -o eth1 -j ACCEPT
 
-A FORWARD  -j LOG --log-level info --log-prefix "[FWD-] "
-A FORWARD  -o eth0 -j ACCEPT
 
COMMIT
 
*nat
-A POSTROUTING -o eth1 -j SNAT --to 71.133.232.116
 
#port forward port 80
-A PREROUTING -d 71.133.232.116 -i eth1 -p tcp -m tcp --dport 80 -j DNAT 
--to-destination 123.123.123.2:80
 
COMMIT
 
#----
I was expecting the firewall (external ip 71.133.232.116) to send the 
packets to the web server (123.123.123.2), but it appears that the 
packets are not going anywhere.

Test:
use a machine whose gateway is not 71.133.232.116 and execute:
wget http://71.133.232.116/

1. On the log file of the firewall, I see a log record indicating that 
the "[FWD-]" log was hit.
2. On the web server, I see no record in the access log file.
3. No response is received to the wget command.

Isn't the prerouting command enough to get the packets to go? What do I 
need to do to get iptables to actually send the packet?
-- 
William Perry


