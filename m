From: =?UTF-8?B?U8OpYmFzdGllbiBDUkFNQVRURQ==?=
 <scramatte@zensoluciones.com>
Subject: Re: Two NICs, same network...
Date: Wed, 09 May 2007 00:39:12 +0200
Message-ID: <4640FC10.4090808@zensoluciones.com>
References: <e53321d30705081317w3d7e6f5bsb38161f155c883da@mail.gmail.com>	<Pine.LNX.4.63.0705081251200.20281@qynat.qvtvafvgr.pbz>
	<e53321d30705081402n2fa7e3c5pcd0ed7baeecebef4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------030409080202080903070100"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e53321d30705081402n2fa7e3c5pcd0ed7baeecebef4@mail.gmail.com>
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
To: semi linux <linuxsemi@gmail.com>
Cc: netfilter@lists.netfilter.org, David Lang <david.lang@digitalinsight.com>

This is a multi-part message in MIME format.
--------------030409080202080903070100
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Why do you no investigate channel bonding ?

semi linux escribi=C3=B3:
> On 5/8/07, David Lang <david.lang@digitalinsight.com> wrote:
>> On Tue, 8 May 2007, semi linux wrote:
>>
>> > I've got an odd problem where I've got two NICs on the same network
>> > and I want all traffic to one IP to go out one interface and all oth=
er
>> > traffic to use the second interface.  I'm going to try an simplify m=
y
>> > actual setup, because a lot of it makes no difference to this post..=
.
>> >
>> > I know this has to be a iptables sort of setup since the routing tab=
le
>> > can only make a difference on different networks and not based on
>> > looking for a specific IP address.
>> >
>> > The question is:
>> >
>> > eth0 IP: 10.1.1.1
>> > eth1 IP: 10.1.1.2
>> >
>> > target: 10.1.1.3
>> >
>> > (these IPs are just examples, there are no hard-fast rules surroundi=
ng
>> > the other possibilities)
>> >
>> > How do I make sure this goes out eth1 instead of eth0?  Do I use the
>> > mangle rule with the physdev module?
>> >
>> > I feel like I'm overlooking something or forgetting my basic network
>> > ideas here...
>>
>> you haven't quite given enough info here
>>
>> if you have target2 10.1.1.4 and you want all traffic to target to go
>> out eth0
>> and all traffic to target2 to go out eth1 then you would want to
>> start out with
>> defining host routes (the routing table _can_ look at specific hosts,
>> not just
>> networks)
>>
>> in addition, I believe that you will need to play around with arp
>> filtering to
>> make sure that each NIC only responds to arp requests for it's IP
>> addresses.
>>
>> if you really only have one remote IP address and two local addresses
>> and you
>> want all communications between the target and  10.1.1.1 to use eth0
>> while
>> all communications between the target and 10.1.1.2 to use eth1 things
>> get more
>> complicated
>>
>> you would need to look into packet/connection tagging and iptables
>> routeing
>> decisions.
>>
>> rather then try and go into that right now why don't you try to be a
>> little
>> clearer about exactly what you are trying to do.
>>
>> David Lang
>>
>
> Ok... you asked for the whole thing, here it is (forget my previous
> example):
>
> eth0 - 10.1.1.1
> eth1 - N/A
> eth2 - N/A
> br0 (eth1, eth2) - 10.1.1.2
> target - 10.1.1.3
>
> The bridge (br0) is setup using brctl and seems to work w/o problem...
> The eth1 and eth2 IP addresses really don't matter since they are both
> referenced via the bridge and are set to something invalid.  10.1.1.3
> is connected via cross-over cable to eth2 port.  br0 and eth0 are
> connected to my network on the same subnet.
>
> What I'd like:
> - all packets (from the network or local) where destination=3D10.1.1.3
> to be routed to eth2.
> - otherwise, all traffic from the network to use eth0 for I/O.
>
> Basically, I want to specify that ONLY traffic for 10.1.1.3 is to use
> eth2.
>


--=20
ZEN SOLUCIONES - Be in XForms take your "Concentr=C3=88"
S=C3=88bastien CRAMATTE=20

Plaza Sandoval, 5, piso 4b
30004 Murcia - ESPA=E2=80=94A

M=C3=9Bvil : +34 627 66 52 83
Fijo : +34 968 29 29 65

E-mail : scramatte@zensoluciones.com
Site : www.zensoluciones.com

Skype : scramatte
Msn : scramatte@hotmail.com
Jabber: scramatte@jabber.org
--

CONCENTR=E2=80=A6
xml entreprise grade framework
http://concentre.zensoluciones.com

--
This e-mail is privileged and may contain confidential information intend=
ed only for the person(s) named above. If you receive this e-mail in erro=
r, please notify the sender immediately and delete it. E-mail and interne=
t transmissions can't be warrant privacy, integrity or correct reception.=
 The sender will not be liable for any damages resulting.=20

Este mensaje va dirigido, de manera exclusiva, a su destinatario y puede =
contener informaci=C3=9Bn confidencial. En caso de haber recibido este me=
nsaje por error, informe al emisor inmediatamente y proceda a su eliminac=
i=C3=9Bn. El correo electr=C3=9Bnico y las comunicaciones por medio de In=
ternet no permiten garantizar la confidencialidad de los mensajes transmi=
tidos, as=C3=8C como tampoco su integridad o su correcta de recepci=C3=9B=
n. El emisor no asume responsabilidad alguna por tales circunstancias.

Ce message est destin=C3=88 exclusivement =E2=80=A1 son destinataire et p=
eut contenir des informations confidentielles. En cas de r=C3=88ception d=
'un tel message par erreur, informez l'exp=C3=88diteur imm=C3=88diatement=
 et proc=C3=88dez =E2=80=A1 son effacement. Il n'est pas possible de gara=
ntir la confidentialit=C3=88, l'int=C3=88grit=C3=88 ou la r=C3=88ception =
correcte du courrier =C3=88lectronique ainsi que des communications par i=
nternet. L'exp=C3=88diteur ne peut =C3=8Dtre tenu pour responsable d'=C3=88=
ventuels dommages commis.


--------------030409080202080903070100--

