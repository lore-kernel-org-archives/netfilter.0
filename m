From: Askar Ali Khan <askarali@gmail.com>
Subject: Re: Ip accounting Help--> Urgent
Date: Sat, 26 Jun 2004 13:33:10 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <a0f69e5040626013325251ac5@mail.gmail.com>
References: <1087962571.2041.10.camel@joel.d2visp.com> <200406231241.29378.Antony@Soft-Solutions.co.uk> <1088224225.3133.20.camel@joel.d2visp.com> <200406260922.14221.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406260922.14221.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>
Cc: antony@soft-solutions.co.uk

Antony www.freshmeat.net got lot of tool for ip accounting :)


On Sat, 26 Jun 2004 09:22:14 +0100, Antony Stone
<antony@soft-solutions.co.uk> wrote:
> On Saturday 26 June 2004 5:30 am, Joel Solanki wrote:
> 
> > Hello all, ANTONY ...hoping something from u :)
> 
> Good morning :)
> 
> > I am testing ip accounting on my production server for last 2 days but i
> > can sort the things. Any body if u could throw little light that would
> > be really helpful to me.
> > This is my testing results.
> >
> > # $IPT -t mangle -i eth1 -A FORWARD -s 192.168.0.2
> > # $IPT -t mangle -o eth0 -A FORWARD -d 192.168.0.2
> >
> > Results:-
> >
> > Chain FORWARD (policy ACCEPT 6853 packets, 2981K bytes)
> >  pkts bytes target     prot opt in     out     source        destination
> >  3267 1483K            all  --  eth1   *       192.168.0.2   0.0.0.0/0
> >     0     0            all  --  *      eth0    0.0.0.0/0     192.168.0.2
> >
> > I download squid-2.5.STABLE5.tar.gz from my ftp server.
> > The size of squid is 1.3M
> >
> > Now when i did upload same squid package from local machine to remote
> > ftp server it doesnt show any bytes counter in second command :--you can
> > see that above ...counters bytes are 0.
> 
> Two very obvious questions first - I don't think these will be the problem,
> but I might as well check:
> 
> 1. Is the machine you are uploading to connected via eth0?
> 2. Does the machine you are uploading to have IP address 192.168.0.2?
> 
> Both the above must be "yes" for the second rule you have (the one that's not
> apparently working properly) to count packets.
> 
> Now for the suggestion where I think you *may* have an error:
> 
> 3. Do you have any PREROUTING nat rules which mean that by the time packets
> hit the FORWARD chain, they're no longer addressed to 192.168.0.2?
> 
> A good way to answer this would be to show us the rule in your FORWARDing
> filter table which allows the connection (the upload connection which you are
> having problems measuring) to work.
> 
> I cannot think of any reason why a rule in the FORWARD mangle table would not
> see packets which are correctly being processed by the FORWARD filter table.
> 
> Regards,
> 
> Antony.
> 
> --
> "There has always been an underlying argument that we should open up our
> source code more broadly. The fact is that we are learning from open source
> and we are opening our code more broadly through Shared Source.
> 
> Is there value to providing source code? The answer is unequivocally yes."
> 
> - Jason Matusow, head of Microsoft's Shared Source Program, in response to
> recent leaks of Windows source code on the Internet.
> 
>                                                     Please reply to the list;
>                                                           please don't CC me.
> 
>

