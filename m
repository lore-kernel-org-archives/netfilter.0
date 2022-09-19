From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: how to use meters?
Date: Mon, 19 Sep 2022 10:47:47 +0200
Message-ID: <Yygss6Pkwuwgmy4o@salvia>
References: <871qs9neip.fsf@alfa.kjonca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <871qs9neip.fsf@alfa.kjonca>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Kamil =?utf-8?B?Sm/FhGNh?= <kjonca@op.pl>
Cc: netfilter@vger.kernel.org

On Sun, Sep 18, 2022 at 12:49:34PM +0200, Kamil Jo=C5=84ca wrote:
[...]
> For example:
> https://wiki.archlinux.org/title/Nftables#Dynamic_blackhole
> --8<---------------cut here---------------start------------->8---
>  ct state new tcp dport 443 \
>                 meter flood size 128000 { ip saddr timeout 10s limit rate=
 over 10/second } \
>                 add @blackhole { ip saddr timeout 1m }
> --8<---------------cut here---------------end--------------->8---
>=20
> I understand " add @blackhole { ip saddr timeout 1m }" - adds address to
> set for 1 min.
> but what is
> "meter flood size 128000 { ip saddr timeout 10s limit rate over 10/second=
 }"
>=20
> (I can guess but I cannot see proper doc of this)
> Any hint?

I'd suggest you use a set declaration for this, instead of the meter syntax.

This example shows how to ratelimit new connections to 10 per second:

table inet global {
    set flood {
        type ipv4_addr
        flags dynamic
        timeout 1m
        limit rate over 10/second
        size 65536
    }

    chain input {
        type filter hook prerouting priority filter; policy drop;
        ct state new tcp dport 443 update @flood { ip saddr } drop
        counter accept
    }
}

This declares a dynamic 'flood' set that stores IPv4 addresses. The
limit rate is also done from the set declaration itself. If the client
goes over the threshold, the packet is dropped.


Now, going back to "drop all HTTPS connections for 1 minute from a
source IP that exceeds the limit of 10/second", let's update the
previous example incrementally with an explicit set declaration:

table inet global {
    set flood {
        type ipv4_addr
        flags dynamic
        timeout 1m
        limit rate over 10/second
        size 65536
    }

    set blocklist {
        type ipv4_addr
        flags dynamic
        timeout 1m
        size 65536
    }

    chain input {
        type filter hook prerouting priority filter; policy drop;
        ct state new tcp dport 443 update @flood { ip saddr } add @blocklis=
t { ip saddr }
        ip saddr @blocklist counter drop
        counter accept
    }
}

the 'flood' set keeps track of the specified ratelimit for each IP
address, if the ratelimit threshold is hit, then the IP address is
added to the blocklist. After 1 minute, the IP address in the
blocklist is removed.
