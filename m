From: "DI BACCO ANTONIO - technolabs" <Antonio.DiBacco@technolabs.it>
Subject: Connecting an host with a subnet to a LAN with different subnet
Date: Wed, 27 Aug 2008 20:27:51 +0200
Message-ID: <F1F6EC0C8B75034F9E3A79FC85122E8E01000E0D@aquib01a>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


 
I have a LAN with a given subnet, let us say: 192.168.0.0/24  with a lot
of hosts. Now I want to connect another host (PLUTO) with an interface
that has  address 10.10.10.1 and netmask 255.255.255.0. I can't change
this ip address but I want to insert some iptables rules on PLUTO to
translate both source and dest ip address of the packets it receives to
subnet 10.10.10.0/24 and viceversa. I think that target NETMAP can help
me, but I'm getting confused.
 
Bye,
Antonio.
