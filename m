From: Anton Danilov <littlesmilingcloud@gmail.com>
Subject: Re: matching process
Date: Tue, 8 Nov 2016 11:48:55 +0300
Message-ID: <CAEzD07JoSVCkoC2JA4SvkqFiQZG4G=ZfchAF1tOZ1yPft+zxdQ@mail.gmail.com>
References: <CANY1rLgxygkJXdLVEQbE_O3fsf0=4Qye8TjdKaYY1d-FzvPj6w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=VivP9GwSNhh9iGwrq5Aa+bcFU45kpEO8acDxaFnf75k=;
        b=Ah7jVA7JddKizSiAP/YRxnakHrd2Wx2zFQh3ZqKuhKgytOPtYhZKQ3wmnxkchZnuVW
         Z4OibAvmYex9k98iHA3Z+LaSA6W3Up119j/MkmM2E9fjBV0SVfjz8as0bt1bF1UtmtLu
         +X9f9LV6Oqp2lbonnznWZGvyxIkKNSNKZMqrFTB+/OYBnjiUCI5Bg0LbgeIB7Ouf8VlS
         dgyU2wO53qCzelNMX6Fg8o5IKmzWGpg+vpGnQCoB138b/vz3VhFTlRNvt9ZN1oEKoF0a
         S9bIBH8tF93prQSFSUDRIOqIn9YW4zWEsRyVCqVd2WLy4iuiMnwcGgrycNtHqUIbHQ1S
         NpkQ==
In-Reply-To: <CANY1rLgxygkJXdLVEQbE_O3fsf0=4Qye8TjdKaYY1d-FzvPj6w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Art Emius <art@emius.ru>
Cc: netfilter@vger.kernel.org

Hello Art!

Some types of matches are being checking always.

Look at http://lxr.free-electrons.com/source/net/ipv4/netfilter/ip_tables.c#L53

Function ip_packet_match checks the interfaces and protocols, and
fragments always.

Other matches are being checked in the loop, that will be break after
first mismatch
( http://lxr.free-electrons.com/source/net/ipv4/netfilter/ip_tables.c#L233
function and
this loop http://lxr.free-electrons.com/source/net/ipv4/netfilter/ip_tables.c#L308
)

> Does criteria number matter? Two example rules are written below.
> iptables -t filter -A FORWARD -i eth0 -p icmp -j ACCEPT
> iptables -t filter -A FORWARD -i eth1 -s 10.10.10.10 -d 10.20.20.20 -p
> icmp -j ACCEPT
> Will it take same time to match packet by these rules, or first rule
> will take less time?

In the both rules --in-interface and --protocol matches will be checked,
but second rule will be take more time, because it checks the addresses.

>
> How does matching process exactly happens?
> Let's say we have a rule like:
> iptables -t filter -A FORWARD -i eth0 -s 10.10.10.10 -d 10.20.20.20 -p
> udp --dport 123 -j ACCEPT
> And packet with
> iif=eth1
> src=10.10.10.10
> dst=10.20.20.20
> proto=udp
> dport=123
>
> Will netfilter match packet with all criteria specified and make
> decision in the end, or it will jump to next rule when first criteria
> mismatch happen?

The intefaces and protocol will be cheched at first step by
ip_packet_match function.
But after interface mismatch there is the jump at next rule, so
protocol, addresses and
port numbers checking will be skipped.

> And third question. Is it all fair if using ipset? Will packet be
> matched with SET2 if it doesn't match SET1?
> iptables -t filter -A FORWARD -m set --match-set SET1 src,src -m set
> --match-set SET2 dst,dst -j ACCEPT

Nope, the packet will not be matches with SET2, if --match-set SET1 src,src
returns the false.


-- 
Anton.
