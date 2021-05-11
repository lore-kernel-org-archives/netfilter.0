From: Oliver Freyermuth <freyermuth@physik.uni-bonn.de>
Subject: Re: Running an active/active firewall/router (xt_cluster?)
Date: Tue, 11 May 2021 11:08:15 +0200
Message-ID: <4bfd159a-1714-958f-6aa3-c6155626d3d8@physik.uni-bonn.de>
References: <3a995078-6bdf-f1c6-0a88-bc56fca55714@physik.uni-bonn.de>
 <CAPJdpdAyqmKtRnnKDqyEOSnpVVJMNMdYjyuT7dNL+6CNDLwB6Q@mail.gmail.com>
 <4113e9ec-225e-75d5-b221-996c00f9b060@physik.uni-bonn.de>
 <CAPJdpdD9LEG7q6MwioRmWoqSdV4gj7xgFCEor1nphAiX8smy7g@mail.gmail.com>
 <16bf545a-6adc-5470-2cb7-f6992ef46e77@physik.uni-bonn.de>
 <CAPJdpdDNmTq_yafDU12w1xz7PUTm4zZr6vt2nGciv=baGYwP1A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256; boundary="------------ms000005030003000304080504"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=physik.uni-bonn.de; s=mail;
        bh=iQd/uhXVvbvJAIULvDLbyNwR/DGzg8TsCgpXUSUJmiY=;
        h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To
        :Subject; b=y63Dcty3hCwGWEbVW1Z7U4P+1l+kZAnNakMXmKBoTOlYW9w3yaWXi7QLVRsbMznrB
        jfp155SxqwTrzzL9Eq6imvw9BfPb22JG1VF+WEgpTeRHNS3B7AoTAi+AC+m/yni0+MgY9fRmGMwpm
        16NGb6l9AiH/w0zAXPi7cBC8L1kBU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=physik.uni-bonn.de; s=mail;
        bh=iQd/uhXVvbvJAIULvDLbyNwR/DGzg8TsCgpXUSUJmiY=;
        h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To
        :Subject; b=y63Dcty3hCwGWEbVW1Z7U4P+1l+kZAnNakMXmKBoTOlYW9w3yaWXi7QLVRsbMznrB
        jfp155SxqwTrzzL9Eq6imvw9BfPb22JG1VF+WEgpTeRHNS3B7AoTAi+AC+m/yni0+MgY9fRmGMwpm
        16NGb6l9AiH/w0zAXPi7cBC8L1kBU=
In-Reply-To: <CAPJdpdDNmTq_yafDU12w1xz7PUTm4zZr6vt2nGciv=baGYwP1A@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
To: Paul Robert Marino <prmarino1@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

This is a cryptographically signed message in MIME format.

--------------ms000005030003000304080504
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Am 11.05.21 um 03:00 schrieb Paul Robert Marino:
> Well In the scenario where you don't control the upstream router I woul=
d recommend putting a small routing switch stack in the middle. The reaso=
n being it solves a lot of the potential hardware issues as well around r=
edundancy and loadbalancing. Ideally I always like to see a separate rout=
ing switch stack on both sides that can only be managed by an OOB network=
 on dedicated ports.=20

We actually have a (non-redundant) routing switch on one end, and a the m=
entioned routing stack on the other end, but _both_ are not controlled by=
 us (we could take control of one,
but since the operators maintain the full switch infrastructure and are v=
ery cooperative and experienced, we preferred to leave also this componen=
t to them for now).
So we'll definitely seek contact to the operators and try to convince the=
m to save extra hardware (but since the infrastructure on one end is shar=
ed, this may need some discussion).

> Back when I did this stuff on a regular large scale (managed hundreds o=
f firewalls) basis I would use cheep Avaya (originally Nortel, now Extrea=
m Networks) ERS or VSP with stack for this because they had the right fea=
tures at a reasonable price, but any switches that do stacking or can do =
multiple 10Gbps uplinks with routing should do. That was what I always fo=
und to be the most stable configuration. There also may be advantages to =
using a switch stack from the same manufacturer as the up stream router. =
That also opens up the possibility of doing 100Gbps to the intermediate s=
witches and doing a more=20
> traditional primary backup configuration on the firewalls.

Thanks! We actually have a general contract to "prefer" components from o=
ne of the (expensive) manufacturers, which is good to get things more hom=
ogeneous at least.
Let's see how the discussion turns out :-).

Cheers and many thanks,
	Oliver

