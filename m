From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: (no subject)
Date: Tue, 29 Jun 2004 15:26:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406291526.12048.Antony@Soft-Solutions.co.uk>
References: <1B5A52EE434FEB48AA4803AD84BD3FC37945@goliath.tngnet.net> <200406291508.45532.Antony@Soft-Solutions.co.uk>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406291508.45532.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

On Tuesday 29 June 2004 3:08 pm, Antony Stone wrote:

> On Tuesday 29 June 2004 2:49 pm, Richard Gutery wrote:
> > Stop macro:
> > $IPT -N LD
> > $IPT -A LD -j LOG
> > $IPT -A LD -j DROP
>
> That has me really confused.   I was expecting you to say that $STOP
> expanded to the word DROP, or some other valid target for the -j option on
> the netfilter command line.
>
> > $STOP=LD (LD = Log and Drop)
>
> I don't quite see how you can use this after -j on an iptables rule,
> however...

Okay, having thought about it a little more I do now see that this should 
work:

LD is a user-defined chain which simply LOGs, then DROPs, everything entering 
it, and therefore "-j $STOP" is the same as "-j LD".

I got confused by thinking you meant that the $STOP macro expanded to three 
lines (!) - now I see that's not quite what you meant....

Regards,

Antony.

-- 
Abandon hope, all ye who enter here.
You'll feel much better about things once you do.

                                                     Please reply to the list;
                                                           please don't CC me.


