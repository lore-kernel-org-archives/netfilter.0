From: Lorenzo Allegrucci <lorenzo.allegrucci@forinicom.it>
Subject: Re: SIP vs NAT, the configuration
Date: Thu, 17 Dec 2009 13:06:41 +0100
Message-ID: <4B2A1ED1.5030609@forinicom.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: rebeca.martinez-garcia@estudiant.upc.edu
Cc: netfilter@vger.kernel.org, vhuertas@indra.es

=46ran=E7ois Legal wrote:
 > I guess yes, but most of the packets will go through the RELATED mat=
ch,
 > and depending on your setup, a lot of packets not related at all to
 > SIP/VOIP could go through that match.

my setup:

no NAT, static routing, my soft-phones can call each other without prob=
lems.
(I configured a local asterisk server just for this test)

on my router (debian lenny):
nf_conntrack_sip ports=3D5060 sip_direct_signalling=3D1 sip_direct_medi=
a=3D1
iptables -t mangle -A FORWARD -m helper --helper sip -j CLASSIFY --set-=
class 1:100

iptables -L -n -t mangle -v -x does not match all voip traffic, just so=
me random packets.
Can anyone reproduce this?
