From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: NAT doesn't work (only a fraction of the forwarded packets
	reach the postrouting chain)
Date: Sun, 13 Mar 2005 14:34:52 +0100
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C49B74@knowledge.wizdom.nu>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter <netfilter@lists.netfilter.org>

Because netfilter is a stateful firewall basically.
It logs the first per NEW and marks the latter as RELATED,ESTABLISHED.

Only packets that match the NEW state will increment the counters. It =
counts how many connections have been set-up. Not how many packets =
belonging to a connection pass. These will be counted in a -j ACEEPT =
--state RELATED,ESTABLISHED rule, if present.

You could bypass this by creating stateless rule, but that would defeat =
the purpose of a stateless firewall.

-----Original Message-----
From: Mohamed Eldesoky [mailto:eldesoky.lists@gmail.com]=20
Sent: Sunday, March 13, 2005 2:21 PM
To: Sietse van Zanen; netfilter
Subject: Re: NAT doesn't work (only a fraction of the forwarded packets =
reach the postrouting chain)

On Sun, 13 Mar 2005 13:14:31 +0100, Sietse van Zanen <sietse@wizdom.nu> =
wrote:
> What do you see, when you tcpdump on your external interface? (tcpdump =
-I eth0). Can you see natted packets exiting that interface?
>=20
> The reason, that you only see 4 packets in the iptables -t nat -L is =
that if you fire off 10 pings, iptables will see the latter 9 as =
belonging to the same connection and therefor only logs 1.

How come ???


>=20
> It might be as simple, that the host you are trying to ping is just =
unpingable.
>=20
> Specify some more info, like what you are trying to ping, traceroute =
-I output.
>=20
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org =
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of M=E5rten =
Segerkvist
> Sent: Sunday, March 13, 2005 1:01 PM
> To: netfilter@lists.netfilter.org
> Subject: RE: NAT doesn't work (only a fraction of the forwarded =
packets reach the postrouting chain)
>=20
> On Sun, 13 Mar 2005, Sietse van Zanen wrote:
>=20
> > From man iptables:
> > MASQUERADE
> > This target is only valid in the nat table, in the POSTROUTING =
chain.
> > It should only be used with dynamically assigned IP (dialup)
> > connections: if you have  a  static  IP address,  you should use the
> > SNAT target.
> >
> > Try using regular SNAT rule:
> >
> > Iptables --table nat --append POSTROUTING --out-interface eth0 -j =
SNAT
> > --to-source:your.pub.ip.addr
> >
>=20
> Now using:
>=20
> echo 1 > /proc/sys/net/ipv4/ip_forward
> modprobe ipt_MASQUERADE
> modprobe iptable_filter
> iptables --table nat --append POSTROUTING --out-interface eth0 -j SNAT =
\
>    --to-source 81.172.241.145
> iptables --append FORWARD --in-interface eth1 -j ACCEPT
>=20
> This gives me the same result as previosly. What confuses me further =
is
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

