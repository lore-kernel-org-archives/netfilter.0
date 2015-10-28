From: Johannes Ernst <johannes.ernst@gmail.com>
Subject: Masquerading with selectively open ports -- nftables
Date: Wed, 28 Oct 2015 10:14:35 -0700
Message-ID: <E3A2E5F1-41EB-41BA-A45D-7FEF5680DC15@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:content-type:content-transfer-encoding:subject:message-id:date
         :to:mime-version;
        bh=RdRMqyMJuVeixHy4UTlk4o5y5YeYbZWNZFlWYkEuggw=;
        b=cvWH11mzhcfkf/d5FnMfxDEhuR9KPZwIX8dr22auFJSDTGkWIiF3S4dwsbSeZP14I3
         XgCx4EbykPcmvSylbg7yOnIAccHCbYf34rT7CPr42CtUWoHC5ouvGj/jeZmPqrMJtZQg
         FEtkoxfGO88eQrHKgtRoH9DKLr5k6+ZDbIvC68WN1LUMklIqZUZeeuzJat/5JW5o97A1
         nJ+VkC7acTfwM/wgPUgGE1/DAmh+wcTjVaBpbHObou45NR9aug2Sy6cUTzFZtUEYogpY
         dV9X98rhhucTLiMhNI3VJjG9rBHvKvQy0ivlCLtVBunkBaKopUeLXXRh59bICOYAQd5w
         YmuA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

My box has two interfaces (enp2s0, upstream to ISP with DHCP) and (enp3=
s0, LAN, static IP assignment). Using nftables, I'm attempting to set i=
t up as a router with NAT, and selective port openings: enp2s0 is suppo=
sed to have the ssh port open, while enp3s0 also gets to have http, htt=
ps, dhcp and dns open so I can run Apache and dnsmasq on it for users o=
n the LAN.

Ideally I'm looking for a full example that will work if I execute 'nft=
 -f' with it. (Pretty much all related nftables examples I find seem to=
 leave out crucial bits.)

Here is what I have so far:

table inet filter {
  chain input { # this chain serves as a dispatcher
    type filter hook input priority 0;

    iifname lo accept # always accept loopback
    iifname enp2s0 jump input_enp2s0
    iifname enp3s0 jump input_enp3s0

    reject with icmp type port-unreachable # refuse traffic from all ot=
her interfaces
   }
  chain input_enp2s0 {
    ct state {established,related} accept
    ct state invalid drop
    udp dport bootpc accept
    tcp dport bootpc accept
    reject with icmp type port-unreachable # all other traffic
  }

  chain input_enp3s0 {
    ct state {established,related} accept
    ct state invalid drop
    udp dport bootpc accept
    tcp dport bootpc accept
    tcp port http accept
    tcp port https accept
    # and a few others
    reject with icmp type port-unreachable # all other traffic
  }

  chain ouput { # for now, we let everything out
    type filter hook output priority 0;
    accept
  }
}

Now I=E2=80=99m attempting to add masquerading, and I=E2=80=99m failing=
:
> nft add table nat
> nft add chain nat prerouting { type nat hook prerouting priority 0 \;=
 }
> nft add chain nat postrouting { type nat hook postrouting priority 0 =
\; }
> nft add rule nat postrouting masquerade
<cmdline>:1:1-35: Error: Could not process rule: No such file or direct=
ory
add rule nat postrouting masquerade
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. This is copied straight from the wiki [1]. What am I doing wrong?

2. Even if this command worked, how do I properly integrate it into the=
 rest of my tables/rules?

I=E2=80=99m on Arch x86_64, nftables 0.5.

Thanks,



Johannes.


[1] http://wiki.nftables.org/wiki-nftables/index.php/Performing_Network=
_Address_Translation_%28NAT%29




