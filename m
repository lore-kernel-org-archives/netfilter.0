From: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Subject: Re: help on tc with kernels >= 2.6.27
Date: Sat, 03 Jan 2009 13:29:22 +0100
Message-ID: <495F5A22.5020207@unipex.it>
References: <37b3b63f0901021046n40962c84mef64cab10153261e@mail.gmail.com>	<20090102204908.7ec18094@catlap> <495F39BE.1070901@unipex.it>	<001701c96d92$43c4e600$cb4eb200$@jorge@decimal.pt> <495F5036.2090104@unipex.it> <002701c96d9b$53a5c0e0$faf142a0$@jorge@decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <002701c96d9b$53a5c0e0$faf142a0$@jorge@decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jorge Bastos <mysql.jorge@decimal.pt>
Cc: 'Marek Kierdelewicz' <marek@piasta.pl>, 'Jorge Bastos' <jorge.decimal@gmail.com>, netfilter@vger.kernel.org

Jorge Bastos wrote:
> Bingo!
> 

:)

> So it seams that the problem is in TBF since 2.6.27 >= Checking the
> 2.6.27 changelog as you said, were made a lot of changes regargind
> TBF (also some CBQ and HTB changes), so that may be the problem. I
> say this because my rules were the same always, and always worked ok.
>  How can this be reported to the QoS people that maintains it in the
> kernel?
> 

See into the changelog, there is the mail addrs of the people who made the
commits and, if you want, to the lkml.

Michele

