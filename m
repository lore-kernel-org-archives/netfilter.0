From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Running an active/active firewall/router (xt_cluster?)
Date: Tue, 11 May 2021 00:19:07 +0200
Message-ID: <20210510221907.GA15863@salvia>
References: <3a995078-6bdf-f1c6-0a88-bc56fca55714@physik.uni-bonn.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="nVMJ2NtxeReIH9PS"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3a995078-6bdf-f1c6-0a88-bc56fca55714@physik.uni-bonn.de>
List-ID: <netfilter.vger.kernel.org>
To: Oliver Freyermuth <freyermuth@physik.uni-bonn.de>
Cc: netfilter@vger.kernel.org


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, May 09, 2021 at 07:52:27PM +0200, Oliver Freyermuth wrote:
> Dear netfilter experts,
>=20
> we are trying to setup an active/active firewall, making use of
> "xt_cluster".  We can configure the switch to act like a hub, i.e.
> both machines can share the same MAC and IP and get the same packets
> without additional ARPtables tricks.
>=20
> So we set rules like:
>=20
>  iptables -I PREROUTING -t mangle -i external_interface -m cluster --clus=
ter-total-nodes 2 --cluster-local-node 1 --cluster-hash-seed 0xdeadbeef -j =
MARK --set-mark 0xffff
>  iptables -A PREROUTING -t mangle -i external_interface -m mark ! --mark =
0xffff -j DROP

I'm attaching an old script to set up active-active I remember to have
used time ago, I never found the time to upstream this.

> Ideally, it we'd love to have the possibility to scale this to more
> than two nodes, but let's stay with two for now.

IIRC, up to two nodes should be easy with the existing codebase. To
support more than 2 nodes, conntrackd needs to be extended, but it
should be doable.

> Basic tests show that this works as expected, but the details get messy.
>=20
> 1. Certainly, conntrackd is needed to synchronize connection states.
>    But is it always "fast enough"?  xt_cluster seems to match by the
>    src_ip of the original direction of the flow[0] (if I read the code
>    correctly), but what happens if the reply to an outgoing packet
>    arrives at both firewalls before state is synchronized?

You can avoid this by setting DisableExternalCache to off. Then, in
case one of your firewall node goes off, update the cluster rules and
inject the entries (via keepalived, or your HA daemon of choice).

Recommended configuration is DisableExternalCache off and properly
configure your HA daemon to assist conntrackd. Then, the conntrack
entries in the "external cache" of conntrackd are added to the kernel
when needed.

>    We are currently using conntrackd in FTFW mode with a direct
>    link, set "DisableExternalCache", and additonally set "PollSecs
>    15" since without that it seems only new and destroyed
>    connections are synced, but lifetime updates for existing
>    connections do not propagate without polling.

No need to set on PollSecs. Polling should be disabled. Did you enable
event filtering? You should synchronize receive update too. Could you
post your configuration file?

[...]
> 2. How to do failover in such cases?
>    For failover we'd need to change these rules (if one node fails,
>    the total-nodes will change).  As an alternative, I found [1]
>    which states multiple rules can be used and enabled / disabled,
>    but does somebody know of a cleaner (and easier to read) way,
>    also not costing extra performance?

If you use iptables, you'll have to update the rules on failure as you
describe. What performance cost are you refering to?

> 3. We have several internal networks, which need to talk to each
>    other (partially with firewall rules and NATting), so we'd also need
>    similar rules there, complicating things more. That's why a cleaner
>    way would be very welcome :-).

Cleaner way, it should be possible to simplify this setup with
nftables.

> 4. Another point is how to actually perform the failover. Classical
>    cluster suites (corosync + pacemaker) are rather used to migrate
>    services, but not to communicate node ids and number of total active
>    nodes.  They can probably be tricked into doing that somehow, but
>    they are not designed this way.  TIPC may be something to use here,
>    but I found nothing "ready to use".

I have used keepalived in the past with very simple configuration
files, and use their shell script API to interact with conntrackd.
I did not spend much time on corosync/pacemaker so far.

[...]

--nVMJ2NtxeReIH9PS
Content-Type: application/x-sh
Content-Disposition: attachment; filename="cluster-node1.sh"
Content-Transfer-Encoding: quoted-printable

