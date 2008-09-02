From: Bernhard Bock <mailinglists@bock.nu>
Subject: Re: conntrackd failover works partially, was Re: conntrack performance
 test results in INVALID packets
Date: Tue, 02 Sep 2008 17:18:09 +0200
Message-ID: <48BD5931.7050703@bock.nu>
References: <488064DD.5080509@bock.nu> <alpine.LNX.1.10.0807181212331.12734@fbirervta.pbzchgretzou.qr> <488075F1.80901@bock.nu> <4880891C.4090004@netfilter.org> <4880A6BA.6030007@bock.nu> <489C0835.3090900@netfilter.org> <48BD09B6.5010905@bock.nu> <48BD0DD6.9000803@netfilter.org> <48BD32CC.5010203@bock.nu> <48BD362C.8020301@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48BD362C.8020301@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Pablo,

Pablo Neira Ayuso wrote:
> I though that your problem was that you cannot even recover the flows=
 in
> the first failover, but it seems to me that you have triggered severa=
l
> fail-overs between the nodes. There's no way to hit this in a clean
> session - ie. empty connection tracking table.=20

Well, there are several thousand connections established and teared dow=
n
on the primary node before the secondary nodes takes over, but as far a=
s
I can tell there is no "bouncing" between the nodes. So, there's no
empty connection tracking table at failover time:

1. Stop conntrackd
2. Clear conntrack table
3. Restart Fedora iptables service (see below)
4. Start conntrackd
-> 0 connections
5. Start traffic
-> lots of connections
6. fail-over

> If you are triggering several fail-overs with unclean session, the ne=
w
> script should help. So please, give it a try. It will take you a coup=
le
> of minutes to get it working.

Your script makes things worse for me, as it drops a lot of traffic on
switchover.

In my setup, it helps a lot to let INVALID packets pass for a couple of
seconds after switchover and return to the =E2=80=9Cnormal=E2=80=9D pol=
icy only after
this time. I coded this into my keepalived scripts. During this time,
some state recovers and most of the sessions actually work afterwards.
With a =E2=80=9Chard=E2=80=9D failover, nearly all sessions get lost.


One more thing I just noticed: It is not sufficient to clear the
conntrack table with 'conntrack -F'. I have to unload and reload the
iptables kernel modules to make it work again. This is done by the
=46edora init scripts for iptables. Without this, after a "broken"
fail-over, the machine keeps dropping some (few) packets even without
conntrackd and a second node involved. After reloading the modules,
everything's fine again. I guess this hints towards searching in the
kernel space and not in the conntrack-tools?!

Best regards
Bernhard
