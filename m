From: Anton Danilov <littlesmilingcloud@gmail.com>
Subject: Re: What wrong with snat in nftables?
Date: Tue, 11 Jul 2017 13:10:32 +0300
Message-ID: <CAEzD07JY4pix=dh0W7rZ1MU0MxCo=Ky32o3EFtbf9i44B+7BMQ@mail.gmail.com>
References: <691d19d7765158dc9d10dd62b5033536@inwebse.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=I6Ex4ABzvVB6sHXqpF99KsBa4Jk2GOa1gdoB6TSyDP8=;
        b=tlhaVJS9gK8UnaYf0DM/JCY86QWK/yZjFNN0HlDA4ZWdId1IJdgdoo2q0Ch2Uz3hi6
         LLyCTDKth1g+AbNghKc4soZMGLeqVchBmcIbCUpYPb18THz5ZAoHdBBbJ6QddIuzFUgc
         /FyMDKKjwe+OMWnfZnx4gk2e5dII2RxcQQ3QQnm2dhCXWjWfne4hwdMwGvvBhRSqk1Eb
         LPqfpgAxBCwJzLPJHd9epnwNUXwiYiP77r+yQ3MfEUFmktUhH3HeSdGpV6xeSHQ8Ibi/
         M1BQWGAw0Rm9s7SoPAU1FtscHTYIbBIwj1WEoydgtRh74DUDGb8P+46bkomt+ZNBvReU
         hiyg==
In-Reply-To: <691d19d7765158dc9d10dd62b5033536@inwebse.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sorcus@inwebse.com
Cc: netfilter@vger.kernel.org

Hello.
I haven't seen the nftables rules.

Seems like you have misconfiguration in the nftables rules.

NAT action are being done in the conntrack subsystem, and *tables just
apply the rule for first packets of NEW state connection and create
special conntrack entries. Other packets of this known connection
bypass the rules in the nat table. So it caused working after moving
back from ip6tables to nftables, because it hasn't affected the
conntrack entries.

So, these are two recommends:

1. flush conntrack entries after changing of rules in the nat table.
2. add counters to nftables nat rule to check that rule really hit the packets.



2017-07-10 16:36 GMT+03:00  <sorcus@inwebse.com>:
> I have two virtual machines (server, client) with wireguard vpn.
> When i try ping any IPv6 resource from client packets doesn't return to
> client.
> Tcpdump show me ICMP Reply packets in enp0s3 interface (server), not in wg0
> (vpn interface on server).
> But if disable nftables and start ip6tables, all works.
> After this step i disable ip6tables and enable nftables... All continue
> works...
>
> Software versions:
> NixOS: 17.09.git.ebaff59 (Hummingbird)
> WireGuard: 0.0.20170706
> Nftables: 0.7
>
> Build ISO images with next commands:
> Server: nix-build -A config.system.build.isoImage -I
> nixos-config=./wireguard_server_10.nix ./nixpkgs/nixos/default.nix
> Client: nix-build -A config.system.build.isoImage -I
> nixos-config=./wireguard_client_20.nix ./nixpkgs/nixos/default.nix
>
> Here nix files -
> https://gist.github.com/MrSorcus/d6d8b8b6acff715368844a643775c980
>
> Create virtual machines with next commands:
>
> Server: virt-install \
> --name NixOSVS10 \
> --ram 1024 \
> --vcpus 1 \
> --cdrom /tmp/nixos_10.iso \
> --os-type linux \
> --nodisk \
> --network bridge=br0 \
> --graphics vnc,password="ABCDEF",port=5910,listen=2a01:4f8:xx:xx::13 \
> --autostart \
> --noautoconsole
>
> Client: virt-install \
> --name NixOSVS20 \
> --ram 1024 \
> --vcpus 1 \
> --cdrom /tmp/nixos_20.iso \
> --os-type linux \
> --nodisk \
> --network bridge=br0 \
> --graphics vnc,password="ABCDEF",port=5920,listen=2a01:4f8:xx:xx::13 \
> --autostart \
> --noautoconsole
>
> Output for ip a, ip -6 route, route -6, wg, sysctl -a, dmesg, lsmod.
>
> Server: https://gist.github.com/MrSorcus/1a8c9f5aacf8957502299d707a38c5fc
> Client: https://gist.github.com/MrSorcus/b7dc077249ca513ca8f307a68c62d1ce
>
> Tcpdump logs from client. Ping IPv6 address 2001:19f0:7400:87a2::64
> (https://ipv6.net/)
> https://gist.github.com/MrSorcus/03e716fba67c4119772012777847c569
>
> Output from /proc/net/nf_conntrack:
> With nftables -
> https://gist.github.com/MrSorcus/601170680ff644c52a11e5352997879a
> With ip6tables -
> https://gist.github.com/MrSorcus/e043101f98e787c8cbf6d0605fd9de7e
>
> Snat doesn't work correctly in nftables. But work after next steps:
> [root@nixos:~]# systemctl stop nftables
> [root@nixos:~]# ip6tables -t nat -A POSTROUTING -o enp0s3 -j SNAT
> --to-source 2a01:4f8:xx:xx::10
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Anton.
