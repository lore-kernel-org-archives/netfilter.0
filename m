From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: http tunneling apps.
Date: Fri, 13 Sep 2002 09:24:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020913082502.EODB13709.mta07-svc.ntlworld.com@there>
References: <00d301c25999$c2662e60$0a0fa8c0@diabelec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00d301c25999$c2662e60$0a0fa8c0@diabelec.com>
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
To: NetFilter List <NetFilter@Lists.NetFilter.org>

On Wednesday 11 September 2002 2:46 pm, George J. Jahchan wrote:

> Is there a way to somehow mark non-browsing traffic encapsulated in http
> packets?

Not with netfilter, no.   This is content-filtering question; netfilter is 
not a content filter.

> (ie. packets encapsulated by socks2http or httptunnel, there may
> be others). Encapsulating (otherwise blocked by the firewall) applications
> in http and sending/receiving them as http traffic allows users to
> circumvent firewall policies intended to stop these applications.
>
> Any suggestions on how to handle these in NetFilter (if at all possible)?

Netfilter can redirect all your http traffic to a proxy such that it works 
transparently to the users (and cannot be bypassed).   See whether Squid or 
Apache will do the sort of filtering you need by restricting the type of 
traffic.

If those can't do it, you might want to investigate Hogwash.

Antony.

-- 

Normal people think "if it ain't broke, don't fix it".
Engineers think "if it ain't broke, it doesn't have enough features yet".

