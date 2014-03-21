From: <mabra@manfbraun.de>
Subject: Understanding ebtables
Date: Fri, 21 Mar 2014 01:34:21 +0100
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAOosgHnoPqdNlUO2DUrQ/DfCgAAAEAAAABe512YLINNJlCLD9myQIzgBAAAAAA==@manfbraun.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello !

I am on the road to learn to protect my server and I want
to suppress the unrequested ARPs, coming from the
WAN side of my linux router from the KabelBW network.

I am using debian squeeze and I installed ebtables
successfully [ebtables v2.0.9-2].

I just started with a simple rule:

ebtables -t filter -A INPUT -i eth1 -d ff:ff:ff:ff:ff:ff -j CONTINUE


This is simply to allow me to see the counters. But nothing is shown:

>>>
[/ops/fw]ebtables -L --Lc
Bridge table: filter

Bridge chain: INPUT, entries: 1, policy: ACCEPT
-d Broadcast -i eth1 -j CONTINUE , pcnt = 0 -- bcnt = 0

Bridge chain: FORWARD, entries: 1, policy: ACCEPT
-p ARP -i eth1 -j DROP , pcnt = 0 -- bcnt = 0

Bridge chain: OUTPUT, entries: 0, policy: ACCEPT
<<<

I am running tcpdump and I am seeing a lot of this
packets with the dest address like in the rule above.

I do not have a separate bridge configured, just use
my WAN interface.

Any help would be really great!

Thanks anyway and
best regards,

Manfred

[Probably a second attempt - missed the message]




