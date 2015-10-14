From: prmarino1@gmail.com
Subject: Re: using conntrack to drop connections?
Date: Tue, 13 Oct 2015 22:42:45 -0400
Message-ID: <20151014024245.5251154.27001.17949@gmail.com>
References: <CA+HxBU+3O-Juj0Ma_Exxdmkfed11yEZQAC9+JVZV5G8cV+i1fg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :subject:from:in-reply-to:references:to;
        bh=f+VKyiOc+yg4saU2/xTj9Eekk9Lc5YUZU7CB36Uzl3w=;
        b=lCaj/SdJQ1Yt+oKIkJo/qlzd5APkchDMFJK0fnhr0j5nZu638HjAJW5P4mtbVxQNF3
         jwGg4GcUZgczvRrc6oC/IZxTU+i8MENJ11lw+P/S7eqRW7a89n0gVxQNaEIM7s2cwHQP
         dSwbBr83sM/NNxgTHxFm4lhBtmDLafcaEoDM/2q6bpSomEkP3O9TTOp8L+bKnkdgf1Lf
         7I9iqQ8fjaRP7I0calR8zxLDvvQwH7aSCr8GOFBeq5izFm+8H2Ph8s+x8SIMVXFGqU4W
         p3t0WGJFFdvlrzMb415ggoQ6VbGRz/Ckh1sEic0tYNCvWyTLTBb5yiBOHqwnnVLl1hqL
         4kAQ==
In-Reply-To: <CA+HxBU+3O-Juj0Ma_Exxdmkfed11yEZQAC9+JVZV5G8cV+i1fg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?q?St=C3=A9phane_Charette?= <stephanecharette@gmail.com>, netfilter@vger.kernel.org

Those kinds of aggressive drops usually due to improper tuning of the n=
etfilters tcp settings in /etc/sysctl.conf

Specifically on firewalls the idle time out should =E2=80=8Eunfortunate=
ly be 201 minutes because the default tcp (idle) heartbeat interval is =
200 minutes and the default idle timer is the same which equals a race =
condition.

The problem usually comes in where some one reduces the netfilters idle=
 timeouts because they hit the conntrack limit (local not conntrackd). =
In more recent versions of the Linux kernel the conntrack max limit has=
 gone way up for very good reasons ( simply the nuber of connections th=
at are common now were incocivabe when the 2.4 kernel was released ) bu=
t most people don't know it because a lack of good uptodate documentati=
on.

In an ideal world the default tcp idle heartbeat should be dropped to 1=
 minute=E2=80=8E , because we aren't using early 80's hardware any more=
=2E But that would require an updated RFC and at minimum a decade for a=
doption and proliferation of those changes in operating systems. =C2=A0

=C2=A0 Original Message =C2=A0
=46rom: St=C3=A9phane Charette
Sent: Tuesday, October 13, 2015 16:10
To: netfilter@vger.kernel.org
Subject: using conntrack to drop connections?

I see conntrack examples where a device used to forward packets can
drop idle connections after a short time. For example,
http://stackoverflow.com/questions/9322325/ip-conntrack-tcp-timeout-est=
ablished-not-applied-to-entire-subnet

But can conntrack also be used on the end device, such as the server
in a normal TCP client/server scenario?

I'm looking at a customer issue that we suspect may be caused by an
aggressive customer firewall dropping TCP connections after a very
short idle time. I was hoping to duplicate the customer scenario with
iptable rules to quickly drop "idle" TCP connections. Can this be
done?

> uname -rvp
3.19.0-30-generic #34-Ubuntu SMP Fri Oct 2 22:08:41 UTC 2015 x86_64
> dpkg -l | grep conntr
ii conntrack 1:1.4.2-2ubuntu1 amd64 Program
to modify the conntrack tables
ii libnetfilter-conntrack3:amd64 1.0.4-1 amd64
Netfilter netlink-conntrack library

TIA.

St=C3=A9phane
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at http://vger.kernel.org/majordomo-info.html
