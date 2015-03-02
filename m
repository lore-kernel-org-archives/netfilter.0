From: richard lucassen <mailinglists@lucassen.org>
Subject: Re: bug in iptables-restore and "recent" module
Date: Mon, 2 Mar 2015 08:52:59 +0100
Message-ID: <20150302085259.3cf54cdcc51407dd42848823@lucassen.org>
References: <20150215133147.6fb4589991419ad29180222a@lucassen.org>
	<54E126F9.6050609@plouf.fr.eu.org>
	<20150216235352.56ccff3bb9bfbb568dcdaeb7@lucassen.org>
	<54E30166.1090406@plouf.fr.eu.org>
	<54E3221E.5050909@conversis.de>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54E3221E.5050909@conversis.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Dennis Jacobfeuerborn <dennisml@conversis.de>

On Tue, 17 Feb 2015 12:12:30 +0100
Dennis Jacobfeuerborn <dennisml@conversis.de> wrote:

> > As -t does not commit the tables to the kernel, I do not expect it
> > to detect errors related to the kernel configuration. So I do not
> > see any bug in your description, it sounds like expected behaviour
> > to me. Where do you see a bug in that behaviour ?
> 
> This should probably be mentioned in the man page. Most people would
> think that if the ruleset passes a test with -t this means the ruleset
> can be activated. Which part specifically of the mentioned rule is it
> that cannot be tested without being committed the rule in the kernel?

--hitcount

Default is 20 and when --hitcount exceeds this value, "iptables-restore
-t" approves the syntax but the kernel does not accept this value.

R.

-- 
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
+------------------------------------------------------------------+
