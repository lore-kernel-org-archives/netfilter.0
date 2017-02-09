From: Alfredo Rezinovsky <alfrenovsky@gmail.com>
Subject: Re: Bridge
Date: Thu, 9 Feb 2017 11:12:10 -0300
Message-ID: <084215be-69e6-fd05-64ff-996a23ce7373@gmail.com>
References: <008c01d28229$87da0cd0$978e2670$@certimeter.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=6pKk18LoKDLpsiqBiDQfZICvdDeBqNS7pGLkVXRPCIM=;
        b=JCiyMxAx5shh9atLO7iblHI8VjySzuUo6mOkDTSQAyg2mf/0SdKmaFs4YassZhstG0
         Q74K/8SRdMqnvYuGAUZTvQKO6oyulbxe4BJhbBiSL7wdZGSOFF72vy69qWMt3uvac03u
         Ptt7Ym4KzGwgLx95/MaV250M9ijeI+egrTsByWQQE7kjF8UaqvlWoEVTl+6lQdNtLOmx
         KLSacBFpdUH33H1taLJB5TGgMF6FlI8awI8wXotmr9KBvYvAzYos67a8Qsit0iadVfDv
         vZ8vvFR2Xq496Ss7zi6hLpAO95nlj5vblT956QoLN/tgMHIJiMvbV4M7FO2Vf5WwN4yo
         JmwA==
In-Reply-To: <008c01d28229$87da0cd0$978e2670$@certimeter.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mario Leone <mario.leone@certimeter.it>, netfilter@vger.kernel.org



On 08/02/17 13:36, Mario Leone wrote:
> Dear users,
>
> I have a GPON fiber home connection that consists in 2 apparatus:
>
> - Optical network terminal ( Huawei HG8010H)
> - My ISP custom firmware router
>
> The router connects to ONT via WAN port and the traffic is basically ipv4
> incapsulated in pppoe session incapsulated in 2 vlan trunk, one for http(s)
> one for voip
>
> I want so see the traffic that flows between router and ont so i built a
> linux box with 2 ports configurated ad bridge with no ip
>
> ONT ------ eth1[BOX]eth0 ------- Router
>
> The tipical packet that flows had source mac address and destination mac
> address of ont and router(depending on the direction) and the rest inside.
> I could just put wireshark listening on br0 but I can see only unencrypted
> traffic, so I want to do something a little more complicated.
>
> I would intercept traffic on both directions and redirect  it to localhost
> proxy with 3 stages:
>
> 1) setup ebtables to recognize traffic on http vlan(so all traffic) and
> bring it to layer3
> 2) setup iptables to NAT packet on some ports to be intercepted by my ssl
> proxy and leave untouched all other traffic
> 3) nat traffic back to original destination like it was sent by the router
> or vice versa from the server
>
> I failed any attempt to redirect traffic or even log it passing trough the
> bridge.
> Any help?
>
> Thanks
>
>
# First rule is only an optimization.
ebtables -t broute -A BROUTING -d ${my_bridge_mac} -p ipv4 -j redirect 
--redirect-target DROP

#Those are the rules to bring http traffic to layer 3
ebtables -t broute -A BROUTING -p ipv4 --ip-proto tcp --ip-dport 80 -j 
redirect --redirect-target DROP
ebtables -t broute -A BROUTING -p ipv4 --ip-proto tcp --ip-sport 80 -j 
redirect --redirect-target DROP

# Some more may be needed because your vlan configuration.

When in layer 3. the Router must have routes to reach ONT, the Router 
and the IPs behind Router. The router needs an IP to ask for ARP in both 
sides.
The proxy (unless in tproxy mode) needs to have an IP to use al source 
for its packets. Even in tproxy, the proxy needs a source IP to ask NS 
queries.


