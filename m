From: Yves Perrenoud <yves-netfilter@xpand.org>
Subject: nftables support for cgroup v2 filtering by path
Date: Sun, 18 Apr 2021 18:13:39 -0700
Message-ID: <c6823afc-70cf-3517-b464-339eb1b6554c@xpand.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I'm trying to convert from iptables/ip6tables (legacy) to nftables, but 
unfortunately, there seems to be a key element missing for me to be able 
to achieve that, and that's for cgroup v2 support in nftables.

As of systemd v248 (the latest stable version), systemd now defaults to 
only using cgroup v2. However, "meta cgroup" only works against a 
"net_cls.classid" from cgroup v1. There seems to be no way (in 0.9.8) to 
filter by cgroup v2 path.

iptables's cgroup module has a "--path" option that allows one to apply 
rules to a given cgroup v2. It would seem that nftables should have a 
meta "cgroup2" keyword that matches against cgroup v2 paths, to match 
the iptables functionality.

So unless I'm missing something, nftables currently doesn't support 
cgroup v2. Is there a plan to support it in the future?

Regards, Yves.
