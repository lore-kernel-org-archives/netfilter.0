From: Fabrice Triboix <gstdbg@yahoo.com>
Subject: How to remove TCP options with NAT?
Date: Wed, 13 Jun 2007 05:00:02 -0700 (PDT)
Message-ID: <734412.97456.qm@web59210.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I have noticed that to handle masquerading,
linux adds some TCP options to the output
packets (for a TCP stream, of course).

I would like to know if there is a way to
avoid that? Or more accurately: is it possible
to tell the linux kernel to do the
masquerading without adding these TCP options?

Thank you very much for any help,

  Fabrice Triboix


       
____________________________________________________________________________________
Get the free Yahoo! toolbar and rest assured with the added security of spyware protection.
http://new.toolbar.yahoo.com/toolbar/features/norton/index.php

