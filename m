From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Re-8: connection to vpn Server (pptp) behind iptables FW
Date: Fri, 12 Mar 2004 13:06:04 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403121306.04135.Antony@Soft-Solutions.co.uk>
References: <DIIE.000000EE00002A43@sbgit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <DIIE.000000EE00002A43@sbgit.com>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Friday 12 March 2004 1:00 pm, peter.gehle@sbgit.com wrote:

> Ok, i have made an test, but in the syslog was nothing about the
> connection? he logs nothing?

So, maybe there's something about the protocol which simply doesn't work 
through nat without a special helper, or something like that?

As I said, I'm not an expert on PPTP, I just thought the logging rules might 
give you a bit more information about what's going on.   If not, it's over to 
someone who knows how PPTP can be made to work....

Regards,

Antony.

> -------- Original Message --------
> Subject: Re: Re-6: connection to vpn Server (pptp) behind iptables FW
> (12-Mrz-2004 13:28) From:    Antony@Soft-Solutions.co.uk
> To:      peter.gehle@sbgit.com
>
> > On Friday 12 March 2004 12:24 pm, peter.gehle@sbgit.com wrote:
> > > > It may be dynamic, but you can still find out what it is for a given
> > > > session.
> > >
> > > How?
> >
> > If it's a Linux machine, ifconfig
> > If it's a Win9x machine, winipcfg
> > If it's a WinXP machine, ipconfig
> > If it's something else, I don't know.
> >
> > Antony.

-- 
There are only 10 types of people in the world:
those who understand binary notation,
and those who don't.
                                                     Please reply to the list;
                                                           please don't CC me.



