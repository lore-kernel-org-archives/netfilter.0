From: "Jee J.Z." <jz105@york.ac.uk>
Subject: packet reording (was: Re: modifying packets using netfilter)
Date: Fri, 2 Apr 2004 01:40:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007801c4184b$130253f0$68892090@grouse>
References: <200404012158.QAA24193@buzzard.research.telcordia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: bss@research.telcordia.com
Cc: netfilter@lists.netfilter.org

Hi Bruce,

I am still very eager to find the answers, especially for packet re-ordering
at userspace. If you find the answers, I would be grateful if you let me
know. I will let you know vice versa.

Cheers,
Jee


> Hi,
>
> I was doing a web search re netfilter and found some questions you
> posted to the netfilter mailing list, but I couldn't find the answers.
> Did you get answers to the questions (listed below)?
>
> > Hi Eric and all,
> >
> > Thank you again. I have a few further questions:
> > 1. How many packets can ip_queue queue for userspace? How can we change
t=
> > he
> > size of QUEUE?
> > 2. Can we use ipq_read() and ipq_set_verdict() to access and process
queu=
> > ed
> > packets in any order?
> >     More specifically, for example, I wish to ipq_read() a number of
pack=
> > ets
> > from QUEUE before ipq_set_verdict() any of them, and then
ipq_set_verdict=
> > ()
> > in whichever order I want. It is possible?
> >
> > Cheers,
> > Jee
>
> Thank you.
>
> Bruce Siegell
> bss@research.telcordia.com
>


