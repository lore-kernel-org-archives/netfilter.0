From: Eric Wilde <ewilde@gntrains.com>
Subject: Missing VPN Packets
Date: Thu, 31 Mar 2011 15:23:59 -0400
Message-ID: <4.3.1.2.20110331132002.022b28a0@jump-gate>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=gntrains.com;
        h=date:from:to:subject:message-id:mime-version:content-type;
        s=key1; bh=9Spq1Cmbxr+GLwUmhineOsvW8w8=;
        b=HJZPt2n73UuWEcSx98JBXSRdrbSlT3XfS1kJlOWjtmMJ3Z7NBDJOXghraGerfBgJgqTrO6qNGdvK7UlXS2gQsw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have a gateway server which is SNATed through my ISP's edge router.
The system is running CentOS 5.5 and the kernel version is
2.6.18-194.11.1.el5-i686.

On this server, I have set up a PPTP VPN connection to a remote
server using pptp.  If I default route traffic from the server out
through the VPN pseudo-device that is created by pptp (e.g. ppp2),
everything works fine.  For example, I can ping, view Web pages from
the browser, etc.

Next, I set up a special rule in rt_tables for iproute2 that looks
like this:

        .
        .
        .
   201     vpn.marked

Then I route all of the packets that are marked with the firewall
mark value of one, through the VPN server, something like this:

   /sbin/ip route add default via 195.12.34.56 dev ppp2 table vpn.marked
   /sbin/ip route flush cache
   /sbin/ip rule add fwmark 1 table vpn.marked

Next, I use iptables to mark packets from systems that are networked
to the gateway server (these systems have the gateway server set as
their gateway, in their routing tables, and their traffic is normally
routed out to the world through the gateway server and the ISP's
edge router).  The marking looks like this:

   /sbin/iptables -N VPN_TUNNEL -t mangle
   # Allow our DNS servers.
   /sbin/iptables -A VPN_TUNNEL -t mangle -d 151.203.0.84 -j RETURN
   /sbin/iptables -A VPN_TUNNEL -t mangle -d 204.122.16.8 -j RETURN
   /sbin/iptables -A VPN_TUNNEL -t mangle -d 216.231.41.2 -j RETURN
   # Mark the packet for tunneling.
   /sbin/iptables -A VPN_TUNNEL -t mangle -j MARK --set-mark 1
   # Add each of the systems that are to be routed through the VPN tunnel.
   /sbin/iptables -A PREROUTING -t mangle -i eth0 -s 192.168.1.84 -j VPN_TUNNEL
   /sbin/iptables -A PREROUTING -t mangle -i eth1 -s 192.168.11.4 -j VPN_TUNNEL

The PPP up script adds the following rules for the VPN tunnel
whenever PPP brings the tunnel up:

   /sbin/iptables -I POSTROUTING -t nat -o ppp2 -j MASQUERADE
   /sbin/iptables -I INPUT -i ppp2 -m state \
        --state RELATED,ESTABLISHED -j ACCEPT

At this point, I have observed with Wireshark all traffic from the
systems that are to be routed through the tunnel, to be actually
going out the tunnel.  I have also observed with Wireshark what I
believe to be the answers from the outside world coming back in.

I have added logging to every one of the tables and I can see the
inbound packets arriving.  They make it to the NAT PREROUTING table
and then seem to fall off the face of the earth.  The tunneled
systems never see the result of pings or other network requests.

An lsmod of the loaded kernel modules shows:

   ip_conntrack
   ip_conntrack_pptp
   ip_nat
   ip_nat_pptp

Anybody got any ideas about where the packets went?  My guess is
that their disappearance is related to masquerading on top of SNAT
but, hey, what do I know?

                                Eric Wilde


