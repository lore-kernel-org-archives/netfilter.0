From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Rejecting udp
Date: Wed, 5 Mar 2003 11:03:29 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0303051055450.26578@dns.toxicfilms.tv>
References: <000801c2e1aa$3fc8f660$0200a8c0@klintan.local>
 <003f01c2e1e2$2d9bd100$0301a8c0@hotpop3> <33803.192.222.90.38.1046775610.squirrel@pelorus.org>
 <1046777181.3924.1.camel@raylinux.internal> <39942.192.222.90.38.1046784694.squirrel@pelorus.org>
 <20030305005105.3ed844e1.arnt@c2i.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030305005105.3ed844e1.arnt@c2i.net>
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
To: Arnt Karlsen <arnt@c2i.net>
Cc: netfilter@lists.netfilter.org

> > I agree that it is important to block certain UDP ports/traffic.  What
> > the issue is, is what is the purpose of REJECTing a UDP packet versus
> > DROPping the UDP packet?  My point is, sending back a REJECT message
> > doesn't make sense with UDP.
Why not? RFCs say that a closed UDP port should elicit
icmp dest.unreach./port unreach.
So it does make sens to be in conformance with the standards.

That is how portscanners see if a port is closed or not. If you drop the
packets, it may mean that the port is either open or is filtered.

Regards,
Maciej

