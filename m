From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: UDP MSS
Date: Tue, 14 Dec 2010 09:17:50 +0530
Message-ID: <AANLkTi=96gvK6gaAE7LcLafbFM-_xGuaMM7J0xwR7hXf@mail.gmail.com>
References: <AANLkTi=qOQ0Rmyp78NEE9qSGOTFvgTDFSbDEDCtzoQ04@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=NuS4O6GMudZeNEcwxXMYMocu9DymRw1nlnDNudaEaIw=;
        b=Ljo14lMZnXBXASgiWWkf1UzipLM9oq3Tk50nV5SROrGDtsJL22bKkl7aylYhhODM6d
         /ADHYGhF2v0+HdRVfbaNeGLye4WzELMs5djHsFFzyCU8tZUfYEIL/kQ151FN0vx43Itl
         Nl0myEZ1eZP7AqOzXSGHXSv3Pu8VPMX7z5CQ8=
In-Reply-To: <AANLkTi=qOQ0Rmyp78NEE9qSGOTFvgTDFSbDEDCtzoQ04@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter mailing list <netfilter@vger.kernel.org>

In udp , there is no mss discovey.So , if we=A0 set DF bit in IP packet
=A0 and suppose an intermediate router does have disabled icmp-reply
(thru iptables )=A0 and=A0 have less MTU than the sender.

Then , router=A0 will drop the packet ,How client know to fragment the
udp packet ?

-Ratheesh
