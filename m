From: Steve Fink <sphink@gmail.com>
Subject: Port redirection
Date: Tue, 4 Aug 2009 21:57:26 -0700
Message-ID: <7d7f2e8c0908042157y4e80136ct82efd1dd2446db2c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=MbetAUn3veu/6YArMwUf1EC83/moZp9nRt1h9kdSvuE=;
        b=CmIJRB/XFDeQxMlR2rbXJjFW3gO4fofv1aytAKFfzQ16nsaumANoHrrGoJUUoiKXg/
         WfhIWAI8QWO8UjbWRdaAYzOLLSAuQ8o+8feN1wjQlX2EeDc9IgM8z087ID8HsrMRQAwK
         PgbM5NRrNrMLgTRoDcL1lXzauR+Rv1tcLFuXs=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

I am trying to redirect all traffic generated on box $SRC to a
particular UDP port to a different host $SPY. I've done similar things
with whole TCP connections using DNAT and SNAT, but this time I want
UDP and I want to be able to start up the redirection after the
"connection" has been established. (I never see these packets in the
'nat' table.)

The only option that seemed viable, me not knowing much about
networking, was to use the 'mangle' table to set a mark on the
outgoing packets, then use 'ip' to route the packet to $SPY. I've used
iptables a fair amount, but ip not at all.

On $SRC, I ran:
=A0iptables -t mangle -A OUTPUT -p udp --dport 8765 -j MARK --set-mark =
1
=A0ip rule add fwmark 1 table 50
=A0ip route add via $SPY table 50
=A0sysctl net.ipv4.ip_forward=3D1 # Dunno if this matters
=A0ip route flush cache

On $SPY, I ran:
=A0sysctl net.ipv4.ip_forward=3D1 # Makes sense here

$SRC, $SPY, and $ORIG_DEST (the original destination) can all reach eac=
h other.

According to iptables, the mark is getting set on the packets I want
redirected. But tcpdump shows packets still going to the original
destination, not $SPY. I am testing by running this on $SRC

=A0 nc -v -u $ORIG_DEST 8765

And I trigger packets to be sent by hitting enter in that window. The
packets are making it to my dummy server on $ORIG_DEST. They do not
show up to tcpdump on $SPY.

I don't know how to read the output of 'ip route show cache', but it in=
cludes

$SPY from $SRC tos lowdelay dev tun0
=A0=A0=A0 cache=A0 mtu 1412 advmss 1372 hoplimit 64
local $SRC from $SPY tos lowdelay dev lo=A0 src $SRC
=A0=A0=A0 cache <local,src-direct>=A0 iif tun0

(I'm testing this over a VPN, hence the tun0 device. Both $ORIG_DEST
and $SPY are accessible via the VPN.)

The only thing I can think of is that $SPY needs to be reachable in a
single hop, but then I'd expect some other error message. On the other
hand, I just tried the above commands on my actual $SRC box, and it
gave me "RTNETLINK answers: Network is unreachable". But as I said,
all three boxes can reach each other via ping and pretty much
anything.

By the way, I don't care if the packets arrive at $SPY with the
destination IP addresses still set to something else; I just want them
to be filterable via another iptables mess. (I'll probably just write
them all out to a file with tcpdump and analyze them after the fact,
but I could imagine writing a application protocol-specific netfilter
module to do the checking that I really want.)

I'd really like for some way to rewrite the destination IP address and
do routing on the resulting packet, but I couldn't figure out how to
do that. Like I said, these packets don't go through the 'nat' table,
and I don't know how to rewrite the destination IP any other way.

Help?
