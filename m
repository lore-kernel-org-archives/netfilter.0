From: Karel Rericha <karel@maxent.cz>
Subject: Re: downlink marked packets dont go to qdisc, uplink ok
Date: Wed, 15 Dec 2004 16:55:54 +0100
Message-ID: <41C05E8A.3020809@maxent.cz>
References: <41B97CCE.2060904@maxent.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41B97CCE.2060904@maxent.cz>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi list, maybe I wasn't clear enough last time :-)

I'm offering 4 bottles of superb beer for first working solution with 
free shipping ofcourse.

Any contestants ?

Karel Rericha napsal(a):

> Short:**********************************************************
>
> On Mandrake 10.0 router with htb shaping I have to use U32 classifier 
> for inserting
> packets to downlink qdiscs, because marking packets only work for 
> uplink qdiscs.
> Downlink packets are properly market, but always reach only default 
> class without
> U32. Why?
>
>
> Detail:**********************************************************
>
> kernel: 2.6.3-19mdk
> iptables: stock 1.2.9
> external network: 172.16.0.0/24
> local network: 10.0.0.0/8
> NAT+Shorewall firewall used
> external interface: eth1 10/100
> local interface: br0 (eth0 and wlan0 bridged, wlan0 is hostap 0.2.5)
>
>
> I have two chains, MARKOUT and MARKIN. MARKOUT is targetted in PREROUTING
> and MARKIN is targetted in POSTROUTING. They are marking packets by 
> src or dst
> local IP. Command
>
> iptables -t mangle  -L  -v
>
> shows that packets in both chains are properly marked. But
>
> tc -s qdisc ls dev br0
> tc -s class ls dev br0
>
> shows only traffic in default class, if I use only classifying by 
> handle and not U32.
> Uplink lists
>
> tc -s qdisc ls dev eth0
> tc -s class ls dev eth0
>
> shows that all traffic is where it should be with classifying by handle.
>
> Commands:********************************************************
>
> # prepare uplink chain for marking packets
> iptables -t mangle -D PREROUTING -j MARK_OUT
> iptables -t mangle -F MARK_OUT
> iptables -t mangle -X MARK_OUT
> iptables -t mangle -N MARK_OUT
> iptables -t mangle -A PREROUTING -j MARK_OUT
>
> # prepare downlink chain for marking packets
> iptables -t mangle -D POSTROUTING -j MARK_IN
> iptables -t mangle -F MARK_IN
> iptables -t mangle -X MARK_IN
> iptables -t mangle -N MARK_IN
> iptables -t mangle -A POSTROUTING -j MARK_IN
>
> # new uplink root
> tc qdisc del dev eth1 root handle 2: >/dev/null
> tc qdisc add dev eth1 root handle 2: htb default 100 r2q 5
> # shaping root class
> tc class add dev eth1 parent 2: classid 2:1 htb rate 752kbit burst 2k
>
> #new downlink root
> tc qdisc del dev br0 root handle 1: >/dev/null
> tc qdisc add dev br0 root handle 1: htb default 100 r2q 5
> #shaping root class
> tc class add dev br0 parent 1: classid 1:1 htb rate 752kbit burst 2k
>
> #default class
> tc class add dev br0 parent 1:1 classid 1:100 htb rate 8kbit ceil 
> 512kbit burst 2k prio 300
> tc qdisc add dev br0 parent 1:100 handle 100: sfq perturb 10
> tc class add dev eth1 parent 2:1 classid 2:100 htb rate 8kbit ceil 
> 512kbit burst 2k prio 300
> tc qdisc add dev eth1 parent 2:100 handle 100: sfq perturb 10
> tc filter add dev eth1 protocol ip parent 2:0 prio 1 handle 100 fw 
> flowid 2:100
>
> ... snip ...
>
> ########## client example with U32 - this is runs as it should, but I 
> have to use U32 for downlink
> tc class add dev br0 parent 1:1 classid 1:105 htb rate 16kbit ceil 
> 128kbit burst 2k prio 100
> tc qdisc add dev br0 parent 1:105 handle 105: sfq perturb 10
> tc class add dev eth1 parent 2:1 classid 2:105 htb rate 16kbit ceil 
> 128kbit burst 2k prio 100
> tc qdisc add dev eth1 parent 2:105 handle 105: sfq perturb 10
> tc filter add dev eth1 protocol ip parent 2:0 prio 1 handle 105 fw 
> flowid 2:105
>
> iptables -t mangle -A MARK_IN --out-interface br0 --destination 
> 10.1.1.5 -j MARK --set-mark 105
> iptables -t mangle -A MARK_IN --out-interface br0 --destination 
> 10.1.1.5 -j RETURN
> tc filter add dev br0 protocol ip parent 1:0 prio 1 u32 match ip dst 
> 10.1.1.5 flowid 1:105
> iptables -t mangle -A MARK_OUT --in-interface br0 --source 10.1.1.5 -j 
> MARK --set-mark 105
> iptables -t mangle -A MARK_OUT --in-interface br0 --source 10.1.1.5 -j 
> RETURN
>
> OR
>
> ########## !!! SAME !!! client without U32 - uplink shapes fine, but 
> why the hell all the downlink traffic ends in default class 
> !!!!!!!!!!!!!!
> tc class add dev br0 parent 1:1 classid 1:105 htb rate 16kbit ceil 
> 128kbit burst 2k prio 100
> tc qdisc add dev br0 parent 1:105 handle 105: sfq perturb 10
> tc filter add dev br0 protocol ip parent 1:0 prio 1 handle 105 fw 
> flowid 1:105
> tc class add dev eth1 parent 2:1 classid 2:105 htb rate 16kbit ceil 
> 128kbit burst 2k prio 100
> tc qdisc add dev eth1 parent 2:105 handle 105: sfq perturb 10
> tc filter add dev eth1 protocol ip parent 2:0 prio 1 handle 105 fw 
> flowid 2:105
>
> iptables -t mangle -A MARK_IN --out-interface br0 --destination 
> 10.1.1.5 -j MARK --set-mark 105
> iptables -t mangle -A MARK_IN --out-interface br0 --destination 
> 10.1.1.5 -j RETURN
> iptables -t mangle -A MARK_OUT --in-interface br0 --source 10.1.1.5 -j 
> MARK --set-mark 105
> iptables -t mangle -A MARK_OUT --in-interface br0 --source 10.1.1.5 -j 
> RETURN
>
> Award:*********************************************************
>
> I'm working on it for few weeks now, tried every possible solution 
> which I could find. But nothing
> helped. Packets are marked fine, but never reach its class for 
> downlink. U32 is fine, but I need
> marking for some reason.
>
> I'm offering 4 bottles of Prazdroj (http://www.pilsner-urquell.com/ , 
> Pilsner Urquell - first beer of its type,
> most of modern beers are named by it "pilsner", and by the way, the 
> best of all), from the beer country,
> Czech Republic, where no one match our 160+ litres of beer per man 
> per  year (but I must say Germany
> holds strong second place), to first working solution. Worldwide 
> shipping free :-)
>
>
>
>



-- 
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.296 / Virus Database: 265.5.2 - Release Date: 13.12.2004



