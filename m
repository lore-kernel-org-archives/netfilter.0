From: "Jamie Harris" <jamie@jharris.homeip.net>
Subject: Re: icmp echo requests
Date: Wed, 1 Oct 2003 13:58:14 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <62378.195.188.238.252.1065013094.squirrel@jharris.homeip.net>
References: <3F77B5C6.1090007@netfront.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F77B5C6.1090007@netfront.net>
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
To: Edmund <kdtc@netfront.net>
Cc: Netfilter Group <netfilter@lists.netfilter.org>

> Is this the right(?)/correct/valid/appropriate thing to do?

There's nothing wrong with ignoring echo requests AFAIK, some see it as
being a security enhancement, although there are plenty of other ways to
work out if a host is up or explore a subnet.

> Furthermore (just for clarification) using tcpdump, I get incoming
> icmp echo requests, but no response from my firewall(good thing
> right?.  This means the firewall is dropping/rejecting the
> echo requests?

Sure does.  It confused me a little at first that tcpdump still see's the
packet eventhough its dropped by the firewall.

> Btw, I'm quite bothered about the pings.  It doesn't
> look right.

Where are these comming from?  Does a reverse lookup of the IP mean
anything to you?

cheers

Jamie...


-- 
**  This message was transmitted on 100% recycled electrons **


