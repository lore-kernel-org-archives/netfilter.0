From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Beginner Question on restricting traffic within the same subnet.
Date: Mon, 02 Nov 2009 22:25:46 +0100
Message-ID: <4AEF4E5A.9010407@plouf.fr.eu.org>
References: <ac5c74140911020721i5edef35el911d700a6017f7eb@mail.gmail.com>	 <4AEF0003.5060404@plouf.fr.eu.org> <ac5c74140911020902s71f6660cl28e7f3d8a436afa8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ac5c74140911020902s71f6660cl28e7f3d8a436afa8@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

paddy joesoap a =E9crit :
>=20
> I need to do some reading here. So thanks for this. But once I form a
> "bridge", I can then apply standard iptables rules, right? Will it
> only inspect packets at layer 2 and not layer 3,4 and 7? Again, I
> better read about the area before posing such questions.

If enabled, bridge-nf extracts the IP packet from the ethernet frame
payload and passes it to iptables. iptables rules inspect the IP packet
as usual, except that -i|-o match the bridge name and --physdev-in|out
match the bridge physical interfaces.

If you only need to do basic filtering based on interfaces or IP
addresses, you can simply do it with ebtables. bridge-nf and iptables
are useful for more advanced IP filtering that ebtables cannot do.

Information about bridge-nf aka bridge-netfilter is available in the
documentation section of <http://ebtables.sourceforge.net/>.

>>> Internal Machines 1,2 and 3 are on the same subnet governed by the
>>> netfilter firewall.
>>>                                    ---------- Machine1
>>> Internet ------ Netfilter Firewall ---------- Machine2
>>>                                    ---------- Machine3
>>
>> Does the Firewall bridge Machine1-3 together (and thus have a separa=
te
>> ethernet interface for each one) or is there an ethernet switch betw=
een
>> them ? A switch won't pass the traffic between Machine1-3 to the Fir=
ewall.
>=20
> I was thinking of a typical SOHO router (combined switch, routing, na=
t
> and firewall) or a simple standalone linux box that has a switch (eve=
n
> outdated hub!) connected to it and then the 3 machines on the far sid=
e
> of the switch.

With a SOHO router, it depends on how the built-in switch works. If eac=
h
ethernet port is or can be set as a separate interface (possibly throug=
h
the use of VLANs), then you can build a Linux bridge and inspect bridge=
d
traffic with ebtables or bridge-nf + iptables. Otherwise, a plain
switch, either built-in or external) won't allow you to inspect LAN
traffic. Traffic between two machines will just flow through the switch
without hitting the firewall.

> This is currently just a hypothetical question.
>=20
> I presumed that given a firewall can examine packets from the interna=
l
> network outbound, that it can also examine packets that are never
> routed externally.
[...]
> Now, I know I can install netfilter locally on the server and even TC=
P
> wrapper but I am interested to know from a security in depth point of
> view, if a firewall also control access amongst machines/systems on
> the same network? (filter by ip addresses on the same subnet. I
> presume the firewall machine needs also be a router).

A firewall can only inspect packets that pass through it. If it is
connected to a port of a switch, it won't see the traffic of the other
ports. The switch is the only one that can see and inspect the traffic.
A Linux bridge is just that : a software switch with filtering capabili=
ties.
