From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Adding features to xt_recent and xt_cluster
Date: Wed, 8 Jun 2011 22:08:56 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1106082205360.13030@frira.zrqbmnf.qr>
References: <BANLkTi=os6R7oUa6B_snwKPtNAfQA=i4GQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=os6R7oUa6B_snwKPtNAfQA=i4GQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karl Heiss <kheiss@gmail.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2011-06-08 16:57, Karl Heiss wrote:
>
>For the xt_recent module, I will be updating the module to support
>matching by destination IP, source-port and destination port. Port
>matching would be supported via the '--rsport' and '--rdport' flags,
>and would default to the current behavior of matching IP only if
>neither is specified.
>
>Many might be wondering why I choose to include matching by
>destination IP since it appears that xt_recent matches destinations
>using --rdest. However, xt_recent does not appear to differentiate
>between source and destination addresses within it's entry tables.

You could use two separate tables, which has the same effect as
storing entries with a unique key of <saddr-or-daddr-bit, addr>
in a single table, unless I missed something.
