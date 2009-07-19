From: Michael Mefford <meffordm@gmail.com>
Subject: questions about nfq_unbind_pf()
Date: Sat, 18 Jul 2009 23:11:51 -0600
Message-ID: <4A62AB17.9000009@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=gkUEeGfC5qaG4BF1TuXywfJUWTxM/6QA6btIRKtDHqo=;
        b=wd/WP42vZQhaK5bkKx3xdlYHK3BJ62/+hUMxRMjUSUQ1Wu42yAEyx1XNoQWZityFec
         71cNrFM7/QGuq1UIniilYlvDxtNYAbfKyfhIBx51AtwyWk7QxADMmDdydjXnLUmYR2/+
         a4PcjLyQyuFWdVKukZ0Gw4aTeYnUbleqD8Zas=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Once I've called nfq_open(), do I need to call nfq_unbind_pf() before 
calling nfq_bind_pf(); or can I call nfq_open() and then nfq_bind_pf() 
directly?


Michael.

