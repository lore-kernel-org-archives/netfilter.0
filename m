From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: are restore-mark and -m connmark same ?
Date: Thu, 3 Sep 2015 14:05:37 +0530
Message-ID: <CAA5aLPjnxpQp9LFXjMeSSnfPU0e4dCvBOzeBwcHn99a-3QTdkg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=g+ix47F+LPcGVZd1lnmM7nphtZJbuBcNEoy/KjQQ3Qc=;
        b=DOVidUY6fiKJJJqXd7WQTgNAFAEs94EI2u+Nz3pqa9QQ2lCeCrQd1pIerYL7rvSHsQ
         1VhaOivgtBv+r5qkKiApPtr59gq6Vnrm+0PMmerPEgT7qvxnHiYqb8oxDmvd6NmFN2+F
         bLfsjEx6NTMUABvDEGJDjFMWi3owEZHGrSQW0Oq6i7WGoHjnZUw44sgIXyJ1REkpVR4A
         h0BEkYXlPZcewK/PwKzphB5EhxL5JjEXpRTU66w/nPFxAmnwbliSJqWu0LiWBSJwxk/4
         17TW4wr3Q+EpKMUTGS+KcSj+bSNwd/VmymcmmGKPJRpr9IMt7ZiGhaNes+U+MbMfRU91
         iWCA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

ARE

iptables -t mangle -A PREROUTING -j CONNMARK --restore-mark
iptables -t mangle -A PREROUTING -m mark ! --mark -0x0 -j ACCEPT

and

iptables -t mangle -A PREROUTING -m connmark --ctstate RELATED,
ESTABLISHED -j ACCEPT


_exactly_ same or there can be any case/condition where this will fail ?
