From: Tom Eastep <teastep@shorewall.net>
Subject: Re: Yet another FTP connection problem
Date: Thu, 6 Jun 2002 10:27:30 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.44.0206061022430.16136-100000@wookie.shorewall.net>
References: <200206061701.g56H1bA32071@vulcan.rissington.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206061701.g56H1bA32071@vulcan.rissington.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: "netfilter@lists.samba.org" <netfilter@lists.samba.org>

On Thu, 6 Jun 2002, Antony Stone wrote:

> On Thursday 06 June 2002 5:56 pm, Tom Eastep wrote:
> 
> > Some FTP sites use auth which can cause connection timeouts with that
> > ruleset. For safety, I recommend adding
> >
> > iptables -A INPUT -p tcp --dport 113 -j REJECT
> 
> Yes, good point.
> 
> I'm thinking of a way to get IDENT requests classified as RELATED, so you can 
> either do this without leaving port 113 visible by the RSTs it sends, or even 
> get the IDENTs sent through to the original client for it to deal with....
> 

Nod -- the whole identd/auth thing should just go away as it is based on
assumptions that haven't been true for years. Nevertheless, it seems to
hang on from sheer inertia and there's no current mechanism for dealing
with it in a stealthy way.

-Tom
-- 
Tom Eastep    \ Shorewall - iptables made easy
AIM: tmeastep  \ http://www.shorewall.net
ICQ: #60745924  \ teastep@shorewall.net


