From: Loganaden Velvindron <loganaden@gmail.com>
Subject: nftables infrastructure
Date: Tue, 9 Aug 2016 20:07:48 +0400
Message-ID: <CAOp4FwSDg6T+FVR3pDt_ZGbAX3Avs8CMAV4gV-Tx3ELDmAtBtw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=gtR1zbNpMRsqpfaN0z6HRwcHu0SpdSJbZos/MfrW8SE=;
        b=MBFbHVwMq3fJzDf7V3DPVyQHuiXrxxMjxeLd5RgoeVEDv3KX2JdPuAXyBFlfe+s2Xr
         vNBwfTUQ9AeBx9iqFYZTQlX1Y2i93EgC0sOSJKFQH8NtuLxcO25z2rSw6K4NUH+MNP/j
         HBt41o52yy8PMYwyQxY8XiG2tKGGaR5kHqvocfF1LZPCX+gBu9lEunGLPvuCcAFZNgQg
         ClBepU7Npoq8lOGQSy0HP+auCSpS6RBjxWAvHy1lhCeTihROG6TsmWDnQ55enkLwlOcb
         rjpl1v5mbxwauP5G1Gd2dRCy8n9gdQVdkCCCp1NUlFZd+3BKifp7Ht7SL2yYxpOVlllp
         1dOQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi folks,

I notice that it's hard for someone to come up with documentation
describing nftables architecture, and its API.

For example, if someone wants to write an nftables module, there is
little guidance, even in the source code comments.

Anybody has tried to document the nftables internals yet ?
