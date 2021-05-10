From: Paul Robert Marino <prmarino1@gmail.com>
Subject: Re: Running an active/active firewall/router (xt_cluster?)
Date: Mon, 10 May 2021 18:55:13 -0400
Message-ID: <CAPJdpdD9LEG7q6MwioRmWoqSdV4gj7xgFCEor1nphAiX8smy7g@mail.gmail.com>
References: <3a995078-6bdf-f1c6-0a88-bc56fca55714@physik.uni-bonn.de>
 <CAPJdpdAyqmKtRnnKDqyEOSnpVVJMNMdYjyuT7dNL+6CNDLwB6Q@mail.gmail.com> <4113e9ec-225e-75d5-b221-996c00f9b060@physik.uni-bonn.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7lUz/hmfvDYgZqz2M20KOx7XPn2fz+os/PLi+6eKZ1Y=;
        b=pBQrDi0fZrxe2Z+nISwX3VtNOVWa0RFkv8kKhV6nwKrqMuS8PphpLkdvF/TjVphf8x
         VMP66tM7UafUR+Ad8XvtQF8AafjiDWi0iaJ+UwEuXZupt1D0xEWjjg+VIcSv4faP2RK0
         QtqkaN0iU7P/IyRwpsKdlOqCiFq/LcMFULxKGOdst+pppM2fmpzCeKn93NGCNNeoIiS2
         9/XaUVV8xZwz3HqedqcbA5af8EPQZQ4NLLKtpAeDS/zqQgq15DPSQPNhnJGU874seHS9
         3GSJH/gATd3cdShe3rlpwTSuxR8dlH2eKxQCbSzwYaLqLPt518bPATbr8lKnvTfxAsbi
         MGNg==
In-Reply-To: <4113e9ec-225e-75d5-b221-996c00f9b060@physik.uni-bonn.de>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Oliver Freyermuth <freyermuth@physik.uni-bonn.de>
Cc: netfilter <netfilter@vger.kernel.org>

I'm adding replies to your replies inline below

On Mon, May 10, 2021, 5:55 PM Oliver Freyermuth
<freyermuth@physik.uni-bonn.de> wrote:
>
> Hey Paul,
>
> many thanks for the detailed reply!
> Some comments inline.
>
> Am 10.05.21 um 18:57 schrieb Paul Robert Marino:
> > hey Oliver,
> > I've done similar things over the years, a lot of fun lab experiments
> > and found it really it comes down to a couple of things.
> > I did some POC testing with contrackd and some experimental code
> > around trunking across multiple firewalls with a sprinkling of
> > virtualization.
> > There were a few scenarios I tried, some involving OpenVSwitch
> > (because I was experimenting with SPBM) and some not, with contrackd
> > similarly configured.
> > All the scenarios were interesting but they all had relatively rare on
> > slow (<1Gbs) network issues that grew exponentially in frequency on
> > higher speed networks (>1Gbs) with latency in contrackd syncing.
>
> Indeed, we'd strive for ~20 Gb/s in our case, so this experience surely i=
s important to hear about.
>
> > What i found is the best scenario was to use Quagga for dynamic
> > routing to load balance the traffic between the firewall IP's,
> > keepalived to load handle IP failover, and contrackd (in a similar
> > configuration to the one you described) to keep the states in sync
> > there are a few pitfalls in going down this route caused by bad and or
> > outdated documentation for both Quagga and keepalived. I'm also going
> > to give you some recommendations about some hardware topology stuff
> > you may not think about initially.
>
> I'm still a bit unsure if we are on the same page, but that may just be c=
aused by my limited knowledge of Quagga.
> To my understanding, Quagga uses e.g. OSPF and hence can, if the routes h=
ave the same path, load-balance.
>
> However, in our case, we'd want to go for active/active firewalls (which =
of course are also routers).
> But that means we have internal machines on one side, which use a single =
default gateway (per VLAN),
> then our active/active firewall, and then the outside world (actually a P=
tP connection to an upstream router).
>
> Can Quagga help me to actively use both firewalls in a load-balancing and=
 redundant way?
