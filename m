From: Fabrice <fabricedeyber@agilemesh.com>
Subject: Re: how to install xtables extension to arbitrary path?
Date: Mon, 14 Feb 2011 14:25:33 +0000 (UTC)
Message-ID: <loom.20110214T152123-163@post.gmane.org>
References: <4CB712C3.3030804@21com.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Xing Qianqian <xingqq <at> 21com.com> writes:

> 
> Hi,
> 
> When building iptables, we can use "configure" to specify the xtables
> extension install path by "prefix" or "withxtlibdir". And when we
> running the iptables, iptables seems to search for the xtables extension
> libraries only in the path that was specified by "configure". If we move
> the xtables extension libraries to some other place, iptables will
> report failing to load the "so" files.
> 
> Because I'm doing cross compiling, and I will place the xtables
> extension libraries in the target board, and the final path might be
> different than the "configure" path. Do you know how to make iptables to
> load the correct xtables extensions?
> 
> Thanks.
> 

Hi Xing,
I'm having the same issue. I'm able to cross compile but when I install 
to another file system the libraries always look at the absolute path which 
is not valid anymore. How did you get around the issue?



