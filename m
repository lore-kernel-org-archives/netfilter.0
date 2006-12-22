From: Nandan Bhat <nlbhat@gmail.com>
Subject: Port forwarding - what's wrong with my setup?
Date: Fri, 22 Dec 2006 12:53:27 +0530
Message-ID: <458B87EF.6060007@gmail.com>
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

Hi,

I think port forwarding is a solution to my problem. But I am going 
wrong in my setup.

My setup is as follows:
192.168.1.6 on eth0 is internal network. It is connected to a hub. Hub 
is connected to an ADSL router which is 192.168.1.1
192.168.1.6 will provide local services http (80), mysql (3306), ssh 
(22), smb (various), ftp (21), pop3 (110), smtp (25)
eth1 has dhcp address on 192.168.0.0/24 network and that is all I know 
of the network.
192.168.0.10 is the smtp/pop server on 192.168.0.0/24 network.

Some clients on 192.168.1.0/24 network need to have email access to 
192.168.0.10
I do not trust 192.168.0.0/24 network, to enable all traffic to be allowed.

I intend to have clients connect to 192.168.1.6 on port 11002 
(arbitrary) and have such traffic to be forwarded to 192.168.0.10 on 
port 110. Likewise on 192.168.1.6:25000 to 192.168.0.10:25.

I have slightly appended to the IP-Masquerade-HOWTO (stronger) ruleset, 
what I think should be the configuration for port forwarding. There are 
no errors on running the script. For the sake of brevity, I have left 
out some statements and included only the iptables statements. I'm sorry 
if it is too long.

I expected to be able to telnet 192.168.1.6 on port 11002 and be shown 
the response of 192.168.0.10 for the POP server. But I get connection 
refused. Any pointers?

Nandan Bhat

------------------------------------------------------------------
-- rc.firewall-iptables-stronger begin
------------------------------------------------------------------
01 EXTIF="eth1"
02 INTIF="eth0"
03 EXTIP="`$IFCONFIG $EXTIF | $AWK \
04  /$EXTIF/'{next}//{split($0,a,":");split(a[2],a," ");print a[1];exit}'`"
05
06 INTNET="192.168.1.0/24"
07 INTIP="192.168.1.6/24"
08 UNIVERSE="0.0.0.0/0"
09
10 echo "1" > /proc/sys/net/ipv4/ip_forward
11 echo "1" > /proc/sys/net/ipv4/ip_dynaddr
12
13 $IPTABLES -P INPUT DROP
14 $IPTABLES -F INPUT
15 $IPTABLES -P OUTPUT DROP
16 $IPTABLES -F OUTPUT
17 $IPTABLES -P FORWARD DROP
18 $IPTABLES -F FORWARD
19 $IPTABLES -F -t nat
20 $IPTABLES -X
21 $IPTABLES -Z
22
23 $IPTABLES -N reject-and-log-it
24 $IPTABLES -A reject-and-log-it -j LOG --log-level info
25 $IPTABLES -A reject-and-log-it -j REJECT
26
27 $IPTABLES -A INPUT -i lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT
28 $IPTABLES -A INPUT -i $INTIF -s $INTNET -d $UNIVERSE -j ACCEPT
29 $IPTABLES -A INPUT -i $EXTIF -s $INTNET -d $UNIVERSE -j reject-and-log-it
30 $IPTABLES -A INPUT -i $EXTIF -p ICMP -s $UNIVERSE -d $EXTIP -j ACCEPT
31 $IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -m state --state \
32  ESTABLISHED,RELATED -j ACCEPT
33
34 #$IPTABLES -A INPUT -p ICMP --icmp-type any -j ACCEPT
35 $IPTABLES -A INPUT -p 50 -j ACCEPT
36 $IPTABLES -A INPUT -p 51 -j ACCEPT
37 $IPTABLES -A INPUT -i $INTIF -m state --state ESTABLISHED,RELATED -j 
ACCEPT
38
39 $IPTABLES -A INPUT -i $INTIF -s $INTNET -d $INTIP -m state --state NEW \
40  -m tcp -p tcp --dport 21 -j ACCEPT
41 $IPTABLES -A INPUT -i $INTIF -s $INTNET -d $INTIP -m state --state NEW \
42  -m tcp -p tcp --dport 22 -j ACCEPT
43 $IPTABLES -A INPUT -i $INTIF -s $INTNET -d $INTIP -m state --state NEW \
44  -m tcp -p tcp --dport 25 -j ACCEPT
45 $IPTABLES -A INPUT -i $INTIF -s $INTNET -d $INTIP -m state --state NEW \
46  -m tcp -p tcp --dport 80 -j ACCEPT
47 $IPTABLES -A INPUT -i $INTIF -s $INTNET -d $INTIP -m state --state NEW \
48  -m udp -p udp --dport 137 -j ACCEPT
49 $IPTABLES -A INPUT -i $INTIF -s $INTNET -d $INTIP -m state --state NEW \
50  -m udp -p udp --dport 138 -j ACCEPT
51 $IPTABLES -A INPUT -i $INTIF -s $INTNET -d $INTIP -m state --state NEW \
52  -m tcp -p tcp --dport 139 -j ACCEPT
53 $IPTABLES -A INPUT -i $INTIF -s $INTNET -d $INTIP -m state --state NEW \
54  -m tcp -p tcp --dport 445 -j ACCEPT
55 $IPTABLES -A INPUT -i $INTIF -s $INTNET -d $INTIP -m state --state NEW \
56  -m tcp -p tcp --dport 3306 -j ACCEPT
57 $IPTABLES -A INPUT -s $UNIVERSE -d $UNIVERSE -j reject-and-log-it
58
59 $IPTABLES -A OUTPUT -m state -p icmp --state INVALID -j DROP
60 $IPTABLES -A OUTPUT -o lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT
61 $IPTABLES -A OUTPUT -o $INTIF -s $EXTIP -d $INTNET -j ACCEPT
62 $IPTABLES -A OUTPUT -o $INTIF -s $INTIP -d $INTNET -j ACCEPT
63 $IPTABLES -A OUTPUT -o $EXTIF -s $UNIVERSE -d $INTNET -j 
reject-and-log-it
64 $IPTABLES -A OUTPUT -o $EXTIF -s $EXTIP -d $UNIVERSE -j ACCEPT
65 $IPTABLES -A OUTPUT -s $UNIVERSE -d $UNIVERSE -j reject-and-log-it
66
67 $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state 
ESTABLISHED,RELATED \
68  -j ACCEPT
69 $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
70
71 $IPTABLES -A FORWARD -i $INTIF -p tcp -s $INTNET --sport 11002 \
72  -d 192.168.0.10 --dport 110 -j ACCEPT
73 $IPTABLES -A FORWARD -i $INTIF -p tcp -s $INTNET --sport 25000 \
74  -d 192.168.0.10 --dport 25 -j ACCEPT
75 $IPTABLES -A FORWARD -j reject-and-log-it
76
77 $IPTABLES -t nat -A PREROUTING -p tcp -i $INTIF -d $INTIP \
78  --dport 11002 -j DNAT --to 192.168.0.10:110
79 $IPTABLES -t nat -A PREROUTING -p tcp -i $INTIF -d $INTIP \
80  --dport 25000 -j DNAT --to 192.168.0.10:25

------------------------------------------------------------------
-- rc.firewall-iptables-stronger end
------------------------------------------------------------------

