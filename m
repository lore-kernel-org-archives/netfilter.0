From: Bruno Meirelles <bmeirelles@gmail.com>
Subject: Re: Rule does not work. This is configuration error or bug?
Date: Sat, 24 Sep 2022 18:19:39 -0300
Message-ID: <e8a8ecad-8ab0-bc1a-cbb9-8789f10c25fa@gmail.com>
References: <88178cba-fbcf-70d0-bf11-380c4260d0cc@gmail.com>
 <c6898217-2a57-cdb9-c6ec-effc28075048@freenet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date;
        bh=BksiO8+WluIpUq5x3RRPBNfW86Bpr5ZhHhp3Yw+Eei8=;
        b=H3er/AgbYFSOUMmQjo4byP+wf9MnemLwilrHuf5VXHF/95ZWctLGYk/mhu8s/1G25u
         54NTJIunMfnBjoR3sgFjBpFZpbwyFYnbRb+v6kAdfHsF6b6PewXi3D8Z52+yRa5ubs0L
         PpVVBUBZ9k0tRqQVgWrcrM+Jtfq4l+9d3nd3nK82jFaEGMSFHwZ2mmxBKGKqeANgG3ks
         Fa7o2tudOrhXJ0EGeDp8k454i3Vwf0p+CNnKVmIrSfZmCW1euhRz+nIUjs2wsI5xHooF
         5NmTbKpXGcBS8K+OOZOft5+pUwdBSPboyN91o6UqJfm3k6SlmJY4+pg/KJftoJapeVWH
         LIYQ==
Content-Language: pt-BR
In-Reply-To: <c6898217-2a57-cdb9-c6ec-effc28075048@freenet.de>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Benno <b.ohnsorg@freenet.de>, netfilter@vger.kernel.org

Hi Benno,

Yes, this is used to match tcp and udp in the same rule.

It is described in the official wiki at the end of this page:
https://wiki.nftables.org/wiki-nftables/index.php/Matching_packet_headers

I tried using dnat and it didn't work either.

nft add rule inet nat PREROUTING iifname "$LAN" meta l4proto {tcp, udp} 
th dport 53 counter dnat ip6 to fd00:ffff:fffe:100::1:53 comment 
Redirect-DNS

nft list ruleset
table inet nat {
         chain PREROUTING {
                 type nat hook prerouting priority dstnat; policy accept;
                 iifname "br0" meta l4proto { tcp, udp } th dport 53 
counter packets 1 bytes 138 dnat ip6 to fd00:ffff:fffe:100::1:53 comment 
"Redirect-DNS"

I tried using ip6tables and it didn't work either. Several people in 
google searches have successfully achieved using ip6tables.

Rules are the same for ipv4 and ipv6, except ipv4 has masquerade. I 
created masquerade for ipv6 and it didn't work either..

All packages are the latest version:

root@router:~# nft --version
nftables v1.0.5 (Lester Gooch #4)

root@router:~# ip6tables --version
ip6tables v1.8.8 (nf_tables)

root@router:~# modinfo nf_conntrack
filename: /lib/modules/5.19.0-1-amd64/kernel/net/netfilter/nf_conntrack.ko
license:        GPL
alias:          nf_conntrack-10
alias:          nf_conntrack-2
alias:          ip_conntrack
depends:        nf_defrag_ipv4,nf_defrag_ipv6,libcrc32c
retpoline:      Y
intree:         Y
name:           nf_conntrack
vermagic:       5.19.0-1-amd64 SMP preempt mod_unload modversions


I really appreciate if anyone can help me.

hugs,

Bruno.


Em 24/09/2022 03:18, Benno escreveu:
> l4proto?
>
> Am 24.09.22 um 00:07 schrieb Bruno Meirelles:
>> Hi friends,
>>
>> […]
>>
>> nft add rule inet nat PREROUTING iifname "$LAN" meta l4proto {tcp, udp}
>> th dport 53 counter redirect to :53 comment Redirect-DNS
>>
>> In ipv4 traffic, the rule works perfectly. In ipv6 traffic I do not
>> receive a response.
>>
>> […]
>>
>> Thanks,
>>
>> Bruno.
>>
>>
>>
