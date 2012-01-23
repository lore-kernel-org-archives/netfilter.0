From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: connect: No buffer space available
Date: Mon, 23 Jan 2012 12:27:19 -0200
Message-ID: <CAMTjHrwO54Zaktwyt=FhcC6h85MLeCtDzYV7SBpqgAb4N+2XOA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hello everyone, my firewall iptables Red Hat 5.7 is show me the follow
bellow message when I run a ping to a IP address 172.16.30.2

connect: No buffer space available

so... I've just add this network ( 172.16.30.0/30 ) on my firewall in
the NIC Interface eth7. the error only accurs when I run a ping from
this Interface( eth7 ) or to ip address 172.16.30.2. ( eth7 has ip
172.16.30.1 )

is very strange because when I run a ping to any other ip address all
it's work. I have changed the follow values but does't work.

# sysctl -w net.ipv4.neigh.default.gc_thresh1=512
# sysctl -w net.ipv4.neigh.default.gc_thresh2=1024
# sysctl -w net.ipv4.neigh.default.gc_thresh3=2048


before I changed this values was 128, 512 and 1024.

maybe I have reboot my firewall ? there is other way I solve the
problem without reboot ?? I thought it was full arp table but it is
with 350 average.


thanks
