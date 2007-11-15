From: "Srinivas Murthy" <codevana@gmail.com>
Subject: new iptable
Date: Wed, 14 Nov 2007 23:22:17 -0800
Message-ID: <df1bdeb10711142322l53ff5da6x6c22b95260e91618@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition:x-google-sender-auth;
        bh=Iq4nELCRKcCzgZTPWxSXO7H1jpW5mkGcLETxekzby9I=;
        b=Z3KdZyIF8ENehaPZrwSIN6ASpcYAdhFVlYDMuT4Bxze/7Sw+PeIuXc4QYvGnxIb7W2PizpV+c9K1Yb4kpa21+K6z6Euf2c79KUwvNniySYPlX0DLRgY8l6nXGmtt0eP7FppZLLBXDLEvKcPigrFdnKiWHXySUyVwdjnEhSOez0M=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I've created a new table (follwing the template for iptable_raw.c). I
can see that the table is registered when I boot the kernel.

However the iptables utility reports it cannot initialize the new table.

debugshell# iptables -L -t pe_chain
FATAL: Module ip_tables not found.
iptables v1.3.8: can't initialize iptables table `testtable': Table
does not exist (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.

What do I need to do to get the iptables to recognize the new table?

Thanks.
