From: Marcel Menzel <mail@mcl.gg>
Subject: Upgrading from kernel 5.12.19 to 5.13.13 made "ct state invalid"
 match IPv6 link-local addresses in tunnels
Date: Sun, 5 Sep 2021 23:53:50 +0200
Message-ID: <3c01d58e-7c52-7177-c101-f9c765360515@mcl.gg>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mcl.gg; s=mail;
        t=1630878830; bh=MzOje+OpAmXT/rBK5zS9K9+jeRGto+Yh7hO/EyDRiuI=;
        h=From:Subject:To:Date;
        b=PnCy+QpZtBYG0dF2MHvamnYgeew1vC1KZS6NzPwkHfXZiZcIx/yO3r2OPP/RMvZlX
         Yp/8Nrnwrl3CB55fXI674v8fj/sFBcdKspRlQwiZ4qC4q46VEhsByxMSTZzLy4iYUq
         N8pfRCLPBeYXm/8VrXCZ5jLT5oN8T2EVYtmfsdN9sfUiqEXJuwCrW4Q5P9y77chkD7
         XI+g7zdpMUH7uCxshtxhXFH0zZWxIht5b7XCM+u5z8nGE4P7naMpgGJFY7ctSNUfA6
         IaQ48c9dyiZc0AIjmu8YQNXAvnCqwTeugymcZZa6TlstKkfPQLq5lRmU88ZBUpO9dI
         gnMQl2EqUoxsA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello list,

I have the following /etc/nftables.conf file:

        flush ruleset

        table inet firewall {
            chain filter_input {
                type filter hook input priority 0;

                ct state invalid counter log drop

                icmpv6 type { destination-unreachable, packet-too-big,
time-exceeded, parameter-problem, echo-request } counter accept

                iifname enp0s3 tcp dport 22 accept

                accept
            }
        }

I am running the following commands on two virtual machines (with GRE
underlay IPs swapped of course):

        ip l add vrf-test type vrf table 1
        ip l set vrf-test up
        ip tunnel add gre99 mode gre remote 10.10.10.37 local
10.10.10.80 ttl 255
        ip l set gre99 up

Up to this point, I am still able to ping the link-local GRE overlay
address between the VMs:

        ping fe80::5efe:a0a:a50%gre99
        PING fe80::5efe:a0a:a50%gre99(fe80::5efe:a0a:a50%gre99) 56 data
bytes
        64 Bytes from fe80::5efe:a0a:a50%gre99: icmp_seq=1 ttl=64
time=0.187 ms

Running the next command on one VM:

        ip l set gre99 master vrf-test

... I am no longer able to ping the overlay link-local address. For the
"ct state invalid counter log drop", the kernel is logging the following:

        IN=vrf-test OUT= MAC=45:00:00:80:ff:1d:40:00:ff:2f:53:a8:0a:0a
SRC=fe80:0000:0000:0000:0000:5efe:0a0a:0a25
DST=fe80:0000:0000:0000:0000:5efe:0a0a:0a50 LEN=104 TC=0 HOPLIMIT=64
FLOWLBL=648307 PROTO=ICMPv6 TYPE=128 CODE=0 ID=2 SEQ=1

Downgrading to kernel 5.12.19, I am able to ping the link-local address
again with the above firewall rules active. This behavior triggers on
GRE and on XFRM tunnels, haven't tested others (for example real NICs in
a VRF).

Is this intended behavior? When I have more time, I am going to try to
see which version in between introduced this issue for me.

Kind regards,

Marcel



