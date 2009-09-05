From: Karl Hiramoto <karl@hiramoto.org>
Subject: Re: Problem with unaccepted rules!
Date: Sat, 05 Sep 2009 11:49:03 +0200
Message-ID: <4AA2340F.1080205@hiramoto.org>
References: <112176.44749.qm@web112010.mail.gq1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <112176.44749.qm@web112010.mail.gq1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Silva Paulo <psdasilva@yahoo.com>
Cc: netfilter@vger.kernel.org

Silva Paulo wrote:
> I'm having the following problems with iptables 1.4.3.2 on gentoo linux. Also tried with  masked (unstable) version 1.4.4 with the same results.
>
>   
Silvia,

On gentoo you have to compile and configure your own kernel.  You need
to  have the kernel module xt_multiport CONFIG_NETFILTER_XT_MATCH_MULTIPORT

and xt_limit  CONFIG_NETFILTER_XT_MATCH_LIMIT

See
http://www.gentoo.org/doc/en/handbook/handbook-x86.xml?part=1&chap=7
http://www.gentoo.org/doc/en/gentoo-kernel.xml



--
Karl Hiramoto

