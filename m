From: guillaume <guillaume.riviere@hcm.vsl-vn.com>
Subject: Routing, SNAT and two ISPs
Date: Tue, 10 Aug 2004 16:18:10 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <411892D2.6010904@hcm.vsl-vn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: iptables <netfilter@lists.netfilter.org>

Hi all,

Well, it's seams to be a little bit more complicated than
I thought to loadbalance Internat connection between 2 (different) ISP
lines ...

Here is my problem:

Basically, I need to connect my office to 2 differents ISP (different 
gateways and different DNS ). My linux box is a 3 NICs Box. The problem 
is that, for the first ISP, I don't have static Addresses.

So, I would like to loadbalance, "route" and NAT all my internals Addresses
through thoses 2 ISP except for some addresses and some port numbers 
which will use
only the ISP2.

I would like also to detect dead gateway (maybe I ask for to much ...).

My problem is that SNAT is POSTROUTING. I am lose ...
I don't know if I have to deal with iptable2 loadbalancing or if I can do
this only with netfilter.

Maybe in a first part, I just would like to "statically loadbalance" my 
connections.
I mean, just put rules to (for example)

- route http packets to my first ISP and ssh packets to my second ISP,
- route packets from my internals IP 10.0.0.2-100 to ISP 1
- route packets from my internals IP 10.0.0.101 to ISP2
        (all with NAT, of course)

After, I will deal with a real loadbalancing for a part of my internal 
IP and
for some protocols.

Any Help will be very appreciated,
Thank you in advance,
Guillaume



