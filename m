From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: bug in iptables-restore and "recent" module
Date: Fri, 20 Feb 2015 16:22:42 -0500
Message-ID: <201502201622.42411.neal.p.murphy@alum.wpi.edu>
References: <20150215133147.6fb4589991419ad29180222a@lucassen.org> <54E30166.1090406@plouf.fr.eu.org> <20150220220544.9df9143e2fb9fbb6f8e5c397@lucassen.org>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20150220220544.9df9143e2fb9fbb6f8e5c397@lucassen.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Friday, February 20, 2015 04:05:44 PM richard lucassen wrote:
> On Tue, 17 Feb 2015 09:52:54 +0100
> 
> Pascal Hambourg <pascal@plouf.fr.eu.org> wrote:
> > > I'd say in iptables-restore. Apparently the -t (test) does not
> > > notice that there is a problem while the real iptables-restore does.
> > 
> > Sorry, my question was not clear enough. Let me rephrase.
> > 
> > As -t does not commit the tables to the kernel, I do not expect it to
> > detect errors related to the kernel configuration. So I do not see any
> > bug in your description, it sounds like expected behaviour to me.
> > Where do you see a bug in that behaviour ?
> 
> You have a point :) And I agree with Dennis to add it to the
> manpage.

To state it a little more explicitly:
  o '-t' can only validate the syntax; it cannot check the data
  o 'the kernel' validates the data
