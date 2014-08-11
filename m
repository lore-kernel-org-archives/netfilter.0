From: lejeczek <peljasz@yahoo.co.uk>
Subject: a missing rule / incomplete routing
Date: Mon, 11 Aug 2014 11:01:19 +0100
Message-ID: <53E8946F.2070403@yahoo.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s2048; t=1407751280; bh=H4jUyqKFH4mHogHdbAOj26WQU+nS2VgL4lNZcm68bbQ=; h=Received:Received:Received:DKIM-Signature:X-Yahoo-Newman-Id:X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:Content-Type:Content-Transfer-Encoding; b=g8muWz7hD7rNCVBT7f6Kx1fWqCpOtxeEk2EJxQu2UckWvoszrnyhUJSHStZuERV/sjAP/ToOTL8qUXRH7qEbAvj3w4+yUm8itIDcJ/uLYrWrP+cEWDmdbJdk4WVH5vGLRu79LFwV+WoNPXNGIH7uxwIuespeD4j+QM9AbdUToRCTLa11OlfwvZwcq0PfEtvMdB0AsfDvOgcrhzev9x0I6KUR2PU1S8B4YUbwuFNV5wloNSaquEUF/4ju5w9FaNK2xb/q0A2JbGMK12t6DGnualrCQhhI5UCWG/Iw8PNIyC/W9UuM8Np/eY5kGyzsv8ijxUhLwej3fM9+AMXQGPMLAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s1024; t=1407751280; bh=H4jUyqKFH4mHogHdbAOj26WQU+nS2VgL4lNZcm68bbQ=; h=X-Yahoo-Newman-Id:X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:Content-Type:Content-Transfer-Encoding; b=25KpAcHOT+7FGSGbOE5TyWRrQouhFbZkrqlXTn8Ejx4Z8M9NzaTrwtW0BHMg01WYoAC5galIKSx1odkuHKtJ5xqmF+dF8vUdKldn1/zG2EtXsJa3oOtAe1ObylR4qgSxoOZ7/ffxZ4V254p38dYtyDLQNebnbYKuwKOSU+wiBfI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@vger.kernel.org>

dear experts

I'm looking for ideas/suggestion why the following does not work

there is a:
* box A - 172.17.166.199 --  then there is 172./8 net -- box 
B - 172.25.12.101 (phys0), 192.168.2.100 (phys1) -- and one 
more net behind 192.168.2.100

a 192.168.2.81 from behind box B can ping172.17.166.199
but not the other way around, box A cannot get to box B's 
phys1 but it does get to phys0

I can control box A but have no control over the nets 
between it and box B's phys0
I can control box B

I thought my route rules on box B are complete, box A is a 
winbox
I though box B' firewall is ready
but I obviously miss something

there is no masquerading for phys0 nor phys1 one box B

any ideas/thoughts? greatly appreciated
thanks
P.
