From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: tcp-window-tracking.patch fails to apply
Date: 28 Apr 2003 11:12:31 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051540340.3334.18.camel@jasiiitosh.nexusmgmt.com>
References: <1051339036.4860.26.camel@jasiiitosh.nexusmgmt.com>
	 <1051354468.5942.72.camel@tux.rsn.bth.se>
	 <1051360177.1437.4.camel@jasiiitosh.nexusmgmt.com>
	 <1051362232.5944.77.camel@tux.rsn.bth.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1051362232.5944.77.camel@tux.rsn.bth.se>
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
To: Martin Josefsson <gandalf@wlug.westbo.se>
Cc: Netfilter <netfilter@lists.netfilter.org>

That did the trick.  Thank you very much - John

On Sat, 2003-04-26 at 09:03, Martin Josefsson wrote:
> On Sat, 2003-04-26 at 14:29, John A. Sullivan III wrote:
> > No, I didn't.  I suppose I felt intimidated by the warning about not
> > applying all the patches.  Is it safe to apply all the patches, or at
> > least all the pending and submitted patches? Thanks - John
> 
> The submitted patches are always safe, the pending are the ones that's
> on their way into the kenel so they are safe as well.
> 
> If you apply all submitted patches the netfilter part of your kernel
> will be up to speed with the latest kernel 2.4 development which is a
> good thing. It's always recommended that you apply all pending and
> submitted patches.
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


