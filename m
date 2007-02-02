From: Wakko Warner <wakko@animx.eu.org>
Subject: Re: SSHBrute Force: False Postives
Date: Fri, 2 Feb 2007 12:26:54 -0500
Message-ID: <20070202172654.GA24236@animx.eu.org>
References: <20070201120648.GA19604@animx.eu.org>
	<20070201131319.71585.qmail@web25512.mail.ukl.yahoo.com>
	<20070201231733.GA21833@animx.eu.org>
	<20070202143815.GA30820@minastirith>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20070202143815.GA30820@minastirith>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Rash <mbr@cipherdyne.org>
Cc: netfilter@lists.netfilter.org

Michael Rash wrote:
> > franck joncourt wrote:
> > > In order to prevent such attacks, you can write iptables rules to set up port knocking. This is the way, I do.
> > 
> > I thought about doing this, but I ultimately decided against it.  The
> > problems of doing the knocking outweighted the benefits.  I prefer to let
> > them try a few times before my current rules ban them.
> 
> If someone finds a remote exploit in sshd, then just allowing
> connections at all can potentially expose you to compromise.  As far as

True.

> port knocking is concerned, I agree, there are a ton of problems.  There
> is a better alternative called Single Packet Authorization:
> 
> http://www.cipherdyne.org/fwknop/docs/SPA.html
> 
> Fwknop is an implementation that is based around iptables:
> 
> http://www.cipherdyne.org/fwknop/

This still means that all authorized users have to do this which is not what
I want to do.  What if I'm at someone's house and decide I want in to my
system and they don't have any way of performing the port knocking or the
fwknop.

-- 
 Lab tests show that use of micro$oft causes cancer in lab animals
 Got Gas???