>=20
> On Mon, May 10, 2021, 7:21 PM Oliver Freyermuth <freyermuth@physik.uni-=
bonn.de <mailto:freyermuth@physik.uni-bonn.de>> wrote:
>=20
>     Also answering inline.
>=20
>     Am 11.05.21 um 00:55 schrieb Paul Robert Marino:
>      > I'm adding replies to your replies inline below
>      >
>      > On Mon, May 10, 2021, 5:55 PM Oliver Freyermuth
>      > <freyermuth@physik.uni-bonn.de <mailto:freyermuth@physik.uni-bon=
n.de>> wrote:
>      >>
>      >> Hey Paul,
>      >>
>      >> many thanks for the detailed reply!
>      >> Some comments inline.
>      >>
>      >> Am 10.05.21 um 18:57 schrieb Paul Robert Marino:
>      >>> hey Oliver,
>      >>> I've done similar things over the years, a lot of fun lab expe=
riments
>      >>> and found it really it comes down to a couple of things.
>      >>> I did some POC testing with contrackd and some experimental co=
de
>      >>> around trunking across multiple firewalls with a sprinkling of=

>      >>> virtualization.
>      >>> There were a few scenarios I tried, some involving OpenVSwitch=

>      >>> (because I was experimenting with SPBM) and some not, with con=
trackd
>      >>> similarly configured.
>      >>> All the scenarios were interesting but they all had relatively=
 rare on
>      >>> slow (<1Gbs) network issues that grew exponentially in frequen=
cy on
>      >>> higher speed networks (>1Gbs) with latency in contrackd syncin=
g.
>      >>
>      >> Indeed, we'd strive for ~20 Gb/s in our case, so this experienc=
e surely is important to hear about.
>      >>
>      >>> What i found is the best scenario was to use Quagga for dynami=
c
>      >>> routing to load balance the traffic between the firewall IP's,=

>      >>> keepalived to load handle IP failover, and contrackd (in a sim=
ilar
>      >>> configuration to the one you described) to keep the states in =
sync
>      >>> there are a few pitfalls in going down this route caused by ba=
d and or
>      >>> outdated documentation for both Quagga and keepalived. I'm als=
o going
>      >>> to give you some recommendations about some hardware topology =
stuff
>      >>> you may not think about initially.
>      >>
>      >> I'm still a bit unsure if we are on the same page, but that may=
 just be caused by my limited knowledge of Quagga.
>      >> To my understanding, Quagga uses e.g. OSPF and hence can, if th=
e routes have the same path, load-balance.
>      >>
>      >> However, in our case, we'd want to go for active/active firewal=
ls (which of course are also routers).
>      >> But that means we have internal machines on one side, which use=
 a single default gateway (per VLAN),
>      >> then our active/active firewall, and then the outside world (ac=
tually a PtP connection to an upstream router).
>      >>
>      >> Can Quagga help me to actively use both firewalls in a load-bal=
ancing and redundant way?
>      >> The idea here is that the upstream router has high bandwidth, s=
o using more than one firewall allows to achieve better throughput,
>      >> and with active/active we'd also strive for redundancy (i.e. re=
duced throughput if one firewall fails).
>      >> To my understanding, OSPF / Quagga could do this if the firewal=
ls are placed between routers also joining via OSPF.
>      >> But is there also a way to have the clients directly talk to ou=
r firewalls, and the firewalls to a single upstream router (which we don'=
t control)?
>      >>
>      >> A simple drawing may help:
>      >>
>      >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ____=C2=A0=
 FW A ____
>      >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>      >> Client(s) --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0--PtP-- upstream router
>      >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\____=C2=A0=
 FW B ____/
>      >>
>      >> This is why I thought about using xt_cluster and giving both FW=
 A and FW B the very same IP (the default gateway of the clients)
>      >> and the very same MAC at the same time, so the switch duplicate=
s the packets, and then FW A accepts some packets and FW B the remaining =
ones
>      >> via filtering with xt_cluster.
>      >>
>      >> Can Quagga do something in this picture, or simplify this pictu=
re?
>      >> The upstream router also sends all incoming packets to a single=
 IP in the PtP network, i.e. the firewall nodes need to show up as "one c=
onverged system"
>      >> to both the clients on one side and the upstream router on the =
other side.
>      >
>      >
>      > I understand what you are shooting for but it's dangerous at tho=
se
>      > data rates and not achievable via stock existing software.
>      > I did write some POC code years ago for a previous employer but
>      > determined it was too dangerous to put into production without s=
ome
>      > massive kernel changes such as using something like RDMA over
>      > dedicated high speed interfaces or linking the systems over the =
PCI
>      > express busses to sync the states instead of using contrackd.
>      >
>      > So load balancing is a better choice in this case, and many midd=
le to
>      > higher end managed switches that have routers built in can do OS=
PF.
>      > I've seen many stackable switches that can do it. By the way Qua=
gga
>      > supports several other dynamic routing protocols not just just O=
SPF.
>=20
>     Thanks, now I understand your answer much better =E2=80=94 the clas=
sical case of intention getting lost between the lines.
>     Indeed, this is important experience, many thanks for sharing it!
>=20
>     I was already unsure if with such a solution I could really expect =
to achieve these data rates,
>     so this warning is worth its weight in gold.
>     I'll still play around with this setup in the lab, but testing at s=
cale is also not easy
>     (for us) in the lab, so again this warning is very useful so we won=
't take this into production.
>=20
>     The problem which made me think about all this is that we don't hav=
e control of the upstream router.
>     That made me hope for a solution which does not require changes on =
that end.
>     But of course we can communicate with the operators
>     and see if we can find a way to use dynamic routing on that end.
>=20
>      > The safest and easiest option for you would be to use 100Gbs fib=
re
>      > connection instead, possibly with direct attach cables if you wa=
nt to
>      > save on optics, and do primary secondary failover.
>=20
>     Sadly, the infrastructure further upstream is not yet upgraded to s=
upport 100 Gb/s (and will not be in the near future),
>     otherwise, this surely would have been the easier option.
>=20
>      >>> I will start with Quagga because the bad documentation part is=
 easy to cover.
