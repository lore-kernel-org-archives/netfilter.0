From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Bad Argument error
Date: Mon, 8 Jul 2002 22:18:40 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020708211842.FLFJ19225.mta07-svc.ntlworld.com@there>
References: <956DDDA708487D498B43C36EA4DEA4050B5C50@SFEXCH01>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <956DDDA708487D498B43C36EA4DEA4050B5C50@SFEXCH01>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.samba.org>

On Monday 08 July 2002 10:08 pm, Mike G. Hammonds wrote:

> Attached is a sample of my iptables script file located in the
> /etc/sysconfig/ <dir>

Well, I can't see anything wrong with the line
LOOPBACK="lo"
which is the only place I can see the variable defined, but then I can't see 
any use of the variable $LOOPBACK either.

Does the error occur on that line of the script, or later on (try commenting 
it out and see if the error goes away) ?

How do you run the script ?

Antony.

> -----Original Message-----
> From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
> Sent: Monday, July 08, 2002 4:38 PM
> To: netfilter
> Subject: Re: Bad Argument error
>
> On Monday 08 July 2002 9:29 pm, Mike G. Hammonds wrote:
> > Thanks
> > I'm also getting this error
> > Bad Argument 'LOOPBACK="lo"
>
> If the script you are running is reasonably short, post it here and we'll
> try
> and tell you why this error occurs.
>
> However, you should be able to find the problem for yourself by doing a
> grep
>
> on the script for LOOPBACK and spot the line with the mistake ?
>
> Antony.
>
> > -----Original Message-----
> > From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
> > Sent: Monday, July 08, 2002 4:18 PM
> > To: netfilter
> > Subject: Re: Bad Argument error
> >
> > On Monday 08 July 2002 9:00 pm, Mike G. Hammonds wrote:
> > > I'm running RH7.2 with iptables1.2.4-2
> > > every time I start iptables I get the following error
> > > Bad Argument 'LOG_LEVEL="notice" [FAILED]
> > >
> > > any ideas on how to fix this?
> >
> > Use a numeric argument to --log-level instead
> >
> > "notice"=5
> >
> > So you would use
> >
> > iptables -A FORWARD -s 192.168.1.0/24 -j LOG --log-level=5
> >
> > or whatever....
> >
> >
> >
> > Antony.

