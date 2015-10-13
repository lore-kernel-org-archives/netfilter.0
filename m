From: =?UTF-8?Q?St=C3=A9phane_Charette?= <stephanecharette@gmail.com>
Subject: using conntrack to drop connections?
Date: Tue, 13 Oct 2015 13:07:24 -0700
Message-ID: <CA+HxBU+3O-Juj0Ma_Exxdmkfed11yEZQAC9+JVZV5G8cV+i1fg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=TkAd4dvB6jcNAfJ948P0kvQrIzVMNaY9BzGvyQosKGY=;
        b=j/+zKbxuPBg7JMRAJq3m31MYqHPygoeMH2FWmr6ZDvtSVB+8HjphYHk6iNtMOrIkNY
         cpCdYf0el9dvaXlDWxK9BiEV30hRn8Z1FntoAtW99gSEZY5zTqrdva+ovc7uOlM/5yYL
         1Z4mUIEeD2JOZ8Tv3NHuqzXWPbNXK+ISHbl2A6dyiL688QFxJV1tWh1OVAxLyJdWYWTa
         kg3iNUdO7tTpJAQWdDAray/TqhTnXfXiHcZSW62AFYG1tjXfo1k7lePj6klRqs2w2G74
         18FYOj1nixiHKyx9FIVJ1hjTGG7tfuePL7nf+JX6aVQ+uSdiJnrbG+G52wEwJt/LG/gm
         /3uQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter@vger.kernel.org

I see conntrack examples where a device used to forward packets can
drop idle connections after a short time.  For example,
http://stackoverflow.com/questions/9322325/ip-conntrack-tcp-timeout-est=
ablished-not-applied-to-entire-subnet

But can conntrack also be used on the end device, such as the server
in a normal TCP client/server scenario?

I'm looking at a customer issue that we suspect may be caused by an
aggressive customer firewall dropping TCP connections after a very
short idle time.  I was hoping to duplicate the customer scenario with
iptable rules to quickly drop "idle" TCP connections.  Can this be
done?

> uname -rvp
3.19.0-30-generic #34-Ubuntu SMP Fri Oct 2 22:08:41 UTC 2015 x86_64
> dpkg -l | grep conntr
ii  conntrack                       1:1.4.2-2ubuntu1   amd64   Program
to modify the conntrack tables
ii  libnetfilter-conntrack3:amd64   1.0.4-1            amd64
Netfilter netlink-conntrack library

TIA.

St=C3=A9phane
