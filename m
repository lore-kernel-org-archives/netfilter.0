From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: RE: Difference between arp proxy and dnat?
Date: Tue, 05 Oct 2004 12:52:51 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096995170.2061.79.camel@localhost>
References: <7C9884991ADAE0479C14F10C858BCDF591E383@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF591E383@alderaan.smgtec.com>
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
To: Daniel Chemko <dchemko@smgtec.com>, mlist@libero.it, netfilter@lists.netfilter.org

On Tue, 2004-10-05 at 12:25, Daniel Chemko wrote:
> > a) What is the difference between them?
> 
<snip>
Daniel gave a very good technical explanation.  There is a little more
than can be explained when it comes to application.  There is also some
confusion about terminology; I'll address that in question d below.

In my experience, proxy arp as understood by Linux (as opposed to how it
is understood by Checkpoint and some router literature), is much less
common than DNAT.  It is used when both sides of the proxy ARP device
are on the same network.

I'm trying to recall why I have used proxy arp in the past (it has been
quite a while).  The idea of using it to control access with ebtables
is, I think, a rather unique innovation.  If I do recall correctly, we
used it to divide very large broadcast domains.  In other words, as
switches became popular and we started pulling out core routers and
flattening networks, we introduced very large networks.  I do recall
sites that used a full class B to create one huge 65535 node network. 
That means that all broadcast traffic from a stations, e.g.,ARP
requests, DHCP discoveries, NetBIOS broadcasts are processed by every
other station.  The broadcast storms could become intolerable.

I believe, in such situations, we broke the network into separate
broadcast domains by not allowing broadcasts from one segment to another
even though they were the same network.  To allow address resolution
between the segments, we had to have the segmenting device proxy the ARP
response.

I think we may have used it on some complex sites where different
devices on the same media had different subnet masks.  Since the devices
with the smaller subnet masks would ARP when the stations with the
larger subnet masks would route, we had to find a way to match to two
for address resolution.  I think we used proxy ARP in such situations
but I'm a bit rusty on that one.

As you can tell, these are pretty out of the  ordinary.
> 
> > b) Are there situation in which I could be forced to use one of them?
> 
<snip>
> 
> You will be forced to use it when you want
> public IP assigned computers to have internet access. <snip>
Unless I misunderstand you, I'm not sure why that would require proxy
ARP unless they were on the same subnet as the public interface of the
gateway.  Even if they are non-RFC1918 addresses, I would still DNAT. 
In fact, even if they were on the same subnet as the gateway public
interface, I would generally use RFC1918 addresses and NAT unless
someone really, really objected - perhaps that is exactly what you are
saying, Daniel, just with slightly different words.
> 
<snip>
> > d) Why lot of famous firewall suggest to use arp proxy?
> 
> Because you are basically guaranteed that a protocol will work, it means
> less support costs for them :-) If you have patience, it can be a good
> solution. 
I think this is more of a semantic issue.  Some literature uses the term
proxy ARP to simply mean that the public interface must respond to ARP
requests for addresses that are not ultimately used by the gateway
itself.  In other words, if the gateway is 1.1.1.1 and you have a device
at 10.1.1.2 on your DMZ that you want to DNAT to 1.1.1.2, then, in
Checkpoint and other literature terminology, you must tell the gateway
to "proxy ARP" for 1.1.1.2.

In Linux terminology, we would say that we are binding a second address
to the interface
ip address add 1.1.1.2/24 dev eth0 brd +
and that this is not true "proxy ARP".

Hope that clarifies rather than confuses! - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


