From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd working, but netfilter not impressed
Date: Wed, 13 Aug 2008 17:51:04 +0200
Message-ID: <48A302E8.5060308@netfilter.org>
References: <BD9F23BEBBF883939AE367D6@Dirks-MacBook-Pro.local> <200808111322.58469.misch@multinet.de> <0F0E3430135185A207EFA41A@Dirks-MacBook-Pro.local> <48A176A2.6000301@netfilter.org> <D8E6FEE44BB41502649A12A2@file.wkd-druck.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <D8E6FEE44BB41502649A12A2@file.wkd-druck.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Dirk H. Schulz" <dirk.schulz@kinzesberg.de>
Cc: netfilter@vger.kernel.org

Hi Dirk,

Dirk H. Schulz wrote:
> --On 12. August 2008 13:40:18 +0200 Pablo Neira Ayuso
> <pablo@netfilter.org> wrote:
> 
> - snip -
>> The CacheWriteThrough clause should do that for you but with some
>> important considerations: higher CPU consumption and possible race
>> conditions - the time to transmit the state to the other firewall
>> replica should be smaller than the RTT between the firewall and the
>> end-peer.
> 
> That is why I tested with a long stream of pings and long consecutive
> http requests. The result was not better.

ICMP request/replies are a bad test since, as for now, there's one ICMP
event per packet. Give a run to `conntrack -E -p icmp' and you'll notice.

For TCP connections, you should notice that *some packets* hit invalid.
I don't have the OSPF setup but I'm emulating a multi-primary with
asymmetric routing in my testbed [1] by means of:

ip ro add 192.168.1.0/24 nexthop via 192.168.0.3 dev eth1 weight 1
nexthop via 192.168.0.4 dev eth1 weight 1

in the client A, so that it sends a packet to FW(A) and FW(B) in a
round-robin basis. It's simple but I think that's enough for testing.
Probably, setting up OSPF may be better, I'd appreciate if you can
detail me a more realistic scenario (in private, if you want).

Note that in my asymmetric routing testbed the assumption: "RTT(firewall
to peer) > time to transmit the state-change" does not fulfill. Thus, we
have races due to the asynchronous nature of conntrackd. Making this
whole thing synchronous does not seem feasible as it would incur
performance and latency drops.

In my testbed, if I create a HTTP connection, the TCP ACK packets to
finish the hand-shake between the client and the server sometimes hit
invalid, thus we lost race and the client has to re-send the packet
after the drop, this result is a slow-down in the TCP connection setup.

You can notice the packet drop as invalid by enabling connection
tracking log message reporting to verify this:

echo 255 > /proc/sys/net/ipv4/netfilter/ip_conntrack_log_invalid

The log should say something like, nf_ct_tcp: invalid state.

BTW, I'm testing with current conntrack-tools git snapshot, just in case
that you're hitting any already resolved bug or observing a different
problem.

>> This is generally true if your firewall is connected to a DSL
>> line or whatever that inherently inserts some latency in the
>> communications.
> 
> In this case it is 100 MBit uplinks with very low latency.

Then, the assumption: RTT(firewall to peer) > time to transmit the
state-change, does not fulfill.

>> Anyhow, the multi-primary setup with asynchronous routing is really bad
>> design for stateful firewalls. The key problem is that stateful
>> firewalling works with at flow-level and OSPF only knows about packets.
>> The preferred way to go should be the multi-primary with symmetric
>> routing
> 
> I am not sure if this can be achieved with OSPF - there is many
> differing posts on that out there but I also have an intensive look at
> that, of course.

Nor me. I don't know any at the moment for this setup - and I did not
have time to check that yet, my current priorities fixing a couple of
reported bugs in the userspace and kernel code, finish the documentation
and the multi-primary with symmetric routing that is based on hashing.
So please, if you find any, let me know.

In short, this scenario is not recommended. It does not exploit the
design of conntrackd and I even think that it somehow goes against the
design of stateful firewalls.

[1] http://conntrack-tools.netfilter.org/testcase.html

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
