From: Jeff Bonner <lunar@comcast.net>
Subject: RE: block Kazaa download
Date: Tue, 04 Jun 2002 10:56:47 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <000701c20bd8$0cfaa6f0$0200a8c0@JEFF>
References: <172011389.1023183763@[192.168.13.4]>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <172011389.1023183763@[192.168.13.4]>
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
To: 'netfilter' <netfilter@lists.samba.org>

> -----Original Message-----
> From: netfilter-admin@lists.samba.org 
> [mailto:netfilter-admin@lists.samba.org] On Behalf Of Erik Pagel
> Sent: Tuesday, June 04, 2002 3:43 AM
> To: Allan Parreno; netfilter
> Subject: Re: block Kazaa download

> > anybody has a sample how to block Kazaa download?
> 
> beside blocking the ports Kazaa use, you can also try to 
> block the hole kazaa domain.
> That should do the job because the login needs access to a 
> kazaa server. 
> Without a connection to a kazaa index-server your user are 
> not able to share  or load any files.

Argh, I didn't think of that.  ;)  It would indeed be the best
option.  You're absolutely right, until it can talk to the main
server, it's dead in the water -- it grays out all the options.

I want to say it's "desktop.kazaa.com" IIRC, but according to
at least one site I read, you have to block the entire range of
213.248.112.0/24.

Something else I should have thought about previously was to
search Google for that answer:

  http://google.com/search?q=block+kazaa

Jeff Bonner



