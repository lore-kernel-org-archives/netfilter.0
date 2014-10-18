From: E R <ears.box@gmail.com>
Subject: ulogd_inppkt_NFLOG.c:503 forcing unbind of existing log handler for protocol
Date: Sat, 18 Oct 2014 12:49:41 -1000
Message-ID: <CAB1i-Sx05bSH5hEgEzAPqeJ_8kq4SqFM106nBrmw+U0cfwb1Xw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=mn039kX0kNCNTtMqsDi3CxKkM4+KR+/gaRVPev57qIU=;
        b=Ua/gYWqxwf9X5rN8WQ3V/TGUDFeLtO0ImrTeiBJuN9VXj4xIlP9px475SeEAqAag6w
         ZTc9n7/5QLG8oC2Tyl1IaVrN+HKuxVHZylsWkE83+jtK2e77ylu7kA5J+xfqgJEvTK/a
         0GgMdQVvF/RfSdhd0lhTk8kDrAQGfII9yUB6ycy9Qd2gpOnBQFAZRk1cILIfmwgPf4hw
         v/UZ/LCn5zGkByjCj19jlFY4qymvwfea0fiWHN6hWn3b4CurFLqusdznI6OxEtLzAGkG
         QNmBioAQJQ6awnnIx1Vps2HNCv56GugYRccdFpTY1bQ2+KiLG6vjPt63xLhl2H5U+puP
         hFAg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi All,

I noticed using NFLOG for ulogd 2.0.2, when ulogd starts, in
/var/log/ulogd.log I'm seeing these three messages;

Thu Oct 16 22:05:22 2014 <5> ulogd_inppkt_NFLOG.c:503 forcing unbind
of existing log handler for protocol 2
Thu Oct 16 22:05:22 2014 <5> ulogd_inppkt_NFLOG.c:503 forcing unbind
of existing log handler for protocol 10
Thu Oct 16 22:05:22 2014 <5> ulogd_inppkt_NFLOG.c:503 forcing unbind
of existing log handler for protocol 7

I made a bug report for this;

https://bugzilla.netfilter.org/show_bug.cgi?id=977

Does anyone know anything about this, if it's a bug or end-user error I can fix?

Thanks
Mii