>      >>> in the Quagga documentation they recommend that you put a rout=
able IP
>      >>> on a loopback interface and attach Quagga the daemon for the d=
ynamic
>      >>> routing service of your choice to it, That works fine on BSD a=
nd old
>      >>> versions of Linux from 20 years ago but any thing running a Li=
nux
>      >>> kernel version of 2.4 or higher will not allow it unless you c=
hange
>      >>> setting in /etc/sysctrl.conf and the Quagga documentation tell=
s you to
>      >>> make those changes. DO NOT DO WHAT THEY SAY, its wrong and dan=
gerous.
>      >>> Instead create a "dummy" interface with a routable IP for this=

>      >>> purpose. a dummy interface is a special kind of interface mean=
t for
>      >>> exactly the scenario described and works well without compromi=
sing the
>      >>> security of your firewall.
>      >>
>      >> Thanks for this helpful advice!
>      >> Even though I am not sure yet Quagga will help me out in this p=
icture,
>      >> I am now already convinced we will have a situation in which Qu=
agga will help us out.
>      >> So this is noted down for future use :-).
>      >>
>      >>> Keepalived
>      >>> the main error in keepalived's documentation is is most of the=

>      >>> documentation and howto's you will find about it on the web ar=
e based
>      >>> on a 15 year old howto which had a fundamental mistake in how =
VRRP
>      >>> works, and what the "state"=C2=A0 flag actually does because i=
ts not
>      >>> explained well in the man file. "state" in a "vrrp_instance" s=
hould
>      >>> always be set to "MASTER" on all nodes and the priority should=
 be used
>      >>> to determine which node should be the preferred master. the on=
ly time
>      >>> you should ever set state to "BACKUP" is if you have a 3rd mac=
hine
>      >>> that you never want to become the master which you are just us=
ing for
>      >>> quorum and in that case its priority should also be set to "0"=

>      >>> (failed) . setting the state to "BACKUP" will seem to work fin=
e until
>      >>> you have a failover event when the interface will continually =
go ip
>      >>> and done on the backup node. on the mac address issue keepaliv=
ed will
>      >>> apr ping the subnets its attached to so that's generally not a=
n issue
>      >>> but I would recommend using vmac's (virtual mac addresses) ass=
uming
>      >>> the kernel for your distro and your network cards support it b=
ecause
>      >>> that way it just looks to the switch like it changed a port du=
e to
>      >>> some physical topology change and switches usually handle that=
 very
>      >>> gracefully, but don't always handle the mac address change for=
 IP
>      >>> addresses as quickly.
>      >>> I also recommend reading the RFC's on VRRP particularly the pa=
rts that
>      >>> explain how the elections and priorities work, they are a quic=
k and
>      >>> easy read and will really give you a good idea of how to confi=
gure
>      >>> keepalived properly to achieve the failover and recovery behav=
ior you
>      >>> want.
>      >>
>      >> See above on the virtual MACs =E2=80=94 if the clients should u=
se both firewalls at the same time,
>      >> I think I'd need a single MAC for both, so the clients only see=
 a single default gateway.
>      >> In a more classic setup, we've used pcs (pacemaker and corosync=
) to successfully migrate virtual IPs and MAC addresses.
>      >> It has worked quite reliable (using Kronosnet for communication=
).
>      >> But we've also used Keepalived some years ago successfully :-).=

>      >>
>      >>> On the hardware topology
>      >>> I recommend using dedicated interfaces for contrackd, really y=
ou don't
>      >>> need anything faster than 100Mbps even if the data interfaces =
are
>      >>> 100Gbps but i usually use 1 Gbps interfaces for this. they can=
 be on
>      >>> their own dedicated switches or crossover interfaces. the main=
 concern
>      >>> here is securely handling a large number of tiny packets so ha=
ving
>      >>> dedicated network card buffers to handle microburst=C2=A0 is u=
seful and if
>      >>> you can avoid latency from a switch that's trying to be too sm=
art for
>      >>> its own good that's for the best.
>      >>
>      >> Indeed, we have 1 Gb/s crossover link, and use a 1 Gb/s connect=
ion through a switch in case this would ever fail for some reason =E2=80=94=

>      >> we use these links both for conntrackd and for Kronosnet commun=
ication by corosync.
>      >>
>      >>> For keepalived use dedicated VLAN's on each physical interface=
 to
