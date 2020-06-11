From: trentbuck@gmail.com (Trent W. Buck)
Subject: Re: Simplifying DNAT Rules using Maps
Date: Thu, 11 Jun 2020 16:43:18 +1000
Message-ID: <87d06685mh.fsf@goll.lan>
References: <CAPyx93x8RtJA8ghab2W630WwpHZP+K-dA26SWkj7+wstasM5mw@mail.gmail.com>
        <20200607214008.GB24054@salvia>
        <CAPyx93xmpSRSQFtMC=bqxh5f3_g_jyMXEGaUB-EjMa1m6SN5Gg@mail.gmail.com>
        <CAPyx93wMpdBEA58ixPxYVWEXGSO3mQZv7Ub=iNX87JXnM2c_NQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--=-=-=
Content-Type: text/plain

Max Ehrlich <max.ehr@gmail.com> writes:

> Just to put some more context, I was able to do this using a map and a
> set as follows:
>
> ```
> define dnat_targets = {
> 80 : 10.0.10.1 . 8080,
> 25565 : 10.0.10.8 . 25565
> }
>
> define dnat_allowed = {
> 10.0.10.1 . 8080,
> 10.0.10.8 . 25565
> }
>
> [...]
>
> table inet filter {
> set dnat_allowed {
> type ipv4_addr . inet_service
> elements = $dnat_allowed
> }
>
> chain forward {
> ip daddr . tcp dport @dnat_allowed accept
> }
> }
> ```
>
> however note that values of the map `dnat_targets` is the same as the
> set `dnat_allowed`, I wonder if there is a way to do this with only
> the map `dnat_targets`? Something like using only the values of the
> map as a set?

FWIW in filter you can just say "allow anything I already DNATted":

    # xtables, annoying explicit way
    -A FORWARD -p tcp --dports http,https -d www -j ACCEPT
    -A FORWARD -p tcp --dports imaps,submission -d mail -j ACCEPT
    ...

    # xtables, easy way
    -A FORWARD --ctstate DNAT -j ACCEPT

    # nft, easy way
    ct status dnat  accept

A full ruleset might look like this (attached):


--=-=-=
Content-Type: text/plain
Content-Disposition: attachment; filename=tmp.nft

#!/usr/sbin/nft --file
flush ruleset
table inet my_filter {
    chain my_input {
        type filter hook input priority filter
        policy drop
        jump my_prologue  comment "deal with boring conntrack/loopback/ICMP/ICMPv6"
        tcp dport ssh  accept
        jump my_epilogue
    }
    chain my_forward {
        type filter hook forward priority filter
        policy drop
        jump my_prologue  comment "deal with boring conntrack/loopback/ICMP/ICMPv6"
        jump my_epilogue
    }
    chain my_prologue {
        ct state vmap { established: accept, related: accept, invalid: drop }
        ct status dnat  accept
        iiftype loopback  accept
        icmp type echo-request accept
        icmpv6 type { echo-request, nd-neighbor-solicit }  accept
    }
    chain my_epilogue {
        iiftype != ppp  reject  comment "be polite (reject, not drop) to local networks"
    }
}
table ip my_nat {
    chain my_postrouting {
        type nat hook postrouting priority srcnat
        policy accept
        oiftype ppp  masquerade
    }
    chain my_prerouting {
        type nat hook prerouting priority dstnat
        policy accept
        iiftype != ppp  return  comment "port forwards are only relevant from the internet"
        define www.example.com = 127.1.2.3
        define mail.example.com = 127.254.253.252
        tcp dport { http, https }              dnat to $www.example.com
        tcp dport { smtp, submission, imaps }  dnat to $mail.example.com
    }
}
list ruleset

--=-=-=--

