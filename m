From: Stephen Mathezer <mathezer@yahoo.com>
Subject: DNAT to a virtual IP problems
Date: Tue, 18 Feb 2003 13:03:00 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030218200300.GC15233@yahoo.com>
Reply-To: Stephen Mathezer <mathezer@yahoo.com>
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

I am having some trouble with DNAT. For various reasons I am running a
webserver that is listening on virtual IP addresses on the internal
interface of my firewall.  I am trying to forward ports 80 and 443 from
the external interface to various virtual internals.  No matter what I
do, packets never seem to show up on the virtual interfaces.

Relevant facts:

Kernel 2.4.17, iptables 1.2.6a (I could upgrade if I knew it would fix
                                my problems)
Cable internet connection (ie: DHCP) on the external interface
eth0 is external
eth1 is internal (192.168.8.1/24)

I have tried using an address on the same subnet (192.168.8.22) as well
as addresses on other subnets (192.168.3.22) for interfaces eth1:0,
eth1:1 etc.  NAT'ing to another box on the internal LAN works fine, it
is just NAT to the virtual that is broken.

I am doing the DNAT as follows:

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 443 -j DNAT --to
192.168.8.22:443

Tcpdump on eth0 shows traffic arriving, iptables doesn't log anything
interesting, although I guess I don't have any logging configured in the
nat table.  Tcpdump on eth1:0 never sees any packets arriving.

I am permitting port 443 connections inbound on eth0. An identical
configuration, except NAT'ing to another webserver on the LAN works
fine, it is just NAT'ing to a virtual that doesn't work.

I have also tried doing the source NAT just in case, although since
traffic never gets to eth1:0 it shouldn't matter at this point:

iptables -t nat -A POSTROUTING -d 192.168.8.22 --dport 443 -j SNAT --from 192.168.8.1

Should this work? Is there something else that I need to be doing?

thanks for any tips

-Steve

