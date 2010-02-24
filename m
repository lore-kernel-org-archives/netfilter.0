From: MargoAndTodd <margoandtodd@gmail.com>
Subject: is there suppose to be an error message when a module is not loaded?
Date: Wed, 24 Feb 2010 13:13:54 -0800
Message-ID: <4B859692.5030003@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=T8IGnLcQqbgWsrJb/iJcrpNBCHCSlnbc/yrMbccRNGg=;
        b=PN5GYnEgSP7hAYEjzasdxS+gMpwRUmGKXxQBPfQLD711NRejXHcAlmlF+2+yysg7kR
         FjddoLHKMk5zglOub4P4luXZk3lbfkX8ictmghczeEnPvxfI+msMj0V4te1C79jzNETJ
         5Du4bEjgXEnCqDi6KaaPMnOCFAN1WZ9TC8jZM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi All,

I am using 64 bit CenOS 5.4 (Red Hat Enterprise Linux clone)
and iptables-1.3.5-5.3.el5_4.1

I am fighting with a situation were my ip_conntrack_ftp
is not loading.

Question, when I run my firewall rule with

    -m helper --helper ftp

and ip_conntrack_ftp is not loaded, should I have
been presented with an error message?

The rule certainly did not work until I modprobed
ip_conntrack_ftp into the fray.

Is this a bug? And is it time to report it to Red Hat?

Many thanks,
-T
