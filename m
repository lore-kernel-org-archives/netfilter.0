From: Mark Fox <mark.fox@gmail.com>
Subject: Re: Implications of a permissive FORWARD chain
Date: Wed, 26 Feb 2014 15:42:35 +0000 (UTC)
Message-ID: <loom.20140226T163317-807@post.gmane.org>
References: <loom.20140218T183628-993@post.gmane.org> <201402181710.01163.neal.p.murphy@alum.wpi.edu> <loom.20140219T022735-831@post.gmane.org> <201402182152.38155.neal.p.murphy@alum.wpi.edu> <loom.20140219T152148-367@post.gmane.org> <53092C70.1060204@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Pascal Hambourg <pascal <at> plouf.fr.eu.org> writes:
> [...]
> 
> This is of course wrong. The host does the job of passing packets to and
> from VMs, so it has to see the traffic.

Agreed. Certainly, that matches with what I'm experiencing.

> > My understanding was that a bridge was a layer 2 device and netfilter would
> > be completely out of the loop on traffic travelling across the bridge.
> 
> Not if the kernel has BRIDGE_NETFILTER=y. Then the various
> net.bridge.bridge-nf-* sysctls control which kind of traffic is passed
> to conntrack, iptables, ip6tables or arptables. By default all is passed.

Yes. To be clear, I'm ecstatic that this capability exists. A little
surprised too, but happy that there is another place to do some firewalling
if needed.

> 
> > So I
> > disabled all forwarding on the container host, but was surprised when that
> > cut the containers off.
> 
> What do you mean exactly by "I disabled all forwarding" ?
> Setting net.ipv4.ip_forward=0 or net.ipv4.conf.*.forwarding=0 should
> have no effect on bridged traffic. However iptables' DROP or REJECT may
> have an effect on IPv4 bridged packets when
> net.bridge.bridge-nf-call-iptables=1.

I set the policy for forwarded traffic to DROP.

> > I don't get the impression that this is specific to containers.
> 
> It is not. It is specific to Linux bridge.

Cool. That makes perfect sense.

> > There is documentation
> > saying that one should do a 'iptables -I FORWARD -m physdev
> > --physdev-is-bridged -j ACCEPT' to allow traffic between a host and any KVM
> > guests.
> 
> It is simpler and more efficient to disable passing bridged IPv4 packets
> to iptables with net.bridge.bridge-nf-call-iptables=0.

Agreed. Since I (now) want to take advantage of the firewalling ability, I
won't be doing this here, but it is good to know it is possible.

Thanks for the discussion. It's been enlightening.

