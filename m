From: Robert White <rwhite@pobox.com>
Subject: Boundary Flag for "site" (IPv6) [Kernel Change?]
Date: Fri, 20 Mar 2020 03:47:44 +0000
Message-ID: <cf48c1f8-4490-f1ad-b2b3-232bf4d85708@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=comcastmailservice.net; s=20180828_2048; t=1584676066;
        bh=+It8RnSErgNm0Vo9hserJ5pL/t16A1simjydUx+tCus=;
        h=Received:Received:To:From:Subject:Message-ID:Date:MIME-Version:
         Content-Type;
        b=b3uazWIYeazpNuwn3DF3AxUDLIYlad89WAzaXS8GNc+CFm7OqofMX4AzPufL5Ub0E
         DYMSrAIRf49SFYeOrJb67pkQfbx1tmDc16Hfn0/1AgV8KvGRnTDK4bJ6mgkvHuM+rE
         W9GXk9+wUikTZdji/7R3PlQiUdha8KCxZ058gIHJjglqmC+ni47u1fo0Mnw6GXpfP0
         CxVqZVsxq2fUZwjJ8p5NCwfmFC0eIPM2ODNAmnddcTkFTG1m8+arIlDE3FSGWLzRMZ
         XCmPW0SAHTOvECzgASnFOjtJDnfFhD/jTCA9lM45IRH51f5tniMd4t1VXh6Bv1WYqT
         nIRUTQQ8ZGypQ==
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Please excuse me if there is already a mechanism for this that is at the 
same level but that I just missed...

So I was thinking about the IPv6 address model and there's a "site 
local" address bit, but I don't see any good/easy way to divide a router 
into multiple "sites".

It occurs to me that every interface should be allocated an integer 
designator.

Within the router the site designator would marry the interfaces with 
the same non-zero designator into one conceptual site each.

A zero designator (the default) represents that the adapter is the only 
local interface that touches the site.

So lets say you have a border router, eth1, eth4, and eth5 go the 
various segments of the "research site"; eth2 and eth3 go to 
"corporate". Then there are the primary and backup broadband links, and 
maybe some wifi for guests. Same too for vlans etc.

Most of the interfaces would get a site number of zero, and site 
addresses and link addresses would function identically on packets 
asserted on sockets bound to such interfaces.

The "corporate" and "research" sites would each get a (locally 
arbitrary) site number such as corporate=7 and research=842. All the 
interfaces that are part of that site would be assigned that number on 
this router and packets asserted on sockets bound to such interfaces 
would route and resolve site addresses by considering all the interfaces 
with the same designator.

This doesn't change any on-wire protocol, and other routers on e.g. 
"research" don't have to use the same number for that site in their systems.

Such a simple arrangement would skip a whole bunch of rules and things 
easier.

In particular it would let addresses like "printhub%rsrh1" vs 
"printhub%corp2" work if the interfaces were so named and e.g. printhub 
resolved to a site local address that was reused all throughout the 
organization.

In practice, at it's core, the need to selectively propagate "site" 
addresses without leaking them globally really ought to be very early 
and very low level.

ASIDE: you can kind-of do this with interface group IDs but I already 
use those for levels of trust and bulk up-down operations or whatever; 
and there is no built-in boundry-like behavior on the addressing axis.

I don't have the in-kernel expertise to offer a candidate code base so I 
obviously have not done that. ha ha ha.
