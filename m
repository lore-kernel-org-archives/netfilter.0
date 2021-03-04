From: Daniele Orlandi <daniele@orlandi.com>
Subject: Matching l3mdev output interface in snat
Date: Thu, 4 Mar 2021 23:50:35 +0100
Message-ID: <d40b2ce6-fa4e-bf6b-ad11-a1af984f7023@orlandi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org


Hello,

I am trying to match the output interface in a VRF scenario.

Kernel Documentation/networking/vrf.rst says that:

.. [2] Iptables on ingress supports PREROUTING with skb->dev set to the real
        ingress device and both INPUT and PREROUTING rules with skb->dev set to
        the VRF device. For egress POSTROUTING and OUTPUT rules can be written
        using either the VRF device or real egress device.

However my nft rules seem only to see the packet with VRF output interface and not the real device.

Stripped rules:

table ip nat {
         chain SRCNAT {
                 type nat hook postrouting priority srcnat; policy accept;
                 ip protocol icmp meta nftrace set 1
         }
}


# nft monitor
trace id c096ec4e ip nat SRCNAT packet: oif "vrf-lan" ip saddr 192.168.7.1 ip daddr 8.8.8.8 ip dscp cs0 ip ecn not-ect ip ttl 64 ip id 29475 ip length 84 icmp code net-unreachable icmp id 43 icmp sequence 1 @th,64,96 4098567253202410505966391040

Am I supposed to be able to match the real output interface there?

Thank you,
Regards.

-- 
Daniele Orlandi
