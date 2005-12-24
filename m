From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: string help
Date: Sat, 24 Dec 2005 14:51:45 +0100
Message-ID: <000a01c60891$2deffae0$0101000a@sterenborg.info>
References: <20051224073209.54921.qmail@web35908.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051224073209.54921.qmail@web35908.mail.mud.yahoo.com>
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

> I want to replace string "hello" with "abcd" how i
> could do with iptables mangle, patch-o-matic is
> working fine
> 
> i am waiting for quick reponse.

Quick...? Have you actually searched the net to make it work ?



From the Netfilter/POM-NG documentation :

============
string - iptables string match
Author: Emmanuel Roger <winfield@freegates.be>
Status: Working, not with kernel 2.4.9

This patch adds CONFIG_IP_NF_MATCH_STRING which allows you to
match a string in a whole packet.

THIS PATCH DOES NOT WORK WITH KERNEL 2.4.9 !!!
============

So, this is a MATCH, not a TARGET or something with which you can alter
packets.

Maybe you should also read this :
http://www.netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO-
3.html#ss3.18

You might be able to QUEUE it to userspace, do the replacing there and
send it back to netfilter. But I don't know how you would re-inject a
packet or if that can be done. If it can be done, I suppose you'd have
to write a program yourself to do it.


Gr,
Rob


