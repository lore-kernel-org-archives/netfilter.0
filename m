From: Adishesh M <adisheshsm@gmail.com>
Subject: Using interface name as a command line option to create a iptables rule
Date: Mon, 20 Jun 2011 17:25:59 +0530
Message-ID: <BANLkTi=A5NWc3YR2fZk7Q6tw-xJ_BAz2Ug@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=8SRwExMo1vuoTluD9TH8WsyR4baZi8I712RX6YP7KPc=;
        b=VfRnDEVpuWhspbDKNm/5HsKFTq50YxscJr+k54/wJDDE9fFgNfZCfKRzbwCMEYPVx6
         saDEQQTR3iqkDEKhJrQE5bfg2HJGVNXMP3av25EdAzO/bzojB2oEUR5KlgkqamNeb484
         Y3SLacWYYr4yFIlKum8y3Xo6VJNNl97NnOe5E=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="johab"
To: netfilter@vger.kernel.org

Hi,

Is it mandatory (or recommended) to use interface as option to enable
a particular port using iptables filter table.

If we don=92t use interface name while forming a rule, then are we
compromising anything with respect to security?


=46or example

We have two interfaces eth0 and eth1 with ip address as given below.
We want to enable ssh service on eth1 and  some other service on eth2.
=46or this we are using below rules

Option 1:
iptables =96P INPUT DROP
iptables -A INPUT   -i eth0  -d 192.168.229.131 =96p tcp  --dport 22  -=
j ACCEPT
iptables -A INPUT  -i eth1 -d  192.168.124.135 -p udp  --dport 5060  -j=
 ACCEPT
iptables =96A INPUT =96J DROP

Option 2:
Iptables =96P INPUT DROP
Iptables =96A INPUT    =96p tcp  --dport 22  -j ACCEPT
Iptables =96A INPUT   -d  192.168.124.135  -p udp  --dport 5060  -j ACC=
EPT
Iptables =96A INPUT =96J DROP

In the above examples, which is more secure option?




[root@adim ~]# ip addr list
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 16436 qdisc noqueue state UNKNOWN
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast
state UNKNOWN qlen 1000
    link/ether 00:0c:29:53:6a:e0 brd ff:ff:ff:ff:ff:ff
    inet 192.168.229.131/24 brd 192.168.229.255 scope global eth0
    inet6 fe80::20c:29ff:fe53:6ae0/64 scope link
       valid_lft forever preferred_lft forever
3: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast
state UNKNOWN qlen 1000
    link/ether 00:0c:29:53:6a:f4 brd ff:ff:ff:ff:ff:ff
    inet 192.168.124.135/24 brd 192.168.124.255 scope global eth1
    inet6 fe80::20c:29ff:fe53:6af4/64 scope link
       valid_lft forever preferred_lft forever
