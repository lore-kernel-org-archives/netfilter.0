From: "Gabriel L. Somlo" <gsomlo@gmail.com>
Subject: Re: Help/Advice with Ethernet NAT or "hub-mode" bridge
Date: Sat, 1 Apr 2023 14:59:32 -0400
Message-ID: <ZCh/FHuJ/AJ8Onxz@errol.ini.cmu.edu>
References: <ZCdWKnTTy+0owQZr@errol.ini.cmu.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680375575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K5dZMSHJDrzD8W+IMxivyedpuHCjj2iNDMCaEzVsYQM=;
        b=NRYFoOfz7N9d0dciYcBeYqHGcrsmIr7+aAOr87fO6hsEZTkfQOxe9Mom5gaTi5/Bo3
         056Cy8qNSFeu/8Yy7b8hMVGHGhe4xW7yooZQaKUxpU1gNAlK63eKy9ZevCHICcS8n5rd
         b0q8VxiDAF1Vb9mPzqxkPia9J2u+JoLHpKcdyDHmSKNyT0j9VcJjmdSh5DckuAdNAhuG
         +q46T2Cjd4MRdHIzlUlzA2xGmSRfLgAGaVxjgjcs9WeUepmcOR+gH4aUA0atZYHjbJQb
         9HV9hratr6DSUvchJIBP2BWiszjSACOqHhV9Gia41wG/6l3mL3sjDj6wFhQsWMfu/oXZ
         T+OQ==
Content-Disposition: inline
In-Reply-To: <ZCdWKnTTy+0owQZr@errol.ini.cmu.edu>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Here's my current (working!) solution, but I feel I shouldn't have to
jump to *this* many hoops (see below) to make it work, there should be
an easier less painful way to pull it off! :)

On Fri, Mar 31, 2023 at 05:52:44PM -0400, Gabriel L. Somlo wrote:
> I have several VMs networked together on a cloud-based hypervisor
> solution, where the "vswitch" connecting the VMs enforces a strict
> "one MAC per VM network interface" policy.
> 
> Typically, one of the VMs has no problem being the "default gateway"
> on such a "vswitch", serving all other VMs connected to the same
> virtualized "LAN" switch.
> 
> In my case, the default gateway is inside a container running inside
> a network simulator on one of the VMs (many containers in that simulation
> are used to connect groups of VMs on this "router's" several interfaces
> across a simulated multi-hop "internet".
> 
> The trouble is, if I use the simulator VM's interfaces as bridge ports
> into the simulation, the container-as-default gateway will have its
> traffic dropped by the vswitch outside its host VM. Here's an ASCII
> picture of the setup: 
> 
> -----------------------------
> VM running simulation       |
>                             |
> sim. node,                  |
> (container),                |
> dflt gateway                |
> -----------    - br0 -      |             -----------------
>           |   /       \     |  inter-VM   | External VM   |
>      eth0 + veth0    ens32  +-- vswitch --+ using in-sim  |
>   Sim.MAC |          VM.MAC |             | dflt. gateway |
> -----------                 |             -----------------
> -----------------------------
> 
> IOW, the "inter-VM vswitch" only allows <VM.MAC> ethernet frames
> from/to the VM running the simulation.


#1. On the simulator VM, create a veth pair (`vi` facing the container):

	ip link add vi0 type veth peer name vo0

#2. create a bridge between "outward" facing `vo0` and `ens32`:

	ip link add br0 type bridge
	ip link set vo0 master br0 
	ip link set ens32 master br0 

#3. bring up the "outward" facing bridge and its ports:

	ip link set dev br0 up
	ip link set dev vo0 up
	ip link set dev ens32 up

#4. assign `vi0` as the "bridge" interface in the Net.Sim. (e.g., gns3
#   or CORE network simulators):

#5. after Net.Sim. starts, we have a situation like the following:

 ---------------------------------------------
 |-------------       bXYZ          br0      |               ---------
 || container |       /  \         /   \     |               | other |
 ||      eth0 + vethXYZ  vi0 --- vo0   ens32 + -- vswitch -- + guest |
 ||           |                      Pub.MAC |               | VM(s) |
 |-------------               |              |               ---------
 | < controlled by Net.Sim.>  | <manual conf>| 
 |                                           |
 |                 Simulator VM              |
 ---------------------------------------------

#6. Set up "double MAC NAT" allowing container `eth0` to use `Pub.MAC`:

	ebtables -t nat -F
	ebtables -t nat -A PREROUTING  -i ens32 -d <Pub.MAC> \
	         -j dnat --to-destination de:ad:be:ef:00:01
	ebtables -t nat -A POSTROUTING -o ens32 -s de:ad:be:ef:00:01 \
	         -j snat --to-source <Pub.MAC>
	ebtables -t nat -A PREROUTING  -i vi0   -d de:ad:be:ef:00:01 \
	         -j dnat --to-destination <Pub.MAC>
	ebtables -t nat -A POSTROUTING -o vi0   -s <Pub.MAC> \
	         -j snat --to-source de:ad:be:ef:00:01

# NOTE: If traffic arrives on a bridge with a destination MAC belonging
#       to one of its own ports (a "permanent" FDB entry), it will not
#       be forwarded. Therefore `de:ad:be:ef:00:01` is subtituted for
#       <Pub.MAC> on the `vi0` <--> `vo0` link, and NAT-ed back to the
#       real <Pub.MAC> after the two bridges have been "tricked" into
#       forwarding the frame!

#7. Set <Pub.MAC> as the mac address of the container's `eth0`:

	ip link set dev eth0 down
	ip link set dev eth0 address <Pub.MAC>
	ip link set dev eth0 up

#8. Restart dhcp inside the container, and we're good to go!

# The Net.Sim. can have multiple containers assigned to multiple ens*
# interfaces, with multiple "enclaves" connected to different
# vswitches. Each "enclave" vswitch will see the simulator VM
# communicate using its assigned MAC address, but that traffic will
# actually originate from each respective "passed-through" container.


Anyway, once I realized that:

	- a single bridge refuses to forward frames destined to
	  addresses present as "permanent" in its own fdb,

	- snat is only available in POSTROUTING,

	- dnat is only available in PREROUTING,

I decided to add an extra bridge hop and translate <Pub.MAC> back and
forth, to allow the inner container `eth0` to also use it, thus
solving the issue of ARP packets having mismatched "inner" and "outer"
mac addresses for the default gateway :)

If anyone else knows of a way to further "dumb down" a bridge to the
point where it can be convinced to ignore its "permanent" fdb entries
when making a forwarding decision, I can further simplify this setup.

Thanks much,
--Gabriel

PS. Figured I'd post my current solution in case anyone else ends up
looking for a neat workaround to a problem similar to mine, assuming
nothing cleaner and simpler becomes known or available :)
