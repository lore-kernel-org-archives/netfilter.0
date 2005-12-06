From: Wolfgang Lonien <wolfgang@lonien.de>
Subject: Re: SNMP through VPN?
Date: Tue, 06 Dec 2005 14:36:06 +0100
Message-ID: <439593C6.3010204@lonien.de>
References: <438EEA93.10000@lonien.de>
	<20051206125236.GB21572@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051206125236.GB21572@metastasis.org.uk>
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
To: netfilter@lists.netfilter.org

Nick Drage wrote:

> Can you make other connections, not related to SNMP, from linuxbox1 to
> router2 and from linuxbox2 to router1, both to the router's internal
> interfaces?

Yup - ssh and/or http work just like a charm...

> And what packet sniffing software do you have available on the routers,
> so you can what's happening to the traffic.

I installed tcpdump lately. But it seems that some guy of the german
Astaro support worked that out already - because that's our commercial
firewall in the company, where I had the same effect.

Looks like some SNAT-rule together with another iptables 'ACCEPT' is
necessary to get things going. As soon as I can confirm that the other
way (from the company to the internal interface of my WRT54G), I'll keep
you updated...

But thanks anyway,
cheers,
wjl

-- 
Key ID 0x728D9BD0 - public key available at wwwkeys.de.pgp.net
'94 Honda NTV still running on fuel -
everything else here proudly runs Debian GNU/Linux

