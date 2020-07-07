From: Thilo-Alexander Ginkel <thilo@ginkel.com>
Subject: nftables: masquerading not applied consistently
Date: Wed, 8 Jul 2020 00:38:12 +0200
Message-ID: <CANvSZQ-TM-2qs4s8QiiFQmqQG_bebn1ptwHEa3atJm7yxii_BQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ginkel.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=FtqN3G2/n2p5dyecw5duIoYmQF21Wpsx2PJhc27/JBc=;
        b=d5a2my8snj2GGnC0TxwBJftuRLQoA355jNEDR6t3f13T79aMyUnHfofJNESnJd8VY5
         cmKSzNUpgIBJvZNS4k8YNARJw0VY1ZK7VR95itmGYLVskep0ig+psxkfhk4eJG3CDC7T
         yFY1K5xN0ujWPTqouys2kxuJeBW+y2nIJTiwY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello everyone,

I have a somewhat complex VPN setup involving a Ubuntu-based VPN
gateway ("vpn-gw") that terminates multiple VPNs based on WireGuard
and OpenVPN. Also involved is a core router ("gw01") that performs
routing among different VLANs comprising the LAN. One of the OpenVPN
interfaces ("tun252")  requires masquerading, which I implemented
through the following nftables config snippet:

table ip nat {
    chain postrouting {
        type nat hook postrouting priority 100; policy accept

        [...]
        oifname "tun252" counter masquerade
    }
}

This works fine if traffic originates on the LAN. Things start acting
weird (i.e., no masquerading is applied when the traffic is forwarded
to tun252) when the traffic originates on one of the WireGuard
interfaces. The path of the packets in this case is: vpn-gw[wireguard]
-> vpn-gw[eth0.250] -> gw01[eth0.250] ->  gw01[eth0.252] ->
vpn-gw[eth0.252] -> vpn-gw[tun252]

In contrast, traffic that takes the following course is masqueraded
correctly: gw01[eth0.10] ->  gw01[eth0.252] -> vpn-gw[eth0.252] ->
vpn-gw[tun252]

Any idea what may be causing this and how to fix this?

Thanks,
Thilo
