From: rebeca.martinez-garcia@estudiant.upc.edu
Subject: SIP vs NAT, the configuration
Date: Thu, 17 Dec 2009 12:02:16 +0100
Message-ID: <20091217120216.17864m4cx9o37fy8@ek2pim.upc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; delsp="Yes	format=flowed"
To: netfilter@vger.kernel.org
Cc: vhuertas@indra.es


Hi all,

I have finally managed to configure my iptables so SIP clients under =20
NAT can make calls outside and clients outside can call clients in the =
=20
LAN.
The aim of this email is to post my configuration as a help for those =20
trying to configure iptables in the same way.

=46irstly, it is necessary to be sure that you have kernel support for =
=20
modules nf_conntrack_sip and nf_nat_sip:

cng@cng:/etc/ser$ modprobe -l | grep sip
kernel/net/netfilter/nf_conntrack_sip.ko
kernel/net/ipv4/netfilter/nf_nat_sip.ko

If you do not have them, then you will need to build the kernel with =20
support for them (but my kernel is 2.6.31 and they are by default).

So next step is to configure the iptables script. I have made comments =
=20
so everybody can understand:

# Load modules:
/sbin/modprobe ip_tables
/sbin/modprobe iptable_nat
/sbin/modprobe iptable_filter
/sbin/modprobe nf_conntrack
/sbin/modprobe nf_nat

# To load nf_conntrack_sip and nf_nat_sip is important to respect the o=
rder:
# first nf_conntrack_sip and then nf_nat_sip.
# If your SIP connection is to dest. udp port 5060 then it is not =20
necessary to # add "ports=3D5060,4060", but if you have the problem tha=
t =20
is to another port
# that the SIP connection is to be done, then the structure is "ports=3D=
5060,xxx
# were xxx is your port. (I think you can add up to 8 ports, not sure)

/sbin/modprobe nf_conntrack_sip ports=3D5060,4060 =20
sip_direct_signalling=3D0 sip_direct_media=3D0
/sbin/modprobe nf_nat_sip

# Remove all rules and chains (this step is not necessary, it was for m=
y
# personal configuration):
iptables -F
iptables -X

# Forward: Again, if your dest. udp port is 5060 you only need the firs=
t two
# rules.
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p udp --dport 5060 -j ACCEPT
iptables -A FORWARD -p udp --dport 4060 -j ACCEPT

# Finally masquerade:
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 10.xx.xx.xx

# End message:
echo " [End iptables rules setting]"

This is all. I hope it will help.
Also I want again to thank Fran=E7ois for all his support.

Regards,
Rebeca Martinez
