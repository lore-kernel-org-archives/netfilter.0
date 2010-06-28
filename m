From: Marcel Laverdet <marcel@laverdet.com>
Subject: No ACK received with multiple clients over MASQ
Date: Sun, 27 Jun 2010 21:47:41 -0500
Message-ID: <2142377f00d7b74030fb76dba67562e4@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Apologies in advance as this is probably the wrong list to ask about this,

but I'm not sure who else to go to at this point.



I don't think my configuration is too important here as I've distilled the

problem down to something beyond iptables entirely, but I'll explain what

I'm doing anyway. I have a private network which I'm extending with a

tun/tap ptp connection over ssh. I have one machine on the private network,

and another on a different network which acts as a router for more machines

(via dnsmasq). The two machines maintain an ssh connection and a ptp

connection on tun0. The machine on the private network is setup to MASQ all

packets from tun0 to eth0, and the other machine MASQs all packets from

eth0 to tun0.



The problem I'm seeing is that if multiple clients on the extended network

attempt to access the same service, only one client can get to it-- every

other client won't receive an ACK.



Here's a tcpdump of what this looks like from the POV of the machine on

the private network. It seems that as long as the outgoing tcp port is

increasing the host will accept the connection. If it receives a connection

request from a port lower than one it has already seen before it will

ignore it entirely. If you allow some amount of time to go by (somewhere

around 60 seconds) you can connect with a lower port which starts the

process over again (attempting to connect with a lower port will fail).



http://pastie.org/1021290



I managed to workaround this problem by rewriting outgoing ports with `-t

tcp --to-ports 30000-40000`, but I'd still like to figure out why this is

happening. Does anyone have any insight?
