From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: cross compilation of xtables fails
Date: Fri, 3 Dec 2010 14:58:12 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012031456370.22038@obet.zrqbmnf.qr>
References: <4CF8F67B.8010504@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CF8F67B.8010504@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Friday 2010-12-03 14:54, Mr Dash Four wrote:

> I have tried to compile xtables (1.30) on a x86_64 machine for i686
> architecture and that was not successful due to, in my opinion, errors in the
> m4-generated gcc statements for compiling/linking when make is executed. This
> is the log I get from make which I think causes the error (./configure passes
> with flying colours - all dependencies - i686 and x86_64 alike - are satisfied,
> I've made sure of that before I began this process):

> After examining the above error and investigating further I've noticed the
> following: the C/CPPFLAGS I specified during the ./configure process which are
> very specific (and vital!) to enable cross compilation (-m32, -mtune, -march
> etc) have, seemingly, been ignored for 3 groups of files/objects:

So what is the actual configure command you used?
