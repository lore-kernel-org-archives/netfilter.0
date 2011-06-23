From: Steven Kath <steven.kath@vyatta.com>
Subject: RE: Bizarre NAT behavior
Date: Thu, 23 Jun 2011 13:49:08 -0700
Message-ID: <1308862148.1984.24.camel@lt>
References: <925A849792280C4E80C5461017A4B8A2A03FEB@mail733.InfraSupportEtc.com>
	 <925A849792280C4E80C5461017A4B8A2A0404D@mail733.InfraSupportEtc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <925A849792280C4E80C5461017A4B8A2A0404D@mail733.InfraSupportEtc.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Greg Scott <GregScott@Infrasupport.com>
Cc: netfilter@vger.kernel.org

On Thu, 2011-06-23 at 10:17 -0500, Greg Scott wrote:
> Why would NATing in both PREROUTING and POSTROUTING
> work  **only**  when I watch it with tcpdump and not work otherwise?

tcpdump by default will put the interface into promiscuous mode, so that
it will not automatically discard frames with a unicast ethernet
destination address which does not match the MAC address of the
interface.  If traffic passes with tcpdump running but not without it,
it's likely related to the destination ethernet addresses.  That would
be a layer 2/bridging problem more than a NAT/iptables problem. 

If promiscuous mode is the factor that allows traffic to pass, a cheap
hack would be to force the interface into promiscuous mode without
tcpdump with "ip link set <dev> promisc on"

I'd gather this information to try to understand the problem better:

tcpdump -e -i <dev> [filters...]
(-e: Print the link-level header on each dump line.)

tcpdump -e -i <dev> -p [filters...]
(-p: Don't put the interface into promiscuous mode.)

If frames are visible when running in promiscuous mode which aren't
visible when running with -p, note the destination ethernet address of
those frames and compare it against the outputs from "ip link" and
"brctl showmacs <brdev>".  They're likely coming in a port which
considers that destination address foreign.  

