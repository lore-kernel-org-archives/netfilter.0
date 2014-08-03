From: Matteo Croce <technoboy85@gmail.com>
Subject: nftables NAT
Date: Sun, 3 Aug 2014 12:35:25 +0200
Message-ID: <CAFnufp1kVrtPXm45VRYZK9G+oHBS0Uy9S_sfYzSmapSB5SdR0w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=ypz4OqABRxNvfN80pwL5bx/FZU1ZGE/d2rU/Pcolz/0=;
        b=Qj+FRCTYisDDvNy0Q5Ct3WpRohlERaEBRrmiUSOoQtB62mbGh9TZdpmeN2/icgPztj
         V90r3jRO6iXYii/Di9F1b5zCah94tBGMbT0RErYspLK3/NfZkzcMmTP+tcIE8L9UyK3a
         EIXaf8xR0kjFfoGPEdXDl3pg0eZ1uKusUKBBAqxtuQqMS5GYoCMS9DIKCqcL0RVEDuU7
         wX10aDWZ87NOUdZ/HRED5bYF0aKVBH46yqqww1PdRS0lZ+t4eBE/h+4FJKeHk4pq70hz
         CVhFZXyBZseupx19K4LWHqW/N7FcgTTMhvZp+PcfmzmS5+MDUjDYn/sQ3seMQNJn6dqx
         meKA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm trying to setup a NAT on my router with nftables, my LAN is wlan0
with address 192.168.20.1 and a the LAN is eth0 with address
192.168.1.7, ip forwarding is enabled:

[~]# ifconfig eth0
eth0      Link encap:Ethernet  HWaddr 00:0d:b9:34:2b:e8
          inet addr:192.168.1.7  Bcast:192.168.1.255  Mask:255.255.255.0
          inet6 addr: fe80::20d:b9ff:fe34:2be8/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:353 errors:0 dropped:0 overruns:0 frame:0
          TX packets:305 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:39409 (38.4 KiB)  TX bytes:39077 (38.1 KiB)

[~]# ifconfig wlan0
wlan0     Link encap:Ethernet  HWaddr 04:f0:21:0c:a3:7d
          inet addr:192.168.20.1  Bcast:192.168.20.255  Mask:255.255.255.0
          inet6 addr: fe80::6f0:21ff:fe0c:a37d/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1612  Metric:1
          RX packets:475 errors:0 dropped:0 overruns:0 frame:0
          TX packets:232 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:48202 (47.0 KiB)  TX bytes:41345 (40.3 KiB)

[~]# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         192.168.1.1     0.0.0.0         UG    0      0        0 eth0
192.168.1.0     0.0.0.0         255.255.255.0   U     0      0        0 eth0
192.168.20.0    0.0.0.0         255.255.255.0   U     0      0        0 wlan0
[~]# cat /proc/sys/net/ipv4/ip_forward
1

I've setup nftables like this:

[~]# nft -n list table nat
table ip nat {
        chain postrouting {
                 type nat hook postrouting priority 0;
                 ip saddr 192.168.20.0/24 oif eth0 snat 192.168.1.7
        }
}

It correctly forwards the packet with the new address, but doesn't
send the replies back:

[~]# tcpdump -pni wlan0 icmp
IP 192.168.20.23 > 8.8.8.8: ICMP echo request, id 9107, seq 11, length 64
IP 192.168.20.23 > 8.8.8.8: ICMP echo request, id 9107, seq 12, length 64
IP 192.168.20.23 > 8.8.8.8: ICMP echo request, id 9107, seq 13, length 64
[~]# tcpdump -pni eth0 icmp
IP 192.168.1.7 > 8.8.8.8: ICMP echo request, id 9107, seq 21, length 64
IP 8.8.8.8 > 192.168.1.7: ICMP echo reply, id 9107, seq 21, length 64
IP 192.168.1.7 > 8.8.8.8: ICMP echo request, id 9107, seq 22, length 64
IP 8.8.8.8 > 192.168.1.7: ICMP echo reply, id 9107, seq 22, length 64
IP 192.168.1.7 > 8.8.8.8: ICMP echo request, id 9107, seq 23, length 64
IP 8.8.8.8 > 192.168.1.7: ICMP echo reply, id 9107, seq 23, length 64

I can't see any problem in the configuration, any hint?
Cheers,
-- 
Matteo Croce
OpenWrt Developer
