From: "Timothy Hayes" <morphieus@earthlink.net>
Subject: snat range not cycling
Date: Tue, 3 Aug 2010 15:06:02 -0700
Message-ID: <003901cb3358$1346b250$39d416f0$@net>
References: <4C5832F9.50004@trash.net> <x6bp9jy7sj@gzp>	<4C584C63.8010607@trash.net> <x6vd7rwrah@gzp> <x6lj8nwqu4@gzp>	<alpine.LSU.2.01.1008032001430.1519@obet.zrqbmnf.qr> <x6sk2vo9eq@gzp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <x6sk2vo9eq@gzp>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Mail List - Netfilter' <netfilter@vger.kernel.org>

Hi guys I've got a iptables firewall setup and a request came in to not just
snat an address but to make each subsequent connection go to a range of
address.

The firewall doesn't normally handle traffic from this particular
application so I've setup a squid proxy and the app is connecting to the
proxy.


I added the range of addresses with ip addr add x.x.x.# dev eth0

and setup a snat rule:
iptables -A POSTROUTING -o eth0 -p tcp --dport 80 -j SNAT --to-source
xx.xx.xx.131-xx.xx.xx.250

translation works fine, but I never seem to get an alternate ip from the
range.



If anyone knows what I need to do to make it so that the source addresses
cycle it would be much appreciated.

