From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: netflow
Date: Thu, 14 Jul 2011 11:19:00 -0300
Message-ID: <CAMTjHrwextXkBdz_g3zS6CB6j+Xmr4nfvLs3==q5eRzMLYvBOw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hello,

I'm researching about netflow on linux. I wish that an linux machine
forwards it flows to a colletor netflow inside my network.

my doubt is how to generate this netflow on linux. I've added the
ipt_netflow-1.6.tgz module and I created some rules as bellow in
iptables:

iptables -A OUTPUT -j NETFLOW
iptables -A OUTPUT -j NETFLOW

I'm forwarding the flows to my netflow collector with modprobe
ipt_NETFLOW destination=10.10.10.1:2055

so...my question is there is other different way to generate netflows
on linux machine than add rules in the iptables and add ipt_netflow
module ??


thank!
