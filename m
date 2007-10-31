From: "Roman Ledovskiy" <roman@usonyx.net>
Subject: conntrack INVALID packets
Date: Wed, 31 Oct 2007 23:14:35 +0800
Message-ID: <000401c81bd0$c0080e00$40182a00$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I have linux firewall in between internet and my network, diagram is
following:

Upstream
   |
Firewall server
   |
my network

"My network" hosts many different email/web servers.

Firewall server is not a bridge, it has 2 interfaces (one to upstream, one
to internal network)
Not much kernel configuration, kernel is default kernel from Centos5 x64
repo: 2.6.18-8.1.10.el5

On this server I get quite a lot of INVALID packets, about 0.07% of all and
I can't figure out why..

Iptables output is quite big so can't post it here, but the logic is simple
- inspect NEW packets, accept RELATED/ESTABLISHED, drop INVALID.


Conntrack is not full:
net.ipv4.netfilter.ip_conntrack_count = 5888
net.ipv4.netfilter.ip_conntrack_max = 65536

server has a lot of free memory also.

It is not ip_conntrack_tcp_be_liberal or ip_conntrack_checksum (changing
these values doesn't help)
 
There is definitely something wrong because I see INVALID packets not only
from outside -> my network, but from my network -> reverse also (although a
lot less)

The only thing I can think of is that one of "ip_conntrack_*_timeout*"
values is reached and conntrack removes connection (and after that there is
one more packet in regards to that deleted connection)

Could anybody tell possible reasons for packet being marked as INVALID
besides those mentioned above.


Any help is appreciated.



Thanks
Roman Ledovskiy