> The idea here is that the upstream router has high bandwidth, so using mo=
re than one firewall allows to achieve better throughput,
> and with active/active we'd also strive for redundancy (i.e. reduced thro=
ughput if one firewall fails).
> To my understanding, OSPF / Quagga could do this if the firewalls are pla=
ced between routers also joining via OSPF.
> But is there also a way to have the clients directly talk to our firewall=
s, and the firewalls to a single upstream router (which we don't control)?
>
> A simple drawing may help:
>
>               ____  FW A ____
>              /               \
> Client(s) --                 --PtP-- upstream router
>              \____  FW B ____/
>
> This is why I thought about using xt_cluster and giving both FW A and FW =
B the very same IP (the default gateway of the clients)
> and the very same MAC at the same time, so the switch duplicates the pack=
ets, and then FW A accepts some packets and FW B the remaining ones
> via filtering with xt_cluster.
>
> Can Quagga do something in this picture, or simplify this picture?
> The upstream router also sends all incoming packets to a single IP in the=
 PtP network, i.e. the firewall nodes need to show up as "one converged sys=
tem"
> to both the clients on one side and the upstream router on the other side=
.


I understand what you are shooting for but it's dangerous at those
data rates and not achievable via stock existing software.
I did write some POC code years ago for a previous employer but
determined it was too dangerous to put into production without some
massive kernel changes such as using something like RDMA over
dedicated high speed interfaces or linking the systems over the PCI
express busses to sync the states instead of using contrackd.

So load balancing is a better choice in this case, and many middle to
higher end managed switches that have routers built in can do OSPF.
I've seen many stackable switches that can do it. By the way Quagga
supports several other dynamic routing protocols not just just OSPF.

The safest and easiest option for you would be to use 100Gbs fibre
connection instead, possibly with direct attach cables if you want to
save on optics, and do primary secondary failover.



> > I will start with Quagga because the bad documentation part is easy to =
cover.
> > in the Quagga documentation they recommend that you put a routable IP
> > on a loopback interface and attach Quagga the daemon for the dynamic
> > routing service of your choice to it, That works fine on BSD and old
> > versions of Linux from 20 years ago but any thing running a Linux
> > kernel version of 2.4 or higher will not allow it unless you change
> > setting in /etc/sysctrl.conf and the Quagga documentation tells you to
> > make those changes. DO NOT DO WHAT THEY SAY, its wrong and dangerous.
> > Instead create a "dummy" interface with a routable IP for this
> > purpose. a dummy interface is a special kind of interface meant for
> > exactly the scenario described and works well without compromising the
> > security of your firewall.
>
> Thanks for this helpful advice!
> Even though I am not sure yet Quagga will help me out in this picture,
> I am now already convinced we will have a situation in which Quagga will =
help us out.
> So this is noted down for future use :-).
>
> > Keepalived
> > the main error in keepalived's documentation is is most of the
> > documentation and howto's you will find about it on the web are based
> > on a 15 year old howto which had a fundamental mistake in how VRRP
> > works, and what the "state"  flag actually does because its not
> > explained well in the man file. "state" in a "vrrp_instance" should
> > always be set to "MASTER" on all nodes and the priority should be used
> > to determine which node should be the preferred master. the only time
> > you should ever set state to "BACKUP" is if you have a 3rd machine
> > that you never want to become the master which you are just using for
> > quorum and in that case its priority should also be set to "0"
> > (failed) . setting the state to "BACKUP" will seem to work fine until
> > you have a failover event when the interface will continually go ip
> > and done on the backup node. on the mac address issue keepalived will
> > apr ping the subnets its attached to so that's generally not an issue
> > but I would recommend using vmac's (virtual mac addresses) assuming
> > the kernel for your distro and your network cards support it because
> > that way it just looks to the switch like it changed a port due to
> > some physical topology change and switches usually handle that very
> > gracefully, but don't always handle the mac address change for IP
> > addresses as quickly.
> > I also recommend reading the RFC's on VRRP particularly the parts that
> > explain how the elections and priorities work, they are a quick and
> > easy read and will really give you a good idea of how to configure
> > keepalived properly to achieve the failover and recovery behavior you
> > want.
>
> See above on the virtual MACs =E2=80=94 if the clients should use both fi=
rewalls at the same time,
> I think I'd need a single MAC for both, so the clients only see a single =
default gateway.
> In a more classic setup, we've used pcs (pacemaker and corosync) to succe=
ssfully migrate virtual IPs and MAC addresses.
> It has worked quite reliable (using Kronosnet for communication).
> But we've also used Keepalived some years ago successfully :-).
>
> > On the hardware topology
> > I recommend using dedicated interfaces for contrackd, really you don't
> > need anything faster than 100Mbps even if the data interfaces are
> > 100Gbps but i usually use 1 Gbps interfaces for this. they can be on
> > their own dedicated switches or crossover interfaces. the main concern
> > here is securely handling a large number of tiny packets so having
> > dedicated network card buffers to handle microburst  is useful and if
> > you can avoid latency from a switch that's trying to be too smart for
> > its own good that's for the best.
>
> Indeed, we have 1 Gb/s crossover link, and use a 1 Gb/s connection throug=
h a switch in case this would ever fail for some reason =E2=80=94
> we use these links both for conntrackd and for Kronosnet communication by=
 corosync.
