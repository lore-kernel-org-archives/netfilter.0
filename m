From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: Patch-o-matic pptp
Date: 14 Apr 2003 17:22:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050333725.11152.247.camel@tux.rsn.bth.se>
References: <1050331434.18572.13.camel@tichael.profindy.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1050331434.18572.13.camel@tichael.profindy.com>
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
To: Michael Friedhoff <michael@profindy.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

On Mon, 2003-04-14 at 16:43, Michael Friedhoff wrote:
> I am trying to run the Patch-o-matic to apply apply the
> pptp patch.  However, it is not working.  POM fails
> when it tries to apply the *.h-3 file, *h-4, etc.  I am not
> able to determine why that is.  I have downloaded
> the latest version from CVS.This is also my first
> attempt at using the POM.  It is likely that I am doing
> something wrong, but am unable to determine what portion
> of the POM that is failing.
> 
> Is it possible to get precompiled modules for this
> functionality?
> 
> I am running:
> RedHat 8.0
> Kernel 2.4.18
> 
> Hopefully I have supplied enough relevant information.

You need to apply all pending and submitted patches first.
You do that like this:

./runme --batch pending

Then the netfilter part of your kernel should be up to speed with what's
in 2.4.21-pre and 2.5.x

The pptp patch depends on this newer stuff.

-- 
/Martin

