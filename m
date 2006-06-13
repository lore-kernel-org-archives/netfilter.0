From: "Kelvin Proctor" <Kelvin.Proctor@citect.com>
Subject: Scriptable Network Testing Environment
Date: Wed, 14 Jun 2006 00:57:43 +1000
Message-ID: <DE7AB3268C8CB149ADA35F54287DC68F05CAEAD5@TEL-MAIL01.citect.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

G'day Netfilter List,

My apologies for a rather long post that may contain quite a few newbie
questions or be slightly mis-posted on this list.

My company builds software for industrial control system and I'm trying
to
change the way we test our product, particularly in relation to network
environments.  We often require our products to work over quite poor
network
links such as radio modem networks for pipeline projects or water
treatment
facilities.

I'm proposing a system to let us create different network test
environments
on the fly, particularly from within a unit testing harness. The goal is
to
create a system where via a web-services interface we can simulate any
sort of network conditions between any nodes on our network without
having
to change any cable patching or ip addresses or effect traffic to and
from
any other nodes.

The sort of network configuration I'm envisaging is as follows:

  -----                -------
  |   |----------------| WWW | 10.0.0.4
  |   |                -------
  | M |       =20
  | a |         eth0   -----------
  | n |       |--------|         |
  | a | VLAN  | eth0.2 | Packet  |
  | g |-------|--------|         | 10.0.0.1
  | e | TRUNK | eth0.3 | Mangler |
  | d |       |--------|         |
  |   |                -----------
  | S |       =20
  | w | VLAN 2         -------
  | i |----------------| PC1 | 10.0.0.2
  | t |                -------
  | c |       =20
  | h | VLAN 3         -------
  |   |----------------| PC2 | 10.0.0.3
  |   |                -------
  -----

The plan goes something like this:

1. A request will come into the packet mangler setup a test environment
between
   two nodes (nodes PC1 and PC2 above) that are both on the main network
VLAN.

2. The packet mangler will interrogate the switch to find out which
ports the
   two nodes are on.

3. The two nodes will then be put onto separate VLANs, allocated on the
fly,
   (VLANs 2 and 3 above).  The packet mangler also adds the two VLANs to
the
   trunk port it is connected on, creating interfaces eth0.2 and eth0.3
in the
   process.

4. On the packet mangler netfilter / ebtables / arptables etc... must
now be setup
   to do the following:
      A. Answer all ARP request for ANY address on the VLANs, replying
with it's own
         MAC address so all traffic will be sent to the mangler.
      B. On the main network answer ARP requests for the 'hidden' nodes
so that
         traffic for these nodes will be sent to the mangler.
      C. Any traffic that is going to/from nodes on the rest of the
network to the
         test nodes just gets routed through normally.
      D. All of the traffic between the test nodes gets pushed through
the QUEUE
         iptables target so we can actually mangle the packets from
userspace via
         libnetfilter_queue.

5. Once the test session is over the test VLANS will be torn down and
everything is
   back to normal.

Once the above has been made work it can be extended to include
interaction between
more than 2 nodes etc.. without any trouble.

There are a few things I am aware of:

1. This will cause some disruptions at test setup until devices refill
their ARP
   caches to send packets to the correct location.

2. It may not be possible to have the trunk port of the switch send /
receive
   traffic off the 'normal' network if it not on any VLAN (which I
presume means
   VLAN 0).  The above diagram could be expanded to have a separate NIC
for
   connection to the main network without effecting the concetp.

Now to my real questions:

1. Has anyone else tried to do something like this? [I've looked at
dummynet on
   FreeBSD and NIST Net]

2. Do you think I'm taking a sane approach to the problem?  Are there
any major
   Problems that people can see I'm about to walk into?

3. How am I best to get the ARP resolution behaviour I desire.  I've
looked into
   the arp_proxy sysctl but need a little bit of guidance.  On the main
network
   VLAN I could just add all the 'hidden' IP addresses to the eth0
interface, but
   I'm not sure how to make sure I answer *ALL* ARP requests coming from
the test
   PCs on the eth0.2 and eth0.3 interfaces.

4. It has been suggested I should also consider buying a linux based
switch / router
   such as the linksys devices and hack the firmware to do it all in the
switch
   itself.  Does this approach have merit?

Thank-you for your help and patience.

Kelvin Proctor

