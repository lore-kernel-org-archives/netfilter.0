From: Steven Kath <steven.kath@vyatta.com>
Subject: Re: Traffic traverses OpenSwan tunnel, return traffic does not
Date: Sat, 01 Oct 2011 13:23:32 -0700 (PDT)
Message-ID: <7c8e3571-7944-4ab5-9ad9-e2634a75c119@tahiti.vyatta.com>
References: <0F5ECE8E-608E-41BC-9C37-2A5FF23A2687@sequestered.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <0F5ECE8E-608E-41BC-9C37-2A5FF23A2687@sequestered.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Corey Quinn <corey@sequestered.net>
Cc: netfilter@vger.kernel.org

----- "Corey Quinn" wrote:
> I have a box with a iptables on it (usually a good prerequisite for
> mailing this list) that has a public IP (munged) of 216.52.2.93.
>  I'm attempting to build an IPSEC tunnel between this box and a
> Fortinet 60C.  I can send traffic across the IPSEC link from the
> Fortigate (tcpdump shows it arriving properly), but the return
> packets (as well as anything else that I attempt to push over the
> tunnel) to 192.168.7.1 (the Fortigate) die at the default gateway
> (216.52.2.94)-- they're never entering the tunnel, and RFC1918
> addresses don't route, obviously.
>=20
> The iptables setup on this box is somewhat convoluted, hence my
> suspicions.  (I've stripped out a few rewrites that don't touch
> those networks and consistently munged the IPs for obvious reasons=E2=
=80=A6)
>=20
> Is this actually an iptables issue, or am I barking up the wrong
> tree?  iptables and routing table are below, please let me know if
> there's anything else I should provide.
>=20
>=20
> root@bel:~# iptables -L -n
=2E..
>=20
> eth0 is the public interface, eth1 is the internal interface, and
> tun0 is an OpenVPN server that doesn't factor into these issues, but
> I've included it for clarity.

It's hard to be sure if any of the filter rules apply to your IPsec pol=
icy without knowing the exact leftsubnet and rightsubnet you're using w=
ith OpenSWAN.  Besides that, if you're seeing the packets leave for the=
 gateway unencrypted, you're not dropping them, so the output of your f=
ilter table probably isn't relevant.  =20

Are you doing any source or masquerade NAT?  If so, what does your NAT =
table look like?  (iptables -vnL -t nat) Better yet, show the output of=
 'iptables-save' instead which includes all tables.=20

I frequently see SNAT or MASQ rules applied to traffic which should be =
encrypted.  Since the nat POSTROUTING chain is traversed before the tra=
nsform policies are applied, such a rule can change the source address =
to one that does not match the policy before the encryption decision is=
 made. =20

You can tell this is happening if you capture the packets going out the=
 interface facing your gateway (eth0) destined for the openswan rightsu=
bnet with a source address which is not in the leftsubnet.  In those ca=
ses, you can create a rule to early in the nat POSTROUTING chain to kic=
k packets with a source/dest pair matching your encryption policy out o=
f the chain (target ACCEPT) before they hit the SNAT/MASQ rules.=20
