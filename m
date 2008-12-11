From: "Ashok Rao" <greatarbor@gmail.com>
Subject: Port forwarding and locally generated packets
Date: Thu, 11 Dec 2008 13:33:27 -0500
Message-ID: <68252ab80812111033nc0a8100s325659bac522160c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=ss8dtTPVwZkwLW3kQA7jx8VivyzLFdLIRw49zznmSAw=;
        b=EjPovRqoOLPmDpxmAPt5VtQ9TMgUVwryQET4BDaZftn8Zq8IQG1WxoXDXgRt0HzDzv
         24V1Ek4vTV2L69MtGQMWAEtc1HbwgXg7P+7nBaH5ED3x9LycOC6ElIvR04lCFMFMG24K
         2uiJiUM27f1ulav9/E6lutayA0c8rVBgrfGO8=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have a router set for portforwarding  -  i.e. all incoming packets
on the WAN interface are DNATed to a host on the LAN side
The router is also set to source NAT all packets going out on the WAN
interface.

HOST-----> ROUTER------>INTERNET
         LAN                WAN

If the router itself sends out a ping on the WAN interface to some
host on the Internet - will netfilter connection tracking ensure that
the ICMP reply is passed back up the router stack  and not
port-forwarded back to the HOST.

I am pretty sure that's the way CONNTRACK works but am looking for confirmation