>      >>> handle the heartbeats and group the VRRP interfaces. to insure=
 the
>      >>> failovers of the IP's on both sides are handled correctly.
>      >>> If you only have 2 firewalls I recommend using a an additional=
 device
>      >>> on each side for quorum in a backup/failed mode as described a=
bove.
>      >>> Assuming a 1 second or greater interval the device could be so=
mething
>      >>> as simple as a Raspberry PI it really doesn't need to be anyth=
ing
>      >>> powerful because its just adding a heartbeat to the cluster, b=
ut for
>      >>> sub second intervals you may need something more powerful beca=
use sub
>      >>> second intervals can eat a surprising amount of CPU.
>      >>
>      >> We currently went without an external third party and let coros=
ync/pacemaker use a STONITH device to explicitly kill the other node
>      >> and establish a defined state if heartbeats get lost. We might =
think about a third machine at some point to get an actual quorum, indeed=
=2E
>      >
>      >
>      > I get why you might think to use corosync/pacemaker for this if =
you
>      > weren't familiar with keepalived and LVS in the kernel,=C2=A0 bu=
t it's
>      > hammering a square peg in a round hole when you have a perfectly=

>      > shaped and sized peg available to you that's actually been aroun=
d a
>      > lot longer and works a lot more predictably, faster and more rel=
iably
>      > by leveraging parts of the kernels network stack designed specif=
ically
>      > for this use case. I've done explicit kills of the other device =
via
>      > cross connected hardware watchdog devices via keepalived before =
and it
>      > was easy.
>      > By the way if you don't know what LVS is it's the kernels builti=
n
>      > layer 3 network load balancer stack that was designed with these=
 kind
>      > of failover scenarios in mind keepalived is just a wrapper aroun=
d LVS
>      > that adds VRRP based heartbeating and hooks to allow you to call=

>      > external scripts for actions based on heart beat state change ev=
ents
>      > and additional watchdog scripts which can also trigger state cha=
nges.
>      > To be clear i wouldn't use keepalived to handle process master s=
lave
>      > failovers i would use corosync and pacemaker, or in some cases
>      > Clusterd for that because they are usually the right tool for th=
e job,
>      > but for firewall and or network load balancer failover i would a=
lways
>      > use keepalived because its the right tool for that job.
>      >
>=20
>     Our main reasoning for corosync/pacemaker was that we've used it fo=
r the predecessor setup quite successfully for ~7 years,
>     while we have only used keepalived in smaller configurations (but i=
t also served us well).
>     You raise many valid points, so even though pacemaker/corosync has =
not disappointed us (as of yet), we might indeed reconsider this decision=
=2E
>=20
>     Cheers and thanks,
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 Oliver
>=20
>      >
>      >>
>      >> Cheers and thanks again,
>      >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Oliver
>      >>
>      >>>
>      >>>
>      >>> On Sun, May 9, 2021 at 3:16 PM Oliver Freyermuth
>      >>> <freyermuth@physik.uni-bonn.de <mailto:freyermuth@physik.uni-b=
onn.de>> wrote:
>      >>>>
>      >>>> Dear netfilter experts,
>      >>>>
>      >>>> we are trying to setup an active/active firewall, making use =
of "xt_cluster".
>      >>>> We can configure the switch to act like a hub, i.e. both mach=
ines can share the same MAC and IP and get the same packets without addit=
ional ARPtables tricks.
>      >>>>
>      >>>> So we set rules like:
>      >>>>
>      >>>>=C2=A0 =C2=A0 =C2=A0iptables -I PREROUTING -t mangle -i extern=
al_interface -m cluster --cluster-total-nodes 2 --cluster-local-node 1 --=
cluster-hash-seed 0xdeadbeef -j MARK --set-mark 0xffff
>      >>>>=C2=A0 =C2=A0 =C2=A0iptables -A PREROUTING -t mangle -i extern=
al_interface -m mark ! --mark 0xffff -j DROP
>      >>>>
>      >>>> Ideally, it we'd love to have the possibility to scale this t=
o more than two nodes, but let's stay with two for now.
>      >>>>
>      >>>> Basic tests show that this works as expected, but the details=
 get messy.
>      >>>>
>      >>>> 1. Certainly, conntrackd is needed to synchronize connection =
states.
>      >>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0But is it always "fast enough"?
>      >>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0xt_cluster seems to match by the sr=
c_ip of the original direction of the flow[0] (if I read the code correct=
ly),
>      >>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0but what happens if the reply to an=
 outgoing packet arrives at both firewalls before state is synchronized?
>      >>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0We are currently using conntrackd i=
n FTFW mode with a direct link, set "DisableExternalCache", and additonal=
ly set "PollSecs 15" since without that it seems
>      >>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0only new and destroyed connections =
are synced, but lifetime updates for existing connections do not propagat=
e without polling.
>      >>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0Maybe another way which e.g. may us=
e XOR(src,dst) might work around tight synchronization requirements, or i=
s it possible to always uses the "internal" source IP?
>      >>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0Is anybody doing that with a custom=
 BPF?
