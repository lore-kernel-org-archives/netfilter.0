From: <mlist@libero.it>
Subject: R: Difference between arp proxy and dnat?
Date: Wed, 6 Oct 2004 23:21:45 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <650.091810575937$1097097758@news.gmane.org>
References: <1096995170.2061.79.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1096995170.2061.79.camel@localhost>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: "'John A. Sullivan III'" <john.sullivan@nexusmgmt.com>, 'Daniel Chemko' <dchemko@smgtec.com>, netfilter@lists.netfilter.org

Hi Daniel and John.

Before all I thank you for this good explanation because I think it will =
be
very useful not only for me.
Unfortunately I still have some things not complitely clear about proxy =
arp
and DNAT. Because I'm not a network guru like you, I kindly ask you to
follow my speech and explain what is wrong in my understanding.

1) Actually I have Checkpoint firewall one (4.1) running on NT.
My firewall is like this:

                         internet
                             |
                             |
                         (2.2.2.9)
192.168.0.x(dmz)---------checkpoint
     |         |             |
  public     public          |
 web srv     ftp srv        lan
192.168.0.5  192.168.0.7   172.16.100.x

I have 16 public ip and, to provide public access to my servers
(192.168.0.x) in dmz, I use Checkpoint proxy arp future (explained =
through a
step by step guide for dummies people like me in this document:
http://www.giac.org/practical/GSEC/Eugene_Ng_GSEC.pdf)
Supposing I would map 2.2.2.10 to 192.168.0.5 I must:
a) modifify c:\winnt\fw1\4.1\state\local.arp adding entry like this:
IP ADDRESS		MAC ADDRESS OF EXT INTERFACE
2.2.2.10		08-00-20-76-ea-77
this will allow any packets destined for 2.2.2.10 to be "routed" to our
firewall. The router sees that the firewall's MAC address is listening =
for
packets with ip address of both 2.2.2.10 and 2.2.2.9
b) reinstall the policy
c) Once the ip addresses have successfully been routed to the firewall,
a final change must be made on the firewall itselt. A static route
will need to be added to pass the request onto an internal ip
address. In our example, the static route will be:
route add 2.2.2.10 mask 255.255.255.255 192.168.0.5 -p

2) I have others office with structures like this in which there is an
iptables firewall and I always use DNAT adding public ip to external
interfaces and adding rules like this:
iptables -t nat -A PREROUTING -d 2.2.2.10/24 -j DNAT --to-destination
192.168.0.5

John said:
Some literature uses the term proxy ARP......
In Linux terminology, we would say that we are binding a second address =
to
the interface ip address add 1.1.1.2/24 dev eth0 brd + and that this is =
not
true "proxy ARP".

Now....and finally....^_^
Are corrected the following affirmations? If not PLEASE CORRECT them =
with a
brief explanation
a) Proxy arp is a technique used by most firewall producers and its
functionality is similar to that explained above (Checkpoint)
b) To map public ip address to private ip address, with LINUX you can =
use
DNAT or PROXY ARP while others commercial products, generally offers =
only
proxy arp (except those based on linux, like Astaro security linux).
Technically speaking DNAT and PROXY arp aren't the same, but, in order =
to
provide mapping (public to private) the result is the same.
c) With Linux you can use both, but, technically speaking, LINUX PROXY
IMPLEMENTATION is not equal to that of others producers and, as john
explained, this is not true "proxy ARP"

Only a final question to john:
John...in your answer you said that proxy arp is used when both sides of =
the
proxy ARP device are on the same network. Daniel explained instead that =
you
can use proxy arp for example if you have softwares that doesn't work =
with
nat; thus i suppose that sides of the proxy ARP devices can be on =
different
networks.
Do you agree with Daniel? Thus...is correct the point "b" of my
affirmations?

I apoligize for the length of this email but I dream to definitively
understand this concept that, in last year, I never understood even =
though I
read tons of documents.

Thanks
Marco
Italy



-----Messaggio originale-----
Da: John A. Sullivan III [mailto:john.sullivan@nexusmgmt.com]=20
Inviato: marted=EC 5 ottobre 2004 18.53
A: Daniel Chemko; mlist@libero.it; netfilter@lists.netfilter.org
Oggetto: RE: Difference between arp proxy and dnat?

On Tue, 2004-10-05 at 12:25, Daniel Chemko wrote:
> > a) What is the difference between them?
>=20
<snip>
Daniel gave a very good technical explanation.  There is a little more =
than
can be explained when it comes to application.  There is also some =
confusion
about terminology; I'll address that in question d below.

In my experience, proxy arp as understood by Linux (as opposed to how it =
is
understood by Checkpoint and some router literature), is much less =
common
than DNAT.  It is used when both sides of the proxy ARP device are on =
the
same network.

I'm trying to recall why I have used proxy arp in the past (it has been
quite a while).  The idea of using it to control access with ebtables =
is, I
think, a rather unique innovation.  If I do recall correctly, we used it =
to
divide very large broadcast domains.  In other words, as switches became
popular and we started pulling out core routers and flattening networks, =
we
introduced very large networks.  I do recall sites that used a full =
class B
to create one huge 65535 node network.=20
That means that all broadcast traffic from a stations, e.g.,ARP =
requests,
DHCP discoveries, NetBIOS broadcasts are processed by every other =
station.
The broadcast storms could become intolerable.

I believe, in such situations, we broke the network into separate =
broadcast
domains by not allowing broadcasts from one segment to another even =
though
they were the same network.  To allow address resolution between the
segments, we had to have the segmenting device proxy the ARP response.

I think we may have used it on some complex sites where different =
devices on
the same media had different subnet masks.  Since the devices with the
smaller subnet masks would ARP when the stations with the larger subnet
masks would route, we had to find a way to match to two for address
resolution.  I think we used proxy ARP in such situations but I'm a bit
rusty on that one.

As you can tell, these are pretty out of the  ordinary.
>=20
> > b) Are there situation in which I could be forced to use one of =
them?
>=20
<snip>
>=20
> You will be forced to use it when you want public IP assigned=20
> computers to have internet access. <snip>
Unless I misunderstand you, I'm not sure why that would require proxy =
ARP
unless they were on the same subnet as the public interface of the =
gateway.
Even if they are non-RFC1918 addresses, I would still DNAT.=20
In fact, even if they were on the same subnet as the gateway public
interface, I would generally use RFC1918 addresses and NAT unless =
someone
really, really objected - perhaps that is exactly what you are saying,
Daniel, just with slightly different words.
>=20
<snip>
> > d) Why lot of famous firewall suggest to use arp proxy?
>=20
> Because you are basically guaranteed that a protocol will work, it=20
> means less support costs for them :-) If you have patience, it can be=20
> a good solution.
I think this is more of a semantic issue.  Some literature uses the term
proxy ARP to simply mean that the public interface must respond to ARP
requests for addresses that are not ultimately used by the gateway =
itself.
In other words, if the gateway is 1.1.1.1 and you have a device at =
10.1.1.2
on your DMZ that you want to DNAT to 1.1.1.2, then, in Checkpoint and =
other
literature terminology, you must tell the gateway to "proxy ARP" for
1.1.1.2.

In Linux terminology, we would say that we are binding a second address =
to
the interface ip address add 1.1.1.2/24 dev eth0 brd + and that this is =
not
true "proxy ARP".

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
http://iscs.sourceforge.net=20


---
Incoming mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.772 / Virus Database: 519 - Release Date: 01/10/2004
=20

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.772 / Virus Database: 519 - Release Date: 01/10/2004
=20



