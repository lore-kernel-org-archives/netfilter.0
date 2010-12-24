From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: IP header mangling
Date: Fri, 24 Dec 2010 11:21:24 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012241118130.16092@obet.zrqbmnf.qr>
References: <437954.32088.qm@web111108.mail.gq1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <437954.32088.qm@web111108.mail.gq1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: doug arro <doug_arro@yahoo.com>
Cc: netfilter@vger.kernel.org

On Thursday 2010-12-23 23:38, doug arro wrote:

>Hello,
>
>I am looking at writing a new xtables extension to add/drop IP Option 
>headers for outgoing packets.  Is the mangle table and the prerouting 
>chain the best places for this task?  Is there an existing module doing 
>similar things that I can model after?  I noticed this so-called 
>IPV4OPTSSTRIP patch.  Is there a similar kernel module that allows 
>adding an Option header to the IP packet?

http://svn.ninux.org/ninuxdeveloping/browser/xtables-addons/extensions
has an SR module that seems to do that for a specific option (SR) and 
then routing it. I guess you can reuse parts of it.