>      >>>>
>      >>>> 2. How to do failover in such cases?
>      >>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0For failover we'd need to change th=
ese rules (if one node fails, the total-nodes will change).
>      >>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0As an alternative, I found [1] whic=
h states multiple rules can be used and enabled / disabled,
>      >>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0but does somebody know of a cleaner=
 (and easier to read) way, also not costing extra performance?
>      >>>>
>      >>>> 3. We have several internal networks, which need to talk to e=
ach other (partially with firewall rules and NATting),
>      >>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0so we'd also need similar rules the=
re, complicating things more. That's why a cleaner way would be very welc=
ome :-).
>      >>>>
>      >>>> 4. Another point is how to actually perform the failover. Cla=
ssical cluster suites (corosync + pacemaker)
>      >>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0are rather used to migrate services=
, but not to communicate node ids and number of total active nodes.
>      >>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0They can probably be tricked into d=
oing that somehow, but they are not designed this way.
>      >>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0TIPC may be something to use here, =
but I found nothing "ready to use".
>      >>>>
>      >>>> You may also tell me there's a better way to do this than use=
 xt_cluster (custom BPF?) =E2=80=94 we've up to now only done "classic" a=
ctive/passive setups,
>      >>>> but maybe someone on this list has already done active/active=
 without commercial hardware, and can share experience from this?
>      >>>>
>      >>>> Cheers and thanks in advance,
>      >>>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Oliver
>      >>>>
>      >>>> PS: Please keep me in CC, I'm not subscribed to the list. Tha=
nks!
>      >>>>
>      >>>> [0] https://github.com/torvalds/linux/blob/10a3efd0fee5e881b1=
866cf45950808575cb0f24/net/netfilter/xt_cluster.c#L16-L19 <https://github=
=2Ecom/torvalds/linux/blob/10a3efd0fee5e881b1866cf45950808575cb0f24/net/n=
etfilter/xt_cluster.c#L16-L19>
>      >>>> [1] https://lore.kernel.org/netfilter-devel/499BEBBF.7080705@=
netfilter.org/ <https://lore.kernel.org/netfilter-devel/499BEBBF.7080705@=
netfilter.org/>
>      >>>>
>      >>>> --
>      >>>> Oliver Freyermuth
>      >>>> Universit=C3=A4t Bonn
>      >>>> Physikalisches Institut, Raum 1.047
>      >>>> Nu=C3=9Fallee 12
>      >>>> 53115 Bonn
>      >>>> --
>      >>>> Tel.: +49 228 73 2367
>      >>>> Fax:=C2=A0 +49 228 73 7869
>      >>>> --
>      >>>>
>      >>
>      >>
>      >> --
>      >> Oliver Freyermuth
>      >> Universit=C3=A4t Bonn
>      >> Physikalisches Institut, Raum 1.047
>      >> Nu=C3=9Fallee 12
>      >> 53115 Bonn
>      >> --
>      >> Tel.: +49 228 73 2367
>      >> Fax:=C2=A0 +49 228 73 7869
>      >> --
>      >>
>=20
>=20
>     --=20
>     Oliver Freyermuth
>     Universit=C3=A4t Bonn
>     Physikalisches Institut, Raum 1.047
>     Nu=C3=9Fallee 12
>     53115 Bonn
>     --
>     Tel.: +49 228 73 2367
>     Fax:=C2=A0 +49 228 73 7869
>     --
>=20


--=20
Oliver Freyermuth
Universit=C3=A4t Bonn
Physikalisches Institut, Raum 1.047
Nu=C3=9Fallee 12
53115 Bonn
--
Tel.: +49 228 73 2367
Fax:  +49 228 73 7869
--


