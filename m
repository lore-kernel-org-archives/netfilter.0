From: Abhijeet Rastogi <abhijeet.1989@gmail.com>
Subject: IPVS: conn_tab_bits param for ip_vs > 20 leads to default being set
Date: Mon, 6 Feb 2023 14:48:19 -0800
Message-ID: <CACXxYfxtsHLpvowG3g=7vkg4U2PmqTMnojtYYjXZGrnwFkF+Ag@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LW18wSqw9tk8g877MXAZhBhz+tdkVc1QMf+OKj029+8=;
        b=Y2zq/BAltOKLxGa4demvP3E2Pwwx8SY2ol4zJZAord5Sbp1N0gq0KQX3E1aBjScfoZ
         ZaqjZursqK0S+WEE/tAQ9OLJL6I9WD6cQ9qwzLVvCt+RVd5l32J0J6PJoCnLDS8MGGXf
         /14nL1Vj8pXqFnwGW+yDBGkVpCJ9WFi4UCEdFRptocGbnfkFEJYATZpzUBgIDTve4Wsh
         R3dEbVeGdw8mJV6L1KXibnhabZAftEK08F21gqqhkydc7vAyjAkS/RF7U5PDKwNoLUEi
         evO82BcDnryXYrMv/wkJ4RUfF7BjmTokmp/qmBQOER0R133cQVkzjPc60FxAwf6+dwSE
         UO/g==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi IPVS users,

This behavior is on the 5.4 CentOS kernel and should be because of
this check. As per the commit message[1], the problematic value is
when conn_tab_bits>31. With that in mind, why do we limit the size to
7 < conn_tab_bits < 21?

I stumbled upon this problem while upgrading our production hosts from
old RHEL with kernel 3.10 to CentOS with kernel 5.4. On current RHEL
systems, conn_tab_bits=24 works just fine.

# RHEL output:-
$ sudo ipvsadm -Ln|head -n1
IP Virtual Server version 1.2.1 (size=16777216)

Sidenote: lvs-users mailing list is dead since 2020, but it is still
listed on the LVS website.
http://www.linuxvirtualserver.org/mailing.html

[1]: https://github.com/torvalds/linux/commit/69e73dbfda14fbfe748d3812da1244cce2928dcb

Cheers,
Abhijeet (https://abhi.host)
