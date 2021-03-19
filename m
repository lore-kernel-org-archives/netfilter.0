From: tech <tech@format-tv.net>
Subject: Re: Traffic drops when using flow offload for nftables based NAT
Date: Fri, 19 Mar 2021 16:04:08 +0200
Message-ID: <54da3fcf9ef0d0e53a76ee418a44a211@format-tv.net>
References: <4986dab7b8162afc20ee5d21e42cca80@format-tv.net>
 <20210316223656.GA981@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=format-tv.net; h=
        mime-version:content-type:content-transfer-encoding:date:from:to
        :cc:subject:in-reply-to:references:message-id; s=mainsel; bh=t0n
        cnlKG59oIezi7YEekgLAu/0M=; b=IHpzTjBmXC8WctOKqvuKC2bgDao9YxINXoN
        Dm6FAzEpkpYFTVombmrDYty7OkP7x20D/ngPZzNci75aHpX+UoWdK9FSW2fdhtcp
        U46QS3U2a7HZGhTp9FHORwCaU0JGXw6JNtVNWO1k6l/JTxusMqI7zhELEi5wmmfN
        TLk3pFZo=
In-Reply-To: <20210316223656.GA981@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Done, kernel was compiled from https://www.kernel.org/:
$ uname -a
Linux nat40g 5.11.6 #1 SMP Wed Mar 17 10:28:06 UTC 2021 x86_64 x86_64 
x86_64 GNU/Linux
$ cat /etc/os-release
VERSION="20.04.2 LTS (Focal Fossa)"

# lshw -c network -businfo
Bus info          Device     Class          Description
=======================================================
pci@0000:01:00.0  enp1s0f0   network        MT27700 Family [ConnectX-4]
pci@0000:01:00.1  enp1s0f1   network        MT27700 Family [ConnectX-4]

I'm using bonding with one 40G link (pci@0000:01:00.0)

https://pasteboard.co/JTlmMnj.png


Pablo Neira Ayuso писал 2021-03-17 00:36:
> On Thu, Mar 11, 2021 at 12:17:18PM +0200, tech wrote:
>> Hi,
>> I'm trying to augment my nft based NAT server with flow offload 
>> feature.
>> Prerequisites:
>> # uname -a
>> Linux nat40g 5.4.0-66-generic #74-Ubuntu SMP Wed Jan 27 22:54:38 UTC 
>> 2021
> 
> What kernel version are you using specifically as of kernel.org?
> 
>> x86_64 x86_64 x86_64 GNU/Linux
>> ethtool -G enp1s0f0 tx 8192
>> ethtool -G enp1s0f0 rx 8192
>> ethtool -K enp1s0f0 hw-tc-offload on
>> 
>> Ethernet controller: Mellanox Technologies MT27700 Family [ConnectX-4]
>> 
>> # cat /opt/nftables.conf
>> flush ruleset
>> 
>> table ip filter {
>>         chain input {
>>                 type filter hook input priority 0; policy accept;
>>                 ct state established accept
>>                 iif "vlan4" counter drop
>>                 iif "vlan5" counter drop
>>         }
>> 
>>         flowtable fastnat {
>>                 hook ingress priority 0
>>                 devices = { vlan4, vlan5 }
>>         }
>> 
>>         chain forward {
>>                 type filter hook forward priority 0; policy accept;
>>                 ip protocol { tcp , udp } flow offload @fastnat;
>>         }
>> }
>> 
>> 
>> table ip nat {
>>         chain post {
>>                 type nat hook postrouting priority 100; policy accept;
>>                 ip saddr 10.0.0.0/8 oif "vlan5" snat to 
>> 19.2.5.1-19.2.5.125
>> persistent
>>         }
>> 
>>         chain pre {
>>                 type nat hook prerouting priority -100; policy accept;
>>         }
>> }
>> 
>> All good when there is up to 12G overall traffic volume, but when my 
>> traffic
>> overall volume exceeds 12+G I experience input drops.
> 
> Probably you are missing this fix?
> 
> commit 8d6bca156e47d68551750a384b3ff49384c67be3
> Author: Sven Auhagen <sven.auhagen@voleatech.de>
> Date:   Tue Feb 2 18:01:16 2021 +0100
> 
>     netfilter: flowtable: fix tcp and udp header checksum update
> 
>> If I comment out this portion of configuration:
>> flowtable fastnat {
>>         hook ingress priority 0
>>         devices = { vlan4, vlan5 }
>> }
>> 
>> chain forward {
>>         type filter hook forward priority 0; policy accept;
>>         ip protocol { tcp , udp } flow offload @fastnat;
>> }
>> The result no drops up to 21.5G and occur when CPU utilization up to 
>> 85%.
>> P.S. If someone interested I can share images.
