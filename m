From: "Justin Piszcz" <jpiszcz@servervault.com>
Subject: RE: NAT question
Date: Fri, 11 Mar 2005 10:15:37 -0500
Message-ID: <F8B974E70BDE1745ABB27AF04788FA000235AB@mail1.dulles.sv.int>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

It is either that or what I took from this thread is that he wants the
actual public IP's behind his main machine.


Router ----------> MAINBOX (public ip#1) ---------> BOX1 (public ip#2)
                                         ---------> BOX2 (public ip#3)

Is this the case?

If so, it is possible but I have not personally tried it myself using an
arp daemon so you basically send/forward the traffic to the other hosts.

Check the networking options and help in the kernel configuration for
more information.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Jason
Opperisano
Sent: Friday, March 11, 2005 10:13 AM
To: netfilter@lists.netfilter.org
Subject: Re: NAT question

On Fri, 2005-03-11 at 08:56, Dimitri Yioulos wrote:
> >> Hello, all.
> >> =20
> >> I've recently set up iptables-1.2.8-12.3 on a CentOS 3.4 (RHEL AS
3) box.
> >> Among other things, I've created a DMZ where my Web and mail
servers
> >>live.
> >> My problem is that my Web and mail servers identify themselves with
the
> >> NAT
> >> ip address that I've assigned   Here's my NAT rule:=20
> >>=20
> >>  IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source=20
> >> $INET_IP=20
> >>=20
> >> How can I get these two servers to identify themselves by their own
ip
> >> addresses and still provide NAT for my users?
>=20
> >specify the source address so that only packets from the inside
network
> >match the SNAT rule:
>=20
> >  iptables -t nat -A POSTROUTING -o $INET_IFACE -s $INSIDE_NET \
> >    -j SNAT --to-source $INET_IP
>=20
>=20
> Thanks to all for your replies!
>=20
> I was hopeful about applying the above rule.  Internet connectivity is
fine;
> inbound mail is fine; outbound mail seems not to make it (if the list
> receives this, it's because I rolled back to the original rule).  Does
that
> make any sense?
>=20
> Dimitri

are your web and mail servers NAT-ed as well?  it was unclear from your
original post, an i assumed that you were using Internet-routed IP space
in your DMZ.  if this is not the case--you need to put your rules in the
proper order.

if you have a static (one-to-one) NAT for a DMZ machine, and also want
to perform a hide NAT (many-to-one) NAT for your internal net's outbound
traffic--you'd have something like:

  # inbound one-to-one NAT for web server
  iptables -t nat -A PREROUTING -i $INET_IFACE -d $WEB_SRV_PUB_IP \
    -j DNAT --to-destination $WEB_SRV_PRIV_IP

  # outbound one-to-one NAT for web server
  iptables -t nat -A POSTROUTING -o $INET_IFACE -s $WEB_SRV_PRIV_IP \
    -j SNAT --to-source $WEB_SRV_PUB_IP

  # outbound many-to-one NAT for inside net
  iptables -t nat -A POSTROUTING -o $INET_IFACE -s $INSIDE_NET \
    -j SNAT --to-source $INET_IP

order matters--place the one-to-one SNAT rules before any many-to-one
SNAT rules.

in order for packets destined for $WEB_SRV_PUB_IP to make it to your
firewall's $INET_IFACE, it either needs to be routed that way by your
upstream Internet router, or you need to add it as an alias:

  ip addr add $WEB_SRV_PUB_IP dev $INET_IFACE

HTH...   any sorry for misleading before.

-j

--
"Do you want to change your name to Homer Junior? The kids can call
 you Hoju!"
	--The Simpsons



