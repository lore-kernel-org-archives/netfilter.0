From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: per-user bandwidth limiting on egress of LAN interface - advice
 please
Date: Sat, 12 Nov 2011 20:49:53 -0600
Message-ID: <op.v4u55fw9x1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello All:

A friend asked me to configure an iptables router that should do load-balancing over 4 external interfaces.  I used this simple load-balancing method:

ip route add default scope global nexthop via $P1 dev $IF1 weight 5 nexthop via $P2 dev $IF2 weight 2 ...

My friend provides Internet to about 60 users, expected to increase eventually to perhaps 1000.  Users are typical Internet users: primarily http download with some voip, which must give good performance (low latency).

Both upload and download bandwidth needs to be limited on a per-user basis, with 5 different classes of connection speeds ranging from 1Mbit/s to 6 Mbit/s.  Users are identified by the router by their source (LAN) IP address.

I have this working experimentally, but it is not yet in use by my friend.  It will need more testing, and I am very concerned about buildup of large queues and the resultant latency problems for interactive traffic.  Therefore I ask for advice on how to possibly improve my implementation.  I will briefly describe what I have done.

Since there are multiple external interfaces, I decided that the speed-limiting would have to be done on the internal (egress) side of the LAN interface.  I realize that this is usually done via policing on the ingress of the external interface, but that appeared impossible due to the multiple external interfaces.

So, on egress of the LAN-facing interface I set up a htb qdisc with a child class for each of the 5 download connection speed classes (members of the bash array named "classes").  To limit upload speed I used the ifb0 device (I do not include here the commands to set up the root qdisc, ip masquerading, etc.):

IF0=eth4, the LAN interface
"classes" and "upclasses" are arrays holding a kbit value for each of the 5 bandwidth classes
(excerpt from bash script)
...
for class in 2 5 10 20 30; do
	if [ "$class" = "30" ]; then
	  # special class with high ceiling
	  ceil=$TOTBANDWIDTH
	  upceil=$TOTUPBANDWIDTH
	else
	  ceil=${classes[$class]}
	  upceil=${upclasses[$class]}
	fi
	tc class add dev $IF0 parent 1:1 classid 1:$class htb rate ${classes[$class]}kbit ceil ${ceil}kbit
	tc qdisc add dev $IF0 parent 1:$class handle $class: prio
	tc qdisc add dev $IF0 parent $class:1 sfq perturb 10 limit 3000
	tc qdisc add dev $IF0 parent $class:2 sfq perturb 10
	tc qdisc add dev $IF0 parent $class:3 sfq perturb 10
	tc filter add dev $IF0 protocol ip parent $class: prio 1 u32 match ip dport 5060 0xffff flowid $class:1
	tc filter add dev $IF0 protocol ip parent $class: prio 1 u32 match ip sport 5060 0xffff flowid $class:1
	# DNS, SSH, and Telnet
	tc filter add dev $IF0 protocol ip parent $class: prio 1 u32 match ip sport 53 0xffff flowid $class:1
	tc filter add dev $IF0 protocol ip parent $class: prio 1 u32 match ip sport 22 0xffff flowid $class:1
	tc filter add dev $IF0 protocol ip parent $class: prio 1 u32 match ip sport 23 0xffff flowid $class:1

	tc class add dev ifb0 parent 1:1 classid 1:$class htb rate ${upclasses[$class]}kbit ceil ${upceil}kbit
	tc qdisc add dev ifb0 parent 1:$class handle $class: prio
	tc qdisc add dev ifb0 parent $class:1 sfq perturb 10 limit 3000
	tc qdisc add dev ifb0 parent $class:2 sfq perturb 10
	tc qdisc add dev ifb0 parent $class:3 sfq perturb 10
	# voip sip
	tc filter add dev ifb0 protocol ip parent $class: prio 1 u32 match ip dport 5060 0xffff flowid $class:1
	tc filter add dev ifb0 protocol ip parent $class: prio 1 u32 match ip sport 5060 0xffff flowid $class:1
	# DNS, SSH, and Telnet
	tc filter add dev ifb0 protocol ip parent $class: prio 1 u32 match ip sport 53 0xffff flowid $class:1
	tc filter add dev ifb0 protocol ip parent $class: prio 1 u32 match ip sport 22 0xffff flowid $class:1
	tc filter add dev ifb0 protocol ip parent $class: prio 1 u32 match ip sport 23 0xffff flowid $class:1
done
...

Hash table lookup filters for each user IP, based on the last byte of the IP, are created from a data file containing 3 data fields per line: <ip> <download class> <upload class>:

(excerpt from bash script)
...
# filter root
tc filter add dev $IF0 parent 1:0 prio 5 protocol ip u32
tc filter add dev ifb0 parent 1:0 prio 5 protocol ip u32

for subnet in ${subnets[@]}; do
   tc filter add dev $IF0 parent 1:1 prio 5 handle $subnet: protocol ip u32 divisor 256
   tc filter add dev $IF0 protocol ip parent 1:1 prio 5 u32 ht 800:$hexlastip: match ip dst 192.168.$subnet.0/24 hashkey mask 0x000000ff at 16 link $subnet:

   tc filter add dev ifb0 parent 1:1 prio 5 handle $subnet: protocol ip u32 divisor 256
   tc filter add dev ifb0 protocol ip parent 1:1 prio 5 u32 ht 800:$hexlastip: match ip src 192.168.$subnet.0/24 hashkey mask 0x000000ff at 12 link $subnet:
done

{
while read line; do
   set -- $line
   # $1, $2 and $3 are now set to values in $line
   ip=$1
   dclass=$2
   uclass=$3
   subnet=`echo "$ip" | cut -d . -f 3`
   lastip=`echo "$ip" | cut -d . -f 4`
   hexlastip=`printf '%x' $lastip`
   tc filter add dev $IF0 parent 1:1 protocol ip prio 5 u32 ht $subnet:$hexlastip: match ip dst 0.0.0.0/0 flowid 1:$dclass
   tc filter add dev ifb0 parent 1:1 protocol ip prio 5 u32 ht $subnet:$hexlastip: match ip src 0.0.0.0/0 flowid 1:$uclass
   echo "ip $ip is limited to download class $dclass and upload class $uclass"
done
} < $ipfile
# ipfile=/home/lloyd/myips

tc filter add dev $IF0 parent ffff: protocol ip prio 5 u32 match ip dst 0.0.0.0/0 flowid :1 \
   action mirred egress redirect dev ifb0
...

In my initial single-user tests, bandwidth is limited correctly, traffic is load-balanced, and traffic shaping looks OK (I used "tc qdisc show dev <dev>" to check traffic shaping of packets.)

QUESTIONS
1. Can the queuing to be expected for both download and upload traffic probably be made acceptable by traffic shaping with prio filters, as I did above for port 5060 traffic?
2. Should the ingress queuing discipline (ingress of LAN interface) best be changed to police (drop excess packets) rather than the present htb + prio + sfq?
3. If there is a better way to accomplish per-user bandwidth limiting with load-balancing over multiple external interfaces, please suggest it to me.
(I am very new to iptables/netfilter.  This is my first router configuration. Any suggestions greatly appreciated.)

-- 
Lloyd Standish
