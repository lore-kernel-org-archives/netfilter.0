From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: (no subject)
Date: Wed, 26 Nov 2003 22:36:39 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311262236.39590.Antony@Soft-Solutions.co.uk>
References: <1069853846.3fc4ac966be15@paris-hme1> <1069880102.3fc513260c677@paris-hme1> <3FC51BC8.1000403@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FC51BC8.1000403@Loudoun-Fairfax.com>
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

On Wednesday 26 November 2003 9:31 pm, Jeffrey Laramie wrote:

> zynkx wrote:
> >hi again Antony:
> >
> >you just said it all. no use for me to add not even
> >one line to what you just wrotte :))
> >
> >now if anyone has got those masks i would appreciate
> >it :))
> >
> >tanx again and sorry for this mess ;)))
>
> zynkx:
>
> If your mail server is running qmail, then your best bet is to read the
> qmail documentation and learn how to apply filters for the mail server.
> If you do use iptables, you will need to create a FORWARD rule to allow
> mail from each of the smtp servers that Ramin listed. Since any message
> from a Yahoo or Hotmail account will be sent from one of those servers
> you don't *have* to know every ip range that they've been assigned. The
> only problem doing it this way is if they change smtp server IPs you'll
> need to change your rules. I would do this with qmail if I were you.

I agree, and zynkx, I can't tell you how to do this with qmail because I'm a 
sendmail person.   Do what Jeff suggests and look at the qmail documentation, 
and if it's not clear ask on a qmail list.

I really think you should not try doing this by IP address because those may 
change and you won't find out until things start going wrong.

> Antony:
>
> It sounds like you have the "We're behind schedule and you got to get
> this done before the holidays blues!"

Not quite - the satellite link got installed very suddenly (phone call Friday, 
two men and a long ladder on Monday...) and we now have a month to evaluate 
it and see if it's a suitable replacement for the leased line - so I have to 
get as much of it working as possible so people can test it properly.

Antony.

-- 
The truth is rarely pure, and never simple.

 - Oscar Wilde

                                                     Please reply to the list;
                                                           please don't CC me.


