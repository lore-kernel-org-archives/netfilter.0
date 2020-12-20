From: Rafael Ganascim <rganascim@gmail.com>
Subject: First packet NAT flow
Date: Sun, 20 Dec 2020 09:14:55 -0300
Message-ID: <CAD4ZOMyRWi-wahS4bw11h=hQpzgjaCjHiomcsKK5fjqawe92MQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=OKsic5HgWVLHxxxPp/f7aQ4A0EaYN8sMWW/TxVraU/U=;
        b=RV3rEDCwmMQzYE5Qi2/ddoapZr4rvi2wmxWyH5fScXWVPDlRzUP4Muu3wjyhg2uVYq
         JikYZC2YM0hSckYwEDGAGUgNODt5t1n4UbGkyNlMleJ7GIV86wogr4fFL01bGex2DY/y
         3Gh/plkEBjRjT1QuJcFuJWFYAWhGszEmEiH6Jik0IfdeK1SVz3CvqoozgyHm4/cnl5Wc
         I00e/DKrkmGXX/s1VyMM4VqZJXnoHh3xus2orFkSadEke+FMHUAdBQOYFIRXrYYCLj+E
         B8u77mR+iJeCGX/h+EcrXqfS61WB7CzfojOyDoDKH2kOmN9Raernr6XoOy3pZX/ouOJW
         N5Wg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello guys,

A question about how NAT works within the Linux kernel.

As I understand it, when a connection is already established at
conntrack, the packets use these entries to flow, do the translation,
and don't go through the entire ruleset. Is this reading correct?

But what about the first connection packet that needs to be NATed?
Suppose we have 1000 rules of SRC-NAT, are the first packets covered
all of them until a match occurs? Or is there a structure already
"configured" where the IP can get its NAT IP quickly?
And for example, for 1:1 NAT, despite the number of rules, what's the
difference between 256 rules of src-nat or just one using NETMAP
module?

Warm regards,

Rafael
