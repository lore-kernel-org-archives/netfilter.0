From: Daniel <tech@tootai.net>
Subject: Howto 2 ipv6 nets, one through ipv4 tun vpn
Date: Tue, 22 Sep 2020 22:46:35 +0200
Message-ID: <3c924831-3660-40a3-7f17-f9607a6dea40@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1600807604; bh=J139HkMVCre0wKgSlNeB7il/QkMY9Toa4cSCWCZk49I=;
        h=From:Subject:To:Date:From;
        b=UCE5ihLxO8B078AUDHjRf5lklir+8g0tBBuwglnCXXwJvwGtDTC+AZ2FOfxLVy1HV
         2Jezw1C1nKOju/gXvjpGMZnN7KMvrefZLopGUNPF0Tz//1eLF6pg+Jorhu9tZ3AL6+
         AvEFGTF/EzjdLlz1RImxyMADJ7/Ru3P/euSNKDTM=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1600807604; bh=J139HkMVCre0wKgSlNeB7il/QkMY9Toa4cSCWCZk49I=;
        h=From:Subject:To:Date:From;
        b=UCE5ihLxO8B078AUDHjRf5lklir+8g0tBBuwglnCXXwJvwGtDTC+AZ2FOfxLVy1HV
         2Jezw1C1nKOju/gXvjpGMZnN7KMvrefZLopGUNPF0Tz//1eLF6pg+Jorhu9tZ3AL6+
         AvEFGTF/EzjdLlz1RImxyMADJ7/Ru3P/euSNKDTM=
Content-Language: fr-FR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter list <netfilter@vger.kernel.org>

Hi,

in office we have a /48 ipv6 from our provider and we have our own /48 
from RIPE. The provider ipv6 is in place and running well. Now we want 
to add ipv6 access in parallel using our own ipv6 range for our 
notebooks if outside office where there is no ipv6 possibility. This one 
is terminated in a bgp VM outside our office network.

We have setup an tun openvpn on notebooks where a /64 is sended through, 
all is good. Problem is that when notebooks are in the office, we can't 
reach them through their VPN ipv6 IP, packets are coming in but no 
answer. What we want to do is that all trafic coming in from tun 
interface goes out from this too.

What we did where $tmpif is our tun interface:

$fwtables add rule ip6 filter input iifname "$tmpif" meta mark set 201 
counter
$fwtables add rule ip6 filter forward iifname "$tmpif" accept
$fwtables add rule ip6 filter output oifname "$tmpif" meta mark == 
$mymark accept
$fwtables add rule ip6 nat postrouting oifname "$tmpif" counter 
masquerade random,persistent

ip -6 rule add fwmark 201 table isp1
ip -6 r add default via <ipv6 of other VPN end> dev $tmpif table isp1

Additionnaly, with this setup, we can't access <ipv6 of other VPN end> 
getting permission denied when trying to ping.

What is wrong with our setup ?

Thanks for any hint

-- 
Daniel
