From: Georgecooldude <georgecooldude@gmail.com>
Subject: iptables: Chain already exists
Date: Sun, 4 May 2008 19:40:28 +0100
Message-ID: <5add45eb0805041140l5b77ca78u92ad78103d2da45d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=XcCvAEBaDV18tpoNO3P4M2UqqoUXa8bs8dgxwwnHiUI=;
        b=kJpXPS55ZVlBxei2pO55Kny6sp710ccuP3zZm+rfvUbHFktL+s/gEyfopllLbvpk05ar3MxLGBMAMVKJeP3veNtseT/V3G9YYI7uWFei0C3w/3DTObLURoNR7y0i2A7ns+bB/6D/1HYnxkHrBNQEANZk6vEE7y1OF/tcikdOpLk=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all

In my iptables script I have the following chains:

# ---LET MAKE SOME CHAINS---
 #...[LOGDROP]...
 iptables -N LOGDROP
 iptables -A LOGDROP -j LOG
 iptables -A LOGDROP -j DROP
 #...[LOGACCEPT]...
 iptables -N LOGACCEPT
 iptables -A LOGACCEPT -j LOG
 iptables -A LOGACCEPT -j ACCEPT


When I re-apply (./iptables.script) I get the following error
iptables: Chain already exists
iptables: Chain already exists

Tried flushing the rules first then re-running and I always get that
error. I guess something is wrong with the chain. Can someone more
experienced explain what the issue here is? I'm primarily from a Cisco
PIX background and just started on iptables.

BTW the OS is ubuntu 6.02 server edition.

Thanks in advance

George
