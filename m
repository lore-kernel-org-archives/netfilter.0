From: John Haxby <john.haxby@oracle.com>
Subject: ebtables problem with Xen bridges
Date: Fri, 16 May 2008 11:24:01 +0100
Message-ID: <482D60C1.1010800@oracle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I have a problem with ebtables.

I am trying to configure a Xen domU as a firewall and while I can do
this when the domU acting as firewall/proxy and the domU behind the
firewall/proxy are on the same machine I can't make it work when the
domU behind the firewall is on a different machine to the domU
firewall.

In other words: this works:

   +-------------------------------------------------+
   |   +---------------+        +---------------+    |
   |   |          domU |        | firewall domU |    |
   |   +---------------+        +---------------+    |
   |                                            dom0 |
   +-------------------------------------------------+

  *broute
  :BROUTING ACCEPT
  -A BROUTING -s <dom0-MAC> -j ACCEPT
  -A BROUTING -d <dom0-MAC> -j ACCEPT
  -A BROUTING -s <firewall-MAC> -j ACCEPT
  -A BROUTING -d <firewall-MAC> -j ACCEPT
  -A BROUTING -p IPv4 -j dnat --to-dst <firewall-MAC> --dnat-target ACCEPT

The idea here is that dom0 and the firewall/proxy have unfettered
access but any other domU will have its IP traffic diverted through
the firewall/proxy.  This works beautifully: the firewall gets to say
what is allowed to and from the other domU's and also gets to
redirect some traffic in the manner of a transparent proxy.

The reason for doing it this way rather than the more conventional
routing is that the non-firwall domU believes that it is on the local
LAN (it has a normal local LAN IP address) and, indeed, limiting the
final BROUTING rule to only match certain traffic does indeed allow
some traffic to skip the firewall altogether.

The problem now comes when I want traffic from a domU in a different
dom0 to go through the firewall.

I believe that what I should so is to add these to the beginning of
the above rules and then have the same rules on both machines.

  -A BROUTING -s <dom0'-MAC> -j ACCEPT
  -A BROUTING -d <dom0'-MAC> -j ACCEPT

Both dom0 and dom0' will have unrestricted access through their
respective bridges and, as before domU running on dom0 will get its
 traffic diverted through the firewall domU.

I thought that a domU running on dom0' would also get its traffic
diverted through the firewall as well, but this doesn't seem to be the
case: something somewhere is just discarding frames.

I'm sure that this is supposed to be possible, but I'm missing
something (probably obvious) or I've misunderstood something.

Is it possible?  What should I be doing?

jch

