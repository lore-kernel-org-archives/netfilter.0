From: Face <falazemi@gmail.com>
Subject: howto share vpn connection (OpenVPN)?
Date: Mon, 9 May 2011 05:53:31 +0300
Message-ID: <BANLkTinNdtpK0q3LPfCaTdc25gQLJJut5Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=X2DHDumm7E1lbHm/7xkQXtCnPBeXWFEh+LFhYd/7IAs=;
        b=xmBNOZZxc9LUxrTe6zkQE7Svrch4McQ7ZjmyZ2zb7JwZuB+QRyOVxuFQlYjFsill+b
         Ny+cX2o/T3shHGqGbpgL8pxqJ77DGfLAIQwP+/GaBvMjniKRSMxJY8FPonnlkOZRNCQC
         HnrAfbM2ZzQMxgnPGKp7oM/JmmdSa/hvmxEnw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

hello all,

I am trying to share vpn connection between my network without any luck.

I do have an office with Several PC's and we share the internet connection
using iptables and our DNS server we also have Mail and FTP Server. Our
ISP keep changing there rules and they start blocking some port like 25,
21 and 143. so the best solution i could think of is to use vpn service with
a static ip address to use instead of my ISP ip address.

I do need all my computer in my local network to be using the VPN ip
address and not my ISP ip address.

my network infrastructure is like this

dsl modem

10.0.0.1  255.255.255.192
Main DNS server with 2 NIC's: /etc/network/interfaces

auto lo eth0 eth1
iface lo inet loopback

#internet
iface eth0 inet static
    address 10.0.0.2
    netmask 255.255.255.192
    gateway 10.0.0.1
#local
iface eth1 inet static
    address 10.0.1.1
    netmask 255.255.255.240
/etc/resolv.conf

nameserver 127.0.0.1
/etc/bind/options.conf

options {
    directory "/var/cache/bind";
    forwarders {208.67.222.222; 208.67.220.220;};
    auth-nxdomain no;
    allow-query { any; };
    recursion no;
    version "0";
    listen-on-v6 { any; };
};
My iptables

EXTIF="eth0"
EXTIP="`/sbin/ifconfig eth0 | grep 'inet addr' | awk '{print $2}' |
sed -e 's/.*://'`" #whick is 10.0.0.2
INTIF="eth1" # Enter the designation for the Internal Interface's
INTNET="10.0.1.0/28" # Enter the NETWORK address the Internal Interface is on
INTIP="10.0.1.1" # Enter the IP address of the Internal Interface
UNIVERSE="0.0.0.0/0"

    /sbin/depmod -a
    /sbin/modprobe ip_tables
    /sbin/modprobe ip_conntrack
    /sbin/modprobe ip_conntrack_ftp
    /sbin/modprobe ip_conntrack_irc
    /sbin/modprobe iptable_nat
    /sbin/modprobe ip_nat_ftp
    /sbin/modprobe ip_nat_irc

    echo "1" > /proc/sys/net/ipv4/ip_forward
    echo "1" > /proc/sys/net/ipv4/ip_dynaddr

    iptables -P INPUT DROP
    iptables -F INPUT
    iptables -P OUTPUT DROP
    iptables -F OUTPUT
    iptables -P FORWARD DROP
    iptables -F FORWARD
    iptables -F -t nat

    if [ "`iptables -L | grep drop-and-log-it`" ]; then
       iptables -F drop-and-log-it
    fi
    iptables -X
    iptables -Z
    iptables -N drop-and-log-it
    iptables -A drop-and-log-it -j LOG --log-level info
    iptables -A drop-and-log-it -j REJECT

    iptables -A INPUT -i lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT
    iptables -A INPUT -i $INTIF -s $INTNET -d $UNIVERSE -j ACCEPT
    iptables -A INPUT -i $EXTIF -s $INTNET -d $UNIVERSE -j drop-and-log-it
    iptables -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -j ACCEPT
    iptables -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -m state
--state ESTABLISHED,RELATED -j ACCEPT
    iptables -A INPUT -s $UNIVERSE -d $UNIVERSE -j drop-and-log-it

    iptables -A OUTPUT -o lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT
    iptables -A OUTPUT -o $INTIF -s $EXTIP -d $INTNET -j ACCEPT
    iptables -A OUTPUT -o $INTIF -s $INTIP -d $INTNET -j ACCEPT
    iptables -A OUTPUT -o $EXTIF -s $UNIVERSE -d $INTNET -j drop-and-log-it
    iptables -A OUTPUT -o $EXTIF -s $EXTIP -d $UNIVERSE -j ACCEPT
    iptables -A OUTPUT -s $UNIVERSE -d $UNIVERSE -j drop-and-log-it


    Cloud=10.0.1.4
    Port=8080
    iptables -A FORWARD -i $EXTIF -o $INTIF -m state --state
ESTABLISHED,RELATED -j ACCEPT
    iptables -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT

    iptables -A FORWARD -i $EXTIF -o $INTIF -d $Cloud -p tcp --dport
$Port -j ACCEPT
    iptables -t nat -A PREROUTING -i $EXTIF -d $EXTIP -p tcp --dport
$Port -j DNAT --to $Cloud

    iptables -A FORWARD -j drop-and-log-it
    iptables -t nat -A POSTROUTING -o $EXTIF -j SNAT --to $EXTIP
With those setting i am able to share my internet connection, however,
when i try to
connect to vpn server using openvpn it seem i am connect to the vpn
server but i
dont have any internet connectivity even on the dns server.

here route -n output before the VPN established and after.

before

route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
10.0.1.0        0.0.0.0         255.255.255.240 U     0      0        0 eth1
10.0.0.0        0.0.0.0         255.255.255.192 U     0      0        0 eth0
0.0.0.0         10.0.0.1        0.0.0.0         UG    100    0        0 eth0
after

route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
174.37.222.38   10.0.0.1        255.255.255.255 UGH   0      0        0 eth0
10.0.1.0        0.0.0.0         255.255.255.240 U     0      0        0 eth1
10.0.0.0        0.0.0.0         255.255.255.192 U     0      0        0 eth0
10.0.0.0        0.0.0.0         255.0.0.0       U     0      0        0 tun0
0.0.0.0         10.10.11.1      128.0.0.0       UG    0      0        0 tun0
128.0.0.0       10.10.11.1      128.0.0.0       UG    0      0        0 tun0
0.0.0.0         10.0.0.1        0.0.0.0         UG    1      0        0 eth0
Mail server /etc/network/interfaces

auto lo
iface lo inet loopback

# The primary network interface
auto eth0
    iface eth0 inet static
        address 10.0.1.3
        netmask 255.255.255.240
        gateway 10.0.1.1
/etc/resolv.conf

nameserver 10.0.1.1
Other clients on local network

address 10.0.1.x
netmask 255.255.255.240
gateway 10.0.1.1
nameserver     10.0.1.1
I really have no idea what should i be doing or if there is something wrong i
should change, therefore if anyone could help me or point me to the right
direction that would be grate.



Any help would be much appreciated.
