From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: REJECTing ident requests (was: FTP problems)
Date: Fri, 28 Feb 2003 16:13:52 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0302281610340.4223@dns.toxicfilms.tv>
References: <Pine.LNX.4.33.0302281404260.9684-100000@lw2.cc-computer.de>
 <1046440457.14100.23.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1046440457.14100.23.camel@elendil.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: Martin =?ISO-8859-1?Q?K=F6hling?= <mk@lw1.cc-computer.de>, Netfilter <netfilter@lists.netfilter.org>

> > Quite some time ago, I had strange problems with some (broken?) mail
> > servers refusing to accept mail when I simply REJECTed ident connects -
> > apparently they didn't like the default ICMP error message
> > (icmp-port-unreachable, I think)...
>
> Maybe because RFC says that a SYN on a closed port must be replied with
> RST, and not ICMP port unreachable...
It is true but by sending ICMP port unreach. you inform the second
party's tcp stack that the port is unreachable, which should cause the
stack to inform the application that there is a problem. Maybe the
application (the mail daemon) was not handling this type of error.
Properly written code should react for TCP RSTs and all other ICMP error
messages, and other error conditions.

Maciej

