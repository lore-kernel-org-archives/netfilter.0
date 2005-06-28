From: Juan Manuel Tato <madness@adinet.com.uy>
Subject: Re: whats wrong???
Date: Tue, 28 Jun 2005 15:04:47 -0300
Message-ID: <42C1913F.1000806@adinet.com.uy>
References: <42C17D6F.70709@adinet.com.uy>
	<96bc76cf05062810322e6ffcbd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <96bc76cf05062810322e6ffcbd@mail.gmail.com>
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
To: Vlad Janicek <vladjanicek@gmail.com>, netfilter@lists.netfilter.org

Here goes de ifconfig output:

fw-new:~# ifconfig
eth0      Link encap:Ethernet  HWaddr 00:E0:7D:AD:B4:FF
           inet addr:192.168.100.9  Bcast:192.168.100.255 
Mask:255.255.255.0
           inet6 addr: fe80::2e0:7dff:fead:b4ff/64 Scope:Link
           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
           RX packets:636262 errors:0 dropped:0 overruns:0 frame:0
           TX packets:265447 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:1000
           RX bytes:187859208 (179.1 MiB)  TX bytes:106784159 (101.8 MiB)
           Interrupt:3 Base address:0xde00

eth1      Link encap:Ethernet  HWaddr 00:D0:09:25:21:DC
           inet addr:pub.blic.ip.addr  Bcast:200.40.86.255 
Mask:255.255.255.252
           inet6 addr: fe80::2d0:9ff:fe25:21dc/64 Scope:Link
           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
           RX packets:305065 errors:0 dropped:0 overruns:0 frame:0
           TX packets:511416 errors:0 dropped:0 overruns:0 carrier:0
           collisions:296 txqueuelen:1000
           RX bytes:108708592 (103.6 MiB)  TX bytes:128511858 (122.5 MiB)
           Interrupt:12 Base address:0xd800

Here goes the script:

#!/bin/sh
IPT="/sbin/iptables"
INT="eth1"
#
# flushhhhh
#
$IPT -F
$IPT -F INPUT
$IPT -F OUTPUT
$IPT -F FORWARD
$IPT -F -t mangle
$IPT -F -t nat
$IPT -X
#
# Policies.
#
$IPT -P INPUT ACCEPT
$IPT -P OUTPUT ACCEPT
$IPT -P FORWARD ACCEPT

echo 1 > /proc/sys/net/ipv4/ip_forward

$IPT -t nat -A POSTROUTING -o $INT -j SNAT --to pub.lic.ip.addr

# This rule protects your fowarding rule.
$IPT -A FORWARD -i $INT -m state --state NEW,INVALID -j DROP

# defino la ip de mi servidor interno
SRV="192.168.100.1"


$IPT -t nat -A PREROUTING -i $INT -p tcp --dport 25 -j DNAT --to 
192.168.100.1:25
$IPT -t nat -A PREROUTING -i $INT -p tcp --dport 53 -j DNAT --to $SRV
$IPT -t nat -A PREROUTING -i $INT -p udp --dport 53 -j DNAT --to $SRV
$IPT -t nat -A PREROUTING -i $INT -p tcp --dport 110 -j DNAT --to $SRV
$IPT -t nat -A PREROUTING -i $INT -p udp --dport 110 -j DNAT --to $SRV
$IPT -t nat -A PREROUTING -i $INT -p tcp --dport 80 -j DNAT --to 
192.168.100.1:80
$IPT -t nat -A PREROUTING -i $INT -p udp --dport 80 -j DNAT --to 
192.168.100.1:80
$IPT -t nat -A PREROUTING -i $INT -p tcp --dport 143 -j DNAT --to $SRV
$IPT -t nat -A PREROUTING -i $INT -p udp --dport 143 -j DNAT --to $SRV

# Now, our firewall chain. We use the limit commands to
# cap the rate at which it alerts to 15 log messages per minute.
$IPT -N firewall
$IPT -A firewall -m limit --limit 15/minute -j LOG --log-prefix Firewall:
$IPT -A firewall -j DROP

# Now, our dropwall chain, for the final catchall filter.
$IPT -N dropwall
$IPT -A dropwall -m limit --limit 15/minute -j LOG --log-prefix Dropwall:
$IPT -A dropwall -j DROP

# Our "hey, them's some bad tcp flags!" chain.
$IPT -N badflags
$IPT -A badflags -m limit --limit 15/minute -j LOG --log-prefix Badflags:
$IPT -A badflags -j DROP

# And our silent logging chain.
$IPT -N silent
$IPT -A silent -j DROP

