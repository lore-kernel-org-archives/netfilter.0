From: Thomas Preissler <thomas.preissler@ipaccess.com>
Subject: SNATting rules causes packets not to egress a firewall
Date: Wed, 12 Sep 2012 13:30:16 +0100
Message-ID: <20120912123016.GX29274@tjp-desktop.hq.ad.ipaccess.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I came across a very wierd problem when I use SNATting, sorry for the
long post.


The thing is we need to establish an IPSEC tunnel with a customer - the
IPSEC is working, but I sometimes have problems with the traffic for
this tunnel to egress the "firewall".

Here is a schematics of the setup:

   +----------------------+            +---------------------+
   |                      |            |                     |
   |               +------------------++ Customers IPSEC box |+-----------+
   |    Internet   |      |            |                     |            |
   |               |      |            +---------------------+            v
   +---------------|------+                                         Remote network
              ^    |                                                      B
              |    |                                               192.168.100.10
              |    |
              |    |
              |    |
              |    |IPSEC tunnel
              |    +-----------------------------------+
              +                                        |
   +-----------------------+               +-----------+-----------+
   |                       |               |                       |
   |     firewall          |+------------->|   My IPSEC box        |
   |                       |eth3          ^|                       |
   +-----------------------+10.40.10.1    |+-----------------------+
              ^                        10.40.10.2
              |
              |
              |
              +
           Office network
                 A     10.10.10.10

To summarize, the idea is that the traffic from "Office network A" needs
to get to "Remote network B" and this is via the IPSEC tunnel
established between us.

"Customer" requires that our traffic comes from a public IP. So I do
a SNAT on my firewall:

  -A POSTROUTING -s 10.10.10.0/24 -d 192.168.100.0/24 -j SNAT --to-source 2.2.2.2

There is a route for 192.168.100.0/24 setup via Quagga to egress via
eth3 on the "firewall":

  192.168.100.0/24 via 10.40.10.2 dev eth3 proto zebra 


2.2.2.2 is setup as an IP on the "lo" interface:

  [root@fw2 sbin]# ip addr show lo
  1: lo: <LOOPBACK,UP,LOWER_UP> mtu 16436 qdisc noqueue state UNKNOWN 
      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
      inet 127.0.0.1/8 scope host lo
      inet 2.2.2.2/32 brd 2.2.2.2 scope global lo
      [OTHER IPs]
      inet6 ::1/128 scope host 
         valid_lft forever preferred_lft forever


So the issue is now that "sometimes" the traffic for 192.168.100.0/24 is
*not* egressing eth3 on "firewall". Doing a ssh or ping while
tcpdump-ing eth3 doesn't show any traffic egressing, but you see
*ingressing* traffic on the interface towards the "office network A".
When that happens and I check "ip route show cached" I see that it
slowly gets populated with these lines:

192.168.100.10 via 10.40.10.2 dev eth3 src 10.40.10.1
local 2.2.2.2 from 192.168.100.10 dev lo  src 2.2.2.2
192.168.100.10 from 10.10.10.10 via 10.40.10.2 dev eth3 src 10.40.10.1

(There is no OSPF, RIP, BGP or any other routing protocol running on the
IPSEC box.)

But still, no traffic egressing eth3.
When I then do a ping on the firewall to 192.168.100.10 and just
after the same from the office network, the IPSEC springs to live as eth3
is egressing these packets - what *should* have been egressed initially
already..

Questions
1) Why is the traffic sometimes not egressing eth3?
2) What are these "cached routing entries" for and where do they come
   from, considering there is a static route to the remote network
   anyway? I did a "tcpdump ... icmp" and at least I cannot see any ICMP
   redirects entering the "firewall" on any interface.
3) Is SNATting causing these cached routing entries?
4) We run "conntrackd" on the "firewall" - could that have to do with
   this?


Cheers

Thomas





This message contains confidential information and may be privileged. If you are not the intended recipient, please notify the sender and delete the message immediately.

ip.access Ltd, registration number 3400157, Building 2020, 
Cambourne Business Park, Cambourne, Cambridge CB23 6DW, United Kingdom
