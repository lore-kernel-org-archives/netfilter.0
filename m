From: Eric Garver <eric@garver.life>
Subject: Re: nftables equivalent for iptable rules.
Date: Wed, 28 Apr 2021 19:09:55 -0400
Message-ID: <YInrQ/AMEaeWqwf+@egarver.remote.csb>
References: <2ddec11e-b22f-39ef-c8c0-fc08438aa26a@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2ddec11e-b22f-39ef-c8c0-fc08438aa26a@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: R C <cjvijf@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, Apr 28, 2021 at 03:12:14PM -0600, R C wrote:
> Hello,
>=20
>=20
> I have a machine I am running RHEL 8 on. there are two interfaces and I w=
ant
> to forward all traffic between those interfaces (for the src and dst in t=
he
> subnet a wireless device is on).
>=20
> One interface is connected to a switch, WAN side. The other ethernet port
> has an access point, connected wired.
>=20
> I did turn on ipforwarding, and thought I needed only two firewall rules.
>=20
>=20
> sysctl -w net.ipv4.ip_forward=3D1
> firewall-cmd --direct --add-rule ipv4 filter FORWARD 0 -o eno1 -i
> enp0s20u4u1 -j ACCEPT
> firewall-cmd --direct --add-rule ipv4 filter FORWARD 0 -o enp0s20u4u1 -i
> eno1 -j ACCEPT
>=20
>=20
> However,=A0 when I try to do a DNS lookup, it looks like it is being
> blocked/stopped by the firewall, because when I stop the firewall, it just
> seems to work. With the firewall up and running, however I can ping an ip
> address.

Makes sense. firewalld is using the nftables backend and you're adding
direct iptables rules. The packet must pass through both iptables and
nftables.  The forwarding between interfaces is not enabled in nftables
(firewalld).

> for example; if I do "ping www.google.com"=A0 I get a "ping www.google.co=
m:
> Name or service not known"=A0 If I use=A0 an IP address (from www.google.=
com),
> it just works.
>=20
> from what I understand is that iptables lets traffic through that way, but
> bftables does not.=A0 One solution suggested was to=A0 change the firewal=
ld
> backend to iptables, which works, but since at some point I'd need to have
> it work with the nftables back end, I might as well look into that now.

IMO, you have two choices:

  1. upgrade to a newer firewalld (v0.9.0 or later) that has native
     forward filtering
     - https://firewalld.org/2020/04/intra-zone-forwarding
     - https://firewalld.org/2020/09/policy-objects-introduction
     - these features should appear in RHEL-8.5

  2. Use the firewalld iptables backend
     - set FirewallBackend=3Diptables in /etc/firewalld/firewalld.conf

Any other solution will be out-of-band of firewalld and will likely
break in the future.

> So; how do I=A0 set up the firewal effectvely with the same result as=A0 =
with
> iptables?

There is a tool called iptables-translate [1] that can do a rough
translation. However, firewalld does not support adding direct nftables
rules. So you would have to inject the rules out-of-band of firewalld -
which is not recommended.

Hope that helps.
Eric.

[1]:
https://wiki.nftables.org/wiki-nftables/index.php/Moving_from_iptables_to_n=
ftables

