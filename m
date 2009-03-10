From: "G.W. Haywood" <ged@rowlescourt.co.uk>
Subject: Re: iptables bad byte counter?!?
Date: Tue, 10 Mar 2009 10:30:02 +0000 (GMT)
Message-ID: <Pine.LNX.4.58.0903101028310.6902@mail3.jubileegroup.co.uk>
References: <200903101026.48807.erik.wasser@iquer.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200903101026.48807.erik.wasser@iquer.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Erik Wasser <erik.wasser@iquer.net>
Cc: netfilter@vger.kernel.org

Hi there,

On Tue, 10 Mar 2009, Erik Wasser wrote:

> Hello list,
>
> > Chain INPUT (policy ACCEPT 2086 packets, 252096 bytes)
> >     pkts      bytes target     prot opt in     out...
> > 18446744073709551148 18446744073709508226 ACCEPT   all  --  eth0 *...
> > 18446744073709548061 18446744073708196250 ACCEPT   all  --  *    *...
>
> [...]
>
> The last comment to the original mail was the followng:
>
> > no, this is clearly a problem within the 32bit-userspace / 64bit
> > kernelspace handling of iptables.
>
> Is that true?

~$ >>> echo '18446744073709551148/(65536*65536*65536*65536)' | bc -l
.99999999999999997462

Looks that way.

--

73,
Ged.
