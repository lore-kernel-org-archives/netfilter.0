From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: Re: NAT doesn't work (only a fraction of the forwarded packets
	reach the postrouting chain)
Date: Sun, 13 Mar 2005 15:20:33 +0200
Message-ID: <1403218a05031305206cb5a0d8@mail.gmail.com>
References: <02BB8A4AC86C564C89C7F14CF98CE0C49B73@knowledge.wizdom.nu>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <02BB8A4AC86C564C89C7F14CF98CE0C49B73@knowledge.wizdom.nu>
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
To: Sietse van Zanen <sietse@wizdom.nu>, netfilter <netfilter@lists.netfilter.org>

On Sun, 13 Mar 2005 13:14:31 +0100, Sietse van Zanen <sietse@wizdom.nu> wro=
te:
> What do you see, when you tcpdump on your external interface? (tcpdump -I=
 eth0). Can you see natted packets exiting that interface?
>=20
> The reason, that you only see 4 packets in the iptables -t nat -L is that=
 if you fire off 10 pings, iptables will see the latter 9 as belonging to t=
he same connection and therefor only logs 1.

How come ???


>=20
> It might be as simple, that the host you are trying to ping is just unpin=
gable.
>=20
> Specify some more info, like what you are trying to ping, traceroute -I o=
utput.
>=20
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-bounces@lis=
ts.netfilter.org] On Behalf Of M=E5rten Segerkvist
> Sent: Sunday, March 13, 2005 1:01 PM
> To: netfilter@lists.netfilter.org
> Subject: RE: NAT doesn't work (only a fraction of the forwarded packets r=
each the postrouting chain)
>=20
> On Sun, 13 Mar 2005, Sietse van Zanen wrote:
>=20
> > From man iptables:
> > MASQUERADE
> > This target is only valid in the nat table, in the POSTROUTING chain.
> > It should only be used with dynamically assigned IP (dialup)
> > connections: if you have  a  static  IP address,  you should use the
> > SNAT target.
> >
> > Try using regular SNAT rule:
> >
> > Iptables --table nat --append POSTROUTING --out-interface eth0 -j SNAT
> > --to-source:your.pub.ip.addr
> >
>=20
> Now using:
>=20
> echo 1 > /proc/sys/net/ipv4/ip_forward
> modprobe ipt_MASQUERADE
> modprobe iptable_filter
> iptables --table nat --append POSTROUTING --out-interface eth0 -j SNAT \
>    --to-source 81.172.241.145
> iptables --append FORWARD --in-interface eth1 -j ACCEPT
>=20
> This gives me the same result as previosly. What confuses me further is
> that no packets seems to be accepted from the wlan-interface.
>=20
> > iptables -L -v
>=20
> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
>   pkts bytes target     prot opt in     out     source
> destination
>    125  5000 ACCEPT     all  --  wlan0  any     anywhere
> anywhere
>=20
> > iptables -t nat -L -v
>=20
> Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
>   pkts bytes target     prot opt in     out     source
> destination
>      4   295 SNAT       all  --  any    eth0    anywhere
> anywhere            to:<IP>
>=20
> As before, I'd be most grateful for any suggestions!
>=20
> /M=E5rten Segerkvist
>=20
>=20


--=20
Mohamed Eldesoky
www.eldesoky.net
RHCE

