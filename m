From: "Storm D. J. Petersen" <stormp@telus.net>
Subject: Re: Command not working  in latest version
Date: Mon, 17 Feb 2003 17:46:29 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LKEMIKEDGPBEAFDKINCGEEKFDGAA.stormp@telus.net>
Reply-To: <stormp@telus.net>
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
To: "Netfilter@Lists. Netfilter. Org" <netfilter@lists.netfilter.org>

Hi,  I believe that I am having the same problem too.  I have linux-2.4.20
kernel and iptables-1.2.7a
# iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE   returns   iptables:
Invalid argument.
I also reviewed
http://www.e-infomax.com/ipmasq/howto/c-html/ipmasq-compiling3.1.html  and
am certain the kernel is configured correctly.  Does anyone have masquerade
working in 2.4.20 kernel?
Any help would be greatly appreciate!
S.

Message: 11
From: "Paulo Jorge O. C. Matos" <pocm@mega.ist.utl.pt>
To: Khanh Tran <khanh@slc.edu>,
 netfilter@lists.netfilter.org
Subject: Re: Command not working  in latest version
Date: Mon, 17 Feb 2003 23:13:37 +0000

Unfortunately enabling Full NAT into the kernel didn't solve the
problem. I don't know what else to do.
Any ideas?

Best regards,
Paulo

On Monday 17 February 2003 00:13, Khanh Tran wrote:
> Well, Full NAT might take care of your "arguments" problem.  I don't
> know exactly what it affects, but it's NAT and that's what you are
> trying to do. Plus, the instructions say so!  What kernel are you
> using?  What OS/distribution?
>
> Khanh Tran
> Network Operations
> Sarah Lawrence College
>
>
> -----Original Message-----
> From: Paulo J. Matos [mailto:pocm@mega.ist.utl.pt]
> Sent: Sunday, February 16, 2003 6:55 PM
> To: Khanh Tran; netfilter@lists.netfilter.org
> Subject: Re: Command not working in latest version
>
> > You may not have all of the proper elements compiled into your
> > kernel.
>
> Try:
> > http://www.e-infomax.com/ipmasq/howto/c-html/ipmasq-compiling3.1.ht
> >ml
>
> Hi Khanh,
>
> I've compiled the kernel specifically like they said in your
> reference except those new options of 2.4.20 but still I get 'Invalid
> Arguments' from iptables 1.2.7a. What's Full NAT in kernel config, is
> that useful for iptables?
>
> I've run the line:
> # iptables -v -t nat -A POSTROUTING -o eth1 -j SNAT --to
> 217.129.146.56 SNAT all opt -- in * out eth1 0.0.0.0/0 -> 0.0.0.0/0
> to:217.129.146.56 iptables: Invalid Argument
>
> This is indeed strange. Do you have any idea of what could I do now?
>
> Is there any other iptables command line with the same outcome?
>
> Best regards,
>
> Paulo
>
> > Khanh Tran
> > Network Operations
> > Sarah Lawrence College
> >
> >
> > -----Original Message-----
> > From: Paulo J. Matos [mailto:pocm@mega.ist.utl.pt]
> > Sent: Sunday, February 16, 2003 11:04 AM
> > To: Khanh Tran; netfilter@lists.netfilter.org
> > Subject: Re: Command not working in latest version
> >
> > > You should also make sure you are loading modules ip_tables and
> >
> > ip_conntrack
> >
> > > before you load your other modules.
> >
> > Iptables are built into the kernel, even after loading
> > ipt_conntrack I receive invalid argument.
> >
> > I just do:
> > iptables -t nat -F
> > iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 217.129.146.56
> >
> > First line is ok, second returns invalid argument. Getting
> > desperate. Any ideas?
> >
> > Best regards,
> >
> > Paulo
> >
> > > Khanh Tran
> > > Network Operations
> > > Sarah Lawrence College
> > >
> > >
> > > -----Original Message-----
> > > From: Paulo J. Matos [mailto:pocm@mega.ist.utl.pt]
> > > Sent: Sunday, February 16, 2003 9:45 AM
> > > To: Khanh Tran; netfilter@lists.netfilter.org
> > > Subject: Re: Command not working in latest version
> > >
> > > > You'll now want to do:
> > > >
> > > > iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to $EXTIP
> > > >
> > > > where eth0 is the interface going out to the Internet and
> > > > $EXTIP is
>
> the
>
> > > > public IP on that interface.
> > >
> > > Hi Khanh, strangely I still get Invalid Argument.
> > > iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to
> > > 217.129.146.56
> > >
> > > where eth1 is the interface that gives access to the internet
> > > with IP 217.129.146.56 (given by DHCP server).
> > >
> > > Thx for your patience,
> > >
> > > Paulo
> > >
> > > > Khanh Tran
> > > > Network Operations
> > > > Sarah Lawrence College
> > > >
> > > >
> > > > -----Original Message-----
> > > > From: Paulo J. Matos [mailto:pocm@mega.ist.utl.pt]
> > > > Sent: Sunday, February 16, 2003 9:00 AM
> > > > To: netfilter@lists.netfilter.org
> > > > Subject: Command not working in latest version
> > > >
> > > >
> > > > Hi all,
> > > >
> > > > I've changed from my old distribution to a new one that comes
> > > > with
> > >
> > > iptables
> > >
> > > > 1.2.7a.
> > > > I have iptables in the kernel (2.4.20) and I've loaded the
> > > > modules iptable_nat, ipt_REDIRECT and ipt_MASQUERADE.
> > > > I had in my previous distributions the following lines:
> > > > iptables -t nat -F
> > > > iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> > > >
> > > > This would give total access from lan attached to eth0 to the
> > > > internet through my computer. But now, line 1 executes ok, line
> > > > 2 gives: iptables: Invalid Argument
> > > >
> > > > If I do :
> > > > iptables -t nat -A POSTROUTING -o eth0
> > > > everything runs ok but lan has still no access to the internet
> > > > as
> > >
> > > expected.
> > >
> > > > What's happening, any ideas?
> > > >
> > > > Best regards,
> > > >
> > > > Paulo



