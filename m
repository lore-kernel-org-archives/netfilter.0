From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Problems with bridge+router setup
Date: Tue, 29 Dec 2015 00:28:36 +0100
Message-ID: <5681C5A4.3060607@plouf.fr.eu.org>
References: <b012b8f6ef5b98338b2ce4544df60a24@vpn.quintux.com> <20151227142118.27861ea5@playground> <7f5d15a0a7067992b1ae21b149d64266@vpn.quintux.com> <5681128F.5090203@plouf.fr.eu.org> <e6259eb987cf9fb4d54fdf3b44ecac86@vpn.quintux.com> <5681839F.4080801@plouf.fr.eu.org> <b574dcf038177fbbc8f8ea2baeff61fd@vpn.quintux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <b574dcf038177fbbc8f8ea2baeff61fd@vpn.quintux.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Misterke a =E9crit :
> On 2015-12-28 19:46, Pascal Hambourg wrote:
>=20
>> I am not saying to use VLAN tagging. I am asking whether the
>> communication between the cable modem and the TV box over the LAN us=
es
>> VLAN tagging, because I have seen it with a triple-play provider, an=
d=20
>> in that case it is easy to identify which packets must be bridged :=20
>> those with a VLAN tag.
>=20
> Ah, sorry for the misunderstanding.  Is there any way I could find ou=
t?

Yes, with a packet sniffer such as tcpdump (-e to print the link layer
header) on a bridge port (not the bridge interface itself) while the TV
box and the cable modem are communicating with each other.
