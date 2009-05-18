From: Miguel Ghobangieno <mikeeusa@yahoo.com>
Subject: Bridge firewall that allows ssh in, and allows http/https out, but nothing else... ebtable ruleset isn't working :(
Date: Mon, 18 May 2009 08:09:22 -0700 (PDT)
Message-ID: <422564.43800.qm@web44812.mail.sp1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1242659363; bh=bMJfZwzKzyt2+6tFkeoeEvLFSUPtWI9rzl+Cj4jWGu8=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type; b=pN8Vr9lOFa6VNVHA6KYYpUxc/1nOPs69m79VxKR2PnMes87YRN+Pm81knBAUZpUCZIGxxghA7X6PsSCMr9iiQsyMHAmUX7aDa7m30+KszNm2CAjAWjmH2JW8gvEKv21PsyJq8+iQZpIJl/YA7ToWJwSt726owSLtutaVJXNKTzQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org


I'm trying to make a bridge firewall that allows ssh in, and allows http/https out, but nothing else... ebtable ruleset isn't working :(

This is what I have so far. When I set the default policy to allow everything gets through, when deny nothing gets through:

Here is the net setup: squid/sshserver --> eth1 [firewall] eth0 ---> Internet

What is supposed to be allowed:
ssh server (port 22 TCP) <--eth1 [firewall] eth0 <--- Internet
ssh/squidserver --> eth1 [firewall] eth0 --> Internet (ports 80 and 443 TCP)

What is supposed to be disallowed
(spoofed ip w/o proper squidserver mac address going out)
(anything else coming in)
(probably anything else going out aswell (maybe allow dns, dhcp)

Here is the ruleset right now:
ebtables -L
Bridge table: filter

Bridge chain: INPUT, entries: 0, policy: ACCEPT

Bridge chain: FORWARD, entries: 8, policy: DROP
-p IPv4 --ip-proto icmp -j DROP
-p IPv4 -i eth0 -o eth1 --ip-dst 192.168.0.22 --ip-proto tcp --ip-dport 22 -j ACCEPT
-p IPv4 -i eth1 -o eth0 --ip-src 192.168.0.22 --ip-proto tcp --ip-sport 22 -j ACCEPT
-p IPv4 -d 0:8:d:54:13:c9 -i eth0 -o eth1 --ip-dst 192.168.0.22 --ip-proto tcp --ip-sport 80 -j ACCEPT
-p IPv4 -s 0:8:d:54:13:c9 -i eth1 -o eth0 --ip-src 192.168.0.22 --ip-proto tcp --ip-dport 80 -j ACCEPT
-p IPv4 -d 0:8:d:54:13:c9 -i eth0 -o eth1 --ip-dst 192.168.0.22 --ip-proto tcp --ip-sport 443 -j ACCEPT
-p IPv4 -s 0:8:d:54:13:c9 -i eth1 -o eth0 --ip-src 192.168.0.22 --ip-proto tcp --ip-dport 443 -j ACCEPT
-p IPv4 -i eth0 --ip-src 192.168.0.22 -j DROP

Bridge chain: OUTPUT, entries: 0, policy: ACCEPT


Here are the commands used:

###The invisible bridge way:

/usr/sbin/brctl addbr br0
/usr/sbin/brctl addif br0 eth0
/usr/sbin/brctl addif br0 eth1
/sbin/ip link set br0 up
/sbin/ip link set eth0 up # don't ask me why
/sbin/ip link set eth1 up # don't ask me why
#/sbin/ip addr add 192.168.0.6 brd + dev br0
#/sbin/route add default gw 192.168.0.1 dev br0 ##Only needed if eth2 hasn't allready set default gateway

# ebtables...
# example rule: block all ICMP
ebtables -F FORWARD
ebtables -P FORWARD DROP
ebtables -A FORWARD -p ip --ip-proto icmp -j DROP ## block all ICMP
#ebtables -A FORWARD -i eth0 -j DROP

##Here We allow SSH to pass through to the ssh server
#Incoming Connection From Internet #ebtables -i eth0 -o eth1 -p ip --ip-proto tcp --ip-destination-port 22 --ip-destination ip-of-the-ssh-server -j ACCEPT
#Reply by the server To Internet   #ebtables -i eth1 -o eth0 -p ip --ip-proto tcp --ip-source-port 22 --ip-source ip-of-the-ssh-server -j ACCEPT
ebtables -A FORWARD -i eth0 -o eth1 -p ip --ip-proto tcp --ip-destination-port 22 --ip-destination 192.168.0.22 -j ACCEPT
ebtables -A FORWARD -i eth1 -o eth0 -p ip --ip-proto tcp --ip-source-port 22 --ip-source 192.168.0.22 -j ACCEPT

##Allow squid server to access HTTP and HTTPS servers on standard ports.
#Incoming Packets From HTTP Server on Internet#   ebtables -i eth0 -o eth1 -p ip --ip-destination squidserver -d macaddress-of-squidserver --ip-proto tcp --i$
#Outgoing Packets From Clients on School Network# ebtables -i eth1 -o eth0 -p ip --ip-source squidserver -s macaddress-of-squidserver --ip-proto tcp --ip-des$
#Incoming Packets From HTTP Server on Internet#   ebtables -i eth0 -o eth1 -p ip --ip-destination squidserver -d macaddress-of-squidserver --ip-proto tcp --i$
#Outgoing Packets From Clients on School Network# ebtables -i eth1 -o eth0 -p ip --ip-source squidserver -s macaddress-of-squidserver --ip-proto tcp --ip-des$
##Anti-spoofing rule (Only matches the IP address of squidserver, not MAC address)
ebtables -A FORWARD -i eth0 -o eth1 -p ip --ip-destination 192.168.0.22 -d 00:08:0D:54:13:C9 --ip-proto tcp --ip-source-port 80 -j ACCEPT
ebtables -A FORWARD -i eth1 -o eth0 -p ip --ip-source 192.168.0.22 -s 00:08:0D:54:13:C9 --ip-proto tcp --ip-destination-port 80 -j ACCEPT
ebtables -A FORWARD -i eth0 -o eth1 -p ip --ip-destination 192.168.0.22 -d 00:08:0D:54:13:C9 --ip-proto tcp --ip-source-port 443 -j ACCEPT
ebtables -A FORWARD -i eth1 -o eth0 -p ip --ip-source 192.168.0.22 -s 00:08:0D:54:13:C9 --ip-proto tcp --ip-destination-port 443 -j ACCEPT
##Anti-spoofing rule (Only matches the IP address of squidserver, not MAC address)
ebtables -A FORWARD -i eth0 -p ip --ip-source 192.168.0.22 -j DROP

#ebtables -A FORWARD -i eth0 -j DROP
#ebtables -A FORWARD -p ip -j DROP ## block everything else
#ebtables -A FORWARD -i eth0 -o eth1 -p ip -j DROP


The bridge works, but the filtering is either all or nothing :/



      

