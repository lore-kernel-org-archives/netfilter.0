From: Erik Wasser <erik.wasser@iquer.net>
Subject: Re: iptables bad byte counter?!?
Date: Tue, 10 Mar 2009 15:30:00 +0100
Message-ID: <200903101530.01319.erik.wasser@iquer.net>
References: <200903101026.48807.erik.wasser@iquer.net> <Pine.LNX.4.58.0903101028310.6902@mail3.jubileegroup.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.58.0903101028310.6902@mail3.jubileegroup.co.uk>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: "G.W. Haywood" <ged@rowlescourt.co.uk>

On Tuesday 10 March 2009, you wrote:

> > The last comment to the original mail was the followng:
> > > no, this is clearly a problem within the 32bit-userspace / 64bit
> > > kernelspace handling of iptables.
> >
> > Is that true?
>
> ~$ >>> echo '18446744073709551148/(65536*65536*65536*65536)' | bc -l
> .99999999999999997462

Well... aren't those bugs easy to fix? I'm just asking because the 
results are correctly in 99% of the time. So why is the transfer from 
the data failing (only) in 1% of the time? If there is anything that I 
can do or test to nail down this bug?

I can give you more infos about the route if it's necessary, that should 
not be a problem.

-- 
So long... Fuzz
