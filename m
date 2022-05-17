From: =?iso-8859-2?Q?Kamil_Jo=F1ca?= <kjonca@op.pl>
Subject: Re: nftables: priority handling for changes on the same table
Date: Tue, 17 May 2022 17:07:49 +0200
Message-ID: <874k1ojiyi.fsf@alfa.kjonca>
References: <637fd485a9de3e0f8dc9f1fbada3701c@dev.tdt.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=op.pl; s=2011;
        t=1652800071; bh=kgs2xtM+BbKx8gjtaX64c9mu3V0PFir93L/7dq53kIU=;
        h=From:To:Subject:References:Date:In-Reply-To:From;
        b=YNDqtBgvdXWlljoiHZhtHLszxsknz5emFJ0G0OT4nSjXQv1587tTkmB4I1UXQBuhP
         4CFn7ctLfIGV+NrfKE2hqsZ2VzQwLFO3LJqh8Px5BK89V4jxyQGza0g7lXCetaDr8h
         CpD64IU0Dp8/NHfiETitsytWYymlU9P5bySJ66hI=
In-Reply-To: <637fd485a9de3e0f8dc9f1fbada3701c@dev.tdt.de> (Florian Eckert's
        message of "Tue, 17 May 2022 16:22:29 +0200")
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Florian Eckert <fe@dev.tdt.de> writes:


>
> Not working:
> root@G3-10483 ~ # nft list ruleset
> table inet fw4 {
>     ...
>     chain strongswan_filter_pre_forward {
>         type filter hook forward priority filter - 2; policy accept;
>         iifname "eth0" meta ipsec exists ipsec in reqid 1 ip saddr
>         192.168.17.0/24 ip daddr 192.168.99.0/24 accept
>         oifname "eth0" meta ipsec exists ipsec out reqid 1 ip saddr
>         192.168.99.0/24 ip daddr 192.168.17.0/24 accept
>     }
>     ...
>     chain forward {
>         type filter hook forward priority filter; policy drop;
>         ct state established,related accept comment "!fw4: Allow
>         forwarded established and related flows"
>         iifname "eth1" jump forward_lan comment "!fw4: Handle lan
>         IPv4/IPv6 forward traffic"
>         iifname "eth0" jump forward_wan comment "!fw4: Handle wan
>         IPv4/IPv6 forward traffic"
>         jump handle_reject
>     }
>     ...
> }
> Working:
> root@G3-10483 ~ # nft list ruleset
> table inet fw4 {
>     ...
>     chain forward {
>         type filter hook forward priority filter; policy drop;
>         iifname "eth0" meta ipsec exists ipsec in reqid 1 ip saddr
>         192.168.17.0/24 ip daddr 192.168.99.0/24 accept
>         oifname "eth0" meta ipsec exists ipsec out reqid 1 ip saddr
>         192.168.99.0/24 ip daddr 192.168.17.0/24 accept
>         ct state established,related accept comment "!fw4: Allow
>         forwarded established and related flows"
>         iifname "eth1" jump forward_lan comment "!fw4: Handle lan
>         IPv4/IPv6 forward traffic"
>         iifname "eth0" jump forward_wan comment "!fw4: Handle wan
>         IPv4/IPv6 forward traffic"
>         jump handle_reject
>     }
>     ...
> }
>
> I have specially lowered the 'priority' of the chain
> "strongswan_filter_pre_forward" by two so that it runs before the 
> 'forward' chain.
>
> Is it possible that my approach is wrong and it doesn't work like
> this? I have not found anything in the documentation about that.

Correct me if I am wrong but but "accept" in
strongswan_filter_pre_forward causes pass packet to normal forward
chain (where packet is dropped I believe)

If you want to keep "multpile chain" approach then I think the best way
is to "mark" packet (instead of "accept") in
strongswan_filter_pre_forward  and then in "forward"chain
- accept marked packets.


You can also wait for next release
(https://marc.info/?l=netfilter&m=165031449504497&w=2)
this release should have more set/map/vmap possiblities
and then should be possible to use something like (I know that this is
not the best example, but I am olso in migration process)

--8<---------------cut here---------------start------------->8---
add chain ip filter ipsec-fw-${PLUTO_REQID} \;\
add rule ip filter ipsec-fw-${PLUTO_REQID} iif ${PLUTO_INTERFACE} ipsec in reqid ${PLUTO_REQID}  ip saddr ${PLUTO_PEER_CLIENT} ip daddr ${PLUTO_MY_CLIENT} accept \;\
add rule ip filter ipsec-fw-${PLUTO_REQID} oif ${PLUTO_INTERFACE} ipsec out reqid ${PLUTO_REQID}  ip saddr ${PLUTO_MY_CLIENT} ip daddr ${PLUTO_PEER_CLIENT} accept \;\
add element ip filter ipsec_fw '{' ${PLUTO_REQID}  : jump ipsec-fw-${PLUTO_REQID} '}'\;\
--8<---------------cut here---------------end--------------->8---


where static config would  be:

map ipsec_fw {
typeof ipsec in reqid : verdict
flags interval
}

chain FORWARD {
                type filter hook forward priority filter; policy drop;
[...]
ct state established,related accept
ipsec out reqid vmap @ipsec_fw
ipsec in reqid vmap @ipsec_fw
}


I compiled modified sources and this works (in a way ;) )

KJ


-- 
http://stopstopnop.pl/stop_stopnop.pl_o_nas.html
