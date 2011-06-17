From: "icukeng@gmail.com" <icukeng@gmail.com>
Subject: how ulogd 2 works with conntrack
Date: Fri, 17 Jun 2011 13:07:05 +0400
Message-ID: <BANLkTimvPfpCdYZ3qBtM9DUF=Dnrxuo2-g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=Y2GddHaeVzlZdTmypuBJ+9A9DSFAesGiI6ozfTyjJ7g=;
        b=Vx/rOGI+ZN95CbmlNiWr1Ba26U1KEHoAkprjLluTQu8hTO12d2Jk/fSO3+cCL2RVRE
         t+qnxb9LlzG4dNBUwuhFpu5bOWhif32HCBBX3NHDlpDLv3VBhgv6SaOKwsrBpF+TcVf+
         vygM80406qOb0Lz+AIl/ibu74GhL7MbcUyvf8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I found in git code that ulogd use nfct_catch. As far as I understood
this function loops over the events until callback return
NFCT_CB_STOP. But in ulogd code there is only NFCT_CB_CONTINUE.
So how ulogd returns from nfct_catch loop? Or it isn't?
