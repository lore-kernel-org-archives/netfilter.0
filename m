From: Bryan Harris <bryanlharris@me.com>
Subject: Re: iptables and slave interfaces
Date: Mon, 28 Jan 2013 17:37:05 -0500
Message-ID: <E006197E-7780-4879-A82C-E4CC85084841@me.com>
References: <5103B7FD.3010504@yahoo.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <5103B7FD.3010504@yahoo.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: lejeczek <peljasz@yahoo.co.uk>
Cc: netfilter@vger.kernel.org


On Jan 26, 2013, at 6:03 AM, lejeczek <peljasz@yahoo.co.uk> wrote:

> newbie sort of question:
> does slave ifs of a bridge need to iptabled? does one need
> to forward/input etc.. them? It should be only bridges in
> this situation, right?
> 

Sorry if I misunderstood your question.  Is it possible you need ebtables?

http://ebtables.sourceforge.net

Bryan
