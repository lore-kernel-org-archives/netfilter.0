From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Difference between arp proxy and dnat?
Date: Tue, 5 Oct 2004 09:25:23 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E383@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: mlist@libero.it, netfilter@lists.netfilter.org


> a) What is the difference between them?

With NAT, you change the packet as its travelling through the firewall
so if I want to hit 24.83.292.111 the packet would turn into something
like destination 192.168.3.665. Because of this 'destination address
change' it may break the odd badly designed protocol like FTP. In order
to counter this negative side-effect, netfilter developers have written
modules for 'fixing' these protocols to work in NAT environments.

With ProxyARP, you have two network segments, lets say A and B. They
have the exact same subnet, but now there's a firewall between them. If
hosts from A want to talk to B, the firewall has to -transparently-
service the request to the host in B. This is done by ProxyARP. ProxyARP
basically says, if I know machine C1 is in subnet B, then let people in
A know that the firewall is C1. If C2 is in the A network, then the
firewall must let the B subnet think that the firewall is C2.

In order to properly use ProxyARP in this configuration, you should also
be using ebtables and the Linux bridging software.=20

Below is a pretty terse description of how this all works.

             |----[br0]----|
             |             |
[A Net] - [eth0][Firewall][eth1] - [B Net]
 |-254     |-100           |-101    |-1
 |-253                              |-2
                                    |-3

254 -> MAC:FFFF who has 3
MAC:eth0 -> MAC: 254 (I do)
254 -> MAC:eth0 (payload)
101 -> MAC:FFFF who has 3
MAC:3 -> MAC:eth1 (I do)
MAC:eth1 -> MAC:3 (payload)
MAC:3 -> MAC:FFFF who has 254
MAC:eth1 -> MAC:3 (I do)
MAC:3 -> MAC:eth1 (payload)
MAC:eth0 -> MAC:254 (payload)

Once the ARP entries are cached, this path becomes a lot less chatty.


> b) Are there situation in which I could be forced to use one of them?

NAT can be used any time that you are using software that doesn't break
with NAT software. There isn't really a reason not to use it unless the
protocols your using don't work with it.

ProxyARP is more difficult to setup / wrap your head around, and I find
it less clear-cut to use. You will be forced to use it when you want
public IP assigned computers to have internet access. Generally Bridged
solutions are never 'required' unless you have customers that care about
it. Also, it could be a hassle moving the IP's of all those computers to
private IP's if you try moving to NAT.


> c) What is the best?

I prefer NAT, but both have meaningful purposes through.


> d) Why lot of famous firewall suggest to use arp proxy?

Because you are basically guaranteed that a protocol will work, it means
less support costs for them :-) If you have patience, it can be a good
solution.=20


