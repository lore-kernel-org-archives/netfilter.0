From: Valentijn Sessink <valentyn+netfilter-users@nospam.openoffice.nl>
Subject: two 2.6 IPsec tunnels: no traffic after >> MTU
Date: Thu, 12 Feb 2004 19:13:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040212181354.GA7946@openoffice.nl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello list,

I have a router with a dual IPsec tunnel, one to my Wifi, the other to my
office network. Now if a large UDP packet travels from office to Wifi, it
will get stuck inside the router - without ICMP traces. There simply seems
to be something that kills off packets that are large enough. Without
traces, and without RFC. As I can see the packet in the FORWARD chain, it's
not a b0rked-isp-icmp-killing-router issue. It's something inside 2.6.


The situation is a local network with a Wifi card, and an
office network with public Internet in between:

wifi host 10.15.67.21
      |
(local net 10.15.67.0/24)
      |
router 10.15.67.1 pub-IP---> internet <---pub-IP router2 192.168.112.0/24 office

Now I have two IPsec 2.6 tunnels: one is local on the Wifi network, like
this: 10.15.67.21-===tunnel===-10.15.67.1----> outside.

The other is 10.15.67.0/24 to 192.168.112.0/24, over public Internet.

The tunnels work like a charm, I can ping and browse around, even from
10.15.67.21 to the office network. This connection goes to two tunnels,
namely the wifi tunnel, then the remote office tunnel. No problem.

However, when I mount my NFS server, the connections sometimes get stuck.
Please note that NFS starts OK, so you can 'ls' on the server. Only when you
start actually doing things instead of looking around, it hangs. From what I
can see with tcpdump and a lot of iptables -j LOG entries, something goes
wrong inside the 10.15.67.1 IPsec machine (which is 2.6.1). This is only the
case with packets that are too large - or so it seems to me.

I can see ESP packets coming in, I can see them in the FORWARD chain
unpacked (as UDP), but then there's no ESP traffic in the POSTROUTING chain
- or I couldn't find it. I see 10.15.67.21 host send small UDP packets to
the NFS-server all the time (presumably it repeats it's question), then the
server repeats it's answer which is a ridiculously large IP packet, which is
fragmented before reaching router2 in my office. This packet *arrives* at
the 10.15.67.1 machine, but it won't get forwarded. I'm pretty sure there's
no ICMP traffic - not even traffic to the wrong machines, afaik. It's
something with fragmentation that's wrong here.

When I flush the Wifi-spd on both 10.15.67.1 and 10.15.67.15, the NFS-server
suddenly comes up with all pending answers - so if there's only one tunnel,
it works.

So, something is b0rked. Does anyone know what it could be? What can I test?

Best regards,

Valentijn
-- 
http://www.openoffice.nl/   Open Office - Linux Office Solutions
Valentijn Sessink  valentyn+sessink@nospam.openoffice.nl

