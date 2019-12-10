From: Mike <mike@mdabbs.org>
Subject: trying to duplicate udp packets destined for port 67 to port 6767 on
 same host
Date: Mon, 9 Dec 2019 21:22:30 -0600
Message-ID: <ba39eeef-6fa0-10de-e45d-8b121f1c37e5@mdabbs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 gw2.litvpn.com 24498E3EF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mdabbs.org; s=relay;
        t=1575948189; bh=5DctLiFe62rubBfwCLSKYP1Xtg8jnneSRIalswuqTQU=;
        h=To:From:Subject:Date:From;
        b=UHIGd1IcRto7A0JqtA6tw8Eohx2g4yNnxFcri4Uqe1JbDpyQqvjhN9Yf+SlWhKtNR
         1e/Gzdv4kzCJReyKyjzjQxGnx6dCGMX5Ht1BB8re2PaJASrHJSkK4Pa2mpG7bwLY/q
         mYZCgk7OZCmp3KnldJKRZRUMN2/KbgA5svi1jcIw=
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I have a DHCP server on a host but also want to run openHAB which has 
the ability to listen on port 6767 for DHCP requests. The docs say to 
execute the following commands to replicate the packets on to port 6767:

iptables -A PREROUTING -t mangle -p udp ! -s 127.0.0.1 --dport 67 -j TEE 
--gateway 127.0.0.1
iptables -A OUTPUT -t nat -p udp -s 127.0.0.1/32 --dport 67 -j DNAT --to 
127.0.0.1:6767

When I do this though, I see the mangle rule packet count start to 
skyrocket and the nat rule never sees any packets. When I try a slight 
variation below, I prevent the skyrocketing packet count but the nat 
rule still never kicks in.

iptables -A PREROUTING -t mangle -p udp ! -i lo --dport 67 -j TEE 
--gateway 127.0.0.1

I have tried various combinations of ip_forward and route_localnet


I hope this is the right mailing list and someone could offer some help. 
I can provide nf trace logs if needed, or any other kind of info.

Thanks,

Mike

