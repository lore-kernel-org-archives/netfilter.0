From: yves baumes <ybaumes@gmail.com>
Subject: Consolidating rules
Date: Wed, 29 Dec 2021 15:09:05 +0100
Message-ID: <CAF1QswjecENZyrGsCtot4dH1xPmDKyG6csk00O7+A6stPP_Lrg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=6+LJr6ejBIu0+QRll3oB5kOmkj/MkydvR8Cmd9emWXM=;
        b=H3fLy966F/LgSR23QeJRU0l4sf5GRnpktbCS1Tzij1aDhjfkuNnJCJjxAn6pna4s2d
         JO8GCwOy1OaEHCQecubeUUyMk3khF3ZgMyYR1FdFZFfqC59/N4+Y/SrK7rvRY1NtZ72A
         O4KNKo5068KMtxpJF+Ph84cu2RSEQSIHJ65M6mKk4/eKQ1sY/QGt8HvUhCD0lw3z+ldq
         th+kp5xYHmAiBXwicUf+4AUoN8ECMaPyA+0qq+7CdVZKqxc6ZR/ItHpb8TDvhQqBT6EA
         ZQnbNPbKLWgdfAjvqNrk04pYv5jLSIPYL49iSOnywyWGL/BQ9OEW5kzcfH7KREK6jIPO
         5ZpA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello everyone,

I'm using :
```
# iptables -V
iptables v1.8.7 (nf_tables)
```

The machine I'm working on already has a lot of iptables rules
attached to it. The default policies are "DROP":
```
# iptables -t filter -L
Chain INPUT (policy DROP)
target     prot opt source               destination
[...]

```

Here is my problem: when I create a table to let DHCP and DNS requests
pass through, my packets are still getting dropped.
```
# nft list ruleset
table inet mytable {
chain inbound {
ip protocol . th dport vmap { tcp . 22 : accept, tcp . 53 : accept,
udp . 53 : accept, udp . 67 : accept }
}

chain ssh_inbound {
tcp dport 22 accept
}

chain input {
type filter hook input priority filter - 1; policy drop;
ct state vmap { invalid : drop, established : accept, related : accept }
iifname vmap { "eth2" : jump inbound, "eth2.103" : jump inbound,
"eth2.3163" : jump inbound }
iifname vmap { "eth0" : jump ssh_inbound }
iifname "lo" accept
iifname "tun0" tcp dport 22 accept
}
[...]
```

So I read about that issue in the wiki:
https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains#Base_chain_priority
. Which states that the default filter/INPUT chain will be run either
before or after my own chain (depending on the priority I set) and
will drop the packets silently, since its default policy is DROP and
no rules match the packets in this filter/INPUT chain.
Indeed if I change the default policy of filter/INPUT to ACCEPT, my
DHCP/DNS packets are getting accepted.

So this is the first solution to my issue. But it is not really
satisfactory because my default policy lets *all* packets go through.
Indeed we changed the default policy, so it looks only like a
workaround.

Second solution would be to let the default filter/INPUT policy to
DROP and centralize my configuration into the filter/INPUT chain,
(which means removing the table 'mytable'). I think it's better than
the first solution, but still not satisfactory since I am creating a
big blob containing all my rules (that is the filter/INPUT chain). I
like the idea to distribute my rules in separate chains/tables.

So how would you tackle this issue, that is: letting the packets go
through while still having a default policy to DROP? Is there a
simpler way that I did not find?

Regards
Yves
