From: Sheran <specify@mailbox.org>
Subject: How to disable network access for certain applications via
 nftables?
Date: Sat, 21 Aug 2021 16:54:32 +0200 (CEST)
Message-ID: <1041550812.134073.1629557672733@office.mailbox.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:content-type:content-type:mime-version
        :subject:subject:message-id:from:from:date:date:received; s=
        mail20150812; t=1629557672; bh=kAT8mMeDZG1Z6TdnUTMRbjtDO7nGdPDoJ
        J+gmagAkJM=; b=XOd75gq5ZDh5yC5V6zSkBYhfSKQVpMubwRNSR5Wg+GEP+0zZj
        8yWKC6EC819f5YxZDujzmC/u+9caiDixAgJFCeA6gy5Rtu+q3n2uiOrg6VcjdXFm
        vNh6T3TqUMSmMTNW32RD9Ww1Lax04DciMamJLT1J5yCL5suSF0jDvPugCyUSOtiS
        ql2lvFqzi6gYFnxVelwZyFodw8LM0U6+mHRR/ZobB4pda4ane64Viin0iU8u1+5+
        8InzZ5kbhaGGYSo5mJgD/TFJAqaxapV6cKezuhqBr2TFj/XMc+lTIU7SBQTzAyDp
        8ihq+Gr+K1TnlqD73wAdeOyXEoo4aCNAbTHRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1629557677;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=kAT8mMeDZG1Z6TdnUTMRbjtDO7nGdPDoJJ+gmagAkJM=;
        b=dkLYJ0GVzY1oSGwLiiJerpOhkxkZWvuSnplYl8gb4TA+0Bv1lIfjhZE1LpS0Ld/e1otOqw
        IiHaY5ne/omhCicaRdrdiDdh5cZurCJbYlHDfJeaVmxlcMH6wklbLXQ4ffeRrSl2JNC3lS
        UxGvbPP7R35jXgDsXpaO2s7xvRmMRTpJKRQ9j3+fyWWaT81EaqYBa0M9sWYkXqnWjjD0Wj
        6aaiDwkj3sjzOTxmpjgUY0Q+e2gyoA+RS5HE+rSjLp20veAfxw1sXNk9+qm+MQJpnZP3DP
        IykY8ZEJ0yQ7wqJVXaD8g+W4RWz232FCGbUDsOtcWyLwjMVW2iMZOK96xFQ30w==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,

I want to use nftables to disable all network access of certain applications. In case it matters, these are applications run through the Wine compatibility layer (https://winehq.org). I'm new to nftables, but I have read a few guides and reference pages, and I can't figure out how to edit my nftables.conf to do that.

If it's possible with nftables, can you walk me through how?

If it's not, what other tool should I use?

Debian 11, kernel 5.10.0-8-amd64.

Thank you
Sheran
