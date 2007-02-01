From: Wakko Warner <wakko@animx.eu.org>
Subject: Re: SSHBrute Force: False Postives
Date: Thu, 1 Feb 2007 18:17:34 -0500
Message-ID: <20070201231733.GA21833@animx.eu.org>
References: <20070201120648.GA19604@animx.eu.org>
	<20070201131319.71585.qmail@web25512.mail.ukl.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20070201131319.71585.qmail@web25512.mail.ukl.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: franck joncourt <joncourt_franck@yahoo.co.uk>
Cc: netfilter@lists.netfilter.org

franck joncourt wrote:
> In order to prevent such attacks, you can write iptables rules to set up port knocking. This is the way, I do.

I thought about doing this, but I ultimately decided against it.  The
problems of doing the knocking outweighted the benefits.  I prefer to let
them try a few times before my current rules ban them.

--
 Lab tests show that use of micro$oft causes cancer in lab animals
 Got Gas???

