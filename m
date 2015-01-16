From: The Media Server <info@themediaserver.com>
Subject: RE: IPTABLES + PREROUTING + --set-mark + Ubuntu
Date: Thu, 15 Jan 2015 23:51:56 -0500
Message-ID: <CAJb3rWAWBB8=gE0RMdW5xoFuQpRh=hTsksUfCjqZ4bR-k=XtCw@mail.gmail.com>
References: <CAJb3rWC06PWq97tsgY0cK_oSjpkyavyi+faY-VWBqUPSv305XA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJb3rWC06PWq97tsgY0cK_oSjpkyavyi+faY-VWBqUPSv305XA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Check this the most simple setup does not work...

---
ip route flush table 2
# table 2 is the connection to internet
ip route add table 2 default via 192.168.2.1 dev eth0
# main table is empty
ip route flush table main

iptables -F
iptables -F -t mangle
iptables -F -t nat

iptables -t mangle -A PREROUTING -p tcp -m multiport --ports 22 -j
MARK --set-mark 2
ip rule add fwmark 2 table 2

sysctl -w net.ipv4.conf.lo.rp_filter=0
sysctl -w net.ipv4.conf.default.rp_filter=0
sysctl -w net.ipv4.conf.all.rp_filter=0

ip route flush cache

---
SSH does not work from anywhere! time out error! BUG? PROBABLY the
rule don't work

BUT

if I add this:
ip rule add from all table 2

ssh connection works..
clearly the PREROUTING iproutes rule does not work
