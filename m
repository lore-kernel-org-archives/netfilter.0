From: Anton Danilov <littlesmilingcloud@gmail.com>
Subject: Re: Losing connection between nat and filter tables
Date: Fri, 9 May 2014 20:48:42 +0400
Message-ID: <CAEzD07LqPgQiftaS6831c2-7Kw0XM=3i84+4WX6XN2GSX0k6Qw@mail.gmail.com>
References: <536CECA8.1000604@riosoft.com.br>
	<CAEzD07JLeCTxUT_rR3H6QDv6_jVH2mFH1q8B2T4EvtJsDGqF1g@mail.gmail.com>
	<536CFE75.90005@riosoft.com.br>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=ZKX44v9rYh8mDRMUyS0+bBn2fu4Zx/qmXt6IvliwQyU=;
        b=vOqJJMttU9ATrBCFUBe+0OloDnh+5FPZbeiWfD56ndLALJS7tvmkVdAFTPu0e8dLsj
         ysYxOE1ySRFH2jD7lNsk07ZKeCAFfzxqqzHsIrfdriDTf8eZ3g580GnJYn1aLz9SWBp8
         d9vSC+VOkQFM/GauOz7/Cs4oQQmaJz4p8ZcZNVymgFWQKdpzsF40jxxfZwrSaupUNAsA
         0esa5MAuiJQ1MbqwYt5c4a/lARDGu6BOWhUGhAoazNLxug4q4xfk+r3tbJTJY3/GkynI
         rTq5tjJ+cC3B3GsvUjKvDd8Y0Nxdu0P5uNyDl2RmIKZZgj0okh5Fo+0XHX9fugonnXqQ
         nQHA==
In-Reply-To: <536CFE75.90005@riosoft.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruno de Paula Larini <bruno.larini@riosoft.com.br>
Cc: netfilter@vger.kernel.org

I think your trouble in the routing.

What is your second gateway on the eth2 interface?

Replied packets are going through default route, not eth2 iface.

You should use PBR for solve this trouble:
ip route add 0/0 via 180.1.2.1 dev eth1 table 1
ip rule add from 180.1.2.11 lookup table 1 pref 10
ip route add 0/0 via <gw2-ip> dev eth2 table 2
ip rule add from 180.1.2.12 lookup table 2 pref 20

Next step of the troubleshooting is run tcpdump.
And other next step is usage of the TRACE target to detail packet path
inside netfilter chains.

2014-05-09 20:12 GMT+04:00 Bruno de Paula Larini <bruno.larini@riosoft.com.br>:
> Hello Anton, here you go:
>
> [root@firewall ~]# ip -4 address
> 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 16436 qdisc noqueue state UNKNOWN
>     inet 127.0.0.1/8 scope host lo
> 2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state
> UP qlen 1000
>     inet 192.168.50.3/24 brd 192.168.50.255 scope global eth0
> 3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state
> UP qlen 1000
>     inet 180.1.2.11/28 brd 180.1.2.15 scope global eth1
> 4: eth2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state
> UP qlen 1000
>     inet 180.1.2.12/28 brd 180.1.2.15 scope global eth2
>
> [root@firewall ~]# ip -4 route
>
> 180.1.2.0/28 dev eth1  proto kernel  scope link  src 180.1.2.11
> 180.1.2.0/28 dev eth2  proto kernel  scope link  src 180.1.2.12
> 192.168.50.0/24 dev eth0  proto kernel  scope link  src 192.168.50.3
> 169.254.0.0/16 dev eth0  scope link  metric 1002
> 169.254.0.0/16 dev eth1  scope link  metric 1003
> 169.254.0.0/16 dev eth2  scope link  metric 1004
>
> default via 180.1.2.1 dev eth1
>
> [root@firewall ~]# ip -4 rule
> 0:      from all lookup local
> 32766:  from all lookup main
> 32767:  from all lookup default
>
> Everything is kinda default here.
> Thank you.
>
> Em 9/5/2014 12:43, Anton Danilov escreveu:
>
>> Hello Bruno.
>> Show please output of commands:
>> ip -4 address
>> ip -4 route
>> ip -4 rule
>>
>>
>> 2014-05-09 18:56 GMT+04:00 Bruno de Paula Larini
>> <bruno.larini@riosoft.com.br>:
>>>
>>> Hello everyone! This is the users list, right? =)
>>>
>>> I'm about to deploy a FTP service for my company using iptables for
>>> NATing
>>> client connections to an internal FTP server. However, there will be two
>>> FTP
>>> sites hosted on the same server, so in order to route the connections to
>>> each FTP site I'm currently using two of our public IP addresses like
>>> this:
>>>
>>> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>>> iptables -A FORWARD -d 192.168.50.3 -p tcp --dport 21 -j ACCEPT
>>> iptables -A FORWARD -d 192.168.50.3 -p tcp --dport 2121 -j ACCEPT
>>>
>>> iptables -t nat -A PREROUTING -d 180.1.2.11 -p tcp --dport 21 -j DNAT
>>> --to-destination 192.168.50.3
>>> iptables -t nat -A PREROUTING -d 180.1.2.12 -p tcp --dport 21 -j DNAT
>>> --to-destination 192.168.50.3:2121
>>>
>>> iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to-source 180.1.2.11
>>> iptables -t nat -A POSTROUTING -o eth2 -j SNAT --to-source 180.1.2.12
>>>
>>> (the FORWARD default policy is DROP; all chains in the nat table are set
>>> to
>>> ACCEPT)
>>>
>>> I didn't open up higher ports because the RELATED state should take care
>>> of
>>> things (or so I think). The default gateway is 180.1.2.1 and the
>>> interface
>>> set to use it is 180.1.2.11 (eth1). Here are my routes:
>>>
>>> 180.1.2.0/28 dev eth1  proto kernel  scope link  src 180.1.2.11
>>> 180.1.2.0/28 dev eth2  proto kernel  scope link  src 180.1.2.12
>>> 192.168.50.0/24 dev eth0  proto kernel  scope link  src 192.168.50.3
>>> default via 180.1.2.1 dev eth1
>>>
>>> After running the above, I can successfully connect to the FTP using the
>>> IP
>>> 180.1.2.11 in passive mode (the only mode I need). But connecting to
>>> 180.1.2.12 will result in a timeout.
>>>
>>> Logging the client connection with PREROUTING and FORWARD I get this:
>>>
>>> May  9 09:53:45 firewall kernel: IN=eth2 OUT=
>>> MAC=02:45:bd:53:82:78:ae:50:4d:5f:b1:b9:08:00 SRC=177.21.108.6
>>> DST=180.1.2.12 LEN=52 TOS=0x00 PREC=0x00 TTL=113 ID=14149 DF PROTO=TCP
>>> SPT=50051 DPT=21 WINDOW=8192 RES=0x00 SYN URGP=0
>>> *repeats 3 more times before timeout*
>>>
>>> So, the connection reaches the server, but I don't see it hit the FORWARD
>>> chain, while client connections to the other IP (180.1.2.11) logs all the
>>> way to the POSTROUTING chain.
>>>
>>> The only peculiarity is that the iptables machine is virtualized on a
>>> XenServer 6.2 platform. I'm using vlans and virtual (bridged) interfaces.
>>> The iptables (v1.4.7) is running on a CentOS 6.4 kernel
>>> 2.6.32-358.el6.x86_64. Even knowing that it don't have anything to do
>>> with
>>> it, I've disabled the rp_filter.
>>>
>>> Right now I'm clueless and that don't even make sense to me =(
>>> Am I missing something? Could somebody help me with that?
>>> Thank you!
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>>
>
>



-- 
Anton.