#!/bin/sh=0A=0A#=0A# Here, you can find the variables that you have to chan=
ge.=0A#=0A=0A# enable this for debugging=0ALOG_DEBUG=3D0=0A=0A# number of c=
luster node (must be unique, from 1 to N)=0ANODE=3D1=0A# number of nodes th=
at belong this cluster=0ATOTAL_NODES=3D2=0A=0A# this is the real MAC addres=
s of eth1=0AREAL_HWADDR1=3D00:18:71:68:f2:34=0A=0A# this is the real MAC ad=
dress of eth2=0AREAL_HWADDR2=3D00:11:0a:60:e7:32=0A=0A#=0A# This below shou=
ldn't change for this example script.=0A#=0A=0A# this is the cluster multic=
ast MAC address of eth1=0AMC_HWADDR1=3D01:00:5e:00:01:01=0A=0A# this is the=
 cluster multicast MAC address of eth2=0AMC_HWADDR2=3D01:00:5e:00:01:02=0A=
=0A# cluster IP address of eth1=0AADDR1=3D192.168.0.5/24=0A=0A# cluster IP =
address of eth2=0AADDR2=3D192.168.1.5/24=0A=0A# random seed: it has to be t=
he same in both nodes=0ASEED=3D0xdeadbeef=0A=0Astart_cluster_address()=0A{=
=0A	# set cluster IP addresses=0A	ip a a $ADDR1 dev eth1=0A	ip a a $ADDR2 d=
ev eth2=0A	# set cluster multicast MAC addresses=0A	ip maddr add $MC_HWADDR=
1 dev eth1=0A	ip maddr add $MC_HWADDR2 dev eth2=0A	# mangle ARP replies to =
include the cluster multicast MAC addresses=0A	arptables -I OUTPUT -o eth1 =
--h-length 6 \=0A		-j mangle --mangle-mac-s $MC_HWADDR1=0A	# mangle ARP req=
uest to use the original MAC address (otherwise the=0A	# stack drops this p=
acket).=0A	arptables -I INPUT -i eth1 --h-length 6 --destination-mac \=0A		=
$MC_HWADDR1 -j mangle --mangle-mac-d $REAL_HWADDR1=0A	arptables -I OUTPUT -=
o eth2 --h-length 6 \=0A		-j mangle --mangle-mac-s $MC_HWADDR2=0A	arptables=
 -I INPUT -i eth2 --h-length 6 --destination-mac \=0A		$MC_HWADDR2 -j mangl=
e --mangle-mac-d $REAL_HWADDR2=0A}=0A=0Astop_cluster_address()=0A{=0A	# del=
ete cluster IP addresses=0A	ip a d $ADDR1 dev eth1=0A	ip a d $ADDR2 dev eth=
2=0A	# delete cluster multicast MAC addresses=0A	ip maddr del $MC_HWADDR1 d=
ev eth1=0A	ip maddr del $MC_HWADDR2 dev eth2=0A	# delete ARP replies mangli=
ng =0A	arptables -D OUTPUT -o eth1 --h-length 6 \=0A		-j mangle --mangle-ma=
c-s $MC_HWADDR1=0A	# delete ARP requests mangling=0A	arptables -D INPUT -i =
eth1 --h-length 6 --destination-mac \=0A		$MC_HWADDR1 -j mangle --mangle-ma=
c-d $REAL_HWADDR1=0A	arptables -D OUTPUT -o eth2 --h-length 6 \=0A		-j mang=
le --mangle-mac-s $MC_HWADDR2=0A	arptables -D INPUT -i eth2 --h-length 6 --=
destination-mac \=0A		$MC_HWADDR2 -j mangle --mangle-mac-d $REAL_HWADDR2=0A=
}=0A=0Astart_nat()=0A{=0A	iptables -A POSTROUTING -t nat -s 192.168.0.11 \=
=0A		-j SNAT --to-source 192.168.1.5 =0A	iptables -A POSTROUTING -t nat -s =
192.168.0.2 \=0A		-j SNAT --to-source 192.168.1.5 =0A}=0A=0Astop_nat()=0A{=
=0A	iptables -D POSTROUTING -t nat -s 192.168.0.11 \=0A		-j SNAT --to-sourc=
e 192.168.1.5 =0A	iptables -D POSTROUTING -t nat -s 192.168.0.2 \=0A		-j SN=
AT --to-source 192.168.1.5 =0A}=0A=0Acase "$1" in=0Astart)=0A	echo "startin=
g cluster configuration for node $NODE."=0A=0A	# just in case that you forg=
et it=0A	echo 1 > /proc/sys/net/ipv4/ip_forward=0A=0A	# disable TCP pickup=
=0A	echo 0 > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal=0A	ec=
ho 0 > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_loose=0A=0A	start_clus=
ter_address=0A	start_nat=0A=0A	# drop new and invalid flows from eth2 (not =
allowed)=0A	iptables -A PREROUTING -t mangle -i eth2 \=0A		-m state --state=
 NEW,INVALID -j DROP=0A=0A	# mark packets that belong to this node (go dire=
