From: Alexei Ustyuzhaninov <alust@208.195-224-87.telenet.ru>
Subject: Port-based routing and nat
Date: Wed, 05 Mar 2008 20:06:08 +0500
Message-ID: <47CEB6E0.7040206@208.195-224-87.telenet.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello!

I have two network interfaces on my machine: eth0 and ppp0. eth0 has 
address 192.168.0.1 and ppp0 - 87.224.195.208. I want to send SMTP 
traffic through ppp0 and all other traffic - through eth0. So I mark the 
outgoing SMTP packages and route them to the ppp0 as follows:

# iptables -L -t mangle
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
MARK       tcp  --  anywhere             anywhere            tcp 
dpt:smtp MARK set 0x10

Chain POSTROUTING (policy ACCEPT)
target     prot opt source

# ip rule show
0:      from all lookup 255
32753:  from all fwmark 0x10 lookup telenet
32754:  from 87.224.195.208 lookup telenet
32766:  from all lookup main
32767:  from all lookup default

# ip route show table telenet
default via 172.30.0.1 dev ppp0  src 87.224.195.208

# ip route show table main
172.30.0.1 dev ppp0  proto kernel  scope link  src 87.224.195.208
192.168.0.0/24 dev eth0  proto kernel  scope link  src 192.168.0.1
127.0.0.0/8 dev lo  scope link
default via 192.168.0.3 dev eth0  metric 2

That works, but in a strange way: all SMTP packets going through ppp0 
have source address 192.168.0.1 instead of 87.224.195.208:

# tcpdump -i ppp0 -n port 25
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ppp0, link-type LINUX_SLL (Linux cooked), capture size 96 bytes
19:43:37.294296 IP 192.168.0.1.49190 > 194.67.23.20.25: S 
3229242744:3229242744(0) win 5840 <mss 1460,sackOK,timestamp 806985910 
0,nop,wscale 6>
19:43:40.293567 IP 192.168.0.1.49190 > 194.67.23.20.25: S 
3229242744:3229242744(0) win 5840 <mss 1460,sackOK,timestamp 806986810 
0,nop,wscale 6>

So the first question: why?

Well, then I turned on address translation:

# iptables -L -n -t nat
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
SNAT       all  --  192.168.0.1          0.0.0.0/0 
to:87.224.195.208

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Now the packets have the expected source address, but the TCP connection 
doesn't establish:

# tcpdump -i ppp0 -n port 25
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on ppp0, link-type LINUX_SLL (Linux cooked), capture size 96 bytes
19:56:55.270305 IP 87.224.195.208.48752 > 194.67.23.20.25: S 
2856938258:2856938258(0) win 5840 <mss 1460,sackOK,timestamp 807225318 
0,nop,wscale 6>
19:56:58.268181 IP 87.224.195.208.48752 > 194.67.23.20.25: S 
2856938258:2856938258(0) win 5840 <mss 1460,sackOK,timestamp 807226218 
0,nop,wscale 6>
19:56:58.325710 IP 194.67.23.20.25 > 87.224.195.208.48752: S 
1253403247:1253403247(0) ack 2856938259 win 32768 <mss 1356,nop,wscale 
0,nop,nop,timestamp 10382268 807226218>
19:57:01.314037 IP 194.67.23.20.25 > 87.224.195.208.48752: S 
1253403247:1253403247(0) ack 2856938259 win 32768 <mss 1356,nop,wscale 
0,nop,nop,timestamp 10382568 807226218>
19:57:04.267788 IP 87.224.195.208.48752 > 194.67.23.20.25: S 
2856938258:2856938258(0) win 5840 <mss 1460,sackOK,timestamp 807228018 
0,nop,wscale 6>
19:57:07.313978 IP 194.67.23.20.25 > 87.224.195.208.48752: S 
1253403247:1253403247(0) ack 2856938259 win 32768 <mss 1356,nop,wscale 
0,nop,nop,timestamp 10383168 807226218>
19:57:16.267010 IP 87.224.195.208.48752 > 194.67.23.20.25: S 
2856938258:2856938258(0) win 5840 <mss 1460,sackOK,timestamp 807231618 
0,nop,wscale 6>

# netstat -n |grep 194.67.23.20
tcp        0      1 192.168.0.1:48752       194.67.23.20:25 
SYN_SENT

The second question: what's wrong with this setup?

-- 
Thanks,
Alexei
