From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: An Interface with alias
Date: Fri, 20 Jan 2012 15:46:59 -0200
Message-ID: <CAMTjHryLg65vvLBJUsDGsNt82P0iXQmFihV_8UTn=Pm8OzG0Dg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hello everyone,

I'm going to add a new Interface in the my firewall iptables Linux Red Hat 5.6.


so... I wonder if is very bad or what can happen when I do alias on a
interface for more the one network. for exemplo:


eth0 has ip 172.16.30.1/30
eth0.1 172.16.30.5/30
eth0.2 172.16.30.9/30


I wish drop any packages between theses network. any traffic between
the network 172.16.30.0/30 and 172.16.30.4/30 must dropped by
iptables.

I'm disabled any filter as follow bellow

for eee in /proc/sys/net/ipv4/conf/*/rp_filter; do
echo 0 > $eee
done


I wonder there is any problem or uninsured with my firewall iptables ?!?!




thanks





















I don't know if this is maillist correct if didn't is please tell me
other options
