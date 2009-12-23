From: Nick Peirson <npeirson@depoelconsulting.com>
Subject: Mapping external to internal IP addresses
Date: Wed, 23 Dec 2009 15:16:33 +0000
Message-ID: <C757E4D1.D29%npeirson@depoelconsulting.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

We've got a couple of servers with external IP addresses NAT'd to internal
IP addresses. Unfortunately the firewall that's performing the NAT isn't
under our control and we have a problem where the servers can't access each
other via their external IPs. This causes a problem when we use domain names
on the servers, as the DNS lookup returns the external IP address. Ideally
I'd like to avoid maintaing hosts files or an internal DNS server.

I looked to solve this with a iptables rule on each of the servers as
follows:
iptables -t mangle -A PREROUTING -d 1.1.1.32/29 -j NETMAP --to 2.2.2.32/29

where 1.1.1.32/29 is the range of external IPs and 2.2.2.32/29 is the range
of internal IPs. I was expecting this to map the IP address from the
external to the internal IP.

Firstly, I'm not sure if this would work at all, and if I'm heading in
completely the wrong direction and someone has a better solution, I'd be
happy to hear it.

Secondly, if I've got the right idea my implementation is a little wrong.
When I run the command, I get "iptables: Invalid argument", which doesn't
provide much info, and I'm not sure how to go about debugging.

A little system info:
nick@blade6-dev1:~$ uname -a
Linux blade6-dev1 2.6.26-2-amd64 #1 SMP Thu Nov 5 02:23:12 UTC 2009 x86_64
GNU/Linux
nick@blade6-dev1:~$ sudo iptables -V
iptables v1.4.2

Any thoughts greatly appreciated.

Thanks
Nick

