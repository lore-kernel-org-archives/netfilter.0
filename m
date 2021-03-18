From: Martin Gignac <martin.gignac@gmail.com>
Subject: Re: How to troubleshoot (suspected) flowtable lockups/packet drops?
Date: Thu, 18 Mar 2021 13:24:21 -0400
Message-ID: <CANf9dFP5+O86gHZcy1vG0dV7QFf51NcjdRkiNY=4YBjnKbwaOg@mail.gmail.com>
References: <CANf9dFO+CAuiugQjwKDZ+tOVYuB+HMKeJzDVqekY=vVFE-rxFw@mail.gmail.com>
 <20210316230521.GB981@salvia> <CANf9dFMxabVweO2ipnPL8Ncemc9wQaxeJQs0dazrgf=VeXVjbA@mail.gmail.com>
 <20210317103443.GA18462@salvia> <CANf9dFPDyAU-WKD5SSBv2M+PUoUmT5jQAjLcD1jcwEYzWKPqXQ@mail.gmail.com>
 <20210317204220.GA13211@salvia> <CANf9dFOHgb+QNqVkWVsnP6ALSQxbPzyv8xA0LXyck39w3bUjwg@mail.gmail.com>
 <20210317222854.GA24692@salvia> <CANf9dFMzt+mZZS5SSYZbVY1M2VOz1wh3KEyUkfVeRMuMMc96yg@mail.gmail.com>
 <20210318162059.GA9120@salvia> <20210318170017.GA30939@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dz44DGEdyfo95IyBzb/sUmZj5iaEGV7vUCYU+4chAh4=;
        b=Mhxz8z6oyiJOCIeK492rG97eWxek/4HFONTpFrazg6228XbrqXc+7DC9phKO4qFFnl
         M7zmYs8kh/H6r8N2K2bn8wdAItCnVbsHMlDT+ecDEJANFq231DjTx3q9syAOAfksibN6
         AZMPMF3FRQJd2wpziBu2LLJeR+s0I+G/1q+wCk85F/E5SHzuVtKqILnUnY5vA+aw9Lrm
         O9DIgTwLhR1jEDh87UUgAad9t7XKFX9FvNjr0o+kYvPTzvSZR4kwl4eUC6ORaQhrskzt
         jc+2HaYXmxaPJmJm4LKGq1eDuZKc/kc1cXw2YPk7hEi/O7vG7KvAQWdC4u28v70gQAvg
         45qQ==
In-Reply-To: <20210318170017.GA30939@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

> I just checked, 5.10.17-200.fc33.x86_64 already contains the fix above.
> No need to check.

Bummer. Thanks for checking!

-Martin