>
> > For keepalived use dedicated VLAN's on each physical interface to
> > handle the heartbeats and group the VRRP interfaces. to insure the
> > failovers of the IP's on both sides are handled correctly.
> > If you only have 2 firewalls I recommend using a an additional device
> > on each side for quorum in a backup/failed mode as described above.
> > Assuming a 1 second or greater interval the device could be something
> > as simple as a Raspberry PI it really doesn't need to be anything
> > powerful because its just adding a heartbeat to the cluster, but for
> > sub second intervals you may need something more powerful because sub
> > second intervals can eat a surprising amount of CPU.
>
> We currently went without an external third party and let corosync/pacema=
ker use a STONITH device to explicitly kill the other node
> and establish a defined state if heartbeats get lost. We might think abou=
t a third machine at some point to get an actual quorum, indeed.


I get why you might think to use corosync/pacemaker for this if you
weren't familiar with keepalived and LVS in the kernel,  but it's
hammering a square peg in a round hole when you have a perfectly
shaped and sized peg available to you that's actually been around a
lot longer and works a lot more predictably, faster and more reliably
by leveraging parts of the kernels network stack designed specifically
for this use case. I've done explicit kills of the other device via
cross connected hardware watchdog devices via keepalived before and it
was easy.
By the way if you don't know what LVS is it's the kernels builtin
layer 3 network load balancer stack that was designed with these kind
of failover scenarios in mind keepalived is just a wrapper around LVS
that adds VRRP based heartbeating and hooks to allow you to call
external scripts for actions based on heart beat state change events
and additional watchdog scripts which can also trigger state changes.
To be clear i wouldn't use keepalived to handle process master slave
failovers i would use corosync and pacemaker, or in some cases
Clusterd for that because they are usually the right tool for the job,
but for firewall and or network load balancer failover i would always
use keepalived because its the right tool for that job.


