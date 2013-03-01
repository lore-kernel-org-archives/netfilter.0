From: Dovydas Sankauskas <laisve@gmail.com>
Subject: brouting different VLANs
Date: Fri, 1 Mar 2013 15:10:18 +0200
Message-ID: <CAB_DuvBof5krc-1J2iCA0zn4qc6vgOGD6O9OsmY+7oEfNfrv3Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=YnJgYU8MpNN5eA+n+zPprrokG+owBxs7tHN77pcrOVI=;
        b=rOu56HD7HJSg9RfhFD7T2uxrZ23c6RJr/lSuOg3+gqtJHGQ2OCdP0h0pE4uVlWwRf7
         VPAPdzG1a2hHR788YXh6tkyHJ7L/c86ewojuRZL59IKyk72aZdbSOuGtfH+wyw6q8RgK
         5Ba5PrJqv5NwOG0ZC5dToVLS4FDvs6kuLAWshw2MCJiTzV8XBFjRSeZzsKsNmZ0nCczq
         q8qqDBSaR7HJ+I6wScexe1+dLPgeeL9MF6gcE7jV7ZHSBSSGkPKE2Bd42tHjOGnjNTRC
         E7N3rXzvD6dKXhBzDr63Jl9kvmzEltrj1wnY0xzWHYFksfb8HlG37Bc+rAf9HHtrnS70
         Ba+Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am having some troubles with brouter setup.
I have customers on different VLANS but on the same subnet. I want to
allow access between customers and to allow access to internet.
Unfortunatelly I can't make customers on VLAN 10 to ping customers on
VLAN 20. Both VLANS 10 and 20 are on the _same_subnet_ 10.0.0.0/24.

Here is my current setup:

                INTERNET
                    |
  +-----------+------------+----------+
  |           |    eth2    |          |
  |           | 1.2.3.4/30 |          |
  |           +------------+          |
  |                                   |
  |   +---------------------------+   |
  |   |            br0            |   |
  |   |        10.0.0.1/24        |   |
  |   +-------------+-------------+   |
  |   |   bond0.10  |  bond0.20   |   |
  |   |   vlan 10   |  vlan 20    |   |
  +---+-------------+-------------+---+
           |                 |
         10.0.0.10     10.0.0.20


I have eth0 and eth1 bonded into bond0. On bond0 I have VLAN
interfaces bond0.10 and bond0.20 for VLAN 10 and VLAN 20 respectively.
These bond0.10 and bond0.20 interfaces are bridged into interface br0.
br0 address 10.0.0.1 is default gateway IP for customer1 10.0.0.10/24
on VLAN 10 and for customer2 10.0.0.20/24 on VLAN 20.
eth2 is my internet facing interface. There is no NAT.

Internet access for both customers is working just fine with the
following ebtables rules:
ebtables -A FORWARD -i bond0.10 -j DROP
ebtables -A FORWARD -i bond0.20 -j DROP
ebtables -t broute -A BROUTING -p ! arp -i bond0.10 -j DROP
ebtables -t broute -A BROUTING -p ! arp -i bond0.20 -j DROP

However I am struggling to enable access between customer 10.0.0.10
and customer 10.0.0.20.
Please can you advise?




-- 
Dovydas Sankauskas
