From: Mark Mitchell <mmitchell@riccagroup.com>
Subject: Help on how to limit a NAT port forward to just a range of IP
 addresses
Date: Fri, 24 Jun 2011 13:45:30 -0400
Message-ID: <ec9c4a4d-00e6-4ff2-b81d-7b88c1d128c1@riccagroup.com>
References: <3afccf8e-e575-4203-962a-0079da9fae75@riccagroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3afccf8e-e575-4203-962a-0079da9fae75@riccagroup.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

I have the following ruleson my firewall (Edgewater Networks Hardware) =
that do a global port forward of port 11211 to an internal host.
What I am trying to figure out is how to limit this port forward to jus=
t a couple ranges of IP addresses.

Outside IP : 173.49.xx.xxx=A0 (xx for privacy reasons)
Internal IP : 192.168.1.22

iptables -I FORWARD 10 -i eth1 -d 192.168.1.22 -p tcp --dport 11211 -j =
ACCEPT
iptables -A PREROUTING -t nat -p tcp --dport 11211 -d 173.49.xx.xxx -j =
DNAT --to 192.168.1.22:11211
iptables -A POSTROUTING -t nat -p tcp -s 192.168.1.22 --dport 11211 -j =
SNAT --to 173.49.xx.xxx
iptables -t nat -A POSTROUTING -p tcp -d 192.168.1.22 --dport 11211 -s =
192.168.1.0/24 -j SNAT --to 192.168.1.1


I tried adding the rule after the FORWARD command but it did not change=
 anything. I could still hit the port from any IP address.

iptables -A INPUT -p tcp --dport 11211 -d 173.49.xx.xxx -m iprange --sr=
c-range 74.205.xx.x-74.205.xx.x -j ACCEPT=A0

Any help is much appreciated.



