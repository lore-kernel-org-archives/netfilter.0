From: "John Jones" <jjones@merlintechnologies.com>
Subject: RE: Strange misunderstandings
Date: Fri, 31 May 2002 14:16:19 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <001c01c208e8$68205720$6301a8c0@JJONES1>
References: <000d01c208e7$b36ba8c0$026410ac@winxp>
Reply-To: <jjones@merlintechnologies.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <000d01c208e7$b36ba8c0$026410ac@winxp>
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
To: 'Iptables' <netfilter@lists.samba.org>

[gemini:~] iptables -C
iptables v1.2.6a: Unknown arg `-C'
Try `iptables -h' or 'iptables --help' for more information.



> -----Original Message-----
> From: Sascha Reissner [mailto:sascha.reissner@toxicnet.de] 
> Sent: Friday, May 31, 2002 2:11 PM
> To: jjones@merlintechnologies.com; 'Iptables'
> Subject: Re: Strange misunderstandings
> 
> 
> From: "John Jones" <jjones@merlintechnologies.com>
> 
> > Two issues, first issue is a simple question:
> >
> > [root] iptables -h
> > ...
> >   --check   -C chain            Test this packet on chain
> > ...
> >
> > [root] iptables --check
> > iptables v1.2.6a: Unknown arg `--check'
> >
> > What's up with that?  The help screen shows me it is a 
> command, but it 
> > doesn't exist?  Is this an optional kernel compilation 
> thing that is 
> > missing, or has it been removed from the distro?
> 
> if you try it with iptables -C it will work.. and result in.. tataaaa
> 
> "iptables: Will be implemented real soon.  I promise ;)" so 
> it aint in there yet.
> 
> 
> 


