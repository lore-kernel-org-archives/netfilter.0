From: =?utf-8?q?O=C4=9Fuz_Yar=C4=B1mtepe?= <comp.ogz@gmail.com>
Subject: prerouting and route
Date: Sat, 29 Sep 2007 23:23:12 +0300
Message-ID: <200709292323.12968.comp.ogz@gmail.com>
Reply-To: comp.ogz@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:from:reply-to:to:subject:date:user-agent:mime-version:content-type:content-transfer-encoding:content-disposition:message-id;
        bh=zaxE0JE3Oq2POJwsQF1O3s7kP9mKBBqA0zEb3lqEjXs=;
        b=H5frKOfFXT+CV/md6m4yys/sqUwdCKCHjp29d66mWs5D08VAqsI15A0mlV4+12xMTcNQb4ASgcY3YkY1XSTi0QWFFZhqMcSftGOUhGqm+Ao0aE5eIFeA23M7cqgsEu3Md2FL4BwpLKAL2B6T3HGytWrA9TtgNczcHySTRNUTDbc=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi,

I gave some points that i couldnt visualize.=20
=46irst question is related with the route command. Lets say i defined =
a local=20
route as,

route add 10.2.0.0 netmask 255.255.255.0 gw 10.2.0.1 dev eth1

and while i am configuring iptables i wrote some rules:

# delete all existing rules
iptables -F
iptables -t nat -F
iptables -t mangle -F
iptables -X

# set default policies
iptables -P INPUT DROP
iptables -P FORWARD DROP

iptables -t nat -A PREROUTING -i eth0 -p ALL -d 10.2.0.0/24 -j DNAT --t=
o=20
10.2.0.1

At this point i ask myself whether i need this rule, because i had alre=
ady=20
defined a route while configuring interfaces. So is there a relation be=
tween=20
route definitions and prerouting, is it unnecessary to define a local r=
oute=20
and try to the same thing with iptables?

Second, i have a rule as,

iptables -t nat -A PREROUTING -i eth1 -p ALL  -j DNAT --to 192.168.1.4

192.168.1.4 is the ip of eth0 which is plugged to a gateway with the ip=
=20
192.168.1.3. If i send a package from eth1 to lets say 192.168.1.10, it=
s=20
destination address is replaced with 192.168.1.4. After this point, wil=
l it=20
continue to 192.168.1.3? If yes how?

Thanx.
=20
--=20
O=C4=9Fuz Yar=C4=B1mtepe
http://www.yarimtepe.com/en
