From: zrm <zrm@trustiosity.com>
Subject: Re: middleman Raspberry Pi wired to wifi configuration
Date: Wed, 3 May 2017 13:10:58 -0400
Message-ID: <07a314f2-9a70-566a-e6d7-d40e5f0bbe5b@trustiosity.com>
References: <88D4348C-63A1-47FC-B096-9DB67B239098@cigarsoul.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.trustiosity.com;
        s=mx; t=1493831411; bh=z0dUcpJMHzwX9jwYubtqHZPebeZF8UiS+8S3/uijZZ0=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=0aTnp5klghSrRFeMxaFsXmrWk+0xBX7Zcn9F+C9HB1x0szp6wxzllXE3gXKwwW+1e
         FQYHuM4kAvDFactphVQ5AmlQQN19J0PmXIIFsOiailyYZtV3cSQmZfHFud9NKDqQaM
         F4xWcO+QNBKInSX7d5uqsow9zjVy7Zmxpgo+MubY=
In-Reply-To: <88D4348C-63A1-47FC-B096-9DB67B239098@cigarsoul.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

 > -A FORWARD -i eth0 -j ACCEPT

The chain default policy is already ACCEPT, so that does nothing.

Get rid of it and add this as the last filter rule:

-A FORWARD -i wlan0 -j REJECT

 > -A POSTROUTING -o eth0 -j MASQUERADE
 > -A POSTROUTING -o eth0 -j MASQUERADE

Duplicate rule, and you don't need either of them, because any NEW 
traffic from the outside should hit the REJECT rule so there is nothing 
to MASQUERADE.

But none of that should make things *slow*. It's probably some kind of 
wireless problem. Make sure the channels your two access points use are 
as far away from each other as possible and put the Pi as physically 
close to the office access point as you can.

The better solution if possible would be to connect your router to the 
office network with ethernet.


On 05/03/2017 07:32 AM, Jeremy Hansen wrote:
>
> I’m sharing a wifi connection in some office space.  I’d like to create my own internal network.  I have a raspberry pi, connected to the office wifi, a switch connected to the ethernet port of the pi, and a wifi AP connected to the switch.  DHCP and DNS running on the Pi…
>
> The configuration works and I’m able to gateway to the public internet via the AP connected to the Pi.
>
> It’s just very slow and I’m wondering if it has to do with my iptables rules and the fact that it’s basically NAT’ing twice, once at the pi for my internal network, and secondly at the office’s main internet connection...
>
> Here’s my current rules:
>
> *filter
> :INPUT ACCEPT [73:5085]
> :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [72:6792]
> -A FORWARD -i eth0 -j ACCEPT
> -A FORWARD -i wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
> COMMIT
> *nat
> :PREROUTING ACCEPT [43:2584]
> :INPUT ACCEPT [2:278]
> :OUTPUT ACCEPT [0:0]
> :POSTROUTING ACCEPT [0:0]
> -A POSTROUTING -o eth0 -j MASQUERADE
> -A POSTROUTING -o eth0 -j MASQUERADE
> -A POSTROUTING -o wlan0 -j SNAT --to-source 192.168.10.30
> COMMIT
>
> 192.168.10.30 is the IP of the wireless interface on the PI.  This wireless interface is connected to the office wifi…
>
> Not sure what other details I’m missing.  If there’s something I’m obviously doing wrong, please let me know.  It’s just extremely slow compared to going direct to the office network.
>
> Thank you
> -jeremy--
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
