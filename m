From: Michal =?utf-8?B?S3ViZcSNZWs=?= <mkubecek@suse.cz>
Subject: Re: IPTables - Going Stateless
Date: Wed, 22 May 2013 07:52:26 +0200
Message-ID: <2084628.EBqyUlm2sA@alaris>
References: <CAGWRaZbwp8jDPxDzHX6g_LkpK74iB6K4GSoU7c_5THDSx1oDmQ@mail.gmail.com>
Reply-To: mkubecek@suse.cz
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAGWRaZbwp8jDPxDzHX6g_LkpK74iB6K4GSoU7c_5THDSx1oDmQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: Nick Khamis <symack@gmail.com>

On Tuesday 21 of May 2013 11:07EN, Nick Khamis wrote:
> #echo -e "       - Accepting SSH Traffic"
> $IPTABLES -A TCP -p tcp -m tcp -s 192.168.2.0/24 -d 192.168.2.5 --dpo=
rt 22 -j ACCEPT
> $IPTABLES -A TCP -p tcp -m tcp -s 0.0.0.0/0 -d 192.168.2.5 --dport 22=
 -j DROP
>=20
> #echo -e "       - Accepting input TCP and UDP traffic to open ports"
> $IPTABLES -A INPUT -i $INTIF1 -p tcp --syn -j TCP
> $IPTABLES -A INPUT -i $INTIF1 -p udp -j UDP
>=20
> #echo -e "       - Accepting output TCP and UDP traffic to open ports=
"
> $IPTABLES -A OUTPUT -o $INTIF1 -p tcp --syn -j TCP
> $IPTABLES -A OUTPUT -o $INTIF1 -p udp -j UDP
>=20
> #echo -e "       - Dropping input TCP and UDP traffic to closed ports=
"
> # $IPTABLES -A INPUT -i $INTIF1 -p tcp -j REJECT --reject-with tcp-rs=
t
> # $IPTABLES -A INPUT -i $INTIF1 -p udp -j REJECT --reject-with
> icmp-port-unreachable
>=20
> #echo -e "       - Dropping output TCP and UDP traffic to closed port=
s"
> # $IPTABLES -A OUTPUT -o $INTIF1 -p tcp -j REJECT --reject-with tcp-r=
st
> # $IPTABLES -A OUTPUT -o $INTIF1 -p udp -j REJECT --reject-with
> icmp-port-unreachable
>=20
> Everything works fine with the REJECT rules commented out, but when
> included SSH access is blocked out. Not sure why, isn't the sequence
> correct (i.e., the ACCPET entries before the DROP and REJECT)?

You send only syn packets into TCP chain so if these are all rules you
have, every other TCP packet is rejected (both in INPUT and OUTPUT).

                                                        Michal Kube=E8e=
k

