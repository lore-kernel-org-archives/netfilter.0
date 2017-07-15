From: sorcus@inwebse.com
Subject: Re: What wrong with snat in nftables?
Date: Sat, 15 Jul 2017 22:47:59 +0000
Message-ID: <b9e98380dacecbec99d0e0aea7847042@inwebse.com>
References: <691d19d7765158dc9d10dd62b5033536@inwebse.com>
 <CAEzD07JY4pix=dh0W7rZ1MU0MxCo=Ky32o3EFtbf9i44B+7BMQ@mail.gmail.com>
 <e55eeed4d10d0209dc4441a83b1bc922@inwebse.com>
 <6687da5a7ee70c19e1c3b41fea5fb20f@inwebse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inwebse.com
        ; s=mail; h=Message-ID:References:In-Reply-To:Cc:From:Date:
        Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:Sender:
        Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
        :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=lye3DS1LCPtqmb1V5T50zEw6i/eMlpGRhK+iR5hB1Ls=; b=cv8Hf9PkunggJuDwqT/jxzRyVN
        GjhivrCX/3j6NOgECfzmdxvAWRlAWcADTJ4z9lNqYgy7xBwoF56c2UHzPW9/1LwVeGZgIOYXGa+he
        kAIfDbjTaIwvuiXq0CJYChwOsZEEqr75bR5gmXTSUdiV9ycyZtYiawKjF0I+0r1CgYig=;
In-Reply-To: <6687da5a7ee70c19e1c3b41fea5fb20f@inwebse.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: netfilter@vger.kernel.org

Output for command nft --debug all -f ruleset

https://gist.github.com/MrSorcus/2c8c65461e3c65fb70364f3a70d95439


On 2017-07-14 01:06, sorcus@inwebse.com wrote:
> Nftables rules for server -
> https://gist.github.com/MrSorcus/17827298ad81970cc272b9e7f779923f
> 
> Nftables rules for client -
> https://gist.github.com/MrSorcus/ad05f19759e02f92aac5d9c246f56cf6
> 
> I used information from here -
> https://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Address_Translation_(NAT)
> 
>> 1. flush conntrack entries after changing of rules in the nat table.
> 
> "conntrack -D" - show me "0 flow entries have been deleted.". But
> "/proc/net/nf_conntrack" has 3 entries...
> 
>> 2. add counters to nftables nat rule to check that rule really hit the 
>> packets.
> 
> chain postrouting {
>   type nat hook postrouting priority 0; policy drop;
>   oif "enp0s3" nftrace set 1 counter packets 3 bytes 312 snat to
> 2a01:4f8:xx:xx::10
>   nftrace set 1 counter packets 0 bytes 0 accept comment "IPv6 < Nat <
> Postrouting"
> }
> 
> With git version of nftables, libmnl & libnftnl and kernels 4.9, 4.11
> & 4.12 doesn't work...
> With archlinux server doesn't work too...

