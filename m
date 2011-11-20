From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: htb + prio trouble
Date: Sun, 20 Nov 2011 14:46:16 -0600
Message-ID: <op.v49inevvx1lyi3@debiandesk2.net>
References: <op.v49c0wstx1lyi3@debiandesk2.net>
 <1321817770.2382.996.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1321817770.2382.996.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: netfilter@vger.kernel.org

<snip>
>> While configuring a load-balancing router, I have run into trouble
>>  setting up traffic shaping (at least the load-balancing is working!)
>>
>> I am trying to:
>> (1) limit total upload speed to somewhat below the interface bandwidth
>> (2) do some traffic shaping, particularly avoid queuing of VOIP packets.
>>
>> To accomplish this I am trying to create a HTB qdisc on each
>>  outward-facing interface, each containing a PRIO qdisc with the
>>  default 3 classes.  sfq qdiscs are created for each PRIO class.
>>
>> Commands to set up qdiscs and filters for outward-facing interface eth0:
>>
>> + tc qdisc del dev eth0 root handle 1
>> + tc qdisc del dev eth0 ingress
>> + tc qdisc add dev eth0 root handle 1:0 htb
>> + tc class add dev eth0 parent 1:0 classid 1:1 htb rate 3200kbit ceil 3200kbit
>> + tc qdisc add dev eth0 parent 1:1 handle 2: prio
>> + tc qdisc add dev eth0 parent 2:1 handle 10: sfq perturb 10 limit 3000
>> + tc qdisc add dev eth0 parent 2:2 handle 20: sfq perturb 10
>> + tc qdisc add dev eth0 parent 2:3 handle 30: sfq perturb 10
>> + tc filter add dev eth0 protocol ip parent 2: prio 1 u32 match ip dport 5060 0xffff flowid 2:1
>> + tc filter add dev eth0 protocol ip parent 2: prio 1 u32 match ip sport 5060 0xffff flowid 2:1
>> + tc filter add dev eth0 protocol ip parent 2: prio 1 u32 match ip dport 53 0xffff flowid 2:1
>> + tc filter add dev eth0 protocol ip parent 2: prio 1 u32 match ip dport 80 0xffff flowid 2:1
>
> I don't think you're filtering correctly. You've attached the filter to
> the prio qdisc, which is below the htb qdisc. Therefore it won't see any
> traffic, as there is no filter to send traffic into the prio qdisc
> itself. In fact, there is no filter at all for the htb qdisc, hence the
> reason you are seeing traffic in it but nowhere else.
>
> The filter needs to sit the level above in order to filter into classes
> below it, so you'll need to do something like
>
> tc filter add dev eth0 protocol ip parent 1:0 prio 1 \
> 	u32 match ip dport 80 0xffff flowid 2:1
>
> You may also need to change the flowid (I've never played with the prio
> qdisc)

Thanks for your insight.  I didn't realize that only the root qdisc receives traffic automatically.  Any subclasses need to receive traffic via a filter, or via the "default" selector.  I added "default" as follows:

tc qdisc add dev ${!interface} root handle 1:0 htb default 1

I left the filters as-is, and all appears to work.  I see port 80 traffic going through prio band 1.  (I can remove that test filter now.):

root@debiandesk2:/home/lloyd/data/traffic_shaping# tc -s qdisc ls dev eth0
qdisc htb 1: root refcnt 2 r2q 10 default 1 direct_packets_stat 0
  Sent 14082 bytes 88 pkt (dropped 0, overlimits 0 requeues 0)
  rate 0bit 0pps backlog 0b 0p requeues 0
qdisc prio 2: parent 1:1 bands 3 priomap  1 2 2 2 1 2 0 0 1 1 1 1 1 1 1 1
  Sent 14082 bytes 88 pkt (dropped 0, overlimits 0 requeues 0)
  rate 0bit 0pps backlog 0b 0p requeues 0
qdisc sfq 10: parent 2:1 limit 127p quantum 1514b perturb 10sec
  Sent 13115 bytes 79 pkt (dropped 0, overlimits 0 requeues 0)
  rate 0bit 0pps backlog 0b 0p requeues 0
qdisc sfq 20: parent 2:2 limit 127p quantum 1514b perturb 10sec
  Sent 967 bytes 9 pkt (dropped 0, overlimits 0 requeues 0)
  rate 0bit 0pps backlog 0b 0p requeues 0
qdisc sfq 30: parent 2:3 limit 127p quantum 1514b perturb 10sec
  Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
  rate 0bit 0pps backlog 0b 0p requeues 0
qdisc ingress ffff: parent ffff:fff1 ----------------
  Sent 40237 bytes 79 pkt (dropped 0, overlimits 0 requeues 0)
  rate 0bit 0pps backlog 0b 0p requeues 0

--
Lloyd
