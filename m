From: "Gabriel L. Somlo" <gsomlo@gmail.com>
Subject: Re: Help/Advice with Ethernet NAT or "hub-mode" bridge
Date: Fri, 31 Mar 2023 19:27:47 -0400
Message-ID: <ZCdscxWfIYsEk/LL@errol.ini.cmu.edu>
References: <ZCdWKnTTy+0owQZr@errol.ini.cmu.edu>
 <CAJMkcM2nyHUUXtYgQ7UOTN3SLi-i-JuJbCv8V9=8g45FVOCXmA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680305270;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l47kGiJYDU5NDwiy6T9fUr9f9dQ8orIwHyGp1XbQ9kY=;
        b=FI+ia1nyV3Ke+G/kIbI0u11PC9xyISXtAaOE9EbJOzJzUjrmX2+daPJVX/9pfsPK2D
         itVRQFWVT3eWUjFltqBOpzcSZJaljaipGpeWDW2xsC8VQSoEFyFYbkaQwqWSsRgJ8BD2
         XL+NkhLVEpcKSL55mEz7fpoWFnc0o3Enlv0WgxBGdy3MwwilpCb6zRVhHAa2IilaGieq
         OOs1LDhImPLkICE6RXNz4m6G0gundk31u6Itt508S01A0zTQJwwpp8vwsFnvQTaFl1h9
         1maMl/ZiX/CpcPWlxCa3BLF2Brm9xRrWzeBLNo5EX1efPPnYqkbmF0FJf/J9od/q/MUJ
         NO+A==
Content-Disposition: inline
In-Reply-To: <CAJMkcM2nyHUUXtYgQ7UOTN3SLi-i-JuJbCv8V9=8g45FVOCXmA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Payam Chychi <pchychi@gmail.com>
Cc: netfilter@vger.kernel.org

Thanks for the reply!

On Fri, Mar 31, 2023 at 04:02:13PM -0700, Payam Chychi wrote:
> Hey Gabriel,
> 
> I’m not sure if the best way of achieving what you’re intending is by bridging
> at the vm down to the container.
> 
> It’s probably not working as you think due to layer2 loop prevention mechanism,
> which VM also has implemented within its architecture (many years now)
> 
> The mac-add overwrite function is also by default to maintain a stable
> network…lookup proxy arp, gratuitous arp, and arp poisoning as some common
> terms.
> 
> Sure, you can fake Arp entries but wow… this is not going to be a stable or
> reliable network, take it from someone that designed massive data centers and
> did architecture and design for tier1/2 network providers.

In the rather specific topology I've shown (with a single container
interface "hidden" behind (bridged to) an outside-facing host-VM
network interface) it's basically a 1:1 translation, so I don't see
why it would be unstable or unreliable :)

The question is, *is* there a way to NFQUEUE ebtables traffic to
userspace? If not, any insight into why that's only supported at layer-3?

This is just a router VM, but instead of running Quagga/FRR on the VM
itself and being a single-hop L3 router across the VM-adjacent LANs,
I'm running many Quagga/FRR instances inside containers, so this would be
a single-vm router simulating many L3 hops. The point is still to present
a straightforward default gateway to the "outside" connected LANs, not to
design a massive datacenter architecture that presumes the "architect" gets
to dictate all the hoops through which all the (presumably "cattle") client
VMs (presumably designed by the same "architect") must also jump through...
 
> There are many reasons why an l2vpn was probably recommended to you, it’s meant
> for things like your example.

The *realism* of "I'm a normie computer, and there's a normie default
gateway on the LAN I'm connected to" for the client VMs is the *entire*
*point* of the exercise, that's why I'm stubbornly ignoring the "why
don't you just set up an l2 vpn thing for everyone" type advice... :)

> There are also other protocols and architectures (l3 vpn with additional
> encapsulation) you can use… but you should focus on your requirements and
> understand if/why an L2 wont work for you.
 
How about my other idea, of turning off enough of the (unwanted, by
me, in this particular case) "smarts" of a Linux bridge, so that it
blindly and stupidly forwards everything, ignoring "fdb entries" ?
This is a 2-port bridge, and all I want from it is that when a frame
enters over one port, it should be sent back out the other port(s).
Don't look at the FDB, don't decide to drop frames because the
destination mac address is permanently associated with the receiving
port, don't learn MAC-port associations from the frames, etc... Is
there still a way to make that work (there used, to, years back, IIRC)?
If not (anymore), then why not ? :)

Thanks again,
--Gabriel
 
