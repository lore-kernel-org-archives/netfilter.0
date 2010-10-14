From: Xing Qianqian <xingqq@21com.com>
Subject: how to install xtables extension to arbitrary path?
Date: Thu, 14 Oct 2010 22:25:07 +0800
Message-ID: <4CB712C3.3030804@21com.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

When building iptables, we can use "configure" to specify the xtables
extension install path by "prefix" or "withxtlibdir". And when we
running the iptables, iptables seems to search for the xtables extension
libraries only in the path that was specified by "configure". If we move
the xtables extension libraries to some other place, iptables will
report failing to load the "so" files.

Because I'm doing cross compiling, and I will place the xtables
extension libraries in the target board, and the final path might be
different than the "configure" path. Do you know how to make iptables to
load the correct xtables extensions?

Thanks.

-- 
Xing Qianqian


