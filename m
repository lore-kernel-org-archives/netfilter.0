From: Justin Yaple <yaplej@gmail.com>
Subject: Marking packets from source router?
Date: Fri, 11 Oct 2013 09:10:34 -0700
Message-ID: <CAOW2CBftfVFEh0rYat_4R4DonOKj=Lzid3TRhzhzyVvuqzHeNQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=bcW8+fW3bftnj2zVA15V+tNGd0B/MlngU/LydnD9+GE=;
        b=Exta/Rk/gv7zBQYr57Ay6Lx5KLHAaiAwMGmQGoujj/HYLd1N1eN++1UzYStRbdyAvz
         IhboucqrkRMaE+k6oSAPvRtDHNivO2wTkEvLQ8q5BpygGSzIenF3z5fyPIqAFkEuj+Hx
         +DudFlk1T8ZQOg/7JqqnocUkNQ3O1d3E84Jec3QcTEcnf/hojEYixeLePIIZOMjS9oV+
         cwgyP6yJwmYXIZLDVaziApgjntdz4UF2NqowylOs7X5IH/JF3utOfamT27dPxRg81WTd
         //bqAtXIyBCFxxxcQ6PQNj7FB4LgVep4WBvQQk0jLEIiKAO9i1Cwtt/9XxVsn75p04GR
         US5w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

Is there any way to mark inbound packets from a particular router? Not
by the source/destination IP but by the previous-hop device.
Here is my senario:

I have two WAN connections each with a dedicated router. These routers
redirect traffic entering the "lan" and "wan" interfaces to a Linux
box via another interface (can be done with Policy Based Routing or
WCCPv2). That traffic is queued to my userspace daemon, processed then
sent back.

I want to return the processed packets back to the original router
that redirected the packets though. I expect this would be pretty
simple if the packets were marked somehow. So is there some method to
mark packets by "previous-hop" or possibly by the source MAC address?
Not sure how this could be done.

The routers and Linux box are all on one subnet. So I cannot mark by
inbound interface.

It seems like once that issue is worked out either of these could push
the packets to where it would need to go.
nfq_set_verdict2
nfq_set_verdict_mark

My original through was do something in my netfilter hook by modifying
the destination MAC address but it did not seem like that is possible
at least not from the netfilter hook but might work with
dev_add_pack() when packets enter the Ethernet interface and storing
the source MAC somewhere in the skb then using dev_add_pack() on
outbound packets to determine if they are going out the same interface
they entered. If so just modify the destination MAC and re-checksum so
it would get delivered back to where it originated. That seemed pretty
hackish to me but might still be an option.

Thank you.
