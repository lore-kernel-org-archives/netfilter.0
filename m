From: Adam Goldberg <adam@ajg.net>
Subject: Incoming Connections with IPv6 NETMAP for Multiple ISPs Only Work for
 1 ISP at a time.
Date: Fri, 12 Feb 2021 11:48:29 -0500
Message-ID: <81636846-8E33-4DAB-AA20-C8F810450AAF@ajg.net>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.10\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ajg.net; s=x;
        h=from:content-transfer-encoding:mime-version:subject:message-id:date
         :to;
        bh=pqgmbeTHQl0Q7aMQEhg7ObQWQpIOvtZdgNxsVzstuC4=;
        b=mkxH+EqLvul6XCJ2VdfTLDHcxxF2c2f9PziXLjPm8p7HoqLdP68hg/DXUqSiVBi5CA
         aIzw/RTumL88xPtomPg0YwmtKdAZsa8q4h7r7MC8m45X5rCTdml3DWTm3GYcuag+KKIo
         Yx6kOFBLxODuiR0/8ZhcDeOUEqccaw6tYxwUI=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I am having an issue with IPv6 NETMAP on a multiwan router using =
nftables v0.9.8 on kernel 5.10.13-1.

We are using ULAs internally for all our LAN hosts to load-balance IPv6 =
connections over multiple ISPs.

Externally, we have 3 ISPs. We are using IPTABLES NETMAP to map our =
internal IPs to each external IPv6 IP prefix. This works great for IPv6 =
load-balancing. We can use policy based routing to route certain hosts =
and certain destinations through particular ISPs.

However, we have an issue with connections from the outside reaching =
internal hosts. Outside connections only work when accessing the IP =
range of WAN1, which is the default gateway on the router. Incoming =
connections through WAN2 and WAN3 fail when WAN1 is the default gateway. =
If I change the default gateway to WAN2, then incoming connections work =
through the WAN2 IPv6 range.

I ran tcpdump to see what's going on, and it appears connections come in =
over WAN1/WAN2/WAN3 and go out over WAN1 (or whatever the default =
gateway is) regardless. This causes dropped packets.=20

With respect to NETMAP, how can I have incoming connections over WAN2 go =
back out through WAN2, WAN3 through WAN3, etc... Is this possible?

Thank you.=