# This rule will accept connections from local machines. If you have
# a home network, enter in the IP's of the machines on the
# network below.
$IPT -A INPUT -i lo -j ACCEPT
$IPT -A INPUT -s 192.168.100.1 -d 0/0 -p all -j ACCEPT
$IPT -A INPUT -s 192.168.100.2 -d 0/0 -p all -j ACCEPT
$IPT -A INPUT -s 192.168.100.3 -d 0/0 -p all -j ACCEPT
$IPT -A INPUT -s 192.168.100.4 -d 0/0 -p all -j ACCEPT
$IPT -A INPUT -s 192.168.100.5 -d 0/0 -p all -j ACCEPT
$IPT -A INPUT -s 192.168.100.6 -d 0/0 -p all -j ACCEPT
$IPT -A INPUT -s 192.168.100.7 -d 0/0 -p all -j ACCEPT
$IPT -A INPUT -s 192.168.100.8 -d 0/0 -p all -j ACCEPT
$IPT -A INPUT -s 192.168.100.9 -d 0/0 -p all -j ACCEPT

# Drop those nasty packets! These are all TCP flag
# combinations that should never, ever occur in the
# wild. All of these are illegal combinations that
# are used to attack a box in various ways, so we
# just drop them and log them here.
$IPT -A INPUT -p tcp --tcp-flags ALL FIN,URG,PSH -j badflags
$IPT -A INPUT -p tcp --tcp-flags ALL ALL -j badflags
$IPT -A INPUT -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j badflags
$IPT -A INPUT -p tcp --tcp-flags ALL NONE -j badflags
$IPT -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j badflags
$IPT -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j badflags

# Drop icmp, but only after letting certain types through.
$IPT -A INPUT -p icmp --icmp-type 0 -j ACCEPT
$IPT -A INPUT -p icmp --icmp-type 3 -j ACCEPT
$IPT -A INPUT -p icmp --icmp-type 11 -j ACCEPT
$IPT -A INPUT -p icmp --icmp-type 8 -m limit --limit 1/second -j ACCEPT
$IPT -A INPUT -p icmp -j firewall

# If you would like to open up port 22 (SSH Access) to various IP's
# simply edit the IP's below and uncomment the line. If youw wish to
# enable SSH access from anywhere, uncomment the second line only.
#$IPT -A INPUT -i $INT -s 10.1.1.1 -d 0/0 -p tcp --dport 22 -j ACCEPT
$IPT -A INPUT -i $INT -s 192.168.100.0/24 -d 0/0 -p tcp --dport 22 -j ACCEPT

# If you are running a Web Server, uncomment the next line to open
# up port 80 on your machine.
$IPT -A INPUT -i $INT -s 0/0 -d 0/0 -p tcp --dport 80 -j ACCEPT
$IPT -A INPUT -i $INT -s 0/0 -d 0/0 -p udp --dport 80 -j ACCEPT
$IPT -A INPUT -i $INT -s 0/0 -d 0/0 -p tcp --dport 25 -j ACCEPT
$IPT -A INPUT -i $INT -s 0/0 -d 0/0 -p udp --dport 25 -j ACCEPT
$IPT -A INPUT -i $INT -s 0/0 -d 0/0 -p tcp --dport 110 -j ACCEPT
$IPT -A INPUT -i $INT -s 0/0 -d 0/0 -p udp --dport 110 -j ACCEPT
$IPT -A INPUT -i $INT -s 0/0 -d 0/0 -p tcp --dport 143 -j ACCEPT
$IPT -A INPUT -i $INT -s 0/0 -d 0/0 -p udp --dport 143 -j ACCEPT
$IPT -A INPUT -i $INT -s 0/0 -d 0/0 -p tcp --dport 53 -j ACCEPT
$IPT -A INPUT -i $INT -s 0/0 -d 0/0 -p udp --dport 53 -j ACCEPT


# Lets do some basic state-matching. This allows us
# to accept related and established connections, so
# client-side things like ftp work properly, for example.
$IPT -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# Uncomment to drop port 137 netbios packets silently.
# We don't like that netbios stuff, and it's way too
# spammy with windows machines on the network.
$IPT -A INPUT -p udp --sport 137 --dport 137 -j silent

# Our final trap. Everything on INPUT goes to the dropwall
# so we don't get silent drops.
$IPT -A INPUT -j dropwall


