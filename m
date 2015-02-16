From: richard lucassen <mailinglists@lucassen.org>
Subject: Re: bug in iptables-restore and "recent" module
Date: Mon, 16 Feb 2015 23:53:52 +0100
Message-ID: <20150216235352.56ccff3bb9bfbb568dcdaeb7@lucassen.org>
References: <20150215133147.6fb4589991419ad29180222a@lucassen.org>
	<54E126F9.6050609@plouf.fr.eu.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54E126F9.6050609@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Pascal Hambourg <pascal@plouf.fr.eu.org>

On Mon, 16 Feb 2015 00:08:41 +0100
Pascal Hambourg <pascal@plouf.fr.eu.org> wrote:

> > On line 180 there is the "COMMIT" of the filter table.
> 
> That sounds like expected behaviour. Where's the bug ?

I'd say in iptables-restore. Apparently the -t (test) does not notice
that there is a problem while the real iptables-restore does.

-- 
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
+------------------------------------------------------------------+
