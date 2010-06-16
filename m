From: Patrick McHardy <kaber@trash.net>
Subject: Re: SCTP ASSOCIATION FAILOVER ISSUE
Date: Wed, 16 Jun 2010 05:39:15 +0200
Message-ID: <4C184763.4040700@trash.net>
References: <AANLkTikiIc1_KD6JmKgOw9_x0lUHYTtLsPjqQLDmtxEI@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikiIc1_KD6JmKgOw9_x0lUHYTtLsPjqQLDmtxEI@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: manoj s <ms.email0@gmail.com>
Cc: netfilter@vger.kernel.org

manoj s wrote:
> We have blades (BL1) that form an SCTP association with an external
> server through a
> set of blades that perform SNAT through IP tables (Bld13 and Bld14).
> During the start of the test Bld13 is the active blade and Bld14 is
> a standby. 'bond2' is the interface on the Bld13 and Bld14 blades that
> interface
> with the external world.
>
> The IP tables rule to perform SNAT is:
> -A POSTROUTING -o bond2 -j SNAT --to-source 10.19.146.147
> When a blade failover occurs, the above rule is applied to the
> newly active blade to continue SNAT.
> The failed blade is rebooted immediately.
>
> In all the tests, we had loaded the module "nf_conntrack_proto_sctp".
>
> In this example,
> (diagram best viewed using fixed width fonts)
>
>                  | --------->      Bld13     --------->     |
>                  |    192.168.20.29 |  10.19.146.147        |
>                  |    Bld IP (int)     Bld IP (ext)         |
>    BL1           |    IPV4                bond2             |
> 192.168.20.21    |                                          |   DCT
> Payload IP (int) |                                          | 10.19.169.230
>    IPV4          |                 Bld14                    | Port 230
> Port 2905        |   192.168.20.30  |   (NOT-ACTIVE)        |
>                  |    Bld IP (int)          (ext)           |
>                  |      IPV4                bond2           |
>
> During a regular session, when we perform a tcpdump on bond2 (outgoing
> interface), we see that the source address is 10.19.146.147 which is the
> desired behavior since it indicates that the packets are NAT'ed.
>
> When blade Bld13 fails/reboots, Bld14 takes over as the active blade,
> so we apply the SNAT rules on the blade immediately (automatically).
> When this happens, we see that the outgoing SCTP packets are
> not NAT'ed. i.e, when we perform a tcpdump on bond2 of Bld14, the source
> address is that of BL1 (192.168.20.21) which is the internal address.
>
>
>                  |                 Bld13                    |
>                  |            *** FAILED ***                |
>    BL1           |                                          |
> 192.168.20.21    |                                          |   DCT
> Payload IP (int) |                                          | 10.19.169.230
>    IPV4          |  --------->     Bld14 --------->         | Port 2906
> Port 2905        |   192.168.20.30  |   10.19.146.147       |
>                  |    Bld IP (int)      Bld IP (ext)        |
>                  |      IPV4                bond2           |
>
>
> This behavior of not SNAT'ing continues until we re-establish the association.
> When the association is re-established, the NAT'ing takes place and the source
> address at bond2 of Bld14 shows up as 10.19.146.147 which is the
> desired address.
>
> The question therefore is, why does SNAT for SCTP not take place until the
> association is re-established upon a failover?
>   

You're probably not quick enough applying the SNAT rule. Once the
first packet has passed through Bld14, the connection tracking entry
is already set up without NAT and the SNAT rule doesn't apply anymore.

> The reason why we think it is a bug, is that until the association is
> re-established, the Bld14 blade exposes the internal blade's IP addresses
> to the external blade.
>   
