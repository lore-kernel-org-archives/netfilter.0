From: richard lucassen <mailinglists@lucassen.org>
Subject: Re: bug in iptables-restore and "recent" module
Date: Fri, 20 Feb 2015 22:05:44 +0100
Message-ID: <20150220220544.9df9143e2fb9fbb6f8e5c397@lucassen.org>
References: <20150215133147.6fb4589991419ad29180222a@lucassen.org>
	<54E126F9.6050609@plouf.fr.eu.org>
	<20150216235352.56ccff3bb9bfbb568dcdaeb7@lucassen.org>
	<54E30166.1090406@plouf.fr.eu.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54E30166.1090406@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Tue, 17 Feb 2015 09:52:54 +0100
Pascal Hambourg <pascal@plouf.fr.eu.org> wrote:

> > I'd say in iptables-restore. Apparently the -t (test) does not
> > notice that there is a problem while the real iptables-restore does.
> 
> Sorry, my question was not clear enough. Let me rephrase.
> 
> As -t does not commit the tables to the kernel, I do not expect it to
> detect errors related to the kernel configuration. So I do not see any
> bug in your description, it sounds like expected behaviour to me.
> Where do you see a bug in that behaviour ?

You have a point :) And I agree with Dennis to add it to the
manpage.

R.

-- 
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
+------------------------------------------------------------------+
