From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Constraints on nft expressions and statements in inet ingress chains
Date: Mon, 8 Feb 2021 10:49:20 -0500
Message-ID: <5959d455-c6b8-acaf-bc1c-9500b4a2716c@fhmtech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Subject:From:To; bh=0lZQ3EQUZX66Lpq5m1uiWt1aUp2mQi4+0/NmxbyU/xo=;
        b=At0RAAD0bjuP1ZailKQcr5q0/t1rl61bqixpN40NFZKRI1lnA0hTbpL+rZNJQ+9hPsUKASoYb7Zv7tLQgE6H9JXR6Wwk2f5j66SJDVZOls/fFmPzeUROWQyP/X2zbsxoHZaKaEu/OGXQ1JGVRJEiLfikLYjnZ6am/4r5yA7JL04=;
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

Since nftables 0.9.7 and kernel 5.10 we have inet ingress chains. It's 
great to now be able to share sets and maps among ingress and other inet 
chains!

I'm wondering about constraints on nft expressions and statements that 
can be used in inet ingress chains?

Some clearly make no sense, like:
- anything involving an output interface
- anything related to conntrack (I think)
- packet mark (I think)

Not sure about:
- reject statement (pretty sure not)
- ah & esp header expressions?
- raw payload expression?
- extension header expressions?

Seem to work, but are they a good idea this early in processing?:
- tcp header & udp header expressions? If IP datagrams are fragmented, 
these matches will miss all but first fragment, correct? (Since 
defragmentation doesn't happen until prerouting?)

My general impression is that inet ingress filtering on L3 IPv4 and IPv6 
header expressions like ip saddr, ip daddr is okay, but trying to reach 
into L4 so early will be problematic...

Thanks for your comments / correction / clarification!

Thanks,
Frank
