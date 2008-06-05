From: =?ISO-8859-1?Q?Thomas_B=E4tzler?= <t.baetzler@bringe.com>
Subject: Re: Router with 2 public interfaces
Date: Thu, 05 Jun 2008 14:09:05 +0200
Message-ID: <4847D761.2080101@bringe.com>
References: <9b7febdd0805211736k3f34b85i659d4aa761e09bda@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9b7febdd0805211736k3f34b85i659d4aa761e09bda@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org, fcosta75@gmail.com

=46l=E1vio Costa wrote:
[...]
> When someone connect to webserver by interface eth1 I doesn't work,
> because packets go back by default route (eth2), which is not the sam=
e
> they arrive (eth1).

This is a late answer but maybe it's still helpful:

#!/bin/sh

ETH1_GW=3D"xxx.xxx.xxx.xxx"
ETH1_IP=3D"xxx.xxx.xxx.yyy"

iptables -t mangle -F

ip route flush table 4

ip route show table main | grep -Ev ^default | while read ROUTE ; do
   ip route add table 4 $ROUTE
done

ip route add table 4 default via $ETH1_GW

iptables -t mangle -A OUTPUT -s $ETH1_IP -j MARK --set-mark 4

ip rule add fwmark 4 table 4
ip route flush cache

HTH,
Thomas
