From: Muhammad Faisal <faisalusuf@gmail.com>
Subject: Ulogd2 messages stopped [Cent OS 6.8]
Date: Mon, 13 Mar 2017 20:38:44 +0500
Message-ID: <CAAzdDtPv0SC=8i3Zn5k4qCNZB7pLBC_4Yf7THAmBU5UAhvnoPA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=JFk6K5aJN2Xu87JbqQLE9LXRKhmDEEJLPC4FXmQAWK8=;
        b=jwwtE5Q9337/F1uXhHZkFudszEQU5fPY9gbBZYcRpHm57CKpd/2t82Ck9hjymtf6qW
         AT6V1+EC+P9kdoVRmu2nLm0I+g+/3jPYaKKq67yqffZfnRr4/jLE/ztYkXkLP7qEJ3d6
         auPABBFTm9yMPsmLPnfU2tIYmF9UxFWre5yJi3tOM2zBBEZ2qiZHdVz/8htF1GQlHOf9
         q2SOnYM5sLyiuXa9OS/3Q4M95+W3yF54tdF5pzAjp8UL5uKGbsXqURkV+Rkm2YLMsGRr
         vlLk3+h7xQGF59oidI6S/8qmpeRYiEcWusky/2PXW/oFGaeWNmAW0CihttcvF+ArOuVc
         J5eg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,
We have setup nat server with src-nat event logging using ulogd2.
After running for couple of day all of sudden the ulogd2 messages
stopped. There was nothing related to connection events.

When i run conntrack -L command and then conntrack -E command the logs
starts appearing.

Please help me out i did not find any clue why this is happening.

Cent OS 6
Conntrack v1.4

[root@wc01 ~]# ulogd -V
ulogd Version 2.0.5

Installed Packages
Name        : libnet
Arch        : x86_64
Version     : 1.1.6
Release     : 7.el6
Size        : 141 k
Repo        : installed
From repo   : epel

Available Packages
Name        : libnet
Arch        : i686
Version     : 1.1.6
Release     : 7.el6
Size        : 59 k
Repo        : epel

Name        : libnet-devel
Arch        : i686
Version     : 1.1.6
Release     : 7.el6
Size        : 181 k
Repo        : epel

Name        : libnet-devel
Arch        : x86_64
Version     : 1.1.6
Release     : 7.el6
Size        : 181 k
Repo        : epel

Name        : libnet10
Arch        : i686
Version     : 1.0.2a
Release     : 18.el6
Size        : 39 k
Repo        : epel

Name        : libnet10
Arch        : x86_64
Version     : 1.0.2a
Release     : 18.el6
Size        : 37 k
Repo        : epel

Name        : libnet10-devel
Arch        : i686
Version     : 1.0.2a
Release     : 18.el6
Size        : 21 k
Repo        : epel

Name        : libnet10-devel
Arch        : x86_64
Version     : 1.0.2a
Release     : 18.el6
Size        : 21 k
Repo        : epel

Name        : libnetfilter_acct
Arch        : i686
Version     : 1.0.2
Release     : 1.el6
Size        : 18 k
Repo        : epel

Name        : libnetfilter_acct
Arch        : x86_64
Version     : 1.0.2
Release     : 1.el6
Size        : 18 k
Repo        : epel

Name        : libnetfilter_acct-devel
Arch        : i686
Version     : 1.0.2
Release     : 1.el6
Size        : 22 k
Repo        : epel

Name        : libnetfilter_acct-devel
Arch        : x86_64
Version     : 1.0.2
Release     : 1.el6
Size        : 22 k
Repo        : epel

Name        : libnetfilter_conntrack
Arch        : i686
Version     : 0.0.100
Release     : 2.el6
Size        : 39 k
Repo        : base

Name        : libnetfilter_conntrack
Arch        : x86_64
Version     : 0.0.100
Release     : 2.el6
Size        : 38 k
Repo        : base

Name        : libnetfilter_conntrack-devel
Arch        : i686
Version     : 0.0.100
Release     : 2.el6
Size        : 14 k
Repo        : base


Name        : libnetfilter_conntrack-devel
Arch        : x86_64
Version     : 0.0.100
Release     : 2.el6
Size        : 14 k
Repo        : base


Name        : libnetfilter_cthelper
Arch        : i686
Version     : 1.0.0
Release     : 3.el6
Size        : 17 k
Repo        : epel

Name        : libnetfilter_cthelper
Arch        : x86_64
Version     : 1.0.0
Release     : 3.el6
Size        : 16 k
Repo        : epel


Name        : libnetfilter_cthelper-devel
Arch        : i686
Version     : 1.0.0
Release     : 3.el6
Size        : 14 k
Repo        : epel

Name        : libnetfilter_cthelper-devel
Arch        : x86_64
Version     : 1.0.0
Release     : 3.el6
Size        : 14 k
Repo        : epel


Name        : libnetfilter_log
Arch        : i686
Version     : 1.0.1
Release     : 7.el6
Size        : 21 k
Repo        : epel

Name        : libnetfilter_log
Arch        : x86_64
Version     : 1.0.1
Release     : 7.el6
Size        : 21 k
Repo        : epel

Name        : libnetfilter_log-devel
Arch        : i686
Version     : 1.0.1
Release     : 7.el6
Size        : 8.9 k
Repo        : epel

Name        : libnetfilter_log-devel
Arch        : x86_64
Version     : 1.0.1
Release     : 7.el6
Size        : 8.9 k
Repo        : epel


Name        : libnetfilter_queue
Arch        : i686
Version     : 1.0.1
Release     : 3.el6
Size        : 18 k
Repo        : base

Name        : libnetfilter_queue
Arch        : x86_64
Version     : 1.0.1
Release     : 3.el6
Size        : 18 k
Repo        : base

Name        : libnetfilter_queue-devel
Arch        : i686
Version     : 1.0.1
Release     : 3.el6
Size        : 8.4 k
Repo        : base

Name        : libnetfilter_queue-devel
Arch        : x86_64
Version     : 1.0.1
Release     : 3.el6
Size        : 8.4 k
Repo        : base
Best Regards,
Muhammad Faisal

Disclaimer:
Information in this e-mail and attachments is confidential and may be
legally privileged. Only intended recipients are authorized to use it.
If you have received this message in error, please delete it and all
copies of the message from your system and notify the sender
immediately by return e-mail. I'm neither liable for incomplete
transmission of the information in this communication nor for damage
caused by any virus transmitted through this e-mail.