> On Fri, Mar 31, 2023 at 3:14 PM Gabriel L. Somlo <gsomlo@gmail.com> wrote:
> 
>     Hi,
> 
>     I have several VMs networked together on a cloud-based hypervisor
>     solution, where the "vswitch" connecting the VMs enforces a strict
>     "one MAC per VM network interface" policy.
> 
>     Typically, one of the VMs has no problem being the "default gateway"
>     on such a "vswitch", serving all other VMs connected to the same
>     virtualized "LAN" switch.
> 
>     In my case, the default gateway is inside a container running inside
>     a network simulator on one of the VMs (many containers in that simulation
>     are used to connect groups of VMs on this "router's" several interfaces
>     across a simulated multi-hop "internet".
> 
>     The trouble is, if I use the simulator VM's interfaces as bridge ports
>     into the simulation, the container-as-default gateway will have its
>     traffic dropped by the vswitch outside its host VM. Here's an ASCII
>     picture of the setup:
> 
>     -----------------------------
>     VM running simulation       |
>                                 |
>     sim. node,                  |
>     (container),                |
>     dflt gateway                |
>     -----------    - br0 -      |             -----------------
>               |   /       \     |  inter-VM   | External VM   |
>          eth0 + veth0    ens32  +-- vswitch --+ using in-sim  |
>       Sim.MAC |          VM.MAC |             | dflt. gateway |
>     -----------                 |             -----------------
>     -----------------------------
> 
>     IOW, the "inter-VM vswitch" only allows <VM.MAC> ethernet frames
>     from/to the VM running the simulation.
> 
>     I've been trying two different approaches:
> 
>     1. assign VM.MAC to eth0 inside the container, overwriting Sim.MAC
>        (e.g., using `ip link set dev eth0 address <VM.MAC>` inside the
>        container).
> 
>        I find that when I do that, `br0` will drop external incoming
>        frames to <VM.MAC> rather than forward them through `veth0`, and
>        that I can't find a way to force br0 to forward everything without
>        considering its permanent fdb entries.
> 
>        If I could force br0 to act more like a hub (forward everything
>        ignoring the fdb, learn nothing, ever), I could get frames to
>        successfully travel between my container's eth0 and the external
>        VMs trying to use it as the default gateway. The frames would
>        have ens32's VM.MAC, which would satisfy the restrictive hypervisor
>        and vswitch policies.
> 
>     2. use ebtables to NAT between ens32's VM.MAC and the container's
>        eth0's Sim.MAC:
> 
>          ebtables -t nat -A PREROUTING \
>                -i ens32 -d <VM.MAC> -j dnat --to-destination <Sim.MAC>
> 
>          ebtables -t nat -A POSTROUTING \
>                -o ens32 -s <Sim.MAC> -j snat --to-source <VM.MAC>
> 
>        This will get frames to successfully cross the bridge with the right
>        MAC addresses in the Ethernet headers, but breaks ARP:
> 
>          - the container replies to arp requests from external VMs, its
>            *payload* (inner) MAC address is still Sim.MAC, even though
>            the Ethernet frame (outer) source MAC address has been rewritten
>            to be VM.MAC.
>            The ebtables man page seems to indicate that using the arpreply
>            extension might take care of this, but so far I've failed to
>            have external arp requests get dropped by adding such a rule,
>            and they still somehow obtain the Sim.MAC as their default gateway
>            host's associated MAC, and things don't work
> 
>         - when the container itself sends out arp requests for external VM's
>           mac addresses, it places its own Sim.MAC in the inner source MAC
>           field
> 
>        Would this be a situation in which I can (should) be able to use
>        the NFQUEUE target to be able to "edit" packets myself in userspace?
> 
>        There seems to be no NFQUEUE support in ebtables, unlike iptables.
>        Is that right, or am I missing something?
> 
>        Is there any other way to dynamically "fix up" ARP to match the changes
>        made to the "outer" (Ethernet header) MAC addresses?
> 
>     I've been advised to use a layer-2 VPN solution, but that would break
>     "realism" for the external client VMs, and, besides, I'm trying to avoid
>     imposing restrictions and requirements on them, since they're independently
>     developed and operated, and a "transparent" solution where the default
>     gateway is on the magic "router" VM, period, would be a huge usability
>     win.
> 
>     Any ideas on what I'm missing, doing wrong, or should otherwise be looking
>     into would be much appreciated!
> 
>     Thanks,
>     --Gabriel
> 
> --
> Payam Tarverdyan Chychi
