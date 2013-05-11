From: Alex Flex <aflexzor@gmail.com>
Subject: Re: synflood +syncookies + conntrack strange behaviour
Date: Sat, 11 May 2013 12:47:05 -0600
Message-ID: <518E9229.20504@gmail.com>
References: <518C479D.1070904@gmail.com> <518E8D5B.3060200@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=i/lGh30G/U8gs1HSPbTX5UgEoSUpdXsN/rlz+jFN0Yw=;
        b=t9sj3ThJVIzUeUvrUDQK0khWsZDqJ8T4cS3iUYNskUyPlWLxn9ZXc2hwem1TjW3u3m
         oDr2LIYEHVaTXm9xua5PdeWFFZihL+C/JvyZzbz/GDxzYxNcexym4/IbiYqmP9qEuEWm
         VkUmZqc2PQTBcXJybmZGP/IyiyAPfsj3uD/QzJx12/oY/0j2ImkTYmgsC4lSP80j99TM
         CDRG4s2bfl0ok23JzW/b0KwhoP3Qbo9sKv/32IY32Wu2fj9IEXJJO4pFdTcoEmnh+zYU
         u0kZbvvEn8H6Ikr9VluWDS8TbE1Js+VHh3j/5sZx+aTrAze3NInJhCfr3HK7v5l6EmMd
         bdXA==
In-Reply-To: <518E8D5B.3060200@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Pascal,

Thank you for your reply.

Ok, I made sure:

a.) conntrack is 100% disabled.
b.) iptables is enabled with a simple stateless ruleset.
c.) Syn cookies is enabled.

The issue is: In my testing Iam still being able to exaust *something* 
because immediately when i hit  a syn flood on port 80 (medium size) I 
get imediate packet loss (as seen through ICMP, also i cannot ssh in the 
machine and unable to reach port 80.

IF i disable syncookies then: I can ping the machine fine no packetloss 
but I cannot reach port 80 (seems this port is the only one in packetloss)

Question: What resource can be exausted both when syncookies is enabled 
and disabled for this to happen?

Thanks

Alex
