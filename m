From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: I need help , please
Date: Fri, 5 Jul 2002 20:14:15 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020705191417.UWDG4119.mta06-svc.ntlworld.com@there>
References: <NJEFLNJDIFFNMHDEBKMJAEKADOAA.jpatterson@asgardgroup.com> <200207051655.g65Gt3802651@vulcan.rissington.net> <01b501c22423$6fb6a010$8703000a@aid.inf.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <01b501c22423$6fb6a010$8703000a@aid.inf.cu>
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
To: netfilter@lists.samba.org

On Friday 05 July 2002 1:56 pm, david wrote:

> Tony:
>
> #echo $PATH
> /usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/X11R6/bin
>: /root/bin
>
> how you can see iptables is in the PATH

Okay, that's good.   I was concerned that you might have . in your path, so 
that commands in the local directory were getting executed instead of the 
ones in /sbin./bin etc.

By the way, did you ever try the list of rules I posted in 
http://lists.samba.org/pipermail/netfilter/2002-July/024548.html ?

 

Antony.

> ----- Original Message -----
> From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
> To: <netfilter@lists.samba.org>
> Sent: Friday, July 05, 2002 6:54 PM
> Subject: Re: I need help , please
>
> > On Friday 05 July 2002 5:45 pm, Joe Patterson wrote:
> > > next tell us the output of these commands:
> > >
> > > which iptables
> > > file `which iptables`
> >
> > I think we should point out that the ` symbols above are the backtick
> > character (probably at the top left of your keyboard), and not the
>
> apostrophe.
>
> > Also, please can you tell us what you get in response to
> > echo $PATH
> >
> >
> >
> > Antony.

