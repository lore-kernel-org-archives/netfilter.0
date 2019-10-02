From: Richard Stanway <r1ch@teamliquid.net>
Subject: nft: auto-merge set doesn't merge overlapping intervals
Date: Wed, 2 Oct 2019 12:17:49 +0200
Message-ID: <CAKWQeyhnQJPoveHKFNBPHosict1v-fAOGoHHVt3_ksv74qNEig@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teamliquid.net; s=g2;
        h=mime-version:from:date:message-id:subject:to;
        bh=KCjF0y2K7UGMls/jFKx1Nijde3RgpEDh6IfyaMhfH48=;
        b=pasKJ1gXl0a+1veuzwb0ZK2yg4DD860FD0JVJBzAFO55qgZdAAUuxjc4Qu3PeizHVW
         Ld7W4gSvhMYHDk52QIkHqE+0ZeYoaCbNBf1pBX2RJVWfbB1wCOx4wQXefhUmzGQYW5my
         PEFlxhJR5/x+M3NbPX0Bq8Q/4PtQNUlJUzKjBh6jEVGSvm2qYat32PJ+G2SUhVZLqDzg
         YzanXLPG2OUT93RBVjgRwSfFUloXYDKgRA5WahtwMaFXzQ5wfnjMaW/2TyYfXZTWeBxM
         0uyvDAIuH3cJo8s7MBHKANXixMlakiYJ5erIYhWC/BK37S8VQwWb6Z2kEwEecRDPsCGo
         WqdQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,
I'm making the transition from iptables to nftables and running into
an issue moving from ipset to native nftables sets. I've created a set
with an interval and the auto-merge flag, however when adding an
address with a mask that happens to cover an existing entry in the
set, the command gives an error instead of merging the two as I
expected. Example output:

# nft -v
nftables v0.9.2 (Scram)

# nft add set ip filter blackhole "{ type ipv4_addr; flags interval;
auto-merge }"

# nft list set ip filter blackhole
table ip filter {
        set blackhole {
                type ipv4_addr
                flags interval
                auto-merge
        }
}
# nft add element ip filter blackhole { 10.0.0.1, }

# nft add element ip filter blackhole { 10.0.0.0/8, }
Error: interval overlaps with an existing one
add element filter blackhole { 10.0.0.0/8, }
                               ^^^^^^^^^^
Error: Could not process rule: File exists
add element filter blackhole { 10.0.0.0/8, }
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Am I misunderstanding how auto-merge works or is this a bug?
