From: Vimal <j.vimal@gmail.com>
Subject: Development equivalent on Mac OS X
Date: Sat, 6 Sep 2008 23:45:12 +0530
Message-ID: <ff71fbf20809061115n2f53c86dk4d0db1aa951f12aa@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=P3ZLmHqldS+F/EPExqq/5sGPKHuWp8huPxqMTlLRuMs=;
        b=eq8CZr7cEdsnmbDIKCUibt90I0aQGk6IXWwWgX0wqCwK9E07hHl/G+SShV+HvDlv6h
         xBuWEak6cZDc1GqrtQjGSWauul3QPEDGLtMkZzSaUYvpnZoIEGv1vZPOIQZQasc9eGQe
         Kq61XZhqdZVm0ZgwejTWHMRX8kzOdv+uUR/CQ=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

Are there libraries for Mac OS X (10.5) that allow packet
manipulation, just like Linux's netfilter library does?

Specifically, I would like to write a program that should be able to
process every packet in the system before it gets `written' on the
wire. According to this page:
http://www.netfilter.org/documentation/HOWTO/netfilter-hacking-HOWTO-3.html,
my program should be able to be hooked at stage [4].

I searched a lot, but in vain.

Thanks,
--
Vimal
