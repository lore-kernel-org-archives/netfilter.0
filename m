From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Ip accounting Help
Date: Wed, 23 Jun 2004 10:01:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406231001.24925.Antony@Soft-Solutions.co.uk>
References: <1087962571.2041.10.camel@joel.d2visp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1087962571.2041.10.camel@joel.d2visp.com>
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
To: netfilter@lists.netfilter.org

On Wednesday 23 June 2004 4:49 am, Joel wrote:

> Hi all,
>
> Currently I am working on Ip accounting in linux.
> My system is Redhat 9.0 with iptables v1.2.7a
> This redhat is doing Squid-Caching/ Nat/ Bandwidth management with tc/
> Real ip forwarding.
>
> I want to do Ip accounting of upload and download. I want to know how
> much per ip bandwidth consumption is ?
>
> As i m doing source nat and Real ip forwarding, FORWARD chain will have
> bytes counters. So FORWARD chain will give the correct figure of how
> much the ip has used the bandwidth ???

Beware of trying to do this if you are using the stateful connection tracking 
of netfilter (iptables -I FORWARD -m state --state ESTABLISHED,RELATED), 
because if you are, then almost all of the packets going through the machine 
(specifically, all except the first one of each connection) will be processed 
by this one rule, and all the other rules in the FORWARD chain will only see 
one packet per connection (the first one).

You may be able to do what you want using the mangle table of the FORWARD 
chain, but not with the default filter table.

Regards,

Antony.

-- 
I own three Windows books, published by O'Reilly.   They are "Windows 
Annoyances", "Office 97 Annoyances" and "Windows 98 Annoyances".   That 
pretty much sums it up for me.

                                                     Please reply to the list;
                                                           please don't CC me.


