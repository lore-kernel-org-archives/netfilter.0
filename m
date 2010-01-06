From: Elison Niven <elison.niven@gmail.com>
Subject: conntrack -F not flushing the table
Date: Wed, 6 Jan 2010 23:01:37 +0530
Message-ID: <201001062301.37395.elison.niven@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:mime-version:content-type:content-transfer-encoding
         :message-id;
        bh=gd0xjM+f3MI/pQQcYHSN8KXwoQ0d7IZw28JeC1dEyZA=;
        b=SG+rXH3Jk2HSUgTAvHJGC0DLJN/WnZoPaz8mbxIOJ5X8VCUWi96IXXJUm3PTFyqX9T
         tDYw1pcjr+qKKtV/0FF6QAOh3NQB5CEUUxOUN45Pdcd6N0oLeoIhtw+FGfTa9h9zZJbR
         JKN9vQ/HNvkJQyYgg8DM89nZvzbcqCMZ/UCis=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi List,

I am running linux on an embedded powerpc board on which conntrack -F does not 
seem to flush the entries as seen below:

# conntrack -C
2000

# # command to flush 
# conntrack -F

#conntrack -C
2000

I am able to delete single conntrack entries using conntrack -D but conntrack 
-F does not work.

Any ideas on what could be possibly wrong, Am running linux-2.6.22 with all 
conntrack modules built in the kernel.

Elison
