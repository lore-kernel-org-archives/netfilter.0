From: "Brennan, JosephX M" <josephx.m.brennan@intel.com>
Subject: one to one NAT
Date: Mon, 23 Sep 2002 17:13:08 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ADCE7AEB26CBD511B4D100508B66D3063BD421@fmsmsx115.fm.intel.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

I have been trying for a couple days to set up one to one nat with iptables
with a few weird results so I would any input out there that could help me
resolve my problem.

First, what I am trying to do is set up a box with a virtual ip that will be
mapped through my iptables box so that essentually the internal box is the
external ip.

I have a dual homed box with interfaces: eth1(internal card):192.168.1.254
and eth2(external card):10.10.10.254.  In addtion I have an external test
box with an ip of 10.10.11.23.  Both the 10.10.10.254 and 10.10.11.23 boxes
are hooked up to a 550T Intel routing switch so they are able to talk to
each other.  On the other side I have an internal test box with an ip of
192.168.1.24 and obviously because the routing box and internal test box are
on the same network they can talk.

My question however is i have tried this command

iptables -t nat -A PREROUTING -d 10.10.10.254 -j DNAT --to 192.168.1.24

and my internal box gets a request from the outside box however it does not
look like there has been any "NAT"ing taken place because when I run a
packet sniffer on the internal box the packets are still coming from the
10.10.10.23 address and obviously the internal box has no idea how to send
the information back.

So if anyone has any suggestions I would appreciate it.

Joe

PS.  I forgot to mention it above but I do have ip forwarding turned on.

