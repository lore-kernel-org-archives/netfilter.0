From: seba@econ.uba.ar
Subject: VRF + Netfilter deployment - multitenancy filtering box
Date: Mon, 10 Oct 2016 11:45:05 -0300
Message-ID: <c847aa653f58c75da5717819ff0f861b.squirrel@minkevie.econ.uba.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi, I'm trying to deploy VRFs + Netfilter in a such a way I could maintain
different filtering rules while attaining isolated traffic at Layer 3, and
perhaps some overlapping IPs functionality.

Even though there's some VRF + NF Kernel documentation, I could use some
help from the netfilter community; and I think lack of information
regarding this topic is due to only recent kernels (>4.6 will do the
sucessful magic!) aren't massive today, but it'll be a hot issue when this
kernel reaches production level.

Here's what I'm looking after:

                           +
                        ^  |
                        |  |
                        |  v
                        |
                     +--+------+
                     |         | 172.17.0.0/16
                     | eth0    |
                     | 	       |
                     +---^-----+
       +---------------^ |  ^-----------+
       |                 |              |
       |                 |              |
       |                 |              |
       |                 |              |
   +---v------+     +----v-----+     +--v--------+
   |          |     |          |     |           |
   | RED      |     | BLUE     |     | GREEN	 |
   | eth1     |     | eth2     |     | eth3      |
   |          |     |          |     |           |
   +----------+     +----------+     +-----------+
10.0.0.0/24         10.0.0.0/24      10.0.0.0/24


Suppose you have an shared & physical interface which leads traffic inside
and outside our box, serving three customers RED, GREEN & BLUE through
dedicated physical internal interfaces, at the same time we're mantaining
their traffic isolated from each other at layer 3 using VRFs (and maybe,
later permit Overlapping IPs between customers if possible).

I'm considering creating three VRF devices and attaching each different
customer interfaces to them at the same time I attach eth0 to all the VRF
devices, then deploy NAT rules through iptables in order to get the
traffic flow in the desired direction...

How would it be your filtering strategy in order to achieve some sort of
"VRF/multitenant" filtering ability? Filtering rules in each vrf device
it's the only way or I'm missing something?

I appreciate any help and advice you guys can give me,
Best regards,
Seba

