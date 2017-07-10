From: sorcus@inwebse.com
Subject: What wrong with snat in nftables?
Date: Mon, 10 Jul 2017 13:36:41 +0000
Message-ID: <691d19d7765158dc9d10dd62b5033536@inwebse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inwebse.com
        ; s=mail; h=Message-ID:From:Date:Content-Transfer-Encoding:Content-Type:
        MIME-Version:Subject:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=6t53u7uwaYz2tiEUY6QCayqPnMyiQnN07NjJ4vgbC+M=; b=c9g7bifE29T7SYcPBP+z0keIMX
        o80dbBjlc/7Pu/Ome0QzHX9tsPy6ywI4r88txhUJOQniygunwwoYbGeEDjjUrP6PKwUCoxsF6KdL3
        OtBmNbyzQPTZs8ID7gWE8Ap+TA3ifOGkiJNkieLQd9RY2ngTNtWow5CdZN0MQGegCmu4=;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I have two virtual machines (server, client) with wireguard vpn.
When i try ping any IPv6 resource from client packets doesn't return to 
client.
Tcpdump show me ICMP Reply packets in enp0s3 interface (server), not in 
wg0 (vpn interface on server).
But if disable nftables and start ip6tables, all works.
After this step i disable ip6tables and enable nftables... All continue 
works...

Software versions:
NixOS: 17.09.git.ebaff59 (Hummingbird)
WireGuard: 0.0.20170706
Nftables: 0.7

Build ISO images with next commands:
Server: nix-build -A config.system.build.isoImage -I 
nixos-config=./wireguard_server_10.nix ./nixpkgs/nixos/default.nix
Client: nix-build -A config.system.build.isoImage -I 
nixos-config=./wireguard_client_20.nix ./nixpkgs/nixos/default.nix

Here nix files - 
https://gist.github.com/MrSorcus/d6d8b8b6acff715368844a643775c980

Create virtual machines with next commands:

Server: virt-install \
--name NixOSVS10 \
--ram 1024 \
--vcpus 1 \
--cdrom /tmp/nixos_10.iso \
--os-type linux \
--nodisk \
--network bridge=br0 \
--graphics vnc,password="ABCDEF",port=5910,listen=2a01:4f8:xx:xx::13 \
--autostart \
--noautoconsole

Client: virt-install \
--name NixOSVS20 \
--ram 1024 \
--vcpus 1 \
--cdrom /tmp/nixos_20.iso \
--os-type linux \
--nodisk \
--network bridge=br0 \
--graphics vnc,password="ABCDEF",port=5920,listen=2a01:4f8:xx:xx::13 \
--autostart \
--noautoconsole

Output for ip a, ip -6 route, route -6, wg, sysctl -a, dmesg, lsmod.

Server: 
https://gist.github.com/MrSorcus/1a8c9f5aacf8957502299d707a38c5fc
Client: 
https://gist.github.com/MrSorcus/b7dc077249ca513ca8f307a68c62d1ce

Tcpdump logs from client. Ping IPv6 address 2001:19f0:7400:87a2::64 
(https://ipv6.net/)
https://gist.github.com/MrSorcus/03e716fba67c4119772012777847c569

Output from /proc/net/nf_conntrack:
With nftables - 
https://gist.github.com/MrSorcus/601170680ff644c52a11e5352997879a
With ip6tables - 
https://gist.github.com/MrSorcus/e043101f98e787c8cbf6d0605fd9de7e

Snat doesn't work correctly in nftables. But work after next steps:
[root@nixos:~]# systemctl stop nftables
[root@nixos:~]# ip6tables -t nat -A POSTROUTING -o enp0s3 -j SNAT 
--to-source 2a01:4f8:xx:xx::10
