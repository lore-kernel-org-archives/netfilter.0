From: Henning Reich <henning.reich@gmail.com>
Subject: List and reimport Ruleset fails with "Error: transport protocol
 mapping is only valid after transport protocol match"
Date: Tue, 6 Apr 2021 17:24:31 +0200
Message-ID: <CAOAVeL3bSQP8SoaS_SUgr7XVMDAhp9ZtE3tstOHDE4dZBN9AgA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=NBAz2FIi931LLDSR6vs2yFIAcC4DuT9OxAxR+jnr9Ao=;
        b=CsvbYwoTWuAkjBGhmDf+vKjWzaFayCfKtfW+HFq3VINXzAluyOtxBmUZKtcNeqzTkA
         s6GYTiQ+9dZItncmZxIAUCx1Z1iGwtaseXQ8aCpcIr+V1LNCFSBx2BhL5d3nEJmtlMBZ
         WR7mLUFOwvlqPslBhD/uSwImoKNrJx40FqKLubJVyQ2r0QjVvgGt83yPJvaPaLTyXsig
         bJbuigwj7AavFQBvTp1VXJq9NuP9ebL673L7PvHN/xxhQ2bEyXeb2BM2m0fzeinn53Iy
         5X7ll5IwzB/2V1Vbe8JPf8SScp6HGtJeFe8crxj+hHEb1EoOXmxt7Mx93NRlcWkl7K4B
         BW6A==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

maybe somebody can give me a hint.

I'm using some systemd-nspawn containers with exposed Port.
Systemd creates automatically some masquerading rules and all works fine.
But if I restart nft.service, these rules are gone (obviously). So I
want to store and re-import them.

so this
nft list table ip io.systemd.nat | tee systemd_nat_rules
shows me:

table ip io.systemd.nat {
       set masq_saddr {
               type ipv4_addr
               flags interval
               elements = { 192.168.162.112/28 }
       }

       map map_port_ipport {
               type inet_proto . inet_service : ipv4_addr . inet_service
               elements = { tcp . 8088 : 192.168.162.117 . 80 }
       }

       chain prerouting {
               type nat hook prerouting priority dstnat + 1; policy accept;
               fib daddr type local dnat ip addr . port to meta
l4proto . th dport map @map_port_ipport
       }

       chain output {
               type nat hook output priority -99; policy accept;
               ip daddr != 127.0.0.0/8 oif "lo" dnat ip addr . port to
meta l4proto . th dport map @map_port_ipport
       }

       chain postrouting {
               type nat hook postrouting priority srcnat + 1; policy accept;
               ip saddr @masq_saddr masquerade
       }
}


But trying to import it:

nft -c -f systemd_nat_rules
results in:
ruleset:9:48-59: Error: transport protocol mapping is only valid after
transport protocol match
               type inet_proto . inet_service : ipv4_addr . inet_service



I also tried to store and import the complete ruleset (nft list
ruleset), but with the same error.

Thanks for your help.
Henning
