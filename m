From: Darius Jahandarie <djahandarie@gmail.com>
Subject: Limits higher than 10000/sec
Date: Sun, 9 Dec 2012 15:05:31 -0500
Message-ID: <CAFANWtU9aeFjgUvczjnCETxy4h01aFs6JnDcK_ikxz-ijJ=Adg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=xaptUmbojEWALIJNn/KWhTVQTa0BOfoQTQOPI6rdQ7w=;
        b=VFJv5wGzw1iriy6oeQDDEhr3IyUYIkrpUY4GnKt0rrOuUb82VHJa9VgxKFKCeU7kIx
         sxPngh49THR0NLttqR3AnTI0/RqhkDnJ4QT35o16YIXrN90RVKdK7l56Gv3pOdXUGkJP
         RbQ4djzxq88tFNGsIneZijwiMsj+rrsWH36JNcV3I7LHdx5yy+ije4DRfFVr9IrLhjFK
         yboIJgVGqR9MHbeG8GtLxRoEfv1gEv82gEJk2wCDphA1U2j13MjZ7ptsw1VFpWlwgXyI
         WgxgSdnE0qWDIWmcaqsv/U3FKX5uPIfRR4cBZ9mU8Tr1mdD5wXbUQ0BR+cTOEsNIH83F
         gCoA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all. I currently have an iptables rule like follows in the raw table:

-A PREROUTING -p tcp --dport 1234 --syn -m limit --limit 10000/sec
--limit-burst 10000 -j ACCEPT
-A PREROUTING -p tcp --syn -j DROP

Unfortunately, it seems like 10000 is the highest limit and
limit-burst can go. I could duplicate that rule multiple times to get
higher, but that would create a massive file for the limits I want,
and would likely create a much greater slowdown than what could be
achieved with a more flexible module.

Does anyone have thoughts on a way to get some sort of rate-limiting
(TBF or otherwise) that can handle more PPS than the limit module
while still being as efficient as possible?

-- 
Darius Jahandarie
