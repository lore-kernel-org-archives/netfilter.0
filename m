From: Dimitar Katerinski <train@bofh.bg>
Subject: Re: transparent proxying NTP
Date: Sun, 27 Jun 2004 23:48:20 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40DF3294.5030200@bofh.bg>
References: <Pine.LNX.4.33.0406272137520.29785-100000@muur.intranet.vanheusden.com> <40DF2B43.8060609@bofh.bg> <00e301c45c87$e6e2cc60$8b00000a@casa>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00e301c45c87$e6e2cc60$8b00000a@casa>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Leonardo Rodrigues Magalh=E3es wrote:
>     If the DNATted machine is NOT the linux router that is doing the DNAT,
> you WILL need the SNAT rule too. If you dont use, DNATted machine will try
> to answer directly to the machine that requested the update. And that
> machine is not expecting anything from that IP. So, SNATting to linux rou=
ter
> IP is needed if DNATting to a machine in the network.
>=20
>     Sincerily,
>     Leonardo Rodrigues
>=20

You are right, I assumed that 192.168.64.1 is his gateway and stratum serve=
r. If it is,
then what I posted previously should work, if it is not then he should to S=
NAT also.

iptables -t nat -A PREROUTING -i eth1 -s $LAN_SUBNET -p udp --dport 123 -j =
DNAT --to-destination 192.168.64.1:124
iptables -t nat -A POSTROUTING -o eth1 -p udp --dport 123 -j SNAT --to-sour=
ce $GW_LAN_IP

Right? :)

Regards,
Dimitar

--=20
"The only thing necessary for the triumph of evil is for good men to do not=
hing."
                                                   --Edmund Burke.

