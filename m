From: "Marcin Polewski" <marcin.polewski@gmail.com>
Subject: Port Triggering in IPTables?
Date: Mon, 22 Sep 2008 23:56:17 -0500
Message-ID: <37a72e270809222156l2c9a9d2ci47bf4101defd5e3d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=nPqoD+/DqBa5mDpibIVxWACasdcoMDa+koGQmBpqoE8=;
        b=MBv2MALzO9uB3rHCsiRt3DIguMxP4YNUkJ8H1L43psvJ9eAJuOvsqkXwEjnXicSj6v
         7DszeFTD8WPvSZkW7wZjaOpZjwWMwwcC6zLNi6hT5eio7PeUa131STey7i7GdYCaijwu
         9O4CvaxeTjDMFIkbQT/s9lI90WhjyynBIyTeU=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

Does IPTables support port triggering similarly like DD-WRT does? I
want to build my own Linux (or FreeBSD) box with IPTables that would
be able to use port triggering. I don't want to use DD-WRT since I
want full control over my box (hardware and software).

http://en.wikipedia.org/wiki/Port_triggering

Thanks,
--Marcin
