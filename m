From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: DMZ howto
Date: Thu, 22 Sep 2005 13:21:32 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7742E2D4A@farmer.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of P=20
> theodorou
> Sent: Thursday, September 22, 2005 8:50 AM
> To: netfilter@lists.netfilter.org
> Subject: DMZ howto=20
>=20
> Hello
>=20
> I want to achieve the firewall script in the official=20
> iptables tutorial 1.20 version practices here=20
> http://iptables-tutorial.frozentux....MZ.firewall.txt
>=20
> typically a well known set up is
> to receive traffic from the ISP via dhcp which assigns IP to=20
> eth0 and eth0 forwords traffic to eth1 (NAT) which is the=20
> default gateway for a laptop .
>=20
> Now the machine has eth0 eth1 and eth2 so far we have spoken=20
> for eth1 . Eth2 i wanted to be a DMZ for servers who need=20
> passive connections FTP etc...
>=20
> The concept of DMZ confuses me , can you suggest any=20
> resources for the topic ?
>=20
> Really appreciated

Technically a DMZ is a subnet with unfiltered access to the internet.
However common usage of the term is a subnet with servers running
services available to the outside world. I can't think of any reason why
an internal network shouldn't be protected by a firewall (not that
firewalls are the answer to security...).

The point of having a separate network for your servers (DMZ) is to
isolate them from the outside world _and_ from your inside users. You
then use your FORWARDing rules to dictate what can travel between the
networks, just like you do for a WAN/LAN setup, but instead of two
possible vectors (WAN->LAN, LAN->WAN) you've got six: WAN->LAN,
WAN->DMZ, DMZ->WAN, DMZ->LAN, LAN->WAN, LAN->DMZ. Makes it easy to
inadvertently block traffic.

Derick Anderson

