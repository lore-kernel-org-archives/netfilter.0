From: stoffl4ever <stoffl4ever@gmail.com>
Subject: nft icmpv6 mld-listener-query rule not honored?
Date: Tue, 25 Nov 2014 14:27:15 +0100
Message-ID: <547483B3.6040207@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=Fge1fGoxGSj1eIGGUe4u5Uk4AKm/U5aFgwi6fQ0AzqY=;
        b=AaeANg4+X/JgdAzZ5lN/SbnUT+sAeEg4o0mQwtu+QFZvR0/9YYLz13JikkFi47oBG2
         3TqCfZUMYHGk15MlV24gc4CCMvlR1p6VgNYaM2bBKMRQJVa2/NYn5cEpY89YwmRBHSWZ
         Y44Gbv+NjmV/HLJ0mBXz3E2/mYyb2TWJiacp4h21VWsLmZVlK1ZjEJA+RbsGy6/yZRkL
         3DYTv7DCjbwmq6Y3VO5s6Eg9CjAhMWC1dd2rIwYZLjCAZhFX1dOkGTehHAy8Qfsxnnou
         +RbI43QYCfC6oCj7Xa8RgnGPYxSA9bOqUl+AzbSSXqI2G08o6LHDS6F/ANaeybE5OkuZ
         guXQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hallo,

I am trying to get a basic nftables set up working but i cannot figure
out why  the packets get rejected despite the afaik correct rule to all
this traffic. The overall result is that IPv6 connectivity is lost
because the router seams not to be able to route any IPv6 Traffic to the
host if Type=130 aka. mld-listener-query packets are rejected. May be
someone could help me and correct me where i am wrong or point me to
some documentation that would explain my misconceptions.

SysInfo:
kernel: 3.17.4.201411220955-1-grsec (all nf* modules loaded)
nft: nftables v0.3
Network setup via systemd-networkd: br0(bridge) is attached to
eth0(physical nic)

nft rule set:

table inet filter {
        chain input {
                 type filter hook input priority 0;
                 ip protocol icmp icmp type { echo-request} accept
                 ip6 nexthdr ipv6-icmp icmpv6 type { packet-too-big,
mld-listener-query, nd-router-advert, mld-listener-report,
nd-neighbor-advert, nd-neighbor-solicit, echo-reply,
mld-listener-reduction, echo-request, destination-unreachable} accept
                 log prefix "REJECTED - " counter packets 211 bytes
11718 reject
        }

        chain forward {
                 type filter hook forward priority 0;
        }

        chain output {
                 type filter hook output priority 0;
        }
}


From Log: (interesting message is the second one)

kernel: REJECTED - IN=br0 OUT= PHYSIN=eth0
MAC=01:00:5e:00:00:01:fe:54:00:02:14:8a:08:00 SRC=0.0.0.0 DST=224.0.0.1
LEN=32 TOS=0x00 PREC=0xC0 TTL=1 ID=0 DF PROTO=2
Nov 25 13:49:57
kernel: REJECTED - IN=br0 OUT= PHYSIN=eth0
MAC=33:33:00:00:00:01:fe:54:00:02:14:8a:86:dd
SRC=fe80:0000:0000:0000:8497:04ff:fee4:07e0
DST=ff02:0000:0000:0000:0000:0000:0000:0001 LEN=72 TC=0 HOPLIMIT=1
FLOWLBL=0 PROTO=ICMPv6 TYPE=130 CODE=0

Thank you with best regards,
chris
