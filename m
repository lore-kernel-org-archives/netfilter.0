From: Eduardo Sachs <edu.sachs@gmail.com>
Subject: Firewall in Load Balance - Active/Active
Date: Mon, 25 May 2009 08:46:17 -0300
Message-ID: <3e7107590905250446g2f3aa95dua9691dc63cc3dfec@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=hALoqQZZ0Dvhj3uEGsxM0Yie0F1bKji2R+6bMsgWjUA=;
        b=TgDELJgbBMTBufFYvEEswWlTyzsYtEUPNa10xbpMgV+CKX1bdXSoqLBVDq6aoPLKfM
         ou4XfM5NMIRjcVoX4jx5I1exDaIjmMsUicsQ36J3foyopQrWkZuCH+so90REEjhY/+EQ
         sGBBoogMRSOEAaxoKVYAg1ApTe0x5NY+NNkdc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi Friends!

I'm looking for firewall solution for active/active, the clients use
the firewalls randomly.

The conntrackd help me to replicate the state of the connection.

What help to "load balance" the firewalls?

My english is very terrible.. :)

Thanks!
