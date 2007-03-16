From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Re: forwarding local ports
Date: Fri, 16 Mar 2007 21:03:55 +0100
Message-ID: <20070316200354.GA10582@galois.math.uni-paderborn.de>
References: <2700.4272-9683-164045092-1174070512@seznam.cz>
	<45FAF1B3.2000601@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <45FAF1B3.2000601@plouf.fr.eu.org>
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

Am Friday, den 16. March hub Pascal Hambourg folgendes in die Tasten:

Hi!

> >I want forward local ports to remote server, for example:
> >for `telnet localhost 80` must answer webserver from remote IP

> The problem, which  has already been discussed in this list, is in 
> kernels 2.6.11 and above. In Changelog-2.6.11 you can read :
[...]

> For this to work you must use a local address outside 127.0.0.0/8.

Or consider using something different than netfilter for this task,
e.g. the rinetd daemon (which works only for tcp, but that should fit
your need in this case.)

From the debian package description:
 rinetd redirects TCP connections from one IP address and port to
 another, with basic IP-based access control.

Ciao
Max
-- 
|           |                 Follow the white penguin.
|  |\/|  |  |-----------------------------------------------------------.
|  |  |/\|  |  Rechnerbetrieb Mathematik  |   Meine Baustellen:  TSM    |
|           |  Universitaet Paderborn     |   Hostmaster, Linux, LDAP   | 

