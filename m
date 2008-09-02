From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd failover works partially, was Re: conntrack performance
 test results in INVALID packets
Date: Tue, 02 Sep 2008 18:22:30 +0200
Message-ID: <48BD6846.9030006@netfilter.org>
References: <488064DD.5080509@bock.nu> <alpine.LNX.1.10.0807181212331.12734@fbirervta.pbzchgretzou.qr> <488075F1.80901@bock.nu> <4880891C.4090004@netfilter.org> <4880A6BA.6030007@bock.nu> <489C0835.3090900@netfilter.org> <48BD09B6.5010905@bock.nu> <48BD0DD6.9000803@netfilter.org> <48BD32CC.5010203@bock.nu> <48BD362C.8020301@netfilter.org> <48BD5931.7050703@bock.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48BD5931.7050703@bock.nu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Bernhard Bock <mailinglists@bock.nu>
Cc: netfilter@vger.kernel.org

Bernhard Bock wrote:
> Pablo Neira Ayuso wrote:
>> I though that your problem was that you cannot even recover the flow=
s in
>> the first failover, but it seems to me that you have triggered sever=
al
>> fail-overs between the nodes. There's no way to hit this in a clean
>> session - ie. empty connection tracking table.=20
>=20
> Well, there are several thousand connections established and teared d=
own
> on the primary node before the secondary nodes takes over, but as far=
 as
> I can tell there is no "bouncing" between the nodes. So, there's no
> empty connection tracking table at failover time:
>=20
> 1. Stop conntrackd
> 2. Clear conntrack table
> 3. Restart Fedora iptables service (see below)
> 4. Start conntrackd
> -> 0 connections
> 5. Start traffic
> -> lots of connections
> 6. fail-over

OK

>> If you are triggering several fail-overs with unclean session, the n=
ew
>> script should help. So please, give it a try. It will take you a cou=
ple
>> of minutes to get it working.
>=20
> Your script makes things worse for me, as it drops a lot of traffic o=
n
> switchover.

Hm, the new script does exactly the same when the node becomes primary
as it used to do script_master.sh, so I cannot find a reason why the ne=
w
script does it worst.

> In my setup, it helps a lot to let INVALID packets pass for a couple =
of
> seconds after switchover and return to the =E2=80=9Cnormal=E2=80=9D p=
olicy only after
> this time. I coded this into my keepalived scripts. During this time,
> some state recovers and most of the sessions actually work afterwards=
=2E

This is a horrible workaround :(

> With a =E2=80=9Chard=E2=80=9D failover, nearly all sessions get lost.

During the fail-over, keepalived recovers the virtual IPs and conntrack=
d
commits the states into the kernel. The commit takes very short but you
can still lose some packets if the state is not yet present in the
kernel - thus, these packets are logged as invalid and dropped as we
don't find any matching state (with a sane stateful rule-set, of
course). *However*, the TCP sessions should recover as the peer or the
server retransmits the packet in short, so I don't understand why you
lose nearly all the sessions.

Is the firewall sending RST packets to the peer/server to close
connections? If so, I remember a similar report with a RHEL kernel:

http://www.mail-archive.com/netfilter-failover@lists.netfilter.org/msg0=
0065.html

> One more thing I just noticed: It is not sufficient to clear the
> conntrack table with 'conntrack -F'. I have to unload and reload the
> iptables kernel modules to make it work again. This is done by the
> Fedora init scripts for iptables. Without this, after a "broken"
> fail-over, the machine keeps dropping some (few) packets even without
> conntrackd and a second node involved. After reloading the modules,
> everything's fine again. I guess this hints towards searching in the
> kernel space and not in the conntrack-tools?!

conntrack -F should be enough, there's something wrong in the kernel.
There were other issues related with nat.

There are three patches that should hit -stable for 2.6.26 soon that ar=
e
not directly related but that are worth to have:

http://marc.info/?l=3Dnetfilter-devel&m=3D121907870404717&w=3D2
http://marc.info/?l=3Dnetfilter-devel&m=3D121907870504722&w=3D2
http://marc.info/?l=3Dnetfilter-devel&m=3D121907870604726&w=3D2

There were other issues related with NAT but they are fixed in 2.6.26,
however, I'm not sure if fedora is a real 2.6.26 kernel.

https://bugs.launchpad.net/ubuntu/+source/linux/+bug/239215

--=20
"Los honestos son inadaptados sociales" -- Les Luthiers
