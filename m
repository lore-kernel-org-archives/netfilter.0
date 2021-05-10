From: Paul Robert Marino <prmarino1@gmail.com>
Subject: Re: Running an active/active firewall/router (xt_cluster?)
Date: Mon, 10 May 2021 12:57:17 -0400
Message-ID: <CAPJdpdAyqmKtRnnKDqyEOSnpVVJMNMdYjyuT7dNL+6CNDLwB6Q@mail.gmail.com>
References: <3a995078-6bdf-f1c6-0a88-bc56fca55714@physik.uni-bonn.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zWZ6VCTYKuxqzVQ8TQy6E2Gx2i8NX2+7j21fLXC18GY=;
        b=JWsNbGJAeXP92YTba04Uy4sZ8ZIdxiLljfa4tlPcRE6QoHhVmZ6y96CYlOwv9agjfk
         YJTpPMhfppZG80rUfVzgt0hg97FgJ2yccw19BVhPlW3NUg22yPIRgc98q7D1J+G2HbU5
         ReVUyIOatbqiN7Nht5vsEfBHJgro5AaR2QajnOozhRf5KqHSiWuOXGs5vE7E8knY5nuE
         DDVdgI8jlgTIMlpDxFyHrnEQ6EAsjJLhXSJmFlIsRtj+Lvfp1Z+TzUy/ZqbOYu5DZp2v
         yG60D0Ce9jxGIYMQ757DFd9pFfn9Cl5krpmdGwSM4LhF8CN6KwTfrDoMhjqL4bVGJjpU
         VLvw==
In-Reply-To: <3a995078-6bdf-f1c6-0a88-bc56fca55714@physik.uni-bonn.de>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Oliver Freyermuth <freyermuth@physik.uni-bonn.de>
Cc: netfilter <netfilter@vger.kernel.org>

hey Oliver,
I've done similar things over the years, a lot of fun lab experiments
and found it really it comes down to a couple of things.
I did some POC testing with contrackd and some experimental code
around trunking across multiple firewalls with a sprinkling of
virtualization.
There were a few scenarios I tried, some involving OpenVSwitch
(because I was experimenting with SPBM) and some not, with contrackd
similarly configured.
All the scenarios were interesting but they all had relatively rare on
slow (<1Gbs) network issues that grew exponentially in frequency on
higher speed networks (>1Gbs) with latency in contrackd syncing.

What i found is the best scenario was to use Quagga for dynamic
routing to load balance the traffic between the firewall IP's,
keepalived to load handle IP failover, and contrackd (in a similar
configuration to the one you described) to keep the states in sync
there are a few pitfalls in going down this route caused by bad and or
outdated documentation for both Quagga and keepalived. I'm also going
to give you some recommendations about some hardware topology stuff
you may not think about initially.

I will start with Quagga because the bad documentation part is easy to cove=
r.
in the Quagga documentation they recommend that you put a routable IP
on a loopback interface and attach Quagga the daemon for the dynamic
routing service of your choice to it, That works fine on BSD and old
versions of Linux from 20 years ago but any thing running a Linux
kernel version of 2.4 or higher will not allow it unless you change
setting in /etc/sysctrl.conf and the Quagga documentation tells you to
make those changes. DO NOT DO WHAT THEY SAY, its wrong and dangerous.
Instead create a "dummy" interface with a routable IP for this
purpose. a dummy interface is a special kind of interface meant for
exactly the scenario described and works well without compromising the
security of your firewall.

Keepalived
the main error in keepalived's documentation is is most of the
documentation and howto's you will find about it on the web are based
on a 15 year old howto which had a fundamental mistake in how VRRP
works, and what the "state"  flag actually does because its not
explained well in the man file. "state" in a "vrrp_instance" should
always be set to "MASTER" on all nodes and the priority should be used
to determine which node should be the preferred master. the only time
you should ever set state to "BACKUP" is if you have a 3rd machine
that you never want to become the master which you are just using for
quorum and in that case its priority should also be set to "0"
(failed) . setting the state to "BACKUP" will seem to work fine until
you have a failover event when the interface will continually go ip
and done on the backup node. on the mac address issue keepalived will
apr ping the subnets its attached to so that's generally not an issue
but I would recommend using vmac's (virtual mac addresses) assuming
the kernel for your distro and your network cards support it because
that way it just looks to the switch like it changed a port due to
some physical topology change and switches usually handle that very
gracefully, but don't always handle the mac address change for IP
addresses as quickly.
I also recommend reading the RFC's on VRRP particularly the parts that
explain how the elections and priorities work, they are a quick and
easy read and will really give you a good idea of how to configure
keepalived properly to achieve the failover and recovery behavior you
want.

