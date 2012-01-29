From: Simon Chen <simonchennj@gmail.com>
Subject: increase the number of routing tables
Date: Sat, 28 Jan 2012 21:23:50 -0500
Message-ID: <CANj2EbesFkNd-d=_Q0wwTLspUbYyevTTc-oS915HJKtpwzBQ_Q@mail.gmail.com>
References: <CANj2EbfR0cBaBd+t1yCZyErRpVzSC00DZohvtyazK8_9bv2aEQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=J+3FtbtlTQaC1e1XfTz897VicgQaZU69Wv5reRTHVS4=;
        b=FIMV97VmEESbVPLdCk6zsVktKS/azRNHPVPPw3eeqRZ1CqN6dg9nyXQmu2tq6st5zU
         Fg78eAgDMgU0LrnImuV5ZnLWdaTGX1JsMDE4+YlQTX5RPVUcCcBqG7tLagh6iuuEnaD6
         Ik90HcSP+3Fmp6yspu3kbLd6W0xoYi8S88aAA=
In-Reply-To: <CANj2EbfR0cBaBd+t1yCZyErRpVzSC00DZohvtyazK8_9bv2aEQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hey folks,

To my limited knowledge, Linux currently supports 256 (255?) routing
tables defined in /etc/iproute2/rt_tables.

Is there a way to increase this number to something much larger? Are
there performance/scalability concerns there? I am trying to have
customized routing table for each IP address (using "ip rule add from
xxx table yyy"). I am not sure exactly how many IPs I'll handle, but
certainly more than 255...

Thanks.
-Simon
