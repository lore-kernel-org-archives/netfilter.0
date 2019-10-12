From: Daniel Huhardeaux <tech@tootai.net>
Subject: nft and defined variables
Date: Sat, 12 Oct 2019 21:52:20 +0200
Message-ID: <7e6d4739-1877-c195-dc7b-95a111dd1cbc@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1570909941; bh=2XoQu6ftXTTxiyuBt+pj0IlCd5aVW4wWuxavNnlcUqs=;
        h=To:From:Subject:Date:From;
        b=R8tcxA/9yqubcB4O3/pkmWajuVTjLnvOhVSdPCHXIKcymlALnblL/NR6Ku2R4DYfZ
         5JaaC/a2CFgBJW0Z4AeSRTFC3Y+tr3v/Owaq5ZhvRlhWdnu5H8qV6HhkPBjaVeh4VS
         cov8aDrusBZy7TXHI5rcKOhRPET1d5Lno5VKVvSo=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1570909941; bh=2XoQu6ftXTTxiyuBt+pj0IlCd5aVW4wWuxavNnlcUqs=;
        h=To:From:Subject:Date:From;
        b=R8tcxA/9yqubcB4O3/pkmWajuVTjLnvOhVSdPCHXIKcymlALnblL/NR6Ku2R4DYfZ
         5JaaC/a2CFgBJW0Z4AeSRTFC3Y+tr3v/Owaq5ZhvRlhWdnu5H8qV6HhkPBjaVeh4VS
         cov8aDrusBZy7TXHI5rcKOhRPET1d5Lno5VKVvSo=
Content-Language: fr
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I want to script nft rules using sh + nft. The sh script contains 
variables set for the host and passed to nft using include like eg 
include "/etc/nftables/local.conf"

It's OK for definition of IPs or port but not for alaphanumerical 
variables. For instance, I want to pass as variable icmp_limit (number) 
and icmp_measure (alpha) to include them in nft rule like blabla ... 
limit rate over $icmp_limit/$icmp_measure ...

define icmp_limit = { 20 }
define icmp_measure = minute

but the result gives

In file included from ./ip4fw.nft:3:1-35:
/etc/nftables/local.conf:10:23-28: Error: syntax error, unexpected minute
define icmp_measure = minute
                       ^^^^^^
./ip4fw.nft:36:110-110: Error: syntax error, unexpected '$', expecting 
number
add rule ip filter input iif $IFACE meta l4proto icmp icmp type { 
echo-reply, echo-request } limit rate over $icmp_limit/$icmp_measure 
counter drop

Same for KEEPSTATE variable but IFACE one is OK

define IFACE = ens3
define KEEPSTATE = "state related, established"

./ip4fw.nft:49:40-40: Error: syntax error, unexpected '$'
add rule ip filter input iif $IFACE ct $KEEPSTATE counter accept

What is the way to define alphanumerical variables ? I tried to escape 
quotes with \ to remove them, to escape slash with \, no way to achieve 
my goal :(

Thanks for any hint

-- 
Daniel
