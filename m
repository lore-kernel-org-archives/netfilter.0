From: "Eliezer Croitor" <ngtech1ltd@gmail.com>
Subject: RE: Use the socks5 proxy sever running in the host network from the docker container.
Date: Tue, 3 Nov 2020 20:47:59 +0200
Message-ID: <000901d6b211$db06c350$911449f0$@gmail.com>
References: <CAGP6POJODEtqzPgcsxZ_Oe+ibJb_wSo9sww-73Vo2ts9C_T5Hw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=eFMLywQsLanH/I8pbWqRwY5bdtAEIdWn+wyyzlG9pUs=;
        b=GgsKTRctm1YATjQoirxmvwL5X9Wr7Zx6vzkCHE2a4QhjbF9POrnZjBdwOM3FfHKSGz
         7N6SK/FIDtYC/HFxyRrxthud+W5aOMDga7n2jpTx4WtfBuBjF/WqNQa4R0x9T0McUiXP
         saX0loGlSDeBojM1j6a0mfzSw2wiuGuAS3FWlBuvNO8lqSdOhySYqj+NI9C7MMezY7F6
         csKpkZOr3w0YXVNz2sVuVAivRHYyUbyE7/FGRj7W2hMZ+asDi//J92ASzOxHm7kye4st
         MOrCEQfw/7FcfoLJCWzV6c3nYaM9ibP0P1BjpJNGRncg1QjTqGchUbfx9ZHOO72seFT9
         s0bA==
In-Reply-To: <CAGP6POJODEtqzPgcsxZ_Oe+ibJb_wSo9sww-73Vo2ts9C_T5Hw@mail.gmail.com>
Content-Language: en-us
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Hongyi Zhao' <hongyi.zhao@gmail.com>
Cc: netfilter@vger.kernel.org

Hey,

You might want to consider either address type or specific ip address:
iptables -t nat -I PREROUTING -i docker0 -p tcp -m tcp --dport 9999 -m =
addrtype --dst-type LOCAL  -j DNAT --to-destination 127.0.0.1:18888

or
iptables -t nat -I PREROUTING -d 172.17.0.1 -j DNAT --to-destination =
172.17.0.1:18888

or
iptables -t nat -I PREROUTING -I docker0 -j DNAT --to-port 18888

I am not sure if a DNAT to 127.0.0.1 should work from another interface =
like dokcer0 to lo.

All The Bests,

----
Eliezer Croitoru
Tech Support
Mobile: +972-5-28704261
Email: ngtech1ltd@gmail.com

-----Original Message-----
From: Hongyi Zhao <hongyi.zhao@gmail.com>=20
Sent: Tuesday, November 3, 2020 4:31 AM
To: netfilter@vger.kernel.org
Subject: Use the socks5 proxy sever running in the host network from the =
docker container.

Hi,

On Ubuntu 20.04, I use docker with its default bridge network mode shown =
as following:

$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN =
group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
2: enp4s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP =
group default qlen 1000
    link/ether 3c:ec:ef:00:f1:28 brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.5/24 brd 192.168.0.255 scope global dynamic enp4s0
       valid_lft 7014sec preferred_lft 7014sec
    inet6 fe80::3eec:efff:fe00:f128/64 scope link
       valid_lft forever preferred_lft forever
3: enp5s0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state =
DOWN group default qlen 1000
    link/ether 3c:ec:ef:00:f1:29 brd ff:ff:ff:ff:ff:ff
4: docker0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue =
state UP group default
    link/ether 02:42:e6:d5:4e:82 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
    inet6 fe80::42:e6ff:fed5:4e82/64 scope link
       valid_lft forever preferred_lft forever

And I've a socks5 proxy 127.0.0.1:18888 running on the host network. I =
want to use this proxy server in a docker container. So I try to add the =
following iptables rule on the host:

$ sudo iptables -t nat -I PREROUTING -i docker0 -p tcp -m tcp --dport
9999 -j DNAT --to-destination 127.0.0.1:18888

Also I've enabled the following option:
$ sysctl -a |& grep net.ipv4.conf.all.route_localnet =
net.ipv4.conf.all.route_localnet =3D 1

Then I do the testings from a docker container and on the host, but both =
of them failed, see following for more info:

On the host:

werner@X10DAi-01:~$ curl -vIx socks5h://172.17.0.1:9999 www.baidu.com
*   Trying 172.17.0.1:9999...
* TCP_NODELAY set
* connect to 172.17.0.1 port 9999 failed: Connection refused
* Failed to connect to 172.17.0.1 port 9999: Connection refused
* Closing connection 0
curl: (7) Failed to connect to 172.17.0.1 port 9999: Connection refused


In a docker container:
root@in-dev-docker:/apollo# curl -vIx socks5h://172.17.0.1:9999 =
www.baidu.com
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
Assoc. Prof. Hongyi Zhao <hongyi.zhao@gmail.com> Theory and Simulation =
of Materials Hebei Polytechnic Vocational and Technical University NO. =
552 North Gangtie Road, Xingtai, China

