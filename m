From: Gio <gioflux@gmail.com>
Subject: Proper way to use counters for a specific child chain
Date: Thu, 14 Apr 2022 14:20:33 -0400
Message-ID: <CADhidkp1nsbujcayMVVyTPfuncxOuCosy1N4VnHVvVb2dSgSQA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=sTDAsxxcV9rYQ/0CWlY/jo79onlSLe9pGir8Fo8FlGQ=;
        b=i4itaiqsws2Q1d0bKi7GLRI/CD6RsyJ7UaJqamj6VcdDYDTNqX0ot/s7JbdJPR1hLa
         w++rxmVMzth1GLX8ii/mDDxXiYzoguC6WSyzBYh8Il8uWLVGKpeJzMPlzMxnfstDZsJO
         9ZS1/SjhsmUw56IoPv7LqZSHOVwYFOIf9Kz/LSdU7ksUxml0c/KBsBIMIdbnPyS2G3kF
         qOeu1n0hptdclf18PCY57Hyy23y1U2/w9/TpygdYnEXeKbmbScCBhFHndYcIBDc9aKRH
         PhQOxTCC88wDQr9FDYFSuSJLEzXGe6VMpCLbgn6nwhvDwYMaXtF3pk5H8gsY+NQ0yyFJ
         F9Xw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Do 'counters' work inside child chains when using 'jump' and 'goto'
statements when I want to only count matches to the full ruleset
inside the child chain?

https://wiki.nftables.org/wiki-nftables/index.php/Counters does not
explain if this is feasible or possible.

My use case: I have a base chain which then uses 'jump' statements to
a children chain which has a more complete rule. Example:

chain child {
ip saddr 1.2.3.4 ip daddr 1.1.1.1 tcp dport 22 accept
}

I wanted to count all hits to 'ip saddr 1.2.3.4 ip daddr 1.1.1.1 tcp
dport 22 accept' - I did not see any 'accept' in the example
documentation, if I replace "accept" above with "counter" does it
result in an implicit accept verdict?

Thanks
