From: Hongyi Zhao <hongyi.zhao@gmail.com>
Subject: Use the socks5 proxy sever running in the host network from the
 docker container.
Date: Tue, 3 Nov 2020 10:30:49 +0800
Message-ID: <CAGP6POJODEtqzPgcsxZ_Oe+ibJb_wSo9sww-73Vo2ts9C_T5Hw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=+dMiNyd7VoEMW/Dnpu0aBswaQLX482cwuCQ6CqfXxM8=;
        b=E2LIKWgXH8+qWPhmTSgWgIKpkMRKAEtAAxBogD2Xa/SY1yO1Sb6iaiBhqHEOggC6Nn
         Th6oi3aEnUbgw5UURIRCAJJ/zHbeW/6qKEgA9VJQHayeQH7604lIvSxvwJFzs5X5aXUs
         DI1H5ceq31ZCnkm7+oKNlPptqKMFNcpygbaPZvP7Jr0DTZzGVpJ5xzX4QTask7o9GAcx
         Y57Ljqts+h+ZrnxriVP1XZQ6zi2tfXtHcJ06T2DTBBUrtpf+TTQWQf4jdO8JNfuxxZ8I
         VOIS6gcntBJl5TjRSJjPPDAlnbHu6bsUPE8KlhPvUqzGeVT0G06eUAU/yR2uji7YNfbU
         fpcg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

On Ubuntu 20.04, I use docker with its default bridge network mode
shown as following:

$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN
group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: enp4s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state
UP group default qlen 1000
    link/ether 3c:ec:ef:00:f1:28 brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.5/24 brd 192.168.0.255 scope global dynamic enp4s0
       valid_lft 7014sec preferred_lft 7014sec
    inet6 fe80::3eec:efff:fe00:f128/64 scope link
       valid_lft forever preferred_lft forever
3: enp5s0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state
DOWN group default qlen 1000
    link/ether 3c:ec:ef:00:f1:29 brd ff:ff:ff:ff:ff:ff
4: docker0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue
state UP group default
    link/ether 02:42:e6:d5:4e:82 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
    inet6 fe80::42:e6ff:fed5:4e82/64 scope link
       valid_lft forever preferred_lft forever

And I've a socks5 proxy 127.0.0.1:18888 running on the host network. I
want to use this proxy server in a docker container. So I try to add
the following iptables rule on the host:

$ sudo iptables -t nat -I PREROUTING -i docker0 -p tcp -m tcp --dport
9999 -j DNAT --to-destination 127.0.0.1:18888

Also I've enabled the following option:
$ sysctl -a |& grep net.ipv4.conf.all.route_localnet
net.ipv4.conf.all.route_localnet = 1

Then I do the testings from a docker container and on the host, but
both of them failed, see following for more info:

On the host:

werner@X10DAi-01:~$ curl -vIx socks5h://172.17.0.1:9999 www.baidu.com
*   Trying 172.17.0.1:9999...
* TCP_NODELAY set
* connect to 172.17.0.1 port 9999 failed: Connection refused
* Failed to connect to 172.17.0.1 port 9999: Connection refused
* Closing connection 0
curl: (7) Failed to connect to 172.17.0.1 port 9999: Connection refused


In a docker container:
root@in-dev-docker:/apollo# curl -vIx socks5h://172.17.0.1:9999 www.baidu.com
* Rebuilt URL to: www.baidu.com/
*   Trying 172.17.0.1...
* TCP_NODELAY set
* connect to 172.17.0.1 port 9999 failed: Connection refused
* Failed to connect to 172.17.0.1 port 9999: Connection refused
* Closing connection 0
curl: (7) Failed to connect to 172.17.0.1 port 9999: Connection refused

Any hints for this problem will be highly appreciated.

Reards,
-- 
Assoc. Prof. Hongyi Zhao <hongyi.zhao@gmail.com>
Theory and Simulation of Materials
Hebei Polytechnic Vocational and Technical University
NO. 552 North Gangtie Road, Xingtai, China
