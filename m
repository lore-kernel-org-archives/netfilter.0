From: Kevin McConnell <kevymac@yahoo.com>
Subject: Re: Doing Bridge with firewalling
Date: Tue, 31 Dec 2002 12:47:56 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021231204756.1918.qmail@web40306.mail.yahoo.com>
References: <20021231202708.GP677@ns>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021231202708.GP677@ns>
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
To: Stephen Frost <sfrost@snowman.net>
Cc: Brad Chapman <kakadu_croc@yahoo.com>, Afshin Lamei <linux_st@hotmail.com>, netfilter@lists.netfilter.org


--- Stephen Frost <sfrost@snowman.net> wrote:
> The two havn't got anything to do with each other. 
> NATing is modifying
> packets as they pass through the router.  Addressing
> is the IP address
> and whatnot to access the firewall/router.  One does
> not require the
> other.

This leads me to another question then. What are the
advantages of not having an IP address assigned to 
interface(s) of the firewall? Like for instance, if my
firewall was the gateway to the outside world, how
would I tell machines behind the firewall to get out
to the outside world if they didn't have a default
route pointing to the internal address of the
firewall? Also, how would packets that hit the
firewall get routed through the other side?


=====
Kevin C. McConnell --RHCE-- <Red Hat Certified Engineer>

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com

