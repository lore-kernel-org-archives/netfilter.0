From: Tasha Smith <natasha3641@yahoo.com>
Subject: Logging Portscans
Date: Mon, 21 Oct 2002 02:39:12 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021021093912.87487.qmail@web40709.mail.yahoo.com>
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

Hii,
I was wandering why iptables is NOT logging to my /var/log/messages/ NMAPS
stealth port scans or when i telnet any port?.  Here are what the first part of
my rules look like. How can u add some rules soo i can see (LOG) all ports scans
or connection attemps on my machine????
iptables 1.2.7
kernel 2.4.19

iptables --flush
iptables -t nat --flush
iptables -t mangle --flush

iptables -A INPUT -i lo -j ACEPT
iptables -A OUTPUT -o lo -j ACCEPT

# I tryed to put in a logging rule here and it didnt log the port scan!
iptables -A INPUT -i eth0 -p tcp \
         --dport 111 -j LOG-prefix "DROP sunrpc: "

iptables --policy INPUT DROP
iptables --policy FORWARD DROP
iptables --policy OUTPUT ACCEPT

# I tryed a LOG Policy here too like this!
iptables -i INPUT -p tcp -j LOG --log-prefix "log-tcp-test: "

iptables -A INPUT -m state --state ESTABLSIHED,RELATED -j ACCEPT
iptables -A FOWARD -m state --state ESTABLSIHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLSIHED,RELATED -j ACCEPT

And then after this i have all stuff that is allowed on my machine like DNS,
DHCP, and my forwarding rules! 
 

__________________________________________________
Do you Yahoo!?
Y! Web Hosting - Let the expert host your web site
http://webhosting.yahoo.com/

