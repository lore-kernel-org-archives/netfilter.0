From: prmarino1@gmail.com
Subject: Re: Limit transfer speed rate by Iptables Rules
Date: Sun, 08 Feb 2015 12:56:07 -0500
Message-ID: <20150208175607.5963923.86563.2179@gmail.com>
References: <CAGHcRxabrZY2BO-by4L266cokmhtFp5Vrzbr-vp1t5Mkp4n8vA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :subject:from:in-reply-to:references:to;
        bh=GMP8d1m5vn0lFAoZk+Iw1C/edgGCs4Sce4Js5m6JsBY=;
        b=NXutC1KfJUdrKVLtz6OLC8H8rLeNx4Nv3/6lcCk2Ags3mmu+y1O1DZJxOg3F/VzxRW
         Nm/HvhKCcSlPUDuBWD+kIXqAl2CXcbEMC6r6ojMXVW4sXNzQRwuRSWglsfnlr+PSkN1N
         sPzEpXBT4Kiv9kRp0+BM6yfsc7ZQApBynA7roNLBepay0dlEeL6wkMBTznazfJ6W7oQZ
         sTDlEoIo14kHBGAOKzpygUtqxBPQ3t/46V8KC5fyGRp0NHznVNKuliIe2imA3vjjXKWD
         4X8wj6EADVqhx3MAYb26Xhlhw/WT6sBjG5gTEgG8Q/2lkInyz+LnET9kjQWC+QAXajWI
         E8gA==
In-Reply-To: <CAGHcRxabrZY2BO-by4L266cokmhtFp5Vrzbr-vp1t5Mkp4n8vA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: jack Linux <ilinuxer.85@gmail.com>, netfilter@vger.kernel.org

Are you sure you aren't mixing up source and destination keep in mind i=
t's not the source of the packet. The source refers to the host that in=
itiated the connection.

Sent from my BlackBerry 10 smartphone.
=A0 Original Message =A0
=46rom: jack Linux
Sent: Sunday, February 8, 2015 02:26
To: netfilter@vger.kernel.org
Subject: Limit transfer speed rate by Iptables Rules

I have D-Link Router DSL-2730U that support busybox OS and iptables
version 1.4.0

I managed successfully to block the host for being connect to the
internet using the following command

Block by ip address

iptables -I FORWARD -d 192.168.1.6 -j DROP

Or By mac source

iptables -I FORWARD -m mac --mac-source bc:20:a4:ff:79:80 -j DROP

The only problem now i have is trying to limit transfer speed rate
(upload & download) to be only serve 30/kbps by MAC Address using

iptables

I tried to make iptables rule like

iptables -I FORWARD -m mac --mac-source bc:20:a4:ff:79:80 -m state
--state RELATED,ESTABLISHED -m limit --limit 100/second --limit-burst
30 -j ACCEPT

But it didn't work

Note : this router cannot modify , delete or add any files . i cannot
make a bash or script file inside the router run , and unfortunately
the iptables connlimit module not supported in this iptables version
too
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at http://vger.kernel.org/majordomo-info.html
