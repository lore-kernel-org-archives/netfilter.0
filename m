From: "Michael Klinteberg" <micke@klintan.se>
Subject: Re: ftp and ssl
Date: Wed, 5 Nov 2003 23:26:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002701c3a3eb$d31756b0$c800a8c0@klintan.cjb.net>
References: <33da01c3a34d$84fe6660$2288e7c0@promed.com.au>
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
To: netfilter@lists.netfilter.org


----- Original Message ----- 
From: "Stuart J. Browne" <stuart@promed.com.au>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, November 05, 2003 4:33 AM
Subject: RE: ftp and ssl


>
>
> >-----Original Message-----
> >From: netfilter-admin@lists.netfilter.org
> >[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Ted Kaczmarek
> >Sent: Wednesday, 5 November 2003 13:03
> >To: Michael Klinteberg
> >Cc: netfilter@lists.netfilter.org
> >Subject: Re: ftp and ssl
> >
> >
> >Allow tcp port 443 :-)
> >
> >Ted
> >On Tue, 2003-11-04 at 09:36, Michael Klinteberg wrote:
> >> I need to setup ftp that use ssl. I don't know if
> >ip_conntrack_ftp supports
> >> ssl. What are my options here?
> >> What do I need to know to setup the iptables rules/modules?
> >>
> >> Regards
> >> Michael
>
> Isn't 443 SSL over HTTP? :)
>
> By default, it looks as if netfilter only watch port 21, but you can
> pass it an option (called 'ports') of the ports you want to treat as FTP
> as well.
>
> How are you doing SSL FTP's?

WS_FTP Server.

>
> Using ssh's sftp? This just uses standard ssh ports.
>
> SSL FTP client (does anybody use this?) I beleive has the
> services entry of 'sftp' and is port 115.  I've not seen a production
> implementation of this though
>
> If using 'sftp' from the OpenSSH packages, there is no need for any
> conntrack helpers, as it all uses the same port.
>
> If using the later however, given that the channel will be encrypted, I
> don't see how this conntrack would work at all.
>
> just my thoughts..
>


A lot of responses  here :-) Still don't know what to do?
I could however set up rules that allow everything from the ftp client (me)
to the ftp server and then run tcpdump and see what's going on. Is this a
god approach?

/Michael K