--------------ms000005030003000304080504
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
EOswggUSMIID+qADAgECAgkA4wvV+K8l2YEwDQYJKoZIhvcNAQELBQAwgYIxCzAJBgNVBAYT
AkRFMSswKQYDVQQKDCJULVN5c3RlbXMgRW50ZXJwcmlzZSBTZXJ2aWNlcyBHbWJIMR8wHQYD
VQQLDBZULVN5c3RlbXMgVHJ1c3QgQ2VudGVyMSUwIwYDVQQDDBxULVRlbGVTZWMgR2xvYmFs
Um9vdCBDbGFzcyAyMB4XDTE2MDIyMjEzMzgyMloXDTMxMDIyMjIzNTk1OVowgZUxCzAJBgNV
BAYTAkRFMUUwQwYDVQQKEzxWZXJlaW4genVyIEZvZXJkZXJ1bmcgZWluZXMgRGV1dHNjaGVu
IEZvcnNjaHVuZ3NuZXR6ZXMgZS4gVi4xEDAOBgNVBAsTB0RGTi1QS0kxLTArBgNVBAMTJERG
Ti1WZXJlaW4gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkgMjCCASIwDQYJKoZIhvcNAQEBBQAD
ggEPADCCAQoCggEBAMtg1/9moUHN0vqHl4pzq5lN6mc5WqFggEcVToyVsuXPztNXS43O+FZs
FVV2B+pG/cgDRWM+cNSrVICxI5y+NyipCf8FXRgPxJiZN7Mg9mZ4F4fCnQ7MSjLnFp2uDo0p
eQcAIFTcFV9Kltd4tjTTwXS1nem/wHdN6r1ZB+BaL2w8pQDcNb1lDY9/Mm3yWmpLYgHurDg0
WUU2SQXaeMpqbVvAgWsRzNI8qIv4cRrKO+KA3Ra0Z3qLNupOkSk9s1FcragMvp0049ENF4N1
xDkesJQLEvHVaY4l9Lg9K7/AjsMeO6W/VRCrKq4Xl14zzsjz9AkH4wKGMUZrAcUQDBHHWekC
AwEAAaOCAXQwggFwMA4GA1UdDwEB/wQEAwIBBjAdBgNVHQ4EFgQUk+PYMiba1fFKpZFK4OpL
4qIMz+EwHwYDVR0jBBgwFoAUv1kgNgB5oKAia4zV8mHSuCzLgkowEgYDVR0TAQH/BAgwBgEB
/wIBAjAzBgNVHSAELDAqMA8GDSsGAQQBga0hgiwBAQQwDQYLKwYBBAGBrSGCLB4wCAYGZ4EM
AQICMEwGA1UdHwRFMEMwQaA/oD2GO2h0dHA6Ly9wa2kwMzM2LnRlbGVzZWMuZGUvcmwvVGVs
ZVNlY19HbG9iYWxSb290X0NsYXNzXzIuY3JsMIGGBggrBgEFBQcBAQR6MHgwLAYIKwYBBQUH
MAGGIGh0dHA6Ly9vY3NwMDMzNi50ZWxlc2VjLmRlL29jc3ByMEgGCCsGAQUFBzAChjxodHRw
Oi8vcGtpMDMzNi50ZWxlc2VjLmRlL2NydC9UZWxlU2VjX0dsb2JhbFJvb3RfQ2xhc3NfMi5j
ZXIwDQYJKoZIhvcNAQELBQADggEBAIcL/z4Cm2XIVi3WO5qYi3FP2ropqiH5Ri71sqQPrhE4
eTizDnS6dl2e6BiClmLbTDPo3flq3zK9LExHYFV/53RrtCyD2HlrtrdNUAtmB7Xts5et6u5/
MOaZ/SLick0+hFvu+c+Z6n/XUjkurJgARH5pO7917tALOxrN5fcPImxHhPalR6D90Bo0fa3S
PXez7vTXTf/D6OWST1k+kEcQSrCFWMBvf/iu7QhCnh7U3xQuTY+8npTD5+32GPg8SecmqKc2
2CzeIs2LgtjZeOJVEqM7h0S2EQvVDFKvaYwPBt/QolOLV5h7z/0HJPT8vcP9SpIClxvyt7bP
ZYoaorVyGTkwggWsMIIElKADAgECAgcbY7rQHiw9MA0GCSqGSIb3DQEBCwUAMIGVMQswCQYD
VQQGEwJERTFFMEMGA1UEChM8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hl
biBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLEwdERk4tUEtJMS0wKwYDVQQDEyRE
Rk4tVmVyZWluIENlcnRpZmljYXRpb24gQXV0aG9yaXR5IDIwHhcNMTYwNTI0MTEzODQwWhcN
MzEwMjIyMjM1OTU5WjCBjTELMAkGA1UEBhMCREUxRTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9l
cmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5nc25ldHplcyBlLiBWLjEQMA4GA1UE
CwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9iYWwgSXNzdWluZyBDQTCCASIw
DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ07eRxH3h+Gy8Zp1xCeOdfZojDbchwFfylf
S2jxrRnWTOFrG7ELf6Gr4HuLi9gtzm6IOhDuV+UefwRRNuu6cG1joL6WLkDh0YNMZj0cZGnl
m6Stcq5oOVGHecwX064vXWNxSzl660Knl5BpBb+Q/6RAcL0D57+eGIgfn5mITQ5HjUhfZZkQ
0tkqSe3BuS0dnxLLFdM/fx5ULzquk1enfnjK1UriGuXtQX1TX8izKvWKMKztFwUkP7agCwf9
TRqaA1KgNpzeJIdl5Of6x5ZzJBTN0OgbaJ4YWa52fvfRCng8h0uwN89Tyjo4EPPLR22MZD08
WkVKusqAfLjz56dMTM0CAwEAAaOCAgUwggIBMBIGA1UdEwEB/wQIMAYBAf8CAQEwDgYDVR0P
AQH/BAQDAgEGMCkGA1UdIAQiMCAwDQYLKwYBBAGBrSGCLB4wDwYNKwYBBAGBrSGCLAEBBDAd
BgNVHQ4EFgQUazqYi/nyU4na4K2yMh4JH+iqO3QwHwYDVR0jBBgwFoAUk+PYMiba1fFKpZFK
4OpL4qIMz+EwgY8GA1UdHwSBhzCBhDBAoD6gPIY6aHR0cDovL2NkcDEucGNhLmRmbi5kZS9n
bG9iYWwtcm9vdC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDBAoD6gPIY6aHR0cDovL2NkcDIu
cGNhLmRmbi5kZS9nbG9iYWwtcm9vdC1nMi1jYS9wdWIvY3JsL2NhY3JsLmNybDCB3QYIKwYB
BQUHAQEEgdAwgc0wMwYIKwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnBjYS5kZm4uZGUvT0NTUC1T
ZXJ2ZXIvT0NTUDBKBggrBgEFBQcwAoY+aHR0cDovL2NkcDEucGNhLmRmbi5kZS9nbG9iYWwt
cm9vdC1nMi1jYS9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwSgYIKwYBBQUHMAKGPmh0dHA6Ly9j
ZHAyLnBjYS5kZm4uZGUvZ2xvYmFsLXJvb3QtZzItY2EvcHViL2NhY2VydC9jYWNlcnQuY3J0
MA0GCSqGSIb3DQEBCwUAA4IBAQCBeEWkTqR/DlXwCbFqPnjMaDWpHPOVnj/z+N9rOHeJLI21
rT7H8pTNoAauusyosa0zCLYkhmI2THhuUPDVbmCNT1IxQ5dGdfBi5G5mUcFCMWdQ5UnnOR7L
n8qGSN4IFP8VSytmm6A4nwDO/afr0X9XLchMX9wQEZc+lgQCXISoKTlslPwQkgZ7nu7YRrQb
tQMMONncsKk/cQYLsgMHM8KNSGMlJTx6e1du94oFOO+4oK4v9NsH1VuEGMGpuEvObJAaguS5
Pfp38dIfMwK/U+d2+dwmJUFvL6Yb+qQTkPp8ftkLYF3sv8pBoGH7EUkp2KgtdRXYShjqFu9V
NCIaE40GMIIGITCCBQmgAwIBAgIMIAznfcQsmKMHwKpYMA0GCSqGSIb3DQEBCwUAMIGNMQsw
CQYDVQQGEwJERTFFMEMGA1UECgw8VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRz
Y2hlbiBGb3JzY2h1bmdzbmV0emVzIGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQD
DBxERk4tVmVyZWluIEdsb2JhbCBJc3N1aW5nIENBMB4XDTE4MTExNTEyNDMyOFoXDTIxMTEx
NDEyNDMyOFowgbIxCzAJBgNVBAYTAkRFMRwwGgYDVQQIDBNOb3JkcmhlaW4tV2VzdGZhbGVu
MQ0wCwYDVQQHDARCb25uMTgwNgYDVQQKDC9SaGVpbmlzY2hlIEZyaWVkcmljaC1XaWxoZWxt
cy1Vbml2ZXJzaXRhZXQgQm9ubjEgMB4GA1UECwwXUGh5c2lrYWxpc2NoZXMgSW5zdGl0dXQx
GjAYBgNVBAMMEU9saXZlciBGcmV5ZXJtdXRoMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEAwKdVNE7QbQkmWwUVE7N+izRfbbEalPrylpwB9Mgm/YIjJCVfzpcdF7g63VY1TSFP
Uxh4yDSpw0lVruJZ6Gd6A1JCQEcw/yiG88Y806POHQEM0LTOYYmkKKG+iz8DEvTQbxC5+DyQ
shU2tYSi5druehKqylyReTun9NfJ1gTdLueKjpGqJnsG3CZOaVUx4eMFj7pMmHzPnZsfe/Nr
w3lTdmtaG0RoKHLDq3jK2LkDC3vgej/FyOVclUfwkEpxrm1l1GegqYMRZ5qAhwJ0d/FdD1Gt
HVdISFHrpHDDJAFZ2dVB+G4bhif1dvXsQK4qWOWT6M2+71xLhDdf9Qawci+isQIDAQABo4IC
WDCCAlQwQAYDVR0gBDkwNzAPBg0rBgEEAYGtIYIsAQEEMBEGDysGAQQBga0hgiwBAQQDCDAR
Bg8rBgEEAYGtIYIsAgEEAwgwCQYDVR0TBAIwADAOBgNVHQ8BAf8EBAMCBeAwHQYDVR0lBBYw
FAYIKwYBBQUHAwIGCCsGAQUFBwMEMB0GA1UdDgQWBBRVYUmFlJJi/QG+QVTQn2tfh4wnhTAf
BgNVHSMEGDAWgBRrOpiL+fJTidrgrbIyHgkf6Ko7dDAoBgNVHREEITAfgR1mcmV5ZXJtdXRo
QHBoeXNpay51bmktYm9ubi5kZTCBjQYDVR0fBIGFMIGCMD+gPaA7hjlodHRwOi8vY2RwMS5w
Y2EuZGZuLmRlL2Rmbi1jYS1nbG9iYWwtZzIvcHViL2NybC9jYWNybC5jcmwwP6A9oDuGOWh0
dHA6Ly9jZHAyLnBjYS5kZm4uZGUvZGZuLWNhLWdsb2JhbC1nMi9wdWIvY3JsL2NhY3JsLmNy
bDCB2wYIKwYBBQUHAQEEgc4wgcswMwYIKwYBBQUHMAGGJ2h0dHA6Ly9vY3NwLnBjYS5kZm4u
ZGUvT0NTUC1TZXJ2ZXIvT0NTUDBJBggrBgEFBQcwAoY9aHR0cDovL2NkcDEucGNhLmRmbi5k
ZS9kZm4tY2EtZ2xvYmFsLWcyL3B1Yi9jYWNlcnQvY2FjZXJ0LmNydDBJBggrBgEFBQcwAoY9
aHR0cDovL2NkcDIucGNhLmRmbi5kZS9kZm4tY2EtZ2xvYmFsLWcyL3B1Yi9jYWNlcnQvY2Fj
ZXJ0LmNydDANBgkqhkiG9w0BAQsFAAOCAQEARUAUNWOOOT8zUouetmweHEU3pYU3Wt5yEWao
KoayF1t5FTdeY9nvOrTss2kKzskO1lH5QodZP+nYGF4nA1YI37J115K8YJN+tjx7A8bVc34C
RAX6R2KXhTM6ToVTr6IsROkO7kj0HMLBcxbCgui635+Pu2PuPw86cd9rP+PxjHIXfQc0dIRi
z2eWG+nY7GwBZDBhpyQwqEBVBD09h8TN9Nz40WrO6fTu3unq7+JV5n7ccqef2ioc6fmI8Aqp
GBK1sl8MUuqD0e7gBdYqGwmZsB/faEgIRC1dKugq5UngD68gfn5rUzchoBAMWxoRcfQ+NEpb
8cw+P7/rk+/cwdD1vTGCBAswggQHAgEBMIGeMIGNMQswCQYDVQQGEwJERTFFMEMGA1UECgw8
VmVyZWluIHp1ciBGb2VyZGVydW5nIGVpbmVzIERldXRzY2hlbiBGb3JzY2h1bmdzbmV0emVz
IGUuIFYuMRAwDgYDVQQLDAdERk4tUEtJMSUwIwYDVQQDDBxERk4tVmVyZWluIEdsb2JhbCBJ
c3N1aW5nIENBAgwgDOd9xCyYowfAqlgwDQYJYIZIAWUDBAIBBQCgggI9MBgGCSqGSIb3DQEJ
AzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIxMDUxMTA5MDgxNVowLwYJKoZIhvcN
AQkEMSIEINwWjZ2BYIzHr2X6xkBH9d0mgu1auBPXlV320fb32asVMGwGCSqGSIb3DQEJDzFf
MF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgIC
AIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwga8GCSsGAQQBgjcQ
BDGBoTCBnjCBjTELMAkGA1UEBhMCREUxRTBDBgNVBAoMPFZlcmVpbiB6dXIgRm9lcmRlcnVu
ZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5nc25ldHplcyBlLiBWLjEQMA4GA1UECwwHREZO
LVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9iYWwgSXNzdWluZyBDQQIMIAznfcQsmKMH
wKpYMIGxBgsqhkiG9w0BCRACCzGBoaCBnjCBjTELMAkGA1UEBhMCREUxRTBDBgNVBAoMPFZl
cmVpbiB6dXIgRm9lcmRlcnVuZyBlaW5lcyBEZXV0c2NoZW4gRm9yc2NodW5nc25ldHplcyBl
LiBWLjEQMA4GA1UECwwHREZOLVBLSTElMCMGA1UEAwwcREZOLVZlcmVpbiBHbG9iYWwgSXNz
dWluZyBDQQIMIAznfcQsmKMHwKpYMA0GCSqGSIb3DQEBAQUABIIBAEfWO3SWLXSfzIqHKvsP
FeRfuSluCuSAo9pXHdiC2UVT9MMzauW2NskBFAxxzwfWo1dSoFHKqi/zA4r2SB+ej3NtLJmz
6VwdTjkmxXZluPN8N3TNQMnH1C+seTeJBJr6b07BM31NlgIdDqZYL7aEZJ1WForWDeHZwhIV
Ub3AlOB5agzWI7p+aIksvD7aluF+VO4PGjNnpCSMdWUySalKmReYeLJYWb9B+mE/J2YZih6W
IdO43sYpPmq8+uyAtFt2wjmtL/J2blEabZCNHvRKhSg/2LHulmjVS6mBbPZD0CX1aujiasdk
cWhUu0u1ujUjGvvOOr54Zezpnftbo38Q0ZcAAAAAAAA=
--------------ms000005030003000304080504--
