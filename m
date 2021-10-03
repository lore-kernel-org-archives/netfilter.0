From: Simon Mullis <simon@mullis.co.uk>
Subject: How to load-balance tcp flows to internal dummy interfaces for
 parallel traffic capture?
Date: Sun, 3 Oct 2021 12:15:27 +0200
Message-ID: <CANnvYi5CLPK7ZAN5ihsmuLQByGU8R9+2wAYugZO2uvLdWf-pyw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi Everyone

Background - I would like to horizontally scale a packet capture and
analysis tool running on a Linux appliance. The capture uses two
processes to capture and process the captured traffic. The raw capture
is multithreaded and is attached to a physical (or virtual) interface.
The metadata extraction process is single-threaded. The rate
determining step of the whole thing is the single-threaded process.

My idea is to split the traffic captured on the external interface to
N internal dummy interfaces and spawn a new extraction process in
parallel for each of them. Where N is derived from how many cores the
capture device has.

I need TCP flows to be persistently sent to one interface to capture
and be able to extract correct metadata (as it is stateful).

So, I need to load-balance TCP flows seen on the capture interface in
a deterministic way to the dummy interfaces.

This is all complicated by the fact the traffic I am handling is
entirely unrelated to the host (in terms of L2 and L3 paths) and I
don't want to change it (i.e. NAT etc).

I am looking at:

iptables -t mangle with CONNMARK and RESTOREMARK, allowing me to mark
discrete flows.
Then I use iptables -t mangle ... -m statistic --mode nth
<some key step here that I cannot figure out>
Then some kind of postrouting forwarding iptables -A POSTROUTING -o
dummyN -j CONNMARK
Then I was thinking to route the marked flows to one of the N dummy
interfaces using new iproute2 tables in /etc/iproute2/rt_tables and ip
rule add fwmark X table <tablename>

I don't care about return paths. I only want the traffic to hit the
dummy interface and then it can be blackholed, as it's only destined
for capture and analysis).

The traffic hitting the external capture interface could be anything -
with any source or destination IP or Port (but limited to UDP or TCP).
The IPs could be Public or private RFC1918 addresses which I don't
want to change so I cannot use NAT.

For step 3 from the list above, I am a bit stuck:

I don't think I can change anything in the packet (at least not DST
IP) or will impact my analysis. (Maybe DST MAC?)
I don't want to have to give my dummy interfaces real addresses as the
addresses in the captured traffic may overlap and cause problems

What I really want is to just move packets from marked flows from one
interface to another.

Should I try ebtables and rewrite the dst MAC to that of the dummy
interface? Can I do this based on the iptables CONNMARK?

I realised that I am trying to make L2 decisions based on L4
information which makes me uneasy, but I will be discarding all
traffic on the interfaces after capture.

Normally, I write out a problem like this for public consumption and
as I write it out, it all becomes clear.

This time no luck so far.

Any ideas or suggestions? Am I missing something really obvious?

Should I be looking at doing this properly with eBPF and XDP? (I am
planning on this route later, but wanted a quick workaround to scale
the existing solution while I work on an improvement).

Thank you in advance
