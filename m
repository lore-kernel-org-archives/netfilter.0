From: "Mario Leone" <mario.leone@certimeter.it>
Subject: Bridge
Date: Wed, 8 Feb 2017 17:36:40 +0100
Message-ID: <008c01d28229$87da0cd0$978e2670$@certimeter.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aruba.it; s=a1;
        t=1486571804; bh=K99yBLKJhDDck+myf9eBKZyiOygRygnaANEp8wSSdSI=;
        h=From:To:Subject:Date:MIME-Version:Content-Type;
        b=cvkqFqqXb+YK3SVxboXcQlvEk0iP01a9idyiHthNa6HTG3rQmqlOG1EK4NIWEREtv
         z8irV3yaHH0gmtyodtY1b5ys9IP5vB5rFawxDHueGSI0KE1GwL3KKGhAFfUijytMcm
         6pD9c2/czkIdYqflQeiNT3blpfXRJ5rmndvCvqGR4CZIMxB9Vy62Y2ETUBwmnlj1tW
         kqs2qsmVbqtOzeBgeuV9/74c/1e9Vk1YShyhaNrdSijH083DvQ5EKSxKiUFZUL4ioG
         SxEIqYGjNk5EHC/m0lGfXOzw4mgSFrMX9I/WG3oC9xpG2ICAkoTclnO/hbhEihbEE6
         /jvqFgNHvBeGQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Dear users,

I have a GPON fiber home connection that consists in 2 apparatus: 

- Optical network terminal ( Huawei HG8010H)
- My ISP custom firmware router 

The router connects to ONT via WAN port and the traffic is basically ipv4
incapsulated in pppoe session incapsulated in 2 vlan trunk, one for http(s)
one for voip

I want so see the traffic that flows between router and ont so i built a
linux box with 2 ports configurated ad bridge with no ip

ONT ------ eth1[BOX]eth0 ------- Router

The tipical packet that flows had source mac address and destination mac
address of ont and router(depending on the direction) and the rest inside.
I could just put wireshark listening on br0 but I can see only unencrypted
traffic, so I want to do something a little more complicated.

I would intercept traffic on both directions and redirect  it to localhost
proxy with 3 stages:

1) setup ebtables to recognize traffic on http vlan(so all traffic) and
bring it to layer3
2) setup iptables to NAT packet on some ports to be intercepted by my ssl
proxy and leave untouched all other traffic
3) nat traffic back to original destination like it was sent by the router
or vice versa from the server

I failed any attempt to redirect traffic or even log it passing trough the
bridge.
Any help? 

Thanks



