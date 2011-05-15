From: Face <falazemi@gmail.com>
Subject: Port foreword Problem!
Date: Sun, 15 May 2011 21:20:42 +0300
Message-ID: <BANLkTin6i9sjJEX9iyXsv+vyxc93HR7++g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=p+kYeLyLV7u+ID+uGxbsLlzn72H3FD9jZIAenk5en5Y=;
        b=skCakyYgWucE038TVW7TbGU4v4l1VBIQV/JkTCgmHeeljXem2n/+peuCZmr+hBSMsv
         bVySj40gm12EorKmXXiP1OZhRQHiITHBPPUul3nTpE20XA7Lir3pt5c8dNdWktO4R1k9
         7rEaetKhVonCm/CcCwD+XiIFng95/YEqBcE0Y=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello all,

I do have an office with Several PC's and we share the internet
connection using iptables and our
DNS server we also have Mail and FTP Server. Our ISP keep changing
there rules and they start
blocking some port like 25, 21 and 143. so the best solution i could
think of is to use vpn service
 with a static ip address to use instead of my ISP ip address.

After I got my vpn service with a static ip address, it seem i am
unable to port forward and
cannot access my server from the internet.


my network infrastructure is like this:

Main DNS server with 2 NIC's: /etc/network/interfaces
Code:
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
Code:
nameserver 127.0.0.1
/etc/bind/options.conf
Code:
options {
    directory "/var/cache/bind";
    forwarders {208.67.222.222; 208.67.220.220;};
    auth-nxdomain no;
    allow-query { any; };
    recursion no;
    version "0";
    listen-on-v6 { any; };
};
Mail server /etc/network/interfaces
Code:
auto lo
iface lo inet loopback

# The primary network interface
auto eth0
    iface eth0 inet static
        address 10.0.1.3
        netmask 255.255.255.240
        gateway 10.0.1.1
/etc/resolv.conf
Code:
nameserver 10.0.1.1
-----------------------------------------------------------------

Other clients on local network
Code:
address 10.0.1.x
netmask 255.255.255.240
gateway 10.0.1.1
nameserver     10.0.1.1
-----------------------------------------------------------------



and here what i did so far



iptables script:
-----------------------------------------------------------------
Code:
{ # Define networks
		iWAN=eth0
		iWANIP=10.0.0.2
		iVPN=tun0
		iLAN=eth1
		lNet=10.0.1.0/24
		lIP="10.0.1.1"
		PubIP="68.168.223.46"
		VPNIP="10.8.0.6"
		
		UNIVERSE="0.0.0.0/0"
}
{ # Disable Firewall
		iptables -F
		iptables -X
		iptables -t nat -F
		iptables -t nat -X
		iptables -t mangle -F
		iptables -t mangle -X
		iptables -P INPUT ACCEPT
		iptables -P FORWARD ACCEPT
		iptables -P OUTPUT ACCEPT
}
{ # LoadModules
    /sbin/depmod -a
    /sbin/modprobe ip_tables
    /sbin/modprobe ip_conntrack
    /sbin/modprobe ip_conntrack_ftp
    /sbin/modprobe ip_conntrack_irc
    /sbin/modprobe iptable_nat
    /sbin/modprobe ip_nat_ftp
    /sbin/modprobe ip_nat_irc
}
{ # Enabling IP forwarding
		echo "1" > /proc/sys/net/ipv4/ip_forward
		echo "1" > /proc/sys/net/ipv4/ip_dynaddr

#Enable packet forwarding to function as a router"
		 iptables --append FORWARD --in-interface $iLAN -j ACCEPT

#Enable MASQUERADE to function as a NAT router"
		iptables --table nat --append POSTROUTING --out-interface $iWAN -j
MASQUERADE
		iptables --table nat --append POSTROUTING --out-interface $iVPN -j
MASQUERADE
}
{ # Creating a DROP chain
		iptables -N drop-and-log-it
		iptables -A drop-and-log-it -j LOG --log-level info
		iptables -A drop-and-log-it -j REJECT
}
{ # Port Forwarding
	#Add a rule to allow related packets to the forward: "
		iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

	#Add a rule for each port:"
		iptables --append FORWARD --in-interface $iVPN  -p tcp -m tcp
--dport 53 -j ACCEPT
		iptables --append FORWARD --in-interface $iVPN  -p udp -m udp
--dport 53 -j ACCEPT
		iptables --append FORWARD --in-interface $iVPN  -p tcp -m tcp
--dport 80 -j ACCEPT
		iptables --append FORWARD --in-interface $iVPN  -p tcp -m tcp
--dport 110 -j ACCEPT
		iptables --append FORWARD --in-interface $iVPN  -p tcp -m tcp
--dport 143 -j ACCEPT
		iptables --append FORWARD --in-interface $iVPN  -p tcp -m tcp
--dport 25 -j ACCEPT

	#actual port forwarding:"
		iptables  -t nat -A PREROUTING -i $iVPN -p tcp -m tcp --dport 53 -j
DNAT --to-destination 10.0.1.1
		iptables  -t nat -A PREROUTING -i $iVPN -p udp -m udp --dport 53 -j
DNAT --to-destination 10.0.1.1
		iptables  -t nat -A PREROUTING -i $iVPN -p tcp -m tcp --dport 80 -j
DNAT --to-destination 10.0.1.2
		iptables  -t nat -A PREROUTING -i $iVPN -p tcp -m tcp --dport 110 -j
DNAT --to-destination 10.0.1.3
		iptables -t nat  -A PREROUTING -i $iVPN -p tcp -m tcp --dport 25 -j
DNAT --to-destination 10.0.1.3
		iptables  -t nat -A PREROUTING -i $iVPN -p tcp -m tcp --dport 143 -j
DNAT --to-destination 10.0.1.3
}


