From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Policy routing with mark not working.
Date: Fri, 12 May 2006 21:45:42 +0200
Message-ID: <4464E5E6.7090803@plouf.fr.eu.org>
References: <20060512135350.98132.qmail@web53302.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060512135350.98132.qmail@web53302.mail.yahoo.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Andre Kalamandeen a =E9crit :
> Hey, i figured out what the problem was, i was passing
> all packets through squid, so when it was maked in the
> mangle PREROUTING chain, squid removed the marks since
> it doesnt support them, but changing the chain to
> OUTPUT solved this prob. Thanks to all.

"squid removed the marks since it doesnt support them" just makes no=20
sense ! When using a proxy such as squid, you have two *independent*=20
connections. One from the client to the proxy, and one from the proxy to=20
the target server. MARKing packets of the former has strictly *no*=20
effect on the packets of the latter.

