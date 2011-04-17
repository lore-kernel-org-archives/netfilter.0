From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Load Balance
Date: Sun, 17 Apr 2011 20:22:22 -0300
Message-ID: <BANLkTimUdLO55Bqrv3=VjDo14-BsLP7xWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello everyone, I'm deploy an test environment with load Balance in my
=46irewall using equalize as follow below


I have two ISPs and one Inside network.

creating the load balance:

ip route add default scope global equalize nexthop via 200.247.209.65
weight 1 =A0nexthop via 201.72.12.1 weight 1

Zeroing the ip_filter

for eee in /proc/sys/net/ipv4/conf/*/rp_filter; do
echo 0 > $eee
done

creating more one table

ip route add default via =A0201.72.12.1 =A0table telemar


it's working in my environment. but I haven't done available in my
production environment.

my question is: there is more parameter ,which, I have to set ? for
exemplo, timers.



thank
