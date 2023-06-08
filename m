From: Wojciech Wrona <w0jtas@w0jtas.com>
Subject: HW Offload to Mellanox ConnectX-5
Date: Thu, 8 Jun 2023 11:39:16 +0200
Message-ID: <fb4a4aa4-d0b0-c61d-697a-462020138eed@w0jtas.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=w0jtas.com; s=keyb;
        t=1686217156; bh=KNtJ4Hi7JnAtm8Y0VOkc8a/5vVGoGbuB1DPbUkbdX+o=;
        h=To:From:Subject:Date:From;
        b=m4GGugDnTeXoopOr7W4nwW9WvfQeLtm/0drYUR4RnKiWCgrRexxH2feFcm3wgSD/o
         Q7C+RDhyQcrJtNionlzd1p10oQ0TlqRRxhZZTJ6US+PNne07iTCxGLB92L1iUAkIKn
         xAE0KFYOkxL8koWqrcG+wJcCEfZZDmgtzxetBhhvcTz1XMX/1t66GbniMg5HG1aG+O
         R6WDWIPzE4VRsdWR9LcqfhoUHXkZy+Ox7dYGhZ5YwHnDpzSUquE6tUYYeLeSpISxRP
         HSLIN+BGjz0fu9dBKpT4fDKpmSO6uEDyGOQkOOH65yNic9g/O6SGbMhdGKYTdTzaZY
         BOUlUSCWaA9lQ==
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi, everyone. I'm having problems running nftables with hardware
offload. Every time keyword "flags offload" is added to flowtable
definition i get "Could not process rule: Operation not supported". For
now tried everything, i feel like nothing left to check, can anyone
point me the way ?

*My Config:*
OS: Ubuntu 20.04.6 LTS

Kernel: 5.15.0-73-generic #80~20.04.1-Ubuntu SMP Wed May 17 14:58:14 UTC
2023 x86_64 x86_64 x86_64 GNU/Linux

Ethernet controller: Mellanox Technologies MT27800 Family [ConnectX-5]
(MCX516A-CCAT)

Device driver: mlx5_core
In fact i tried driver included in kernel and also compiled from sources
latest 5.8-2.0.3.0 version from Nvidia/Mellanox - same result on both.

root@nat-router2004:~# mlxburn -query -d /dev/mst/mt4119_pciconf0
-I- Image type:            FS4
-I- FW Version:            16.35.2000
-I- FW Release Date:       24.11.2022
-I- Product Version:       16.35.2000
-I- Rom Info:              type=UEFI version=14.28.16 cpu=AMD64
-I-                        type=PXE version=3.6.805 cpu=AMD64
-I- Description:           UID                GuidsNumber
-I- Base GUID:             1070fd0300b346d6        8
-I- Base MAC:              1070fdb346d6            8
-I- Image VSD:             N/A
-I- Device VSD:            N/A
-I- PSID:                  MT_0000000012
-I- Security Attributes:   N/A

root@nat-router2004:~# ethtool -k eth1 | grep tc-off
hw-tc-offload: on
root@nat-router2004:~# ethtool -k eth2 | grep tc-off
hw-tc-offload: on

root@nat-router2004:~# nft --version
nftables v1.0.7 (Old Doc Yak)
*This one was compiled from sources.*

root@nat-router2004:~# conntrack --version
conntrack v1.4.7 (conntrack-tools)
*This one was compiled from sources.*

nftables.conf
#!/usr/local/sbin/nft -f

flush ruleset

table ip filter {
    flowtable f {
    hook ingress priority filter; devices = { eth1, eth2 };
    flags offload;
    }

    chain input {
    type filter hook input priority filter; policy drop;
    ct state { related, established } accept
    iif "lo" accept
    iif "eth0" accept
    ip protocol icmp accept
    }

    chain forward {
    type filter hook forward priority filter; policy accept;
    ip protocol { tcp, udp } flow add @f
    }

    chain output {
    type filter hook output priority filter; policy accept;
    }
}

When i remove "flags offload" definition from flowtable everything works
fine, but in "conntrack -L" i see only [OFFLOAD] sign, instead of
[HW_OFFLOAD].

Anyone managed to force it to work as intended ? I am seeing only same
kind of questions on different internet maling lists but every subject
ends without any solution.

Best regards,

-- 
Wojciech Wrona