iptables -t nat -L -n -v
----------------------------------------
Code:
Chain PREROUTING (policy ACCEPT 9474 packets, 684K bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 DNAT       tcp  --  tun0   *       0.0.0.0/0
0.0.0.0/0           tcp dpt:53 to:10.0.1.1
    0     0 DNAT       udp  --  tun0   *       0.0.0.0/0
0.0.0.0/0           udp dpt:53 to:10.0.1.1
    0     0 DNAT       tcp  --  tun0   *       0.0.0.0/0
0.0.0.0/0           tcp dpt:80 to:10.0.1.2
    0     0 DNAT       tcp  --  tun0   *       0.0.0.0/0
0.0.0.0/0           tcp dpt:110 to:10.0.1.3
    0     0 DNAT       tcp  --  tun0   *       0.0.0.0/0
0.0.0.0/0           tcp dpt:25 to:10.0.1.3
    0     0 DNAT       tcp  --  tun0   *       0.0.0.0/0
0.0.0.0/0           tcp dpt:143 to:10.0.1.3

Chain POSTROUTING (policy ACCEPT 551 packets, 39296 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 MASQUERADE  all  --  *      eth0    0.0.0.0/0
0.0.0.0/0
    0     0 MASQUERADE  all  --  *      tun0    0.0.0.0/0
0.0.0.0/0

Chain OUTPUT (policy ACCEPT 8288 packets, 650K bytes)
 pkts bytes target     prot opt in     out     source               destination

route -n
----------------------------------------
Code:
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
10.8.0.6        0.0.0.0         255.255.255.255 UH    0      0        0 tun0
10.8.0.1        10.8.0.6        255.255.255.255 UGH   0      0        0 tun0
68.168.223.45   10.0.0.1        255.255.255.255 UGH   0      0        0 eth0
10.0.1.0        0.0.0.0         255.255.255.240 U     0      0        0 eth1
10.0.0.0        0.0.0.0         255.255.255.192 U     0      0        0 eth0
0.0.0.0         10.8.0.6        128.0.0.0       UG    0      0        0 tun0
128.0.0.0       10.8.0.6        128.0.0.0       UG    0      0        0 tun0
0.0.0.0         10.0.0.1        0.0.0.0         UG    100    0        0 eth0

ifconfig
----------------------------------------
Code:
eth0      Link encap:Ethernet  HWaddr 00:30:4f:1c:49:f8
          inet addr:10.0.0.2  Bcast:10.0.0.63  Mask:255.255.255.192
          inet6 addr: fe80::230:4fff:fe1c:49f8/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:237225 errors:0 dropped:0 overruns:0 frame:0
          TX packets:240397 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:162233252 (162.2 MB)  TX bytes:46279818 (46.2 MB)
          Interrupt:11 Base address:0xc000

eth1      Link encap:Ethernet  HWaddr 00:08:54:41:42:88
          inet addr:10.0.1.1  Bcast:10.0.1.15  Mask:255.255.255.240
          inet6 addr: fe80::208:54ff:fe41:4288/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:481444 errors:0 dropped:0 overruns:0 frame:0
          TX packets:461148 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:138833837 (138.8 MB)  TX bytes:194547673 (194.5 MB)
          Interrupt:10 Base address:0xc400

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:5770 errors:0 dropped:0 overruns:0 frame:0
          TX packets:5770 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:622634 (622.6 KB)  TX bytes:622634 (622.6 KB)

tun0      Link encap:UNSPEC  HWaddr
00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
          inet addr:10.8.0.5  P-t-P:10.8.0.6  Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1500  Metric:1
          RX packets:127546 errors:0 dropped:0 overruns:0 frame:0
          TX packets:148752 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:66371419 (66.3 MB)  TX bytes:19781324 (19.7 MB)



Any help would be much much much much appreciated.
