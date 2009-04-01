From: =?ISO-8859-1?Q?Javier_G=E1lvez_Guerrero?= 
	<javier.galvez.guerrero@gmail.com>
Subject: Incoming traffic: TOS works; MARK doesn't
Date: Wed, 1 Apr 2009 13:54:26 +0200
Message-ID: <145d4e1a0904010454u5047e38u65c5ca2df0acdf23@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=oKSL27KFod9zHyDRGpxvaYxNpi4PzVD/rwpQE15HK+w=;
        b=s2eY1CDudYORVHLIcoLyvQ5oyvy09IDtVG/VvYa8+9miWARSxvne9JFOoSKamqHgaX
         F8in0pqCR5LHAjLkIzIUkcBXEcQKInmd2iGkkqYDYIk/bK0YtqcQyripI01REqqSq4fI
         QEey2TgzMO7ahckAPit2b5q/qquFxtqew+QnU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I want to choose which network interface (between 2 WiFi NICs) to be
the 'active' one, so I'm trying to manage it with ip rules, ip routes
and iptables.

What I do is to mark outgoing packets so I can manage which routing
table will be selected. What I've noted is that I also need to manage
the response of this traffic (such as ACK packets), so I need to mark
the incoming traffic according to the outgoing rules (i.e. redirecting
the traffic to the same route tables).

The results show that if I use the TOS target I can properly send and
receive traffic through the network I want, while using the MARK
target (the one I'm really interested) only the outgoing traffic is
correctly managed, so the incoming packets are never received by the
local process.

These are the configuration commands I use in order to set up this behavior:

TOS

Global setup:
sudo ip rule add from all tos 0x10 table 1 prio 1
sudo ip rule add from all tos 0x04 table 2 prio 1

1. interface ra0 'active'
sudo iptables -t nat -A POSTROUTING -p tcp --dport 8554 -j SNAT
--to-source 192.168.0.2
sudo iptables -A OUTPUT -t mangle -p tcp --dport 8554 -j TOS --set-tos 0x10
sudo iptables -A PREROUTING -t mangle -p tcp --sport 8554 -j TOS --set-tos 0x10
sudo ip route add table 1 192.168.0.0/24 dev ra0
sudo ip route add table 1 default via 192.168.0.1 dev ra0

2. interface ra1 'active'
sudo iptables -t nat -A POSTROUTING -p tcp --dport 8554 -j SNAT
--to-source 192.168.1.2
sudo iptables -A OUTPUT -t mangle -p tcp --dport 8554 -j TOS --set-tos 0x04
sudo iptables -A PREROUTING -t mangle -p tcp --sport 8554 -j TOS --set-tos 0x04
sudo ip route add table 2 192.168.1.0/24 dev ra1
sudo ip route add table 2 default via 192.168.1.1 dev ra1


MARK

Global setup:
sudo ip rule add from all fwmark 1 table 1 prio 1
sudo ip rule add from all fwmark 2 table 2 prio 1

1. interface ra0 'active'
sudo iptables -t nat -A POSTROUTING -p tcp --dport 8554 -j SNAT
--to-source 192.168.0.2
sudo iptables -A OUTPUT -t mangle -p tcp --dport 8554 -j MARK --set-mark 1
sudo iptables -A PREROUTING -t mangle -p tcp --sport 8554 -j MARK --set-mark 1
sudo ip route add table 1 192.168.0.0/24 dev ra0
sudo ip route add table 1 default via 192.168.0.1 dev ra0

2. interface ra1 'active'
sudo iptables -t nat -A POSTROUTING -p tcp --dport 8554 -j SNAT
--to-source 192.168.1.2
sudo iptables -A OUTPUT -t mangle -p tcp --dport 8554 -j MARK --set-mark 2
sudo iptables -A PREROUTING -t mangle -p tcp --sport 8554 -j MARK --set-mark 2
sudo ip route add table 2 192.168.1.0/24 dev ra1
sudo ip route add table 2 default via 192.168.1.1 dev ra1


As said before, the configuration is all the same except for the use
of the MARK or the TOS targets, and the first seems to fail only with
the incoming traffic (the packets received from the port 8554 are
never received in the local process), while the second works properly.


Could anyone tell me what I'm doing wrong? Any help will be welcome.


Regards,
Javi
