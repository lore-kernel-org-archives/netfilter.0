From: Ben K <benkloester@gmail.com>
Subject: iptables --string-replace
Date: Mon, 17 Jan 2011 09:43:27 +1100
Message-ID: <AANLkTinzEVbR7L8PU_qhJj4MVXKsAOTKxQfA15ZHUWGT@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:date:x-google-sender-auth
         :message-id:subject:from:to:content-type;
        bh=bTSsQmBqCla8QJJmECmOM1uzZnzzuukE0SwU1eJxMPY=;
        b=PxGvr6/Dq5utA1TGwC/YoOV3Tk0am0RVtXhyq581NkezyJ3BstBbIneQcHR75NeouF
         ldC2jc8urYN/z6EeoTQDGJ2yZP9yyP7AqvFtYBqIId/2SXQAPYbauq6yZYF8YEey8nwe
         eq4Z/byBB+lkkNEG+2wVUwfoCwpEZ8EfZuZlI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'd like to be able to mangle strings passing through my home router
running Openwrt in order to modify/anonymize user-agent strings. I
believe a patch further extending the iptables string extension by
providing string replace functionality was submitted by Michael Rash
back in 2004 (archived at
http://www.spinics.net/lists/netfilter/msg23791.html). This would be
ideal as I could then mangle user-agent headers without eg needing to
run an http proxy.

Does anyone know if the --string-replace functionality ever made it
into iptables? If not, what are my chances of the patch from 2004
playing nice with the current Git head revision?

Thanks very much,
Ben

(BTW what's with the mailing list rejecting HTML emails?! Are we
living in 2001?)
