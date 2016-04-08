From: Damir Franusic <df@release14.org>
Subject: Re: conntrack -L fails with Linux 4.0: Operation not supported
Date: Fri, 8 Apr 2016 15:24:58 +0000 (UTC)
Message-ID: <loom.20160408T172250-888@post.gmane.org>
References: <20150505204800.GA2660@album.bayer.uni.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Petr Pisar <petr.pisar <at> atlas.cz> writes:

> 
> Hello,
> 
> after upgrading Linux to 4.0.0, listing conntrack table with conntrack tool
> does not work fork me:
> 
> # conntrack -L
> conntrack v1.4.2 (conntrack-tools): Operation failed: Operation not supported
> 

I am having the same issue and have discovered that NFCT_FILTER_DUMP_MARK
attribute is causing issues (conntrack.c):

nfct_filter_dump_set_attr(filter_dump, NFCT_FILTER_DUMP_MARK,
                                        &tmpl.filter_mark_kernel);




