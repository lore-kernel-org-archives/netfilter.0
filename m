From: Philip Prindeville <philipp_subx@redfish-solutions.com>
Subject: tc question about ingress bandwidth splitting
Date: Sun, 22 Mar 2020 12:20:50 -0600
Message-ID: <1D33C8C0-0638-4566-A85F-80B19CD532BA@redfish-solutions.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi all,

I asked around on IRC but no one seems to know the answer, so I thought I’d go to the source… Seemed like something Stephen or Eric might be able to answer.

I have a SoHo router with two physical subnets, which we’ll call “production” (eth0) and “guest” (eth1), and the egress interface “wan” (eth5).

The uplink is G.PON 50/10 mbps.  I’d like to cap the usage on “guest” to 10/2 mbps.  Any unused bandwidth from “guest” goes to “production”.

I thought about marking the traffic coming in off “wan" (the public interface).  Then using HTB to have a 50 mbps cap at the root, and allocating 10mb/s to the child “guest”.  The other sibling would be “production”, and he gets the remaining traffic.

Upstream would be the reverse, marking ingress traffic from “guest” with a separate tag.  Allocating upstream root on “wan” with 10 mbps, and the child “guest” getting 2 mbps.  The remainder goes to the sibling “production”.

Should be straightforward enough, right? (Well, forwarding is more straightforward than traffic terminating on the router itself, I guess… bonus points for getting that right, too.)

I’m hoping that the limiting will work adequately so that the end-to-end path has adequate congestion avoidance happening, and that upstream doesn’t overrun the receiver and cause a lot of packets to be dropped on the last hop (work case of wasted bandwidth).  Not sure if I need special accommodations for bursting or if that would just delay the “settling” of congestion avoidance into steady-state.

Also not sure if ECN is worth marking at this point.  Congestion control is supposed to work better than congestion avoidance, right?

Anyone know what the steps would look like to accomplish the above?

A bunch of people responded, “yeah, I’ve been wanting to do that too…” when I brought up my question, so if I get a good solution I’ll submit a FAQ entry to LARC.

Thanks,

-Philip

