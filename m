From: Sergio Belkin <sebelk@gmail.com>
Subject: ebtables and interception proxy
Date: Wed, 23 Nov 2011 15:41:06 -0300
Message-ID: <CABZC=5zD6ksDGg8Eq9RLqEpGKo2yMhicin3s=tN8zu1tvOgY0A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:from:date:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=6FeFbAGJZf4rOfVfs+i/KoFKZDSfY4fD6lJdYk3l4+M=;
        b=tH/gkt5DpVkCswf16ZKUZAAcCbu0zkQ59VBVGI4D7JMuBjgafR/QYDe8hW/5k7DXkr
         L57xYJzhsvhZNgZiLoAvxuDTEfiDY8KAtjII6ZdCJVYyBrT62xJJ0WEdFUBvr8zdfzyJ
         3Zd9m0tYPAClpSFUNkLYPrbQuvQv6XF6MM1RE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,

I have a bridge on a openwrt box:

bridge name     bridge id               STP enabled     interfaces
br-lan          8000.00212968312a       no              eth0.0
                                                        wlan0



I have the following rules in the nat table:

Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 zone_lan_prerouting  all  --  br-lan *       0.0.0.0/0
       0.0.0.0/0
    1    60 prerouting_rule  all  --  *      *       0.0.0.0/0
   0.0.0.0/0

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 zone_lan_nat  all  --  *      br-lan  0.0.0.0/0
0.0.0.0/0
    0     0 postrouting_rule  all  --  *      *       0.0.0.0/0
    0.0.0.0/0

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain postrouting_rule (1 references)
 pkts bytes target     prot opt in     out     source
destination

Chain prerouting_lan (1 references)
 pkts bytes target     prot opt in     out     source
destination

Chain prerouting_rule (1 references)
 pkts bytes target     prot opt in     out     source
destination
    1    60 DNAT       tcp  --  br-lan *      !200.69.213.193
0.0.0.0/0           tcp dpt:80 to:x.x.x.x:8080

Chain zone_lan_nat (1 references)
 pkts bytes target     prot opt in     out     source
destination

Chain zone_lan_prerouting (1 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 prerouting_lan  all  --  *      *       0.0.0.0/0
  0.0.0.0/0


Where x.x.x.x is a remote proxy

And my ebtables rules on broute table is as follows:

Bridge table: broute

Bridge chain: BROUTING, entries: 1, policy: ACCEPT
-p IPv4 --ip-proto tcp --ip-dport 80 -j redirect , pcnt =3D 1251 -- bcn=
t =3D 75060


The problem is that interception proxy  (aka transparent proxy) is not
working. Of course it works is I add by hand at browers settings....

Please could you help me?
--=20
--
Sergio Belkin =A0http://www.sergiobelkin.com
Watch More TV http://sebelk.blogspot.com
LPIC-2 Certified - http://www.lpi.org
