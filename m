From: Eric Leblond <eric@regit.org>
Subject: Re: ulogd_inppkt_NFLOG.c:503 forcing unbind of existing log handler
 for protocol
Date: Sun, 19 Oct 2014 13:13:30 +0200
Message-ID: <1413717210.14410.8.camel@regit.org>
References: <CAB1i-Sx05bSH5hEgEzAPqeJ_8kq4SqFM106nBrmw+U0cfwb1Xw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAB1i-Sx05bSH5hEgEzAPqeJ_8kq4SqFM106nBrmw+U0cfwb1Xw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: E R <ears.box@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,


On Sat, 2014-10-18 at 12:49 -1000, E R wrote:
> Hi All,
> 
> I noticed using NFLOG for ulogd 2.0.2, when ulogd starts, in
> /var/log/ulogd.log I'm seeing these three messages;
> 
> Thu Oct 16 22:05:22 2014 <5> ulogd_inppkt_NFLOG.c:503 forcing unbind
> of existing log handler for protocol 2
> Thu Oct 16 22:05:22 2014 <5> ulogd_inppkt_NFLOG.c:503 forcing unbind
> of existing log handler for protocol 10
> Thu Oct 16 22:05:22 2014 <5> ulogd_inppkt_NFLOG.c:503 forcing unbind
> of existing log handler for protocol 7
> 
> I made a bug report for this;
> 
> https://bugzilla.netfilter.org/show_bug.cgi?id=977
> 
> Does anyone know anything about this, if it's a bug or end-user error I can fix?

This is just a normal message. It warns you that ulogd is trying to
remove other software that could have declared log handler for the
protocols.

So this does not explain the issue described in bugzilla.

BR,
-- 
Eric Leblond <eric@regit.org>

