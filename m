From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Intercept name lookup discover SA and alter reply?
Date: Mon, 23 Sep 2002 12:17:30 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209231216180.1469-100000@dns.toxicfilms.tv>
References: <20020920213318.TKBX295.mta06-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020920213318.TKBX295.mta06-svc.ntlworld.com@there>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

> > I've seen iptables used to block SPAM via dnsbl so I'm wondering... can
> > iptables watch UDP 53, inspect for a specific name query
> > (server.company.com), remap the address to a closer server?
How about, creating a zone in your DNS and disallow anyone to resolve it:
zone "evil.com"
{
	type hint;
	allow-query { none; };
}

I just tried that.


