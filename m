From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: safely apply new rulesets: iptables-apply
Date: Sun, 9 Mar 2008 17:45:06 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0803091733060.26142@fbirervta.pbzchgretzou.qr>
References: <20080304231606.GA16376@piper.oerlikon.madduck.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080304231606.GA16376@piper.oerlikon.madduck.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: martin f krafft <madduck@madduck.net>
Cc: netfilter discussion list <netfilter@vger.kernel.org>


On Mar 5 2008 00:16, martin f krafft wrote:
>
>iptables-apply is a simple shell script which applies the new
>ruleset and then prompts whether you like it. If you've locked
>yourself out, you cannot answer the prompt, and if you don't, the
>script rolls back the ruleset. Nice and simple.

It needs a minor tweak in that the timeout needs to be started
before you output anything to the terminal, just in case the
terminal blocks.


On a related note, you cannot trap signal 0:
	trap "rm -f $TMPFILE" 0 1 2 3 4 5 6 7 8 10 11 12 13 14 15

>Could this script possibly make it into the iptables distribution
>tarball? I am flexible about the licence and all...

The idea gets my approval.
