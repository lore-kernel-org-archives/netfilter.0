From: Daniel <tech@tootai.net>
Subject: Re: Howto 2 ipv6 nets, one through ipv4 tun vpn
Date: Thu, 24 Sep 2020 23:13:24 +0200
Message-ID: <8853c5d6-cccc-325a-8d75-6aab843372fc@tootai.net>
References: <3c924831-3660-40a3-7f17-f9607a6dea40@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1600982005; bh=YtKfjEWfcveYkE+NmZJvJH+07X3bVamnX+jGdFd7V0s=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=bgrajWH5mpsFcM2oPc/cJ5Xs/atl2vtjclMGdhXR52qqm0Og1wfia2IcW3nzP/aFK
         M+4bUqmmPMvukUg4cUbVeiKsJ+HS86EpnBIGAv0Edoajx+1QRsSCN0jLNuhHQVjh16
         zJ/ulROyFo6VzAAZtNJ58XNXUaXr2skfiQIzWbOI=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1600982005; bh=YtKfjEWfcveYkE+NmZJvJH+07X3bVamnX+jGdFd7V0s=;
        h=Subject:From:To:References:Date:In-Reply-To:From;
        b=bgrajWH5mpsFcM2oPc/cJ5Xs/atl2vtjclMGdhXR52qqm0Og1wfia2IcW3nzP/aFK
         M+4bUqmmPMvukUg4cUbVeiKsJ+HS86EpnBIGAv0Edoajx+1QRsSCN0jLNuhHQVjh16
         zJ/ulROyFo6VzAAZtNJ58XNXUaXr2skfiQIzWbOI=
In-Reply-To: <3c924831-3660-40a3-7f17-f9607a6dea40@tootai.net>
Content-Language: fr-FR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Netfilter list <netfilter@vger.kernel.org>

No one ?

If not, does someone knows a clear documentation on how to setup 
nftables for two or more isp's ?

Thanks for any hint

Le 22/09/2020 à 22:46, Daniel a écrit :
> Hi,
>
> in office we have a /48 ipv6 from our provider and we have our own /48 
> from RIPE. The provider ipv6 is in place and running well. Now we want 
> to add ipv6 access in parallel using our own ipv6 range for our 
> notebooks if outside office where there is no ipv6 possibility. This 
> one is terminated in a bgp VM outside our office network.
>
> We have setup an tun openvpn on notebooks where a /64 is sended 
> through, all is good. Problem is that when notebooks are in the 
> office, we can't reach them through their VPN ipv6 IP, packets are 
> coming in but no answer. What we want to do is that all trafic coming 
> in from tun interface goes out from this too.
>
> What we did where $tmpif is our tun interface:
>
> $fwtables add rule ip6 filter input iifname "$tmpif" meta mark set 201 
> counter
> $fwtables add rule ip6 filter forward iifname "$tmpif" accept
> $fwtables add rule ip6 filter output oifname "$tmpif" meta mark == 
> $mymark accept
> $fwtables add rule ip6 nat postrouting oifname "$tmpif" counter 
> masquerade random,persistent
>
> ip -6 rule add fwmark 201 table isp1
> ip -6 r add default via <ipv6 of other VPN end> dev $tmpif table isp1
>
> Additionnaly, with this setup, we can't access <ipv6 of other VPN end> 
> getting permission denied when trying to ping.
>
> What is wrong with our setup ?
>
> Thanks for any hint
>
-- 
Daniel