ction)=0A	iptables -A PREROUTING -t mangle -i eth1 -m cluster \=0A		--clust=
er-total-nodes $TOTAL_NODES --cluster-local-node $NODE \=0A		--cluster-hash=
-seed $SEED -j MARK --set-mark 0xffff=0A=0A	# mark packet that belong to th=
is node (reply direction)=0A	# note: we *do* need this to change the packet=
 type to PACKET_HOST,=0A	# otherwise the stack silently drops the packet.=
=0A	iptables -A PREROUTING -t mangle -i eth2 -m cluster \=0A		--cluster-tot=
al-nodes $TOTAL_NODES --cluster-local-node $NODE \=0A		--cluster-hash-seed =
$SEED -j MARK --set-mark 0xffff=0A=0A	if [ $LOG_DEBUG -eq 1 ]=0A	then=0A		i=
ptables -A PREROUTING -t mangle -i eth1 -m mark \=0A			--mark 0xffff -j LOG=
 --log-prefix "cluster-accept: "=0A		iptables -A PREROUTING -t mangle -i et=
h1 -m mark \=0A			! --mark 0xffff -j LOG --log-prefix "cluster-drop: "=0A		=
iptables -A PREROUTING -t mangle -i eth2 -m mark \=0A			--mark 0xffff \=0A	=
		-j LOG --log-prefix "cluster-reply-accept: "=0A		iptables -A PREROUTING -=
t mangle -i eth2 -m mark \=0A			! --mark 0xffff \=0A			-j LOG --log-prefix =
"cluster-reply-drop: "=0A	fi=0A=0A	# drop packets that don't belong to us (=
go direction)=0A	iptables -A PREROUTING -t mangle -i eth1 -m mark \=0A		! -=
-mark 0xffff -j DROP=0A=0A	# drop packets that don't belong to us (reply di=
rection)=0A	iptables -A PREROUTING -t mangle -i eth2 -m mark \=0A		! --mark=
 0xffff -j DROP=0A	;;=0Astop)=0A	echo "stopping cluster configuration for n=
ode $NODE."=0A=0A	stop_cluster_address=0A	stop_nat=0A=0A	# drop new and inv=
alid flows from eth2 (not allowed)=0A	iptables -D PREROUTING -t mangle -i e=
th2 \=0A		-m state --state NEW,INVALID -j DROP=0A=0A	iptables -D PREROUTING=
 -t mangle -i eth1 -m cluster \=0A		--cluster-total-nodes $TOTAL_NODES --cl=
uster-local-node $NODE \=0A		--cluster-hash-seed $SEED -j MARK --set-mark 0=
xffff=0A=0A	iptables -D PREROUTING -t mangle -i eth2 -m cluster \=0A		--clu=
ster-total-nodes $TOTAL_NODES --cluster-local-node $NODE \=0A		--cluster-ha=
sh-seed $SEED -j MARK --set-mark 0xffff=0A=0A	if [ $LOG_DEBUG -eq 1 ]=0A	th=
en=0A		iptables -D PREROUTING -t mangle -i eth1 -m mark \=0A			--mark 0xfff=
f -j LOG --log-prefix "cluster-accept: "=0A		iptables -D PREROUTING -t mang=
le -i eth1 -m mark \=0A			! --mark 0xffff -j LOG --log-prefix "cluster-drop=
: "=0A		iptables -D PREROUTING -t mangle -i eth2 -m mark \=0A			--mark 0xff=
ff \=0A			-j LOG --log-prefix "cluster-reply-accept: "=0A		iptables -D PRER=
OUTING -t mangle -i eth2 -m mark \=0A			! --mark 0xffff \=0A			-j LOG --log=
-prefix "cluster-reply-drop: "=0A	fi=0A=0A	iptables -D PREROUTING -t mangle=
 -i eth1 -m mark \=0A		! --mark 0xffff -j DROP=0A=0A	iptables -D PREROUTING=
 -t mangle -i eth2 -m mark \=0A		! --mark 0xffff -j DROP=0A	;;=0A*)=0A	echo=
 "$0 start|stop"=0A	;;=0Aesac=0A
--nVMJ2NtxeReIH9PS--
