From: "W. Michael Petullo" <mike@flyn.org>
Subject: Modifying NFQUEUE rules in flight
Date: Mon, 13 Mar 2017 21:18:38 -0400
Message-ID: <20170314011838.GA9432@imp.flyn.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have a question about the use of NFQUEUE from userspace.

Imagine two firewall rules:

        (A): NFQUEUE tcp -- imp x.x.x.x tcp dpt:http NFQUEUE num 0

and

        (B): NFQUEUE tcp -- imp x.x.x.x tcp dpt:http NFQUEUE num 1

I am interested in making the callback associated with rule (A)/NFQUEUE 0
remove rule (B) and replace it (usng firewalld/dbus in my case)
with another, more specific rule. For example, perhaps the callback for
NFQUEUE 0 would rewrite rule (B) to include a source port. I am further
interested in having this new rule apply to the packet being processed.

Is this type of modification in flight possible? By the time the callback
for (A)/NFQUEUE 0 is invoked, the kernel is obviously processing a packet
through the rule chain. In my experiments I have not been able to modify
the chain such that the kernel continues to push the packet through the
modified chain.

I assume that if this is possible it requires the proper use of NF_QUEUE,
NF_STOLEN, and so on. However, I have not yet come across a clear
description of the meaning of these values with respect to libnetfilter.

I can instead get what I want by copying some of the functionality in
(B)'s callback to (A)'s callback. However, the two callbacks really do
two different things, and futher (A) exists only for a short time. For
these reasons, I am trying to move the code to something which resembles
what I describe above.

Any comments would be helpful.

Thank you,

-- 
Mike

:wq
