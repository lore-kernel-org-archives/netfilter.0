From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: GRE over two NATs
Date: Tue, 05 Apr 2005 01:36:49 +0200
Message-ID: <4251CF91.2030509@lopsch.com>
References: <20050404190444.GA22407@epsilon.rdc.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050404190444.GA22407@epsilon.rdc.pl>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Mariusz Kruk schrieb:
> I have a router with 4 interfaces on which I prepared a "IMQ without IM=
Q
> setup". Long story short - every packet that traverses the router is
> first pushed through a tunnel set up between 127.0.0.2 and 127.0.0.3.
> Therefore I can easily shape the trafic for all interfaces.
>=20
> It looks like this (one interface only for simplicity):
>=20
> localnet --- eth3 --- localend <---------> remoteend --- eth0 --- world
>=20
> Where localnet is of course my local network, eth3 is a local interface=
,
> localend is a "local" end of the tunnel, and so on.
> I use NAT and therefore I have to NAT every packet twice, since... I
> don't exactly remember what was the exact reason but it had something t=
o
> do with connection tracking. Anyway, my 192.168.0.0/16 local addresses
> are first mapped 1-to-1 to 172.16.0.0/16 addresses and finally all are
> mapped to my public IP.
> Everything runs well except GRE.
> My users complained that they can't connect to their VPNs over PPTP.
> PPTP uses GRE, so I started to log packets in various tables.
> I found that for a GRE packet generated in localnet it goes like this:
> eth3, mangle/prerouting, mangle/forward, filter/forward, mangle/postrou=
ting,
> nat/postrouting, localend.
> Then the packet gets in the box again from the remoteend end of the
> tunnel and, surprisingly to me, gets logged at mangle/prerouting and
> nat/prerouting(!).
>=20
> Why is it so?
> I won't be attaching my setup here since it is generated from a script
> and has quite a few hundred rules (yes, I know it's not veryeffective,
> but I wanted to have a vanilla kernel, and it's kind of a
> proof-of-concept), but there is no rule that should filter such packets=
.
> There is no rule in nat/prerouting table that applies to those packets.
> I have completely no idea. :-(

I don=B4t really understand your setup so far but for GRE to work behind=20
NAT you need connection tracking modules because afaik there=B4s nothing=20
like NAT-T for GRE like for IPSec. I hope I=B4m not totally telling you=20
nonsense. For PPTP and GRE there are conntrack modules in POM-NG.

