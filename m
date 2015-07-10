From: Vitaly Repin <vitaly_repin@fsfe.org>
Subject: SNAT and connection tracker: should established connections be
 dropped when a rule is removed from nat table?
Date: Fri, 10 Jul 2015 19:28:11 +0300
Message-ID: <CAH+_UjWYim1b3+hZQN_P_uAQXSioX1+kooAry0pbpE0hdEWgHg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:date:message-id:subject:from:to:content-type;
        bh=FxyTKPkrT7NbhWgogMVqB9g+D7R+6JCqcxbAko6uo8o=;
        b=I/BsS+m0yMZrEmz38ORumeJlvOSFSvVuacvoU1AnzX9vb+9JOUwq3o5/nMH4uH9tWA
         etTcWyenIoM0qEGm4V7MeiDr6XuexbBlCPcsEl3n8C/7tl3CZLGPsGunuXiXJSoPB7Ma
         HmpNMnqXZ0tiLBWZ7lTF8Mv0Ke1lofkRUg+BiMhRqtXYcVtBuS/imxddDw2ZA3Uj46p/
         mlf1Zi8KnZJyJJqh14smXHehgw2F3e28CR/ie9oIAOnbPWYKjp2bkwkDmmMDtUbjVIJX
         toenkCAeC4Xx4aq6Jrzmzm6yGi9hcLcbd/OunKPVLNDmxsFrLnqXKC7he/UKWbabHWIP
         4gyg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I need am advice on SNAT.

There is SNAT setup where my clients connected through ipsec. Whenever
new connection appears, SNAT rule for respective IP is created.
Whenever client disconnects, corresponding SNAT rule is dropped.

In general it works, but this schema leads to the packets leakage through NIC:

1) IPSEC client disconnects
2) Rule for this client is deleted from the nat table
3) But incoming messages (from remote servers) for already established
connections are continuing to come! They are "de-NATed" regardless of
the fact the rule does not exist anymore.
4) They come to xfrm subsystem which does not take them (as no SA
associated with this IP exists)
5) As a result these packets (addressed to the private addresses) are
appearing on the eth0 interface

As of now my solution is to drop these packets using ebtables. But I
am still not sure it's an optimal one.

So, my questions:

- Do I understand it right that when SNAT rule is deleted from the nat
table, it does not mean that already established connections are
stopped from being tracked? And the they are continuing to flow using
the rule which was assigned to them at the moment when corresponding
connection was created?  Can this behavior be changed?
- Any idea how can current schema be improved?   The first option I
see is to be able to stop SNATting of the connections for which the
rule was deleted. In theory I can do it even from userland. The second
option is to ask xfrm to drop all the packets from specific network if
there no SA for dest IP address of the packet (sounds weird).

Thanks in advance!

-- 
WBR & WBW, Vitaly
