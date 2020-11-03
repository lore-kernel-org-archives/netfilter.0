From: Hongyi Zhao <hongyi.zhao@gmail.com>
Subject: Pure iptables solution for DNS/socks5/http forwarding/transparent
 proxy in docker environment.
Date: Wed, 4 Nov 2020 07:09:32 +0800
Message-ID: <CAGP6POKs6jnuYHhr-gv6uw8zz6Gz73oV8sBdko_af=ez3aKgMg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=3QJSazYX1UjsR3znnDRXt1VGGt1P15VRPM0VXqG2Fis=;
        b=cYx3fWmL68GAcaFvckzNlrzJr0gKDNMb5hsHCxNJMCVwD2P/YxI8jhWMenrv69yCM8
         wb2JxvdVWoeVuYs0acALg6gxQrz779XGztuCSWB8pYTE85f//ICSPyBmY0NvZgBmIaVg
         YV81CwnEo0Zak5UCwds5KRlx+GsaUWWYji5FYsKdl2e3LY1Z3hrSWGIOFGjIbEqxWUM/
         pPfCEH8GKkcssFVjNSpxdlbn0ut9GfKkBXNTW6NkeH8YwiLCjkkq4MbNKacW6yERIi69
         vtb4CfhixNQBh6K/zBsKIE8D2OzzxIfwVZr+tKnsL7eCL52mU4BNR+fNRXi9gpTY8ASc
         hqzw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

On Ubuntu 20.04, I've docker installed with the default bridge network
mode. See the following for more information:

werner@X10DAi-01:~$ docker -v
Docker version 19.03.12, build 48a66213fe
werner@X10DAi-01:~$ ip a s
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN
group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: enp4s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state
UP group default qlen 1000
    link/ether 3c:ec:ef:00:f1:28 brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.3/24 brd 192.168.0.255 scope global dynamic enp4s0
       valid_lft 3688sec preferred_lft 3688sec
    inet6 fe80::3eec:efff:fe00:f128/64 scope link
       valid_lft forever preferred_lft forever
3: enp5s0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state
DOWN group default qlen 1000
    link/ether 3c:ec:ef:00:f1:29 brd ff:ff:ff:ff:ff:ff
4: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue
state DOWN group default
    link/ether 02:42:fd:6f:8c:9b brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever

At the same time, I use systemd-resolvd stub resolver on the host
network DNS server as shown following:

werner@X10DAi-01:~$ egrep -v '^[[:blank:]]*(#|$)' /etc/resolv.conf
nameserver 127.0.0.53
options edns0
werner@X10DAi-01:~$ realpath -e /etc/resolv.conf
/run/systemd/resolve/stub-resolv.conf

With the following settings, I can use the host network DNS server in
the docker container via setting 172.17.0.1 as the DNS server:

$ sudo sysctl -w net.ipv4.conf.docker0.route_localnet=1

$ sudo iptables -t nat -I PREROUTING -i docker0 -p udp --dport 53 -j
DNAT --to-destination 127.0.0.53
$ sudo iptables -t nat -I PREROUTING -i docker0 -p tcp --dport 53 -j
DNAT --to-destination 127.0.0.53

But I want to extend this method to use the host network
socks5/http servers in docker container, say, socks5 server on
127.0.0.1:18888 and http server on 127.0.0.1:8080, by setting the
following iptables rules:

$ sudo iptables -t nat -I PREROUTING -i docker0 -p tcp --dport 18888
-j DNAT --to-destination 127.0.0.1

$ sudo iptables -t nat -I PREROUTING -i docker0 -p tcp --dport 8080 -j
DNAT --to-destination 127.0.0.1

But, with the above settings, it doesn't get me to use the host
socks5/http servers in docker container with the following forms:

socks5 proxy server: 172.17.0.1:18888
http proxy server: 172.17.0.1:8080

Any hints for this problem will be highly appreciated.

Sincerely,
-- 
Assoc. Prof. Hongyi Zhao <hongyi.zhao@gmail.com>
Theory and Simulation of Materials
Hebei Polytechnic Vocational and Technical University
NO. 552 North Gangtie Road, Xingtai, China
