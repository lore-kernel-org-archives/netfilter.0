From: Jason Opperisano <opie@817west.com>
Subject: Re: Can an iptables NAT firewall Block URL's and Attachments?
Date: Thu, 18 Nov 2004 20:10:46 -0500
Message-ID: <1100826646.3874.13.camel@hubcap.ljm.dom>
References: <20041119004820.3753.qmail@web54501.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041119004820.3753.qmail@web54501.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org
Cc: realcucumber@hotmail.com

On Thu, 2004-11-18 at 19:48, Real Cucumber wrote:
> If using an Iptables fedora box to act as a networks
> internety gateway NAT server, is it possible to create
> rules to block specific URL's or attachments?
> 
> ie: block any URL's ending in *.exe or block any URL's
> containing the word "sex"
> 
> If anybody knows please reply directly to me at
> realcucumber@hotmail.com
> 
> Any help is much appreciated.
> 
> Thanks!

iptables does a fantastic job of transparently redirecting port 80
requests:

  http://www.tldp.org/HOWTO/TransparentProxy.html

to squid:

  http://www.squid-cache.org/

which supports infinitely flexible acls:

  http://squid.visolve.com/squid/squid24s1/access_controls.htm#acl

and category-based URL filtering redirectors like squidGuard:

  http://www.squidguard.org/

and dansguardian:

  http://dansguardian.org/

hope this helps.

-j

--
"Okay, retrace your steps. Woke up, fought with Marge, ate Guatemalan
 insanity peppers, then I... Oh..."
	--The Simpsons


