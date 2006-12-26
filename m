From: Nandan Bhat <nlbhat@gmail.com>
Subject: Re: Port forwarding - what's wrong with my setup?
Date: Tue, 26 Dec 2006 17:31:54 +0530
Message-ID: <45910F32.8060705@gmail.com>
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
To: pascal.mail@plouf.fr.eu.org, netfilter@lists.netfilter.org

Hi Mr. Pascal,

Thanks for your response. I am sorry to have responded so late - I was 
out of the city and had no access.

I have modified some of my script statements according to your suggestions

I now have the port forwarding setup working to some extent.

On the 192.168.1.0/24 network, I am able to access the pop and smtp 
server located at 192.168.0.10

On the 192.168.1.0/24 network, I am able to access smtp, pop, ssh, http, 
mysql servers from within the same network.

Out of curiosity, I went over to the 192.168.0.0/24 network and tried to 
do a port scan for my server's external IP (192.168.0.176 - DHCP)
Using Look@LAN software on Windows XP, I saw ports 21, 25 and 110 
detected during the scan, but no ICMP reply.

My knee-jerk reaction was to edit the ICMP rule for INPUT. It was 
earlier above line 27.

But, what is causing ports 25 and 110 to be exposed on my server's IP?

Thanks once again,

Nandan

------ begin rc.firewall-iptables-stronger ------
01 $IPTABLES -P INPUT DROP
02 $IPTABLES -F INPUT
03 $IPTABLES -P OUTPUT DROP
04 $IPTABLES -F OUTPUT
05 $IPTABLES -P FORWARD DROP
06 $IPTABLES -F FORWARD
07 $IPTABLES -F -t nat
08 $IPTABLES -X
09 $IPTABLES -Z
10
11 $IPTABLES -N reject-and-log-it
12 $IPTABLES -A reject-and-log-it -j LOG --log-level info \
13  --log-prefix "iptables"
14 $IPTABLES -A reject-and-log-it -j REJECT
15
16 $IPTABLES -A INPUT -i lo -j ACCEPT
17
18 # for testing purpose only
19 $IPTABLES -A INPUT -p ICMP -j ACCEPT
20
21 $IPTABLES -A INPUT -i $INTIF -s $INTNET -d $UNIVERSE -j ACCEPT
22 $IPTABLES -A INPUT -i $EXTIF -s $INTNET -d $UNIVERSE -j reject-and-log-it
23 $IPTABLES -A INPUT -i $INTIF -s $INTNET -d $INTIP -p tcp -m multiport \
24  --dports 22,25,80,139,445,3306 -m state --state NEW -j ACCEPT
25 $IPTABLES -A INPUT -i $INTIF -s $INTNET -d $INTIP -p udp -m multiport \
26  --dports 137,138 -m state --state NEW -j ACCEPT
27 $IPTABLES -A INPUT -s $UNIVERSE -d $UNIVERSE -j reject-and-log-it
28
29 $IPTABLES -A OUTPUT -p ICMP -m state --state INVALID -j DROP
30 $IPTABLES -A OUTPUT -o lo -j ACCEPT
31 $IPTABLES -A OUTPUT -o $INTIF -s $INTIP -d $INTNET -j ACCEPT
32 $IPTABLES -A OUTPUT -o $EXTIF -s $UNIVERSE -d $INTNET -j 
reject-and-log-it
33 $IPTABLES -A OUTPUT -s $UNIVERSE -d $UNIVERSE -j reject-and-log-it
34
35 $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state \
36  --state ESTABLISHED,RELATED -j ACCEPT
37 $IPTABLES -A FORWARD -i $INTIF -p tcp -s $INTNET -d $PORTFWIP \
38  --dport 110 -j ACCEPT
39 $IPTABLES -A FORWARD -i $INTIF -p tcp -s $INTNET -d $PORTFWIP \
40  --dport 25 -j ACCEPT
41 $IPTABLES -A FORWARD -j reject-and-log-it
42
43 $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to $EXTIP
44 $IPTABLES -t nat -A PREROUTING -p tcp -i $INTIF -d $INTIP \
45  --dport 11002 -j DNAT --to $PORTFWIP:110
46 $IPTABLES -t nat -A PREROUTING -p tcp -i $INTIF -d $INTIP \
47  --dport 25000 -j DNAT --to $PORTFWIP:25
------ end rc.firewall-iptables-stronger ------

