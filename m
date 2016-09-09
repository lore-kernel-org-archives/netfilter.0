From: Jens Koehler <jenskxxx@googlemail.com>
Subject: Linux - nf_conntrack_count = 30684?
Date: Fri, 9 Sep 2016 10:29:33 +0200
Message-ID: <CAL7_A_XQXMFP598iP1nhUqvvmzE7GC5GUXcOoQ_2Y9YvRx8TOw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to;
        bh=K1s0RK0qPHkCL26fvxZYAgoDpzh6/vsBDTISb7O0CvQ=;
        b=nsgoaRp3wXt3Sy8Pfnx5P6S4tUXpXS+Ur2wZIkZVhZBvi4xE5fTpJyQKsHjWEOPRSy
         BeANUCtXgWbsxAy2FrC+OT6gBgyAFva7fc5qZwMxkovjy90gqu9CiItM3WKk2wFZg1R9
         USd0wimQLT45pa+nB4penS+oQvXpNSwVoHrQg61+nyD/zssnjuiGi1KW7Gn/dmlkie9G
         BRGk34HEm9LW87XfYZ1WFMELVzwFT9Xkq1XcsN12cd4PTKRoy6Up+41+q3Y8Tgon29Iy
         gXMQ2nnQhUbZr8jXc9206yiwJvF/CyP3X+OcnxJQ+z45Sy1L6bJU2R9vDMZL0AS2/lbm
         PSmQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

 A Linux application reads cyclically data from up to 32 severs by
Tcp. After disconnecting of many/ all servers another Linux
application could not send data via the network interface by UDP.
nf_conntrack_count shows an unexpected high value:

net.netfilter.nf_conntrack_count = 30684

What means the number exactly? And what could be reason for so many
open connections if no server is connected?

Thanks in advance,
Jens
