From: "Joe Patterson" <jpatterson@asgardgroup.com>
Subject: RE: I need help , please
Date: Fri, 5 Jul 2002 12:45:38 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <NJEFLNJDIFFNMHDEBKMJAEKADOAA.jpatterson@asgardgroup.com>
References: <019301c2240f$e8e004e0$8703000a@aid.inf.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <019301c2240f$e8e004e0$8703000a@aid.inf.cu>
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
To: david <david@aid.inf.cu>, Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org

next tell us the output of these commands:

which iptables
file `which iptables`

and did you mean to mis-spell INPUT as INPUD?

-Joe


> -----Original Message-----
> From: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org]On Behalf Of david
> Sent: Friday, July 05, 2002 6:37 AM
> To: Antony Stone
> Cc: netfilter@lists.samba.org
> Subject: Re: I need help , please
> 
> 
> Antony;
> 
> #iptables -P INPUD DROP
> iptables:Bad built in chain name
> 
> if I turn to:
> #iptables -P inpud DROP
> iptables:Bad built in chain name
> 
> if I try:
> #iptables -p inpud DROP
> iptables v1.2.3: unknown protocol `inpud` specified
> 
> thanks again tony
> 
> david
> 
> ----- Original Message -----
> From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
> To: <netfilter@lists.samba.org>
> Sent: Friday, July 05, 2002 6:35 PM
> Subject: Re: I need help , please
> 
> 
> > On Friday 05 July 2002 11:18 am, david wrote:
> >
> > > iptables:Bad built-in change name
> >
> > What *exactly* did you type (punctuation as well) and what *exactly* is
> the
> > response ?
> >
> > The command I want you to try is
> >
> > iptables -P INPUT DROP
> >
> > That is:
> > "iptables" in lower case
> > a space
> > a hyphen or minus sign
> > a capital P
> > a space
> > "INPUT" in capitals
> > a space
> > "DROP" in capitals
> > <enter>.
> >
> > If you really do get an error in response to this, your system is very
> sick.
> >
> >
> >
> > Antony.
> >
> > >  ----- Original Message -----
> > > From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
> > > To: <netfilter@lists.samba.org>
> > > Sent: Friday, July 05, 2002 6:00 PM
> > > Subject: Re: I need help , please
> > >
> > > > On Friday 05 July 2002 10:25 am, david wrote:
> > > > > OK , I agree.In fact I  am just trying.
> > > > > I heve tested a simpler script :
> > > > >
> > > > > # Standard default policies
> > > > > iptables -P INPUT DROP
> > > > > iptables -P FORWARD DROP
> > > > > iptables -P OUTPUT DROP
> > > > >
> > > > > am here you have the output.
> > > > > /etc/rc.d/init.d/iptables : command not found
> > > > > iptables: bad police name
> > > > > iptables: bad police name
> > > > > iptables: bad police name
> > > > > /etc/rc.d/init.d/iptables : command not found
> > > >
> > > > Do you have . in your path ???   It looks to me as though you're in
> > > > /etc/rc.d/init.d when you type this, and it's trying to run the
> iptables
> > > > script in the local directory instead of the iptables 
> binary in /sbin
> > > >
> > > > What happens if you cd to /root and type
> > > > iptables -P INPUT DROP
> > > >
> > > >
> > > >
> > > > Antony.
> 
> 
> 
> 

