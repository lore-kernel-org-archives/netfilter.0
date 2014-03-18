From: Aleksey Kashin <aleksey.kashin@gmail.com>
Subject: using ebtables for dnat mac address
Date: Tue, 18 Mar 2014 16:36:14 +0600
Message-ID: <CAPJYFP-tr8cX2D6Wga+sMCsWUu-XdOT_JO=GSgC4oOvM7YuE7A@mail.gmail.com>
References: <CAPJYFP_X0swMyaLugsUB2Z4DjweU_RG6=VXoenHpG-HbUfqGVQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=oKoI+s7fEVOyPzsrwPgFez5XrwBgyRV7a483UwuJtIg=;
        b=C+FVUO4r1/D6B76rkQ2bhZ8AhcEt6N+nGp1v9zGa/cUH6dPnPitFuo8WBnfwzIYxkl
         GxpS6SibrpSa1DQeKL+MMIY7Ab5A3l+DcS5GKSSg/b2tlu/o9pZ3s0ZXyMMoGkOlY0B0
         ULxSawRC6O5tXfj9zSgu5Nhul5vcj5QUNbGcCnzUnjmgd9ZWVZZSEJz+9Bq6WOVWyNpV
         RnPqYVunl6B4oGvd+LZNKjr44vHHj+xIIMmbs1C4C6LOoO3/3BvY7W8A+J8Gb/PQDcEh
         BCPrAHbds//MWP9eR6v/FRe8QkgcHPnLFvRZNJeY9vzz+SdS104oo+cPGZsCLch3BFjB
         Ur6A==
In-Reply-To: <CAPJYFP_X0swMyaLugsUB2Z4DjweU_RG6=VXoenHpG-HbUfqGVQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hello,

I need to handle mirrored traffic. For this I need to change
destination mac address of mirrored traffic to mac on network
interface on which I accept mirrored traffic.

Here is example mirrored traffic
15:59:29.114520 00:25:ba:5b:c9:11 (oui Unknown) > 34:40:b5:81:6c:ac
(oui Unknown), ethertype IPv4 (0x0800), length 84: 1.1.1.1.2052 >
2.2.2.2.domain: 43161+ A? dnl-01.geo.kaspersky.com. (42)

Here is network interface on which I want handle mirrored traffic
eth1      Link encap:Ethernet  HWaddr fe:f9:b4:d5:08:c3
          inet addr:X.X.X.X  Bcast:0.0.0.0  Mask:255.255.255.248
          inet6 addr: fe80::fcf9:b4ff:fed5:8c3/64 Scope:Link
          UP BROADCAST RUNNING PROMISC MULTICAST  MTU:1500  Metric:1
          RX packets:6424655 errors:0 dropped:0 overruns:0 frame:0
          TX packets:6 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:1088214395 (1.0 GiB)  TX bytes:468 (468.0 B)
          Interrupt:30

Here is rules for ebtables

root@ns4:~# ebtables -t nat -L --Lc
Bridge table: nat

Bridge chain: PREROUTING, entries: 1, policy: ACCEPT
-d 34:40:b5:81:6c:ac -i eth1 -j dnat --to-dst fe:f9:b4:d5:8:c3
--dnat-target ACCEPT, pcnt = 0 -- bcnt = 0

Bridge chain: OUTPUT, entries: 0, policy: ACCEPT

Bridge chain: POSTROUTING, entries: 0, policy: ACCEPT

root@ns4:~# ebtables  -L --Lc
Bridge table: filter

Bridge chain: INPUT, entries: 0, policy: ACCEPT

Bridge chain: FORWARD, entries: 0, policy: ACCEPT

Bridge chain: OUTPUT, entries: 0, policy: ACCEPT

But no one frame doesn't satisfy this rule. Where I'm wrong?

OS and package version:
root@ns4:~# uname -r
3.2.0-4-amd64
root@ns4:~# lsb_release -a
No LSB modules are available.
Distributor ID:	Debian
Description:	Debian GNU/Linux 7.4 (wheezy)
Release:	7.4
Codename:	wheezy
root@ns4:~# dpkg -l | grep ebtables
ii  ebtables                           2.0.10.4-1
amd64        Ethernet bridge frame table administration


Thank you.
