From: marko.rakamaric@gmail.com
Subject: iptables not possible to respond on request which comes from ebtables
Date: Fri, 15 Jul 2016 23:31:12 +0200
Message-ID: <20160715213112.GA889@keyton-ntxbook.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:date:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=6NQXgVxzzqv0bJq/MassXb3pxOyiXvDdPJaVrr+4+fo=;
        b=fVTeXP9sLzW5b6NNahESaUMOCsJprJvvt+6KtFbF84KWMJ3IVSmt2uOGAO/HloNxjj
         tcv+Zcrh5SIm+rDrjfMUnWB/WuipIa6MfqP7sS2wZUp9FK+q4bZ9XAm77PguJwNIUkn8
         78j3c6epBCmTQPSdGqGvTvVY2ma91Aq1QiA3AQGTPJyQoOnTJcCetOk0kjAea2X5y+Jf
         a84MXsoIlcZKpT4YGfwhyYfxDiCJfD9eHEnCuxa9xBLl+ZVgX3UrlRVkLA7hVD17i8/1
         tkrw3GVccn7R8kOUyxbbXQMlaUXsTDaGZzfT3+nx+5gERPkf/8B2A0qlJolIENBy4CGO
         wOrA==
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello guys, hope someone can help me here. 

I have one device, with two physical nics in it. Those nic's eth0 and eth1 are enslaved in one logical bridge interface br0.

My goal here is to have L2 filtering based on MAC source, at the same time no meter if MAC is blacklisted or not always allow access
to 192.168.1.1, which is box itself.

Things should work like this:

pc: 192.168.1.44
br0: 192.168.1.1

When device receive frame, ebtables will trigger broute table, specifically BROUTING chain, and check if destination frame has
IP 192.168.1.1, if this is true it should allow traffic to this IP. if it is not true then it should trigger ebtables nat PREROUTING
chain, and check if frame has src MAC address XX:XX:XX:XX:XX:XX, if it matches DROP it. 

When frame is received and destination is 192.168.1.1 it will be passed to higher network layers, thus iptables will 
be in-charge for packet decisions. This is perfectly fine. 

At this stage, passing ebtables ipv4 traffic if destination is 192.168.1.1 works but only in 1 way. When iptables receive
packet in INPUT chain i am not able to forward it to 192.168.1.1 which is box itself, so even simple ICMP doesn't work. 

Looking at the logs, I am able to see perfectly fine made decisions, packet counter is incremented thus INPUT chain have's it. Afterward 
OUTPUT chain should return response to requested src which is 192.168.1.44. Unfortunately this response never arrives back to request 
host. 

I have also tried to set all relevant default policies to ACCEPT, but result is same. 

Here are iptable INPUT  logs: 
IPTIN=eth1 OUT= MAC=14:ea:31:1e:00:e1:20:1c:8a:b2:ef:85:08:00 SRC=192.168.1.44 DST=192.168.1.1 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=21871 DF PROTO=ICMP TYPE=8 CODE=0 ID=4104 SEQ=12 
IPTIN=eth1 OUT= MAC=14:ea:31:1e:00:e1:20:1c:8a:b2:ef:85:08:00 SRC=192.168.1.44 DST=192.168.1.1 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=21959 DF PROTO=ICMP TYPE=8 CODE=0 ID=4104 SEQ=13 
IPTIN=eth1 OUT= MAC=14:ea:31:1e:00:e1:20:1c:8a:b2:ef:85:08:00 SRC=192.168.1.44 DST=192.168.1.1 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=21984 DF PROTO=ICMP TYPE=8 CODE=0 ID=4104 SEQ=14 

Here are iptable OUTPUT logs: 
IPTIN= OUT=br0 SRC=192.168.1.1 DST=192.168.1.44 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=62294 PROTO=ICMP TYPE=0 CODE=0 ID=29857 SEQ=481 
IPTIN= OUT=br0 SRC=192.168.1.1 DST=192.168.1.44 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=62378 PROTO=ICMP TYPE=0 CODE=0 ID=29857 SEQ=482 
IPTIN= OUT=br0 SRC=192.168.1.1 DST=192.168.1.44 LEN=84 TOS=0x00 PREC=0x00 TTL=64 ID=62462 PROTO=ICMP TYPE=0 CODE=0 ID=29857 SEQ=483

Here are commands which I am using: 

brctl addbr br0
brctl addif br0 eth0
brctl addif br0 eth1
brctl stp br0 off 

ip addr flush dev eth1
ip addr flush dev eth0
ip link set dev br0 up
ip addr add 192.168.1.1 dev br0

echo 1 > /proc/sys/net/ipv4/ip_forward

# broute BROUTING (ACCEPT):
ebtables -t broute -A BROUTING -p IPv4 --logical-in br0 --ip-dst 192.168.1.1 -j redirect --redirect-target DROP
ebtables -t broute -A BROUTING -p ARP --logical-in br0 --arp-ip-dst 192.168.1.1 -j redirect --redirect-target DROP

# nat PREROUTING (ACCEPT):
ebtables -t nat -s XX:XX:XX:XX:XX:XX -j DROP
ebtables -t nat -s XX:XX:XX:XX:XX:XX -j DROP
ebtables -t nat -s XX:XX:XX:XX:XX:XX -j DROP

iptables: 
# INPUT (ACCEPT-only for testing)
iptables -I INPUT -i br0 -d 192.168.1.1 -j ACCEPT

# FORWARD(ACCEPT):

# OUTPUT(ACCEPT):
iptables -I OUTPUT -o br0 -j ACCEPT

Any hint, I would really appreciate!

Best regards!
