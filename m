From: David Cannings <lists@edeca.net>
Subject: Re: iptables dnat to loopback
Date: Sun, 8 Aug 2004 09:41:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408080941.38256.lists@edeca.net>
References: <D5C9032B2B09C64EA2409D6214E91AC905124D@asimail2.alphanumeric.com> <1091945878.12669.0.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1091945878.12669.0.camel@localhost>
Content-Disposition: inline
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

On Sunday 08 August 2004 07:17, Damian Gatabria wrote:
> :o( no luck.
> I even tried -F ing INPUT, FORWARD, OUTPUT, PREROUTING and POSTROUTING
> before adding the rule, (all policies set to ACCEPT) and still no luck!
> Forwarding is enabled,
> net.ipv4.conf.all.forwarding = 1
> net.ipv4.ip_forward = 1
> and still the packets are going nowhere... however giving
> the loopback an alias with an ip address of, say, 200.136.136.136
> works... so why can't I route to 127.0.0.x? Is there anything
> else I should check/add?

You can't send packets from non 127/8 addresses to 127/8.  The kernel 
filters them out and drops them as it considers them "martians".

David

