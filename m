From: "Jack Knowlton" <jknowlton@vp44.com>
Subject: Building network
Date: Thu, 6 Aug 2009 09:55:47 +0200
Message-ID: <ca067d757753e0893cbebd61d2c90c8c.squirrel@webmail.vp44.net>
Reply-To: jknowlton@vp44.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: debian-firewall@lists.debian.org

Hi all.
I have just switched to a new DSL provider and I need some serious help
re-building my iptables/routing setup for the new connection.
The ISP now provides me with a /29 subnet that I want to use for some of
the computers on my LAN.

The access device, a DSL bridge, is attached to the debian routing box
(currently with 2 interfaces). According to the ISP tech department (they
are referring to a standard soho router) I have to set the internal (LAN)
interface to xxx.xxx.xxx.153 and the outside interface (WAN) will get the
IP assigned by their DHCP. I then have 5 more IPs that I want to assign to
different computers (static addressing - no internal DHCP needed).

Since I want to host various servers, all of the computers that get public
IPs will have to be accessible on whatever service they're hosting. In the
case of the mailserver, the outgoing IP has to be the real one (and not
the routing box's) because of rdns and dnsbl issues.
Basically I think I do not need NAT. Unfortunately I have no idea how to
implement that..

Next: there's a bunch of wifi clients that connect to an internal AP. To
be on the safe side I decided to keep the AP in a local LAN (10.0.1.0/24)
and have the debian box to do NAT for them.
My idea would be to add a third network interface to the routing box and
give it a local LAN address, then use a basic iptables setup to have it
NAT for any local client that requests it.

If someone has had some experience with this I would really appreciate
some guidence with what I'm trying to set-up.
Regards,

-JK



