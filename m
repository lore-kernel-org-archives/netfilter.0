From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: -j ULOG
Date: Thu, 27 Jan 2005 21:44:27 +0100 (CET)
Message-ID: <Pine.LNX.4.62.0501272141580.27261@mercury.sdinet.de>
References: <1106856472.14748.10.camel@localhost.localdomain>
	<9326.142.169.215.10.1106857751.squirrel@142.169.215.10>
	<1106857486.14748.23.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1106857486.14748.23.camel@localhost.localdomain>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Mohammad Khan <mkhan@lextranet.com>
Cc: netfilter@lists.netfilter.org

On Thu, 27 Jan 2005, Mohammad Khan wrote:

> How this source is related to iptables?
> I already have iptables installed. and my iptables does not through any
> error for -j ULOG. I haven't installed ulogd yet. So, where are my log
> going?

into nirvana.
sloppy said -j ULOG throws the packets in the direction of userspace, and 
there is nothing (i.e. no ulogd) picking them up.

> Do I need to install ulogd to write log to mysql database?

yes

c'ya
sven

-- 

The Internet treats censorship as a routing problem, and routes around it.
(John Gilmore on http://www.cygnus.com/~gnu/)

