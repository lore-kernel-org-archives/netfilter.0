From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: how-to help
Date: Wed, 26 Nov 2003 15:29:41 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311261529.41596.Antony@Soft-Solutions.co.uk>
References: <1069676953.14413.33.camel@muriel>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1069676953.14413.33.camel@muriel>
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

On Monday 24 November 2003 12:29 pm, Muriel wrote:

> Hello,
>
> we have a nated box with transparent proxy squid  and wish to control
> all ports/protocols (143 110 119 80 etc...) with iptables and because of
> the transparent proxy we cannot control, with iptables "forward" rules,
> access to the transparent proxy any idea?

Why does the fact that Squid is on the box (and running as a transparent 
proxy) stop you putting in forwarding rules for all the other protocols?

Squid is only an http proxy - in transparent mode it won't even do ftp for you 
as well - so it should not make any difference to whatever you want to do 
with other port numbers.

> ps: i already tell my boss to use squid's acl but he want all controls
> in one place...

Please tell us exactly what you want to do, what your existing setup is, and 
what you have tried which doesn't work.

Antony.

-- 
Perfection in design is achieved not when there is nothing left to add, but 
rather when there is nothing left to take away.

 - Antoine de Saint-Exupery

                                                     Please reply to the list;
                                                           please don't CC me.


