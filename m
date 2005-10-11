From: "Jorge I. Davila L." <davila@cablenet.com.ni>
Subject: Re: iprange match
Date: Tue, 11 Oct 2005 14:26:50 -0600
Message-ID: <1129062410.2415.103.camel@vyatka-39.cablenet.com.ni>
References: <1129043668.2415.12.camel@vyatka-39.cablenet.com.ni>
	<200510111351.51801.rob0@gmx.co.uk>
	<1129059566.2415.86.camel@vyatka-39.cablenet.com.ni>
	<200510111506.03998.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510111506.03998.rob0@gmx.co.uk>
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
Content-Type: text/plain; charset="iso-8859-1"
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org

robO:

I'm understand very well that you are telling me ... I need the ability
to define ranges, the firewallS are over 1400 lines ...I don't want loss
my time establishing individual rules for each ip or for w.x.y.z/mask
when maybe the source of the traffic (or the resource that is reached)
overlaps the defined addresss or range used to define the users
(accessor) or the boxes and the services running in those boxes and
considering the changes in the firewall configurations because of
changes in the bussines.

I need flexibility ... this "fine" tool is a "required" tool for me :-(

Can you give me some light about how to solve this issue?

Again:

I'm using

fedora core 3
kernel 2.4.30
iptables 1.3.3

Best regards,

Jorge.
El mar, 11-10-2005 a las 15:06 -0500, /dev/rob0 escribi=F3:
> > El mar, 11-10-2005 a las 13:51 -0500, /dev/rob0 escribi=F3:
> > > Please don't top-post your replies. It makes it very difficult to
> > > follow, especially since the post you're replying to has not (yet?)
> > > reached the list.
>=20
> > > On Tuesday 2005-October-11 13:36, Jorge I. Davila L. wrote:
> > > > iptables -A OUTPUT -p tcp -m iprange \
> > > > --src-range 192.168.223.1-192.168.223.2 \
> > > > -j ACCEPT
> > > >
> > > > iptables: No chain/target/match by that name
> > >
> > > I guess this means that your kernel lacks support for the iprange
> > > target. "CONFIG_IP_NF_MATCH_IPRANGE=3Dm"
> > >
> > > This is at most a minor inconvenience. You can always use CIDR
> > > addressing and multiple rules. (I always try to keep logical breaks
> > > in network space on CIDR boundaries, to facilitate this.)
>=20
> On Tuesday 2005-October-11 14:39, Jorge I. Davila L. wrote:
> > I need the iprange working because I don't want use a large set of
> > rules.
>=20
> Are you not familiar with CIDR addressing?
>=20
> The example you posted would only be two rules for individual IP's. I=20
> understand, that was only an example, but creative use of CIDR can do=20
> the job quite well. You can jump a CIDR block larger than your iprange=20
> to a special chain, and put exception rules with -j RETURN targets at=20
> the top.
>=20
> And again, in designing your networks, it helps to think in hexadecimal=20
> terms. In a class C (/24) I often use 128-191 as the DHCP range. That=20
> would be x.x.x.128/26 in CIDR. I try to keep static IP ranges in blocks=20
> of 8, 16 or 32 and grouped by purpose.
>=20
> There's nothing wrong with -m iprange; it's a fine tool.  But I get=20
> along quite well without it.
--=20
Jorge Isaac Davila Lopez


