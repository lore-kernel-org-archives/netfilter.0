From: Kevin McConnell <kevymac@yahoo.com>
Subject: RE: msn voice chat
Date: Tue, 31 Dec 2002 14:10:45 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021231221045.6788.qmail@web40311.mail.yahoo.com>
References: <000801c2b111$0e4aaad0$6c00a8c0@blue>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000801c2b111$0e4aaad0$6c00a8c0@blue>
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
Content-Transfer-Encoding: 7bit
To: Glover George <dime@gulfsales.com>, 'Roy Sigurd Karlsbakk' <roy@karlsbakk.net>
Cc: cuigl@ilion.bio.sunysb.edu, netfilter@lists.netfilter.org


--- Glover George <dime@gulfsales.com> wrote:
> I'd like
> to look at this
> patch, although this would only solve the SIP
> problem right?  Is RTP in
> there as well?  

You would have to take a look at the patch. I'm not
really a developer. More like just a plain old
sysadmin. I think that you should bring this
discussion onto the netfilter-devel list, as I am not
sure if cronos (Filip Sneppe is his real name I
believe) reads this list.
 
> UPnP is just another solution to the problem, that
> happens to solve a
> lot of other problems with clients that are UPnP
> aware at the same time.
> (And being a sysadmin myself, I must say a lot
> easier to set up than
> recompiling your kernel with these experimental
> helpers).  But then I'm
> thinking of the users and myself on that one ;-)

I didn't really run into too much trouble when
applying patch-o-matic to my kernel for some reason. I
read all these people having problems, yet all I did
was to get the vanilla source from kernel.org (like
the docs said) and then I applied the pom to it and
enabled all kinds of extra functionality to test a few
things out. Then I recompiled iptables and voila... it
just worked.


=====
Kevin C. McConnell --RHCE-- <Red Hat Certified Engineer>

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com

