From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: ftp and ssl
Date: Wed, 5 Nov 2003 18:59:24 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311051859.24882.Alistair@nerdnet.ca>
References: <33da01c3a34d$84fe6660$2288e7c0@promed.com.au> <002701c3a3eb$d31756b0$c800a8c0@klintan.cjb.net>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002701c3a3eb$d31756b0$c800a8c0@klintan.cjb.net>
Content-Disposition: inline
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
To: Michael Klinteberg <micke@klintan.se>, netfilter@lists.netfilter.org

On November 5, 2003 05:26 pm, Michael Klinteberg wrote:
> ----- Original Message -----
> From: "Stuart J. Browne" <stuart@promed.com.au>
> To: <netfilter@lists.netfilter.org>
> Sent: Wednesday, November 05, 2003 4:33 AM
> Subject: RE: ftp and ssl
>
> > >-----Original Message-----
> > >From: netfilter-admin@lists.netfilter.org
> > >[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Ted Kaczmarek
> > >Sent: Wednesday, 5 November 2003 13:03
> > >To: Michael Klinteberg
> > >Cc: netfilter@lists.netfilter.org
> > >Subject: Re: ftp and ssl
> > >
> > >
> > >Allow tcp port 443 :-)
> > >
> > >Ted
> > >
> > >On Tue, 2003-11-04 at 09:36, Michael Klinteberg wrote:
> > >> I need to setup ftp that use ssl. I don't know if
> > >
> > >ip_conntrack_ftp supports
> > >
> > >> ssl. What are my options here?
> > >> What do I need to know to setup the iptables rules/modules?
> > >>
> > >> Regards
> > >> Michael
> >
> > Isn't 443 SSL over HTTP? :)
> >
> > By default, it looks as if netfilter only watch port 21, but you can
> > pass it an option (called 'ports') of the ports you want to treat as FTP
> > as well.
> >
> > How are you doing SSL FTP's?
>
> WS_FTP Server.
>
> > Using ssh's sftp? This just uses standard ssh ports.
> >
> > SSL FTP client (does anybody use this?) I beleive has the
> > services entry of 'sftp' and is port 115.  I've not seen a production
> > implementation of this though
> >
> > If using 'sftp' from the OpenSSH packages, there is no need for any
> > conntrack helpers, as it all uses the same port.
> >
> > If using the later however, given that the channel will be encrypted, I
> > don't see how this conntrack would work at all.
> >
> > just my thoughts..
>
> A lot of responses  here :-) Still don't know what to do?
> I could however set up rules that allow everything from the ftp client (me)
> to the ftp server and then run tcpdump and see what's going on. Is this a
> god approach?
	
	I don't know that god would use that approach *grin* but it would be a start.
	
	you could use -j LOG to catalog what packets are being dropped.
	give me a few hours .. I've a friend with WS_FTP server running in 
	*cough* that other operating system, and he might have hints for me.
	
	If I get anything interesting I'll let the list know.

>
> /Michael K

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

