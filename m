From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: Bad Filter Set?
Date: Mon, 11 Nov 2002 14:35:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DCFB217.4030501@fugmann.dhs.org>
References: <004701c2867f$f176d2a0$d900a8c0@yamatto> <20021109144114.JEWN21275.mta07-svc.ntlworld.com@there> <008f01c2880f$2d2f5980$d900a8c0@yamatto> <20021109172906.WITS27595.mta05-svc.ntlworld.com@there> <002d01c2894a$71b1fb30$c600a8c0@yamatto>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dan Egli <dan@shortcircuit.dyndns.org>
Cc: netfilter@lists.netfilter.org

Dan Egli wrote:
> 
> 1) Block all ports EXCEPT:
> FTP, SSH, TELNET (yes there is a reason for telnet!), SMTP, DNS, NNTP, NTP,
> ROUTED (520), PRINTER (515), POP3, IMAP, HTTP, HTTPS, and ports 4000 & 5000
> (special programs run on those ports and they need to be open).
You do realize that many of these protocols are very insecure, and 
should not be opend to the public. Also do you really want to allow 
everyone (on the intra- and inter-net ) to use your printers?

> 
> 2) Forward Inbound traffic from port 5000 to IP 192.168.0.5. Should be a
> Transparent NAT (If I hit 192.168.0.1 port 5000, then the firewall forwards
> it to 192.168.0.5 5000,  and any packets sent from 192.168.0.5:5000 [which
> would only be in reply to an inbound packet] should appear as coming from
> 192.168.0.1:5000). Here's a basic setup of the machine so you have that to
> go on:
This is impossible. A machine with IP 192.168.0.6 cannot be redirected 
to 192.168.0.5 through 192.168.0.1. But in the example below, all 
connections to 64.122.31.38:5000 (through eth1) will be redirected to 
192.168.0.5.

> 
> EXTERNAL IP:  64.122.31.38 on eth1
> internal IP: 192.168.0.1 on eth0
> 
> 3) Perform basic IP Masquerading for unlisted machines on the 192.168.0.x
> net. So if a machine addressed as 192.168.0.26 requests www.yahoo.com, it
> goes in from eth0, then goes out eth1 as from eth1's address, and the return
> comes in eth1 and goes back out eth0 to the correct machine.
> 
> 4) Log any blocked traffic in the syslog.
> 
> Your help is greatly appreciated!
> 
Here is your rules. I have not tested them, so minor changes may be 
nessesary.
--------------------------------

# Set default policies.
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP

# Flush all tables.
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD
iptables -t NAT -F PREROUTING
iptables -t NAT -F POSTROUTING
iptables -t NAT -F OUTPUT

iptables -A INPUT -p tcp -m multiport --dports \
   SMTP,DNS,NNTP,NTP,ROUTED,520,PRINTER,POP3,IMAP,HTTP,\
   HTTPS,4000,5000 -j ACCEPT
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -j LOG

iptables -A FORWARD -i eth0 -j ACCEPT
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -j LOG

iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 5000 \
   -j DNAT --to-destination 192.168.0.5:5000

iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to-source 64.122.31.38

echo 1 > /proc/sys/net/ipv4/ip_forward
-------------------------

Regards
Anders Fugmann



