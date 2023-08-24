From: Pierre-Philipp Braun <pbraun@nethence.com>
Subject: Re: failing fail-over - commit still in progress
Date: Thu, 24 Aug 2023 12:59:47 +0300
Message-ID: <0865d2fb-8720-efd8-39a1-61e22ae9acca@nethence.com>
References: <910b44e4-06e8-19d6-45f0-06f886a2e812@nethence.com>
 <ZNYTF+uCod++Htl9@calendula>
 <df659821-cee6-9702-e259-9db8cf290316@nethence.com>
 <ZNf013cGy81TcxoN@calendula>
 <18a0e2b8-dc7c-b9c6-77a7-8cfbe5fddb68@nethence.com>
 <ZOMtqtvQLZE38sfm@calendula>
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nethence.com;
        s=aug2022; t=1692871190;
        bh=iWQ0d9yl+JoOS4eBHKp8F8Yoz0kAsDtLCalaY7dCQfE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=cZvoLVz6BK/GK7UtufGUZcpbgJSLcP4Xwcix+3v/au+LTA632kUeYySqUPFy/lH9z
         DQGhDLUHghNtlvKM4xZVVqMAJSM7G21OV6D6bkB3Ox91jQ1ixnwCyAKcAV/a8VS/Mc
         lToyk0WqFr91HQXrVC013nr9YN406RpVSTQBUmVqtySTP9B8wSvNUwPBCZXsXTj9kP
         oSA9ci6ihXmL8bSDMMbqNFtqKZdEz69q36j7860vdko3JE99WKG3AY6GW70QiewPpe
         JFgbDpzeSVDjESPjDLw/Gy4aUAt2pmVxf69BoTlCtYGMbXb4KIXwVyLWdituDcF6IP
         T+g/RFHulQ2aA==
Content-Language: en-US, fr
In-Reply-To: <ZOMtqtvQLZE38sfm@calendula>
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On 8/21/23 12:26, Pablo Neira Ayuso wrote:
> As I said before, you have to have a stateful ruleset which does not
> pick up states from the middle.

I am now filtering both interfaces, the front-facing and the internal one, on the FORWARD chain.

table inet filter {
         chain input {
                 type filter hook input priority filter; policy accept;
         }

         chain forward {
                 type filter hook forward priority filter; policy drop;
                 ip protocol icmp accept
                 ct state invalid log prefix "INVALID: " drop
                 ct state established,related,new accept
                 log prefix "DROP POLICY: "
         }

         chain output {
                 type filter hook output priority filter; policy accept;
         }
}
table ip nat {
         chain postrouting {
                 type nat hook postrouting priority srcnat; policy accept;
                 ip saddr 10.1.0.0/16 oif "eth0" snat to 217.19.208.157
         }

         chain prerouting {
                 type nat hook prerouting priority dstnat; policy accept;
                 iif "eth0" tcp dport 50 dnat to 10.1.0.50:22
         }
}

However it looks like I am still tracking in the middle.

> nftables is completely irrelevant in this picture. State
> synchronization relies on ctnetlink and userspace conntrackd for state
> synchronization. nftables is only the packet classification framework.

I was just wondering if I absolutely had to use the iptables example from the testcase sample.
I notice that example has additional SYN flag.
Basically I am doing things the other way around, DNAT instead of SNAT.

> Rule of thumb is: You have disable nf_conntrack_tcp_loose from
> conntrack and a stateful ruleset which drops packets that are in
> invalid state.

tcp_loose is zero and as for the stateful ruleset, I am still not sure.

> Otherwise, state synchronization does not make sense because conntrack
> can pick connections from the middle, ie. you can implement "poor man"
> failover and let conntrack recover the history from the middle.

This seems to be what is happening (correct me if I am wrong).  I sometimes manage to successfully fail-over after checking carefully that things are in order, namely that the state is there on internal and external cache respectively.  Anyhow the commit error remains.

> Can you see events on the active node with `conntrack -E`?

No, and I have to restart conntrackd to actually be able to see the states (I guess thanks to `StartupResync on`).

> Did you debug with tcpdump on both ends to check to see if conntrackd
> delivers the synchronization messages?

Yes I noticed an UDP datagram that is larger than the other ones.

> What do conntrackd stats tell you? There is a good number of options
> that allow you debug your setup.

right after a successful fail-over

root@vrrp1:~# conntrackd -s
cache internal:
current active connections:                2
connections created:                       4    failed:            0
connections updated:                       0    failed:            0
connections destroyed:                     2    failed:            0

cache external:
current active connections:                2
connections created:                       4    failed:            0
connections updated:                       0    failed:            0
connections destroyed:                     2    failed:            0

traffic processed:
                    0 Bytes                         0 Pckts

UDP traffic (active device=eth2):
                 8384 Bytes sent                 8216 Bytes recv
                  499 Pckts sent                  498 Pckts recv
                    0 Error send                    0 Error recv

message tracking:
                    0 Malformed msgs                    0 Lost msgs

root@vrrp2:~# conntrackd -s
cache internal:
current active connections:                2
connections created:                       2    failed:            0
connections updated:                       0    failed:            0
connections destroyed:                     0    failed:            0

cache external:
current active connections:                2
connections created:                       6    failed:            0
connections updated:                       0    failed:            0
connections destroyed:                     4    failed:            0

traffic processed:
                    0 Bytes                         0 Pckts

UDP traffic (active device=eth2):
                 8552 Bytes sent                 8704 Bytes recv
                  519 Pckts sent                  519 Pckts recv
                    0 Error send                    0 Error recv

message tracking:
                    0 Malformed msgs                    0 Lost msgs

but the commit error is always there in the logs.
