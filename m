From: Alex Bligh <alex@alex.org.uk>
Subject: iptables / ebtables IP address intercept
Date: Sat, 31 Jul 2010 15:24:53 +0100
Message-ID: <B02D1E8884632086B0CC9CAF@Ximines.local>
Reply-To: Alex Bligh <alex@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Alex Bligh <alex@alex.org.uk>

On a machine acting as a bridge, I want to intercept calls to a specific
IP address, and serve them locally. So, the bridge config looks like (e.g.)

  10.10.0.1/29     ethernet   eth0         tap1.1       10.10.0.2/29
  default router <-------------> br0 bridge <---------> testbox

                                    | 192.200.3.2/24
                                    | eth1
                                    V
                                second default router (192.200.3.1/24)


I have control over the bridge running br0, and I want to intercept
on the bridge tcp requests to (e.g.) 192.0.200.1:80, and remap them
locally to (e.g.) 192.0.200.2:8080. What I want to achieve is that
when testbox makes a connection to 192.0.200.1:80, this is remapped
by SNAT and DNAT within the bridge so that 192.0.200.2 sees a connection
to its port 8080 coming from 192.200.3.2 (i.e. the public IP of the
bridge).

I have a config which works if I put an IP address on the bridge's
ethernet interface of (e.g.) 10.10.0.3/29 (*)

The main components are:
  # masquerade on the output interface
  iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

  # allow backtrafic back in
  iptables -A FORWARD -i eth1 \! -o eth1 -m state \
    --state RELATED,ESTABLISHED -j ACCEPT

  # Rewrite destination address and port
  iptables -t nat -A PREROUTING --p tcp --match multiport --dports 80 \
    -d 192.0.200.1 -j DNAT --to 192.0.200.2:8080

This all works fine, but my problem is that I can't put an IP interface
on the ethernet interface (i.e. I can't do the step labeled (*) above)
because I don't know how the network is numbered (here it's labeled
10.10.0.0 but I don't know what the true labeling is).

So I am trying to use ebtables (which I am less familiar with) to turn
the bridge into a brouter. I use this:

 ebtables -t broute -A BROUTING -p IPv4 --ip-dst 192.0.200.1 \
  -j redirect

I think what that should do is redirect the MAC address for requests
to the IP address to the internal brouter, and indeed it seems to
work. My problem is on return traffic. The brouter unmangles the
IP addresses correctly, and wants to send traffic back to
10.10.0.2. However, it does this by looking in the internal routing
table, which results in the packet being sent out of eth1 (not
tap1.1) whereupon bad things happen. This is because the
machine doesn't (and can't) have a route to 10.10.0.0/24, so
doesn't know what interface to send it out of.

What I really want is for the masquerade line to remember not only
the input IP address but also the input interface associated with
the connection, and ignore the routing table. I am, however, open
to any other ideas. I should say that the bridge box concerned
carries hundreds of VLANs - I am happy using connmark to track
traffic, but I can't see how to match connmark in iptables and
use that to set output interface and output mac address.

-- 
Alex Bligh
