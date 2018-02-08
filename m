From: Omri Bahumi <omri.il@gmail.com>
Subject: Unable to query reply direction with conntrack-tools / libnetfilter_conntrack
Date: Thu, 8 Feb 2018 14:21:10 +0200
Message-ID: <CANtbet1vQmGGFw7f7MkSC=+x1QWEnJA-_rEu0AT22QH4zF-FNg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=as9ufY3+7Fp6XoYasKdT324VZfWbDrYiy9yq04dfy5s=;
        b=pQLyxkVt4D5XUaReP6RuoFdMHq4F2yqRNJrUr/3SCgB6USNMMogzAlEI5/yOVo7A9l
         HirRi3av4A+u5qFmgbk7tTLt1c7LrnT7kXZ8XcqBPC2vySOeNNsWkHjtanm0EXG33YFI
         aLR3nREUiqGBsKBMC810vDiRV2G1bVcTyO+Hl+kua7TH4hvyXz2NlBEYkHaF19WWImYh
         +nluzktKz/I7vIms4cgBfaMPCCf5bAM8um09ti7TiMuT1KS4cn02N58EeERv9CkzDx/O
         9eKzpBkfQJg5E+sUy6IV2bTgAhyxf2Ui+gYTvKp9tY8zUbru/rAbz0gGlosGISVsTUuP
         G70A==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi,

I=E2=80=99m trying to match a conntrack table entry based on the reply 5 tu=
ple
with conntrack -G.

My setup is as follows: two terminals, one running "nc -l 1024" and
the other "nc 127.0.0.1 1024".
I=E2=80=99m running =E2=80=9Cconntrack -L --src 127.0.0.1 --dst 127.0.0.1 -=
-protonum
tcp --dport 1024=E2=80=9D to find the connection, then, I=E2=80=99m trying =
to match
them with =E2=80=9Cconntrack -G=E2=80=9D:

original direction: =E2=80=9Cconntrack -G --src 127.0.0.1 --dst 127.0.0.1
--protonum tcp --sport <ephemeral-port-from-list-output> --dport 1024=E2=80=
=9D
matches the connection

reply direction: =E2=80=9Cconntrack -G --reply-src 127.0.0.1 --reply-dst
127.0.0.1 --protonum tcp --sport 1024 --dport
<ephemeral-port-from-list-output>=E2=80=9D
returns =E2=80=9Cconntrack v1.4.4 (conntrack-tools): Operation failed: inva=
lid
parameters=E2=80=9D

I think that:
1. conntrack-tools is missing the --reply-sport --reply-dport flags,
which have different ENUM values (ATTR_REPL_PORT_SRC !=3D
ATTR_ORIG_PORT_SRC)
2. there seems to be a bug with libnetfilter_conntrack implementation
of __build_conntrack (conntrack/api.c) that assumes ORIG direction
(makes sure ATTR_ORIG_L3PROTO exists, calls nfnl_fill_hdr based on
orig l3protonum)

Given the above two points, I couldn=E2=80=99t test a IPCTNL_MSG_CT_GET que=
ry
on the reply flow. I tried both with the conntrack-tools package and
by modifying the nfct-mnl-get.c example in libnetfilter_conntrack.

Am I missing something here?

Thanks,
Omri
