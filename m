From: Hendrik Visage <hvjunk@gmail.com>
Subject: Logging for NAT information with ULOG/NFLOG/LOG
Date: Sun, 28 Dec 2014 00:02:01 +0200
Message-ID: <CADtGFv=6U6U8Aosvz=rN-Wv8Bk-Ag=LMCXHLCXU99udTmdnymA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=GjbsvAgyqI5RpljIPqGRkoqIHmpg0ZbWCgF0oVjAnkc=;
        b=h1/Afig4Sgc9ccFMcTq91WOGFUUjL1y72pQlPDAd9eHalV4y9flceBSP/n+/SJjoZS
         m2FR0isIb/lFmE5S5xWOgnziZUOWAfAfxmJ25uZ/njxuYvYffFIVR0dy4MK3sf3jdQr5
         fxJtn57L7pmgpsoDOOPuRfixjClwhrZs+NLBTw2zhYFYEhYInkwqVcTqrvPI5NYxMCAM
         fZQ2y3WS723v3mxJE4jb+Tbhjesw2Sidb/7/yHshJYxoj6TFAcYXOXylpI3ZJUfxfF3T
         mnS03KvviqFVVEuDRWhAUUdiOn0XHG76x44FmWDT4G1i3eOhjOXY71FtdP1EDW3s/kuE
         YlEA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,


 I'm in need to track internal NATted/masquaraded IPs bandwidth
utilization, mapped to which outbound interface was used as I have
multiple outbound routes/interfaces as well as transparent caching as
an encore, and I need to account for the bandwidth used by the
firewall/server too as some service runs on it too.

 What I'm looking for, is something like conntrack -L output, but for
each packet in each direction with it's input, output interfaces and
size, preferably logged via ULOG/NFLOG mechanism and not the kernel
logging method.

 Any advice on how to achieve this?

Thank you
Hendrik VIsage
