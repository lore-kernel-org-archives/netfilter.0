From: Brian Mearns <mearns.b@gmail.com>
Subject: Is p-o-m still the correct thing to use?
Date: Fri, 25 Jul 2008 21:25:43 -0400
Message-ID: <488A7D17.4070506@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=mf+lBR7yMypB4efqC/NBYDc0c0r9PTasPO8UDYEXb/Q=;
        b=a6NLmsM9g6lFa9n77hBYOqa0/5HGEKdnzJqNlfp+j/L12pZvC6GeVuEVVn+lNHKH+N
         KUG8Xn6Q4kw6C+6F5rbJh5bm31G30wSy6LpW9jCoIpY6BtuxxiaXr9ccJawBPvSEVP4I
         OLbEV59llwtqv7grLT4huTGTRwum29KH+WUYU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

The latest version of POM seems to be from 2004, and I saw some 
references in the mailing list archive seeming to indicate that is' 
being deprecated, but is there anything to replace it?

I'd really like to patch in TARPITs, but the latest POM does not work 
with the latest iptable src ("doesn't look like a iptables source code 
directory to me.")


Thanks,
-Brian

---
There is no disclaimer. Do what you want.
