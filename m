From: tech <tech@format-tv.net>
Subject: Traffic drops when using flow offload for nftables based NAT
Date: Thu, 11 Mar 2021 12:17:18 +0200
Message-ID: <4986dab7b8162afc20ee5d21e42cca80@format-tv.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=format-tv.net; h=
        mime-version:content-type:content-transfer-encoding:date:from:to
        :subject:message-id; s=mainsel; bh=lyMWxdRZRocNlhpXgQLGKDo0ieY=; b=
        kz3m6YBsgHDy5dJ3Sxrm//IMh6LRsYr0IXIlE5/N63LBJcmE6sILBuv6zaje0QtV
        cwZQfWzWAW9b6yhV+6pKaZq1eFLNLiVnEUcHhxMSXQqJX6VAMYL4WQaW39QTRhOV
        IDyjJS+TpD537wseE0LiD3ck/SJqIE5QSAZImBc+d2E=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
I'm trying to augment my nft based NAT server with flow offload feature.
Prerequisites:
# uname -a
Linux nat40g 5.4.0-66-generic #74-Ubuntu SMP Wed Jan 27 22:54:38 UTC 
2021 x86_64 x86_64 x86_64 GNU/Linux
ethtool -G enp1s0f0 tx 8192
ethtool -G enp1s0f0 rx 8192
ethtool -K enp1s0f0 hw-tc-offload on

Ethernet controller: Mellanox Technologies MT27700 Family [ConnectX-4]

# cat /opt/nftables.conf
flush ruleset

table ip filter {
         chain input {
                 type filter hook input priority 0; policy accept;
                 ct state established accept
                 iif "vlan4" counter drop
                 iif "vlan5" counter drop
         }

         flowtable fastnat {
                 hook ingress priority 0
                 devices = { vlan4, vlan5 }
         }

         chain forward {
                 type filter hook forward priority 0; policy accept;
                 ip protocol { tcp , udp } flow offload @fastnat;
         }
}


table ip nat {
         chain post {
                 type nat hook postrouting priority 100; policy accept;
                 ip saddr 10.0.0.0/8 oif "vlan5" snat to 
19.2.5.1-19.2.5.125 persistent
         }

         chain pre {
                 type nat hook prerouting priority -100; policy accept;
         }
}

All good when there is up to 12G overall traffic volume, but when my 
traffic overall volume exceeds 12+G I experience input drops.
If I comment out this portion of configuration:
flowtable fastnat {
         hook ingress priority 0
         devices = { vlan4, vlan5 }
}

chain forward {
         type filter hook forward priority 0; policy accept;
         ip protocol { tcp , udp } flow offload @fastnat;
}
The result no drops up to 21.5G and occur when CPU utilization up to 
85%.
P.S. If someone interested I can share images.
