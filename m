From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Load Balance with equalize
Date: Wed, 13 Apr 2011 09:26:43 -0300
Message-ID: <BANLkTi=GEruHV55FPViJJ=2zoTyUERuzzg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello everyone, I'm deploy an test environment with load Balance in my
Firewall using equalize as follow below


I have two ISPs and one Inside network.

creating the load balance:

ip route add default scope global equalize nexthop via 200.247.209.65
weight 1  nexthop via 201.72.12.1 weight 1

Zeroing the ip_filter

for eee in /proc/sys/net/ipv4/conf/*/rp_filter; do
echo 0 > $eee
done

creating more one table

ip route add default via  201.72.12.1  table telemar


it's working! but no in my production environment.

my question is: there is more parameter ,which, I have to set ? for
exemplo, timers.



thank
