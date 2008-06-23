From: Francois Goudal <fg@satcom1.com>
Subject: Re: NAT issue on a machine with both routing and bridging.
Date: Mon, 23 Jun 2008 17:25:49 +0200
Message-ID: <485FC07D.6060306@satcom1.com>
References: <485FB19D.9080908@satcom1.com> <485FBB02.9090901@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <485FBB02.9090901@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Grant Taylor a =E9crit :
> On 06/23/08 09:22, Francois Goudal wrote:
>> So I decided to use virtual machines, like Xen (I tried UML as well,=
=20
>> so my problem is not related to Xen specifically).
>=20
> This is starting to sound like a project that I would work on.
>=20

Thanks !

>> ................                                     ...............=
=2E
>> .    HOST A    .                                     .    HOST D    =
=2E
>> . 10.168.254.1 .                                     . 172.16.33.10 =
=2E
>> ................                                     ...............=
=2E
>>   |                                                               |
>>   |                                                               |
>>   |                                                               |
>>   | eth1                                                     eth0 |
>> ....................................................................=
=2E
>> . |0.0.0.0                                                0.0.0.0 | =
=2E
>> . |__________________________________             ________________| =
=2E
>> .                                    |           |                  =
=2E
>> ............................         |_ br0      |                  =
=2E
>> .                     eth0 . vif1.0  |  0.0.0.0  |                  =
=2E
>> . XEN VM          _________._________|           |                  =
=2E
>> . HOST B         | 0.0.0.0 . 0.0.0.0             |                  =
=2E
>> .                |         .                     |_ br2             =
=2E
>> .           br0 _|         .                     |  172.16.33.200   =
=2E
>> . 10.168.254.51  |    eth1 . vif1.1              |        ^         =
=2E
>> .                |_________._________                     |         =
=2E
>> .                  0.0.0.0 . 0.0.0.0 |                    | Routing =
=2E
>> ............................         |_ br1               | + DNAT  =
=2E
>> .                                    |  10.168.254.250 <--'         =
=2E
>> .                                    |                              =
=2E
>> .        HOST C                                                     =
=2E
>> ....................................................................=
=2E
>=20
> (Nice ASCII art)
>=20

:-)

>> Host C is a Xen Host machine that contains one Xen VM for the PEP=20
>> stuff and which is responsible for the masquerading of packets.
>=20
> So Host C is Dom 0 and Host B is a Dom U, correct.
>=20

Yes, Host C is the Dom0 and Host B is a DomU here.

> <snip>
>=20
>> But now, I want to get rid of the need of a special route on host D,=
=20
>> so I want to setup DNAT/Masquerade on the Host C.
>=20
> *nod*
>=20
> <snip>
>=20
>> So I suspect that on Host C, the packets that comes in the eth1 NIC=20
>> are not just forwarded to the VM by the bridge, but detected somehow=
=20
>> by the network stack and forwarded to eth0 (by some layer2 code ?)=20
>> without being masqueraded, then.
>=20
> Can we see the output of brctl on Host C (domain 0)?
>=20

bridge name	bridge id		STP enabled	interfaces
br1		8000.c6eabf59b7a0	no		vif1.1
br0		8000.00304883f91f	no		eth1
							vif1.0
br2		8000.00304883f91e	no		eth0

This looks like the ASCII-art I did, I double checked all this, I don't=
=20
think the problem comes from the bridge configuration, but you will=20
probably tell me if you can see sth wrong here :-)

>> I have been working on trying to solve this during 2 days now but=20
>> still I can't find a solution.
>=20
> Is there a reason that you are not masquerading packets that leave br=
2=20
> in Host C?
>=20

I don't understand your question. I want them to be masqueraded, but th=
e=20
fact is that I can't get them masqueraded when they come from a machine=
=20
connected to eth1 on the Dom0. But they are masqueraded when they come=20
from the DomU. But I don't see any reason for that difference. On the=20
Dom0, the eth1 interface is linked with a bridge to one interface of th=
e=20
DomU but no IP addresses are set (on eth1 itself, on the bridge=20
interface it belongs to, and on the Xen backend interface which is in=20
the bridge) so the traffic has to go through the DomU, so now, why is i=
t=20
working with the DomU itself but not with the hosts connected on eth1, =
I=20
have no idea :-/

I had a look at the big Linux Network Packet Flow picture that describe=
s=20
how the packets are going through both ebtables and iptables rules, but=
=20
I don't see anything that could be a problem.

>> Can anyone have a quick look and hopefully provide me an explainatio=
n=20
>> and maybe some help to find a solution ?
>=20
> I need to see how things are bridged in Host C to be sure.  I suspect=
=20
> that either something is amiss in your bridging or where / how you we=
re=20
> doing your masquerading.
>=20

for the masquerading, as I said, it's very simple :

iptables -t nat -A POSTROUTING -o xenbr0 -j MASQUERADE

And I tried with eth0 instead of xenbr0, and I tried with SNAT,=20
specifying manually the IP address 172.16.33.200, but nothing worked.

Regarding the routing, The HostC has nothing special : One default rout=
e=20
for each interface that has an IP address, so :
10.168.254.0 goes through br1
172.16.33.0 goes through xenbr0

On HostA, I have this :
10.168.254.0 goes through eth0
0.0.0.0 goes through gw 10.168.254.250

On HostB, I have :
10.168.254.0 goes through br0
0.0.0.0 goes through gw 10.168.254.250

And on HostD, I just have :
172.16.33.0 goes through eth0

So I need masquerading so that HostD can reply to HostA without having=20
to setup a route on HostD to tell him how to do it.

> I will say that what you are wanting to do is sound and does work.  I=
=20
> have deployed multiple systems running complex networks in vms, be it=
=20
> UML (multiple incarnations) and VMWare (any incarnation needing a=20
> Windows vm).  Presently I have multiple systems deployed that have on=
e=20
> host with up to 8 guest vms.  These types of systems sound overly=20
> complex. but the networking is usually the least complex part of them=
=2E
>=20

Yes, I'm aware this is quite complex, and I understand that it might be=
=20
difficult to help, especially because I'm using a PEP software which=20
might be quite difficult to setup if someone wants to reproduce the pro=
blem.
But still, as I said, the PEP stuff can be replaced by bridging the two=
=20
interfaces in the DomU together, it does the same, and I am able to=20
reproduce the problem with such a setup as well.

 > Don't give up.

I won't ;-)

Thank's for your time.
Best regards.
--=20
=46rancois Goudal
Satcom1

