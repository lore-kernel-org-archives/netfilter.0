From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: A Simple Question
Date: Wed, 10 Aug 2005 14:58:43 -0500
Message-ID: <200508101458.43569.rob0@gmx.co.uk>
References: <5c685153050809171164af25e4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5c685153050809171164af25e4@mail.gmail.com>
Content-Disposition: inline
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

On Tuesday 2005-August-09 19:11, Robb Bossley wrote:
> I have been reading the mailing list posts and it seems that most of
> you who are very knowledgeable with netfilter would propose a default
> policy of DROP on both the INPUT and FORWARD chains.
>
> iptables -P INPUT DROP
> iptables -P FORWARD DROP

Yes, but ...

> However, I have noticed that a number of what I would consider to be
> strong contenders in the market use default policies of ACCEPT and
> then have a DROP rule at the end of the tables / chain.
>
> iptables -P INPUT ACCEPT
> iptables -P FORWARD ACCEPT
> ...................................(other stuff
> here).......................... iptables -A INPUT -j DROP
> iptables -A FORWARD -j DROP

... this is simply another means to the same end.

> I'm confused.  Which is preferred for security and why?  (Or is this
> just six of one, half a dozen of another?)

It all depends on the "other stuff" in the middle. At my most complex 
site, I went for default ACCEPT policies because I had multiple types 
of internal interfaces. Even those have varying needs. It just seemed 
that an ACCEPT policy would be the simplest way to get the job done. 
Everything we don't want is dropped (or rejected), everything we do 
want is accepted.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

