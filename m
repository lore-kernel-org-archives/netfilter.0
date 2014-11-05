From: Ricardo Klein <klein.rfk@gmail.com>
Subject: Linux Firewall Active/Active
Date: Wed, 5 Nov 2014 17:15:23 -0200
Message-ID: <CADuigkVbB2nt5P6y-JCaW_bh6v_GhjL9BRBiHRyvA_yH81v4RA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=QiiDtyrr48doU/gNPre13WAEfJQ1JeJ3Qv2FiWq1l38=;
        b=bp19LcEmFsriJL8hUu8F0yVs2aBdbOnPi2DAhU3Pqu76bdYXsHEicj1OxbJ6JcxIBw
         CeZjhwEzgwfAYGBB/m3tGbA/GZZie+eafUrlhjx2c+QK/Dva+wadfy+nehup2d0RkPgF
         z5oo//5L8qtfB/ogZfxXzfZpaUiabDMDK6P8RHzBGmmKCujakEpACqJtllBg2AQkGS0H
         eElhX4MOxJm7T9U5eE+U7dPIGThURekSQNuAqTtvMnktH3Sthjo4UoxG2eTiK9jtXpUn
         9IEld25SZF0wRJSgvGgSLd5+oOOX96zGwfa7tLZ15xhsAkMCoqE2KNOiW754RmN3w5s9
         1XGQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hi there,

I need to build a scenario with 2 linux servers (probably CentOS7)
acting as active/active firewall servers. What tools should I use?
I saw some articles with:
 - conntrackd + keepalived
 - conntrackd + corosync + pacemaker

But, what is the most used/stable?


AND, if there is a chance, I have 4 lan networks (each one in a
different VLAN) and it should be good if I can set something like
"preffered master" to each one for load distribution, because I will
run SQUID in those servers too.

I just need to know which way to go, so, I can learn the tools and
configure it all here.


regards,

Ricardo Felipe Klein
klein.rfk@gmail.com
