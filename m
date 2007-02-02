From: Michael Rash <mbr@cipherdyne.org>
Subject: Re: SSHBrute Force: False Postives
Date: Fri, 02 Feb 2007 09:38:15 -0500
Message-ID: <20070202143815.GA30820@minastirith>
References: <20070201120648.GA19604@animx.eu.org>
	<20070201131319.71585.qmail@web25512.mail.ukl.yahoo.com>
	<20070201231733.GA21833@animx.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <20070201231733.GA21833@animx.eu.org>
Content-disposition: inline
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
To: netfilter@lists.netfilter.org

On Feb 01, 2007, Wakko Warner wrote:

> franck joncourt wrote:
> > In order to prevent such attacks, you can write iptables rules to set up port knocking. This is the way, I do.
> 
> I thought about doing this, but I ultimately decided against it.  The
> problems of doing the knocking outweighted the benefits.  I prefer to let
> them try a few times before my current rules ban them.

If someone finds a remote exploit in sshd, then just allowing
connections at all can potentially expose you to compromise.  As far as
port knocking is concerned, I agree, there are a ton of problems.  There
is a better alternative called Single Packet Authorization:

http://www.cipherdyne.org/fwknop/docs/SPA.html

Fwknop is an implementation that is based around iptables:

http://www.cipherdyne.org/fwknop/

--
Michael Rash
http://www.cipherdyne.org/
Key fingerprint = 53EA 13EA 472E 3771 894F  AC69 95D8 5D6B A742 839F