Vlad Janicek wrote:
> which IP address are you using? could you paste the script you use and your 
> nic configurations??
> 
> 2005/6/28, Juan Manuel Tato <madness@adinet.com.uy>:
> 
>>hi, i'm configuring a firewall, and i need some port forwarding
>>to ip 192.168.100.1 <http://192.168.100.1> from my public ip.
>>but isn't working....
>>where come the output of the chains
>>
>>fw-new:~# iptables -L -n
>>Chain INPUT (policy ACCEPT)
>>target prot opt source destination
>>ACCEPT all -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>
>>ACCEPT all -- 192.168.100.1 <http://192.168.100.1> 0.0.0.0/0<http://0.0.0.0/0>
>>ACCEPT all -- 192.168.100.2 <http://192.168.100.2> 0.0.0.0/0<http://0.0.0.0/0>
>>ACCEPT all -- 192.168.100.3 <http://192.168.100.3> 0.0.0.0/0<http://0.0.0.0/0>
>>ACCEPT all -- 192.168.100.4 <http://192.168.100.4> 0.0.0.0/0<http://0.0.0.0/0>
>>ACCEPT all -- 192.168.100.5 <http://192.168.100.5> 0.0.0.0/0<http://0.0.0.0/0>
>>ACCEPT all -- 192.168.100.6 <http://192.168.100.6> 0.0.0.0/0<http://0.0.0.0/0>
>>ACCEPT all -- 192.168.100.7 <http://192.168.100.7> 0.0.0.0/0<http://0.0.0.0/0>
>>ACCEPT all -- 192.168.100.8 <http://192.168.100.8> 0.0.0.0/0<http://0.0.0.0/0>
>>ACCEPT all -- 192.168.100.9 <http://192.168.100.9> 0.0.0.0/0<http://0.0.0.0/0>
>>
>>badflags tcp -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>tcp
>>flags:0x3F/0x29
>>badflags tcp -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>tcp
>>flags:0x3F/0x3F
>>badflags tcp -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>tcp
>>flags:0x3F/0x37
>>badflags tcp -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>tcp
>>flags:0x3F/0x00
>>badflags tcp -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>tcp
>>flags:0x06/0x06
>>badflags tcp -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>tcp
>>flags:0x03/0x03
>>ACCEPT icmp -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>icmp type 0
>>ACCEPT icmp -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>icmp type 3
>>ACCEPT icmp -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>icmp type 11
>>ACCEPT icmp -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>icmp type 8
>>limit: avg 1/sec burst 5
>>firewall icmp -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>
>>ACCEPT tcp -- 192.168.100.0/24 <http://192.168.100.0/24> 0.0.0.0/0<http://0.0.0.0/0>tcp dpt:22
>>ACCEPT tcp -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>tcp dpt:80
>>ACCEPT udp -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>udp dpt:80
>>ACCEPT tcp -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>tcp dpt:25
>>ACCEPT udp -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>udp dpt:25
>>ACCEPT tcp -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>tcp dpt:110
>>ACCEPT udp -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>udp dpt:110
>>ACCEPT tcp -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>tcp dpt:143
>>ACCEPT udp -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>udp dpt:143
>>ACCEPT tcp -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>tcp dpt:53
>>ACCEPT udp -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>udp dpt:53
>>ACCEPT all -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>state
>>RELATED,ESTABLISHED
>>silent udp -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>udp spt:137
>>dpt:137
>>dropwall all -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>
>>
>>Chain FORWARD (policy ACCEPT)
>>target prot opt source destination
>>DROP all -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>state
>>INVALID,NEW
>>ACCEPT tcp -- 0.0.0.0/0 <http://0.0.0.0/0> 192.168.100.1<http://192.168.100.1>tcp dpt:80
>>ACCEPT udp -- 0.0.0.0/0 <http://0.0.0.0/0> 192.168.100.1<http://192.168.100.1>udp dpt:80
>>ACCEPT tcp -- 0.0.0.0/0 <http://0.0.0.0/0> 192.168.100.1<http://192.168.100.1>tcp dpt:25
>>ACCEPT udp -- 0.0.0.0/0 <http://0.0.0.0/0> 192.168.100.1<http://192.168.100.1>udp dpt:25
>>
>>Chain OUTPUT (policy ACCEPT)
>>target prot opt source destination
>>
>>Chain badflags (6 references)
>>target prot opt source destination
>>LOG all -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>limit: avg
>>15/min burst 5 LOG flags 0 level 4 prefix `Badflags:'
>>DROP all -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>
>>
>>Chain dropwall (1 references)
>>target prot opt source destination
>>LOG all -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>limit: avg
>>15/min burst 5 LOG flags 0 level 4 prefix `Dropwall:'
>>DROP all -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>
>>
>>Chain firewall (1 references)
>>target prot opt source destination
>>LOG all -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>limit: avg
>>15/min burst 5 LOG flags 0 level 4 prefix `Firewall:'
>>DROP all -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>
>>
>>Chain silent (1 references)
>>target prot opt source destination
>>DROP all -- 0.0.0.0/0 <http://0.0.0.0/0> 0.0.0.0/0 <http://0.0.0.0/0>
>>
>>
> 
> 


