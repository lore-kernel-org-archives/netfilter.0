From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: "-m state -state NEW" or "--tcp-flags ALL SYN" for tcp?
Date: Thu, 30 Oct 2003 11:53:25 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0310301150560.24537@dns.toxicfilms.tv>
References: <20031029203922.3d8f47cf.netfilter@schuetter.org>
 <1067500316.893.13.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1067500316.893.13.camel@elendil.intranet.cartel-securite.net>
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
Cc: =?ISO-8859-1?Q?J=F6rg_Sch=FCtter?= <netfilter@schuetter.org>, netfilter@lists.netfilter.org

> If you're really paranoid, you can also enforce that TCP packets flagged
> as ESTABLISHED should not be SYN ones :
>
> 	iptables -A FORWARD -m state --state ESTABLISHED -p tcp \
> 		! --syn -j ACCEPT
And If you're really really PARANOID try this for new TCP :-)
	iptables -A FORWARD -p tcp -m state --state NEW --syn -m length \
		--length 40:68 -j ACCEPT

New SYN packets are 40 to 68 bytes (depending on IP options) - without
payload.

Regards,
Maciej


