From: =?ISO-8859-1?Q?Fran=E7ois?= Delawarde 
	<fdelawarde@wirelessmundi.com>
Subject: Re: kernel panic when adding QUEUE to OUTGOING
Date: Wed, 04 Nov 2009 15:32:35 +0100
Message-ID: <1257345155.1254.245.camel@francois.tc.commsmundi.com>
References: <1257332494.1254.218.camel@francois.tc.commsmundi.com>
	 <4AF163EE.7060306@trash.net>
	 <1257337891.1254.220.camel@francois.tc.commsmundi.com>
	 <4AF183A7.5060005@trash.net>
	 <1257342875.1254.224.camel@francois.tc.commsmundi.com>
	 <4AF18937.5010901@trash.net>
Reply-To: fdelawarde@wirelessmundi.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AF18937.5010901@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org

On Wed, 2009-11-04 at 15:01 +0100, Patrick McHardy wrote:
> I can't find anything which could cause this. Please post full
> information (all netfilter rules, ping version, qdiscs and whatever
> else might seem important).
>=20
> Also, your kernel is already tainted (D), please retry with
> a cleanly booted kernel.

I reproduce right after a reboot, and it's still tainted, how do I
remove that? The only strange thing at boot would be some vga=3D option=
 in
lilo that fails (because of a wrong value) and asks me for a mode.

It might be worth noting that the kernel is patched with IMQ, latest
version from linux-imq.net, but the IMQ device is not used.

Versions:
- Everything Debian Lenny except for the kernel and iptables
- Linux 2.6.30.9 SMP-PREEMPT (also happened with older 2.6.30 versions)
- iptables v1.4.4 patched with IMQ
# ping -V
ping utility, iputils-sss20071127

Hardware:
- Reproduced on an HP-ML110 and some man-made gigabyte motherboards wit=
h
old dual-cores and realtek eths.
- Could not reproduce in QEMU/KVM with the exact same SW versions.


My script running right before the command that causes panic is:
# cleanup
iptables -t mangle -F
iptables -t nat -F
iptables -t filter -F
tc qdisc del dev eth0 root
tc qdisc del dev eth1 root
ip address flush dev eth0
ip address flush dev eth1
ip rule flush
ip route flush

# configure
ip rule add prio 32766 from all lookup main
ip rule add prio 32767 from all lookup default
ip address add dev eth0 192.168.10.218/24 brd +
ip route add default via 192.168.10.1

The exact commands I run are:
# iptables -I OUTPUT -j QUEUE
# ping google.com

Appart from a ping command, anything generating traffic will provoque
the panic like an ssh command or just waiting for some incoming
packets.=20
It does not happen at the very first packet, as I have results when I d=
o
the following from a remote machine (by ssh):
# iptables -I OUTPUT -j QUEUE; cat /proc/net/netfilter/nf_queue
 0 NONE
 1 NONE
 2 NONE
 3 NONE
 4 NONE
 5 NONE
 6 NONE
 7 NONE
 8 NONE
 9 NONE
10 NONE
11 NONE
12 NONE


Thanks,
=46ran=C3=A7ois.