On the hardware topology
I recommend using dedicated interfaces for contrackd, really you don't
need anything faster than 100Mbps even if the data interfaces are
100Gbps but i usually use 1 Gbps interfaces for this. they can be on
their own dedicated switches or crossover interfaces. the main concern
here is securely handling a large number of tiny packets so having
dedicated network card buffers to handle microburst  is useful and if
you can avoid latency from a switch that's trying to be too smart for
its own good that's for the best.
For keepalived use dedicated VLAN's on each physical interface to
handle the heartbeats and group the VRRP interfaces. to insure the
failovers of the IP's on both sides are handled correctly.
If you only have 2 firewalls I recommend using a an additional device
on each side for quorum in a backup/failed mode as described above.
Assuming a 1 second or greater interval the device could be something
as simple as a Raspberry PI it really doesn't need to be anything
powerful because its just adding a heartbeat to the cluster, but for
sub second intervals you may need something more powerful because sub
second intervals can eat a surprising amount of CPU.


On Sun, May 9, 2021 at 3:16 PM Oliver Freyermuth
<freyermuth@physik.uni-bonn.de> wrote:
>
> Dear netfilter experts,
>
> we are trying to setup an active/active firewall, making use of "xt_clust=
er".
> We can configure the switch to act like a hub, i.e. both machines can sha=
re the same MAC and IP and get the same packets without additional ARPtable=
s tricks.
>
> So we set rules like:
>
>   iptables -I PREROUTING -t mangle -i external_interface -m cluster --clu=
ster-total-nodes 2 --cluster-local-node 1 --cluster-hash-seed 0xdeadbeef -j=
 MARK --set-mark 0xffff
>   iptables -A PREROUTING -t mangle -i external_interface -m mark ! --mark=
 0xffff -j DROP
>
> Ideally, it we'd love to have the possibility to scale this to more than =
two nodes, but let's stay with two for now.
>
> Basic tests show that this works as expected, but the details get messy.
>
> 1. Certainly, conntrackd is needed to synchronize connection states.
>     But is it always "fast enough"?
>     xt_cluster seems to match by the src_ip of the original direction of =
the flow[0] (if I read the code correctly),
>     but what happens if the reply to an outgoing packet arrives at both f=
irewalls before state is synchronized?
>     We are currently using conntrackd in FTFW mode with a direct link, se=
t "DisableExternalCache", and additonally set "PollSecs 15" since without t=
hat it seems
>     only new and destroyed connections are synced, but lifetime updates f=
or existing connections do not propagate without polling.
>     Maybe another way which e.g. may use XOR(src,dst) might work around t=
ight synchronization requirements, or is it possible to always uses the "in=
ternal" source IP?
>     Is anybody doing that with a custom BPF?
>
> 2. How to do failover in such cases?
>     For failover we'd need to change these rules (if one node fails, the =
total-nodes will change).
>     As an alternative, I found [1] which states multiple rules can be use=
d and enabled / disabled,
>     but does somebody know of a cleaner (and easier to read) way, also no=
t costing extra performance?
>
> 3. We have several internal networks, which need to talk to each other (p=
artially with firewall rules and NATting),
>     so we'd also need similar rules there, complicating things more. That=
's why a cleaner way would be very welcome :-).
>
> 4. Another point is how to actually perform the failover. Classical clust=
er suites (corosync + pacemaker)
>     are rather used to migrate services, but not to communicate node ids =
and number of total active nodes.
>     They can probably be tricked into doing that somehow, but they are no=
t designed this way.
>     TIPC may be something to use here, but I found nothing "ready to use"=
.
>
> You may also tell me there's a better way to do this than use xt_cluster =
(custom BPF?) =E2=80=94 we've up to now only done "classic" active/passive =
setups,
> but maybe someone on this list has already done active/active without com=
mercial hardware, and can share experience from this?
>
> Cheers and thanks in advance,
>         Oliver
>
> PS: Please keep me in CC, I'm not subscribed to the list. Thanks!
>
> [0] https://github.com/torvalds/linux/blob/10a3efd0fee5e881b1866cf4595080=
8575cb0f24/net/netfilter/xt_cluster.c#L16-L19
> [1] https://lore.kernel.org/netfilter-devel/499BEBBF.7080705@netfilter.or=
g/
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
