From: Matteo Croce <technoboy85@gmail.com>
Subject: Re: nftables NAT
Date: Mon, 4 Aug 2014 10:46:41 +0200
Message-ID: <CAFnufp1WCpouK0xwwqhhM_fZaoVP-otepvwCXvtkx7PzYqSg3A@mail.gmail.com>
References: <CAFnufp1kVrtPXm45VRYZK9G+oHBS0Uy9S_sfYzSmapSB5SdR0w@mail.gmail.com>
 <53DF0AE2.5080202@atc.tcs.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=hO7Fn4NEgwSHuTzNuuDzjzxqo5BSbgLa0xCnBdA3VU0=;
        b=TTiT6cTzQLh6KM+q9jxsJqVEIKoZCDu1szDEzNAt3Xiabe8R28ZJsx/V9mdFfP9fu2
         YeSujR/YqC+VmaL7thsYvKZxouvTlPLS6m7NH9ymeIJ3XvPUV2WhTQba4+Gd62eM0Qnm
         oVnXnBnIXTbt/iTlGmayf84QdgQ+n90pE8yoxfovj+bdOw7btk3tsrzL8euyn8Qxotdr
         PQZF8j81F+iLoYqGXkZsMf5zv6N3P/0Q1b4zzorJ4zvmZmj1HS5U/9Vb+B40xSAOT66D
         GU5++wJ9JlYRYvaq1EUgqE0lX5UisJHflolIMHKvdBSnzYB44VAK8g62lkW41+8HM29P
         OIng==
In-Reply-To: <53DF0AE2.5080202@atc.tcs.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vigneswaran R <vignesh@atc.tcs.com>
Cc: netfilter@vger.kernel.org

It started working after loading the module iptable_nat
Does nftables rely on iptables?

2014-08-04 6:24 GMT+02:00 Vigneswaran R <vignesh@atc.tcs.com>:
> On 08/03/2014 04:05 PM, Matteo Croce wrote:
>>
>> Hi,
>>
>> I'm trying to setup a NAT on my router with nftables, my LAN is wlan0
>> with address 192.168.20.1 and a the LAN is eth0 with address
>> 192.168.1.7, ip forwarding is enabled:
>>
>> [~]# ifconfig eth0
>> eth0      Link encap:Ethernet  HWaddr 00:0d:b9:34:2b:e8
>>            inet addr:192.168.1.7  Bcast:192.168.1.255  Mask:255.255.255.0
>>            inet6 addr: fe80::20d:b9ff:fe34:2be8/64 Scope:Link
>>            UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>>            RX packets:353 errors:0 dropped:0 overruns:0 frame:0
>>            TX packets:305 errors:0 dropped:0 overruns:0 carrier:0
>>            collisions:0 txqueuelen:1000
>>            RX bytes:39409 (38.4 KiB)  TX bytes:39077 (38.1 KiB)
>>
>> [~]# ifconfig wlan0
>> wlan0     Link encap:Ethernet  HWaddr 04:f0:21:0c:a3:7d
>>            inet addr:192.168.20.1  Bcast:192.168.20.255
>> Mask:255.255.255.0
>>            inet6 addr: fe80::6f0:21ff:fe0c:a37d/64 Scope:Link
>>            UP BROADCAST RUNNING MULTICAST  MTU:1612  Metric:1
>>            RX packets:475 errors:0 dropped:0 overruns:0 frame:0
>>            TX packets:232 errors:0 dropped:0 overruns:0 carrier:0
>>            collisions:0 txqueuelen:1000
>>            RX bytes:48202 (47.0 KiB)  TX bytes:41345 (40.3 KiB)
>>
>> [~]# route -n
>> Kernel IP routing table
>> Destination     Gateway         Genmask         Flags Metric Ref    Use
>> Iface
>> 0.0.0.0         192.168.1.1     0.0.0.0         UG    0      0        0
>> eth0
>> 192.168.1.0     0.0.0.0         255.255.255.0   U     0      0        0
>> eth0
>> 192.168.20.0    0.0.0.0         255.255.255.0   U     0      0        0
>> wlan0
>> [~]# cat /proc/sys/net/ipv4/ip_forward
>> 1
>>
>> I've setup nftables like this:
>>
>> [~]# nft -n list table nat
>> table ip nat {
>>          chain postrouting {
>>                   type nat hook postrouting priority 0;
>>                   ip saddr 192.168.20.0/24 oif eth0 snat 192.168.1.7
>>          }
>> }
>>
>> It correctly forwards the packet with the new address, but doesn't
>> send the replies back:
>>
>> [~]# tcpdump -pni wlan0 icmp
>> IP 192.168.20.23 > 8.8.8.8: ICMP echo request, id 9107, seq 11, length 64
>> IP 192.168.20.23 > 8.8.8.8: ICMP echo request, id 9107, seq 12, length 64
>> IP 192.168.20.23 > 8.8.8.8: ICMP echo request, id 9107, seq 13, length 64
>> [~]# tcpdump -pni eth0 icmp
>> IP 192.168.1.7 > 8.8.8.8: ICMP echo request, id 9107, seq 21, length 64
>> IP 8.8.8.8 > 192.168.1.7: ICMP echo reply, id 9107, seq 21, length 64
>> IP 192.168.1.7 > 8.8.8.8: ICMP echo request, id 9107, seq 22, length 64
>> IP 8.8.8.8 > 192.168.1.7: ICMP echo reply, id 9107, seq 22, length 64
>> IP 192.168.1.7 > 8.8.8.8: ICMP echo request, id 9107, seq 23, length 64
>> IP 8.8.8.8 > 192.168.1.7: ICMP echo reply, id 9107, seq 23, length 64
>>
>> I can't see any problem in the configuration, any hint?
>
>
> Just a thought.. Are you accepting packets in the FORWARD chain in both
> directions (eth0 -> wlan0, wlan0 -> eth0)?
>
> Vignesh



-- 
Matteo Croce
OpenWrt Developer
