From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: fail in the connmark load-balancing
Date: Sat, 11 Feb 2012 18:19:12 -0200
Message-ID: <CAMTjHrw9SY99jV9iwVH2CaSX2s4s=m7wzSjYii_k_D8fmJrDzA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hello,

I've just deployed the load balance in the my firewall iptables
1.4.3.1 as How to below:

http://www.sysresccd.org/Sysresccd-Networking-EN-Iptables-and-netfilter-load-balancing-using-connmark


some doubts has grown in my mind....the main is:

I need add follow line to occur the load balance ?? because without it
my load balance itsn't work!! and when I put equalize line I have some
problems with forward packages between my two gateway interfaces there
is some sites I'm unable access because occur the load balance even
mark and track packages as how to above.

ip route add default scope global equalize nexthop via x.y.t.z1 weight
2  nexthop via x.y.t.z2 weight 2

so...I wish remove the "equalize" and keep the load balance as how to.
it's possible ??


thanks
