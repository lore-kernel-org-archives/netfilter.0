From: "Gabriel L. Somlo" <gsomlo@gmail.com>
Subject: Help/Advice with Ethernet NAT or "hub-mode" bridge
Date: Fri, 31 Mar 2023 17:52:42 -0400
Message-ID: <ZCdWKnTTy+0owQZr@errol.ini.cmu.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680299564;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ZUWCizzorUS4Hic+w2+avj9Y3fjjPmygYA7K9nLvCM=;
        b=JdIgpaORU/KGniT9KgJ0mJsGf/CRnT1ioRVsy/WfGhyNmGY4l7Ta8qfbqfo+kbhuq0
         TWsb52qaliyRA6l8eqgr5JIlxey75UBldOmFMWgz4hXHPc8FqfK/qrINSQy+TNIuD35u
         WsgVqGvZXBUSlmYqTqH7gHW4lX5bPaiCjsRR0JkC9wscNeN95eW0zPe8HKMWNi0kMR4n
         9zY1KXFJ2zJGbw5Iv+kNNH2di4hTDzQAtaliM+4W0akrK1aS8ySiL8UyWQ7247nmIh1t
         /yyfBpar8/IQJ9lY6A0PGHLZIOSXNHCVOIzelQAlS7c2JK/TE30zsInEM1C1Xxx0V4RN
         IPZQ==
Content-Disposition: inline
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have several VMs networked together on a cloud-based hypervisor
solution, where the "vswitch" connecting the VMs enforces a strict
"one MAC per VM network interface" policy.

Typically, one of the VMs has no problem being the "default gateway"
on such a "vswitch", serving all other VMs connected to the same
virtualized "LAN" switch.

In my case, the default gateway is inside a container running inside
a network simulator on one of the VMs (many containers in that simulation
are used to connect groups of VMs on this "router's" several interfaces
across a simulated multi-hop "internet".

The trouble is, if I use the simulator VM's interfaces as bridge ports
into the simulation, the container-as-default gateway will have its
traffic dropped by the vswitch outside its host VM. Here's an ASCII
picture of the setup: 

-----------------------------
VM running simulation       |
                            |
sim. node,                  |
(container),                |
dflt gateway                |
-----------    - br0 -      |             -----------------
          |   /       \     |  inter-VM   | External VM   |
     eth0 + veth0    ens32  +-- vswitch --+ using in-sim  |
  Sim.MAC |          VM.MAC |             | dflt. gateway |
-----------                 |             -----------------
-----------------------------

IOW, the "inter-VM vswitch" only allows <VM.MAC> ethernet frames
from/to the VM running the simulation.

I've been trying two different approaches:

1. assign VM.MAC to eth0 inside the container, overwriting Sim.MAC
   (e.g., using `ip link set dev eth0 address <VM.MAC>` inside the
   container).

   I find that when I do that, `br0` will drop external incoming
   frames to <VM.MAC> rather than forward them through `veth0`, and
   that I can't find a way to force br0 to forward everything without
   considering its permanent fdb entries.

   If I could force br0 to act more like a hub (forward everything
   ignoring the fdb, learn nothing, ever), I could get frames to
   successfully travel between my container's eth0 and the external
   VMs trying to use it as the default gateway. The frames would
   have ens32's VM.MAC, which would satisfy the restrictive hypervisor
   and vswitch policies.

2. use ebtables to NAT between ens32's VM.MAC and the container's
   eth0's Sim.MAC:

     ebtables -t nat -A PREROUTING \
           -i ens32 -d <VM.MAC> -j dnat --to-destination <Sim.MAC>

     ebtables -t nat -A POSTROUTING \
           -o ens32 -s <Sim.MAC> -j snat --to-source <VM.MAC>

   This will get frames to successfully cross the bridge with the right
   MAC addresses in the Ethernet headers, but breaks ARP:

     - the container replies to arp requests from external VMs, its
       *payload* (inner) MAC address is still Sim.MAC, even though
       the Ethernet frame (outer) source MAC address has been rewritten
       to be VM.MAC.
       The ebtables man page seems to indicate that using the arpreply
       extension might take care of this, but so far I've failed to
       have external arp requests get dropped by adding such a rule,
       and they still somehow obtain the Sim.MAC as their default gateway
       host's associated MAC, and things don't work

    - when the container itself sends out arp requests for external VM's
      mac addresses, it places its own Sim.MAC in the inner source MAC
      field

   Would this be a situation in which I can (should) be able to use
   the NFQUEUE target to be able to "edit" packets myself in userspace?

   There seems to be no NFQUEUE support in ebtables, unlike iptables.
   Is that right, or am I missing something?

   Is there any other way to dynamically "fix up" ARP to match the changes
   made to the "outer" (Ethernet header) MAC addresses?

I've been advised to use a layer-2 VPN solution, but that would break
"realism" for the external client VMs, and, besides, I'm trying to avoid
imposing restrictions and requirements on them, since they're independently
developed and operated, and a "transparent" solution where the default
gateway is on the magic "router" VM, period, would be a huge usability
win.

Any ideas on what I'm missing, doing wrong, or should otherwise be looking
into would be much appreciated!

Thanks,
--Gabriel
