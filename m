From: d l <popgojp@yahoo.co.jp>
Subject: Re: Cannot use iptable extensions[solved]
Date: Tue, 21 Sep 2004 14:36:16 +0900 (JST)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040921053616.23076.qmail@web804.mail.yahoo.co.jp>
References: <63855.216.239.93.106.1095711687.squirrel@216.239.93.106>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <63855.216.239.93.106.1095711687.squirrel@216.239.93.106>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> So, could it be that you are loading it in the wrong
chain (not supported by the module) ?

Indeed.... I missed the big capital letter words in the
man page that <owner> is only usable in OUTPUT chain.

For the <connlimit> extension the kernel module isn't
compiled in for FC2.

Thanks all for helping out.
Regards,
DL


__________________________________
TSUKAME EIKOU! KAGAYAKE EGAO!
Yahoo! JAPAN JPC OFFICIAL INTERNET PORTAL SITE
http://pr.mail.yahoo.co.jp/para/


