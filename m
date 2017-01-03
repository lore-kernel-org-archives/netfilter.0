From: Johannes Krupp <johannes.krupp@cispa.saarland>
Subject: same MAC, same IP, different interface - NAT possible?
Date: Tue, 3 Jan 2017 02:17:25 +0100
Message-ID: <586AFBA5.6030108@cispa.saarland>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Dear netfilter community,

I have a setup* in which I have a server with multiple virtual network
interfaces (vif1 .. vifX) that are connected (bridged) to one virtual
machine each (vm1 .. vmX) which all have the same IP and MAC (let's say
192.168.1.100 resp. 00:11:22:33:44:55). In addition to that my server
also has one regular network interface (eth0) connected to the rest of
my network (10.0.0.0/16).

Now I would like to be able to provide NAT-like capabilities such that
every packet coming from vm1 reaches the regular network as coming from
10.0.1.1, every packet coming from vm2 as 10.0.1.2 and so on. Of course,
packets coming from the network destined towards 10.0.1.x should also be
correctly translated by the server such that vmX will receive them.

From what I understand I could use ebtables with the snat-target to
rewrite the MAC addresses for the vifX bridges, such that the remaining
network would see at least a different MAC address per VM. However, I
cannot see an easy solution to rewrite the IP. Using iptables nat-table
and the snat-target will not work, since I would need to also filter on
the source-mac or incoming device, but the snat-target is only available
on the POSTROUTING chain.

One possible to solution would be to write a small program that listens
on a rawsocket on every interface, rewrites packets and re-sends them on
the correct interface, but I'd rather avoid that and use standard tools
instead.

I would be very grateful for ideas/tips,

kind regards,

Johannes


*The reason all virtual machines have the same MAC and IP is that I want
to run a analysis on memory dumps and would like all VMs to be as
identical as possible.
