From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: tcp-window-tracking.patch fails to apply
Date: 26 Apr 2003 08:29:38 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051360177.1437.4.camel@jasiiitosh.nexusmgmt.com>
References: <1051339036.4860.26.camel@jasiiitosh.nexusmgmt.com>
	 <1051354468.5942.72.camel@tux.rsn.bth.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1051354468.5942.72.camel@tux.rsn.bth.se>
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
To: Martin Josefsson <gandalf@wlug.westbo.se>, Netfilter <netfilter@lists.netfilter.org>

No, I didn't.  I suppose I felt intimidated by the warning about not
applying all the patches.  Is it safe to apply all the patches, or at
least all the pending and submitted patches? Thanks - John

On Sat, 2003-04-26 at 06:54, Martin Josefsson wrote:
> On Sat, 2003-04-26 at 11:19, John A. Sullivan III wrote:
> > I very much wanted to use the window tracking patch but an unable to get
> > it to apply.  I am running RedHat 7.3 with kernel 2.4.20.  The
> > patch-o-matic test replies:
> > 
> > Testing... tcp-window-tracking.patch NOT APPLIED (29 rejects out of 32
> > hunks)
> > 
> > When I try to apply the patch I get:
> > 
> > Patch extra/tcp-window-tracking.patch conflicts with
> > extra/ip_conntrack-timeouts.patch...
> > ip_conntrack-timeouts.patch NOT APPLIED (1 missing files)
> > Testing patch extra/tcp-window-tracking.patch...
> >    Placed new Makefile line
> > Failed to patch copy of /usr/src/linux
> > TEST FAILED: patch NOT applied.
> > 
> > I do not have ip_conntrack-timeouts.patch installed.  I even tried
> > reversing that patch in case it was installed without my knowing it but
> > it is not there.
> > 
> > I rebuilt the kernel and tried the tcp-window-tracking patch as the only
> > patch but that didn't work either.  I tried applying it separately after
> > applying all other patches.  That didn't work.  What am I doing wrong?
> 
> Did you apply all pending and submitted patches?
> 
> ./runme --batch pending
> 
> will do that and it is required for some patches to apply.
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


