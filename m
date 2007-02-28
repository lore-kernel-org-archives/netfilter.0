From: "Andrew Kraslavsky" <andykras@hotmail.com>
Subject: Blocking direct private IP address
Date: Wed, 28 Feb 2007 15:20:49 -0800
Message-ID: <BAY119-F18E57FAE6C344557F46010D6810@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hello,

I am experiencing an unusual problem relating to a DNAT causing a private I=
P=20
address to become accessible from the public network and I am hoping for=20
advice on how to avoid this problem.

The set up (slightly simplified to avoid clutter) is:

One external/public interface (eth0) on the firewall/router - IP 10.0.0.1/24
One internal/private interface (eth1) on the firewall/router - IP=20
192.168.0.1/24
A Web server on the internal/private network - IP 192.168.0.99

If I add this rule to the nat:PREROUTING chain...

iptables -t nat -A PREROUTING -d 10.0.0.1 -j DNAT --to-destination=20
192.168.0.99

...traffic addressed to the firewall/router at 10.0.0.1 has the destination=
=20
IP address changed to 192.168.0.99 as expected and that traffic is forwarde=
d=20
to the Web server.

So far so good.  Now, here's the bad part.

If I set up a host on the external/public network with a static route that =

causes it to send traffic addressed to 192.168.0.0/24 to the 10.0.0.1=20
external/public IP address of the firewall/router and then attempt to acces=
s=20
the Web server using 192.168.0.99 as the address, these directly addressed =

packets get through the firewall.

The reason these packets are not dropped by my filter:FORWARD chain is=20
because, at that point, the destination IP is 192.168.0.99 regardless of=20
whether the destination was NATted or not. I.e., I do not how to create a=20
filtering rule that says "allow traffic from eth0 to 192.168.0.99 on eth1, =

but only if it was NATted".

I can certainly drop the directly addressed packets in the mangle:PREROUTIN=
G=20
chain, either by adding a rule that tests for and drops all possible local =

subnets IP address destinations on incoming eth0 traffic or, probably more =

cleanly, add a rule in mangle:PREROUTING that only allows through packets=20
from eth0 with a destination IP of 10.0.0.1, but it seems like the iptables=
=20
guidlelines are to only do filtering in the filter table.

I also did some research on /proc settings but could not find one that=20
seemed to meet my needs.

The other option I was considering was to define some advanced routing=20
stuff, but I have not really looked into that in detail yet.

Any advice would be greatly appreciated.  Hopefully this is simply one of=20
those "d'oh!" kinds of things and I have missed a very easy answer=20
somewhere.

Thanks,

- Andrew Kraslavsky

_________________________________________________________________
Find a local pizza place, movie theater, and more=85.then map the best rout=
e!=20
http://maps.live.com/?icid=3Dhmtag1&FORM=3DMGAC01


