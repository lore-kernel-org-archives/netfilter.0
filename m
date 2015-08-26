From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: wrong info in ipset man pages
Date: Wed, 26 Aug 2015 14:26:04 +0530
Message-ID: <CAA5aLPj0FgFzhbPvtAKF3shX2V9Eeu-cBpkPdODqp6foKW_opA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=cNlgoVQ7+90MBGAAEwIMBpsUfKksVd5XjmItP6Kymfg=;
        b=0m9AE1/A8JnaOJHOiwI7Hm4GorpqnPru/RVOIq7lo5/6E6yVqQHFoAnA0TcxbIZ1Uo
         UCx2kDledf6IgnM37T7FV7/kS8lwpEn7xNaGrjYNYm0UR3FnoN/Oc42XAcia3ZdGJawk
         4uPBpRwqReD4uEDZLjRLQadHnhLbITCp3ZLaDNaAfaTqQobgbtFIULHyCl3eRP3MRSPW
         mm/dR1QHnz7H1afujE6Qbbtg0+Y6aJm5HMUz0yMaZW5lfKJvJxz1UlDPhVP1ZuR+/6Ii
         3NQv3utpERKfHYRIncQHvxo7Ju9g6g/e4N1DQwrrkjZH7cmtmRbSQ1FZpdFu0nTXZNKl
         HQ6A==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

With regards to ipset type hash:ip,mark, it is mentioned that

"""
The hash:ip,mark type of sets require two src/dst parameters of the
set match and SET target kernel modules.
"""

However as it invoves storing mark, which has nothing to do with
src/dst parametes, so it should be mentioned something like

"""
The hash:ip,mark type of sets require one src/dst IP/network and
fwmark of the set match and SET target kernel modules.
"""

Besides, as this is the only set which hashes mark also, so exactly
which IPTABLES module to use should also be mentioned.
