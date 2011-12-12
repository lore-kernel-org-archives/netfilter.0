From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: prio + policing filter on ingress?
Date: Mon, 12 Dec 2011 09:27:03 -0600
Message-ID: <op.v6dujdvsx1lyi3@debiandesk2.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: netfilter@vger.kernel.org

Hello All,

I would like to police traffic (bandwidth-limit with drop) on ingress of an outward-facing interface, but I would also like to make sure that inbound traffic destined for a certain IP is dropped *before* traffic to the other IPs.  I think I can do this by combining a prio qdisc with a policing filter via ifb.  I have never seen an example of this; I don't know whether or not it's possible.

All I have so far is the ingress prio qdisc.  I don't know how to add the policing filter to it.  (I wonder if I would have to add a policing filter to each of the prio's bands.  In that case I could not limit the total bandwidth of the interface.)

eth0 is the inbound interface.

tc qdisc add dev eth0 ingress
tc qdisc add dev ifb0 root handle 1: prio default 1
tc qdisc add dev ifb0 parent 1:1 sfq perturb 10 limit 3000
tc qdisc add dev ifb0 parent 1:2 sfq perturb 10
tc qdisc add dev ifb0 parent 1:3 sfq perturb 10

# filters to put packets in different prio bands, only 2 are shown.

# DNS
tc filter add dev ifb0 protocol ip parent 1: prio 1 u32 match ip sport 53 0xffff flowid 1:1
# http
tc filter add dev ifb0 protocol ip parent 1: prio 3 u32 match ip sport 80 0xffff flowid 1:2

# put traffic to LAN IP 192.168.0.5 in the lowest priority prio band
tc filter add dev ifb0 parent 1: protocol ip prio 2 u32 match ip dst 192.168.0.5 flowid 1:3

# all unfiltered traffic goes to prio band 2
tc filter add dev ifb0 parent 1: protocol ip prio 4 u32 match ip dst 0.0.0.0/0 flowid 1:2

#
## how to add a policing filter to limit the bandwidth of the entire interface, and drop extra bandwidth from prio band 3 first?
#
tc filter add dev eth0 parent ffff: protocol ip prio 1 u32 match ip dst 0.0.0.0/0 flowid :1 \
   action mirred egress redirect dev ifb0

Thanks in advance for any help.
-- 
Lloyd
