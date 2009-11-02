From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Beginner Question on restricting traffic within the same subnet.
Date: Mon, 02 Nov 2009 23:23:42 +0100
Message-ID: <4AEF5BEE.7080503@plouf.fr.eu.org>
References: <ac5c74140911020721i5edef35el911d700a6017f7eb@mail.gmail.com>	 <4AEF0003.5060404@plouf.fr.eu.org>	 <ac5c74140911020902s71f6660cl28e7f3d8a436afa8@mail.gmail.com>	 <4AEF4E5A.9010407@plouf.fr.eu.org> <ac5c74140911021358i36d81ff5r3fe2305c2017d18f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ac5c74140911021358i36d81ff5r3fe2305c2017d18f@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

paddy joesoap a =E9crit :
>>
>> With a SOHO router, it depends on how the built-in switch works. If =
each
>> ethernet port is or can be set as a separate interface (possibly thr=
ough
>> the use of VLANs), then you can build a Linux bridge and inspect bri=
dged
>> traffic with ebtables or bridge-nf + iptables.
[...]
> My home router is a Linksys WRT54GL with a 4 port switch. I have
> installed DD-WRT on it.

It looks like the built-in switch of the WRT54GL is VLAN-capable, so it
should be possible to set each LAN port in a different VLAN, create VLA=
N
interfaces for each VLAN on the internal interface eth0 (like the WAN
port and its corresponding VLAN interface vlan1, cf. internal diagram
e.g. at <http://gablog.eu/online/node/24>) and bridge them together.
Oops, I don't know whether DD-WRT supports ebtables or has bridge-nf
enabled.

> If I understood what you said about firewalls and switches in broad
> terms (possibly in an enterprise setting)  I can essentially  "trick"=
,
> for a want of a better term, the switch to forward all traffic to the
> firewall for inspection regardless if the packets are outbound or not=
=2E

It is possible, but I didn't mean that. I meant that the switch itself
could act as a firewall, if it is sophisticated enough.