>
> Cheers and thanks again,
>         Oliver
>
> >
> >
> > On Sun, May 9, 2021 at 3:16 PM Oliver Freyermuth
> > <freyermuth@physik.uni-bonn.de> wrote:
> >>
> >> Dear netfilter experts,
> >>
> >> we are trying to setup an active/active firewall, making use of "xt_cl=
uster".
> >> We can configure the switch to act like a hub, i.e. both machines can =
share the same MAC and IP and get the same packets without additional ARPta=
bles tricks.
> >>
> >> So we set rules like:
> >>
> >>    iptables -I PREROUTING -t mangle -i external_interface -m cluster -=
-cluster-total-nodes 2 --cluster-local-node 1 --cluster-hash-seed 0xdeadbee=
f -j MARK --set-mark 0xffff
> >>    iptables -A PREROUTING -t mangle -i external_interface -m mark ! --=
mark 0xffff -j DROP
> >>
> >> Ideally, it we'd love to have the possibility to scale this to more th=
an two nodes, but let's stay with two for now.
> >>
> >> Basic tests show that this works as expected, but the details get mess=
y.
> >>
> >> 1. Certainly, conntrackd is needed to synchronize connection states.
> >>      But is it always "fast enough"?
> >>      xt_cluster seems to match by the src_ip of the original direction=
 of the flow[0] (if I read the code correctly),
> >>      but what happens if the reply to an outgoing packet arrives at bo=
th firewalls before state is synchronized?
> >>      We are currently using conntrackd in FTFW mode with a direct link=
, set "DisableExternalCache", and additonally set "PollSecs 15" since witho=
ut that it seems
> >>      only new and destroyed connections are synced, but lifetime updat=
es for existing connections do not propagate without polling.
> >>      Maybe another way which e.g. may use XOR(src,dst) might work arou=
nd tight synchronization requirements, or is it possible to always uses the=
 "internal" source IP?
> >>      Is anybody doing that with a custom BPF?
> >>
> >> 2. How to do failover in such cases?
> >>      For failover we'd need to change these rules (if one node fails, =
the total-nodes will change).
> >>      As an alternative, I found [1] which states multiple rules can be=
 used and enabled / disabled,
> >>      but does somebody know of a cleaner (and easier to read) way, als=
o not costing extra performance?
> >>
> >> 3. We have several internal networks, which need to talk to each other=
 (partially with firewall rules and NATting),
> >>      so we'd also need similar rules there, complicating things more. =
That's why a cleaner way would be very welcome :-).
> >>
> >> 4. Another point is how to actually perform the failover. Classical cl=
uster suites (corosync + pacemaker)
> >>      are rather used to migrate services, but not to communicate node =
ids and number of total active nodes.
> >>      They can probably be tricked into doing that somehow, but they ar=
e not designed this way.
> >>      TIPC may be something to use here, but I found nothing "ready to =
use".
> >>
> >> You may also tell me there's a better way to do this than use xt_clust=
er (custom BPF?) =E2=80=94 we've up to now only done "classic" active/passi=
ve setups,
> >> but maybe someone on this list has already done active/active without =
commercial hardware, and can share experience from this?
> >>
> >> Cheers and thanks in advance,
> >>          Oliver
> >>
> >> PS: Please keep me in CC, I'm not subscribed to the list. Thanks!
> >>
> >> [0] https://github.com/torvalds/linux/blob/10a3efd0fee5e881b1866cf4595=
0808575cb0f24/net/netfilter/xt_cluster.c#L16-L19
> >> [1] https://lore.kernel.org/netfilter-devel/499BEBBF.7080705@netfilter=
.org/
> >>
> >> --
> >> Oliver Freyermuth
> >> Universit=C3=A4t Bonn
> >> Physikalisches Institut, Raum 1.047
> >> Nu=C3=9Fallee 12
> >> 53115 Bonn
> >> --
> >> Tel.: +49 228 73 2367
> >> Fax:  +49 228 73 7869
> >> --
> >>
>
>
> --
> Oliver Freyermuth
> Universit=C3=A4t Bonn
> Physikalisches Institut, Raum 1.047
> Nu=C3=9Fallee 12
> 53115 Bonn
> --
> Tel.: +49 228 73 2367
> Fax:  +49 228 73 7869
> --
>
