From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPsec & FreeS/WAN
Date: Wed, 3 Jul 2002 20:12:22 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020703191224.LSGV19225.mta07-svc.ntlworld.com@there>
References: <200FAA488DE0D41194F10010B597610D2BA1F6@JUPITER> <200207030925.g639PfU28723@vulcan.rissington.net> <20020703190127.GB19157@willow.seitz.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020703190127.GB19157@willow.seitz.com>
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

On Wednesday 03 July 2002 8:01 pm, Ross Vandegrift wrote:

> > > I'd rather use IPSEC if I can only just compile my damn kernel right
> > > for once.. (it's been a while)..
> >
> > FreeS/WAN isn't difficult - it just takes a while, and you have to follow
> > the instructions carefully.   I think the guides and documentation on
> > http://www.freeswan.org are very good, though.
>
> Does anyone distribute the FreeS/WAN kernel code as a patch instead of
> the crazy scriptish system they use?  I've never been able to get that
> part working without many hours of fudging.  And after that, I'd *never*
> want to have to do it again.  OTOH, if someone had a way to make diffs,
> that would be very easy.

What kernel source do you start from ?

I haven't had any problems using FreeS/WAN's method of patching / modifying 
the kernel source, but suppose someone did that on their machine and then 
sent you a set of diff files - if you can't get the FreeS/WAN system to work, 
surely you wouldn't be able to apply the diffs to your kernel source either ?

Do the problems you get suggest that the FreeS/WAN system can't find the 
right files to update, or it can't find the tools on your machine to do the 
updating with ?

The only thing I've ever had to load separately to get FreeS/WAN working is 
the gmp maths library.   I use the Slackware distro.

 

Antony.

