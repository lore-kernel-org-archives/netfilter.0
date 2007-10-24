From: "Srinivas Murthy" <codevana@gmail.com>
Subject: iptables 1.3.8 with older kernel
Date: Wed, 24 Oct 2007 14:09:07 -0700
Message-ID: <df1bdeb10710241409w4df5bd34qf64f7fdbcb1d4786@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition:x-google-sender-auth;
        bh=3aEt139+bzkbhWhzvNPAxvjbP6Kk2kJeBZDkyb/+bUQ=;
        b=CT7mcRD17JRv3F9h1wUudEWw08Hza7/CNHPvlZLdMBertBc55QydWMZkWTZHDKa9llKuY/u2ljnSAGtAYSnjEHr8gMHhNZR5OnQ3R9SA+iApoom+mrKfbNS6NqvFO5a6mad1CsUZN+/uK9I2eqjZh3LIV7DEBS+/DPIplfs4vdY=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'm working on migrating from using ipchains to iptables in our linux
2.6.10 and would like to use the latest iptables that can work with
this older kernel version.

Are there any known issues with using the newer iptables pkg with the
older kernel version?

Thanks.
