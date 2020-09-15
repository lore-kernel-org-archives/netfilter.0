From: Daniel <tech@tootai.net>
Subject: Re: Error adding a DNAT rule
Date: Tue, 15 Sep 2020 10:57:34 +0200
Message-ID: <f470070f-4193-8a0d-8407-89b8d3b11d42@tootai.net>
References: <CAGNib0wnZ-0WmV1quBXGZr3uF7n-ZhDxtiLoeGyea4ygwQvcLw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1600160257; bh=PBgJSw7CUeJj6JGjSZx5nd60B0YOdwnWTweswBP/fqA=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=RLakydB1d5HMWCs0NL/oWyLRqve/bjRIx+losx0C1T6yaawG5qENIzfruPEam0PUn
         Fe1Cx8w5qjkE2CQHyZYZmbu8M0EZMDLMwevhajf0ScuZDHi/I6KalpIvW+XC0YivJH
         kKQ11tCFCX1QFC6zljFWawUjAkkGlaDQ39NHd8R8=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1600160257; bh=PBgJSw7CUeJj6JGjSZx5nd60B0YOdwnWTweswBP/fqA=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=RLakydB1d5HMWCs0NL/oWyLRqve/bjRIx+losx0C1T6yaawG5qENIzfruPEam0PUn
         Fe1Cx8w5qjkE2CQHyZYZmbu8M0EZMDLMwevhajf0ScuZDHi/I6KalpIvW+XC0YivJH
         kKQ11tCFCX1QFC6zljFWawUjAkkGlaDQ39NHd8R8=
In-Reply-To: <CAGNib0wnZ-0WmV1quBXGZr3uF7n-ZhDxtiLoeGyea4ygwQvcLw@mail.gmail.com>
Content-Language: fr-FR
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: vikaig <vikaig99@gmail.com>, netfilter@vger.kernel.org

Hi

Le 15/09/2020 à 05:07, vikaig a écrit :
> Hello, I'm trying to add a DNAT rule, I tried many variations from the
> Internet, in an IRC chat I was confirmed that my rule should work, but
> I get an error, what could be wrong?(I use Debian 10)
> $ sudo nft list ruleset
> table inet nat {
>      chain prerouting {
>          type nat hook prerouting priority dstnat; policy accept;
>      }
>
>      chain postrouting {
>          type nat hook postrouting priority srcnat; policy accept;
>          oifname "ens3" ip6 saddr fd00::/48 masquerade
>          oifname "ens3" ip saddr 10.0.0.0/24 masquerade
>      }
> }
> table inet filter {
>      chain input {
>          type filter hook input priority filter; policy accept;
>          ct state { established, related } accept
>          ct state invalid drop
>          iifname "lo" accept
>          ip protocol icmp accept
>          meta l4proto ipv6-icmp accept
>          tcp dport 20414 accept
>          udp dport 51820 accept
>          reject
>      }
>
>      chain forward {
>          type filter hook forward priority filter; policy accept;
>      }
>
>      chain output {
>          type filter hook output priority filter; policy accept;
>      }
> }
> $ sudo nft 'add rule inet nat prerouting iifname "ens3" tcp dport
> 20415 dnat ip to 10.0.0.2'
> Error: Could not process rule: No such file or directory
> add rule inet nat prerouting iifname "ens3" tcp dport 20415 dnat ip to 10.0.0.2
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Try by removing the ' before add and after 10.0.0.2

sudo nft add rule inet nat prerouting iifname "ens3" tcp dport 20415 dnat ip to 10.0.0.2

-- 
Daniel
