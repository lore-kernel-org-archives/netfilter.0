From: Jonathan Disher <jdisher@parad.net>
Subject: Re: odd problem
Date: Tue, 7 Oct 2003 16:07:58 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0310071547280.6029@pasiphae.parad.net>
References: <Pine.LNX.4.53.0310071310090.4398@pasiphae.parad.net>
 <20031007181405.GA9394@cannon.eng.us.uu.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031007181405.GA9394@cannon.eng.us.uu.net>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.netfilter.org

On Tue, 7 Oct 2003, Ramin Dousti wrote:

> Can you see response packets on C1 being 172.17.0.3 (by tcpdump)?
> What you say is strange because the application on C would see
> packets like a.b.c.d -> 1.1.1.1 and if the application which is
> supposed to reply back is listening on 1.1.1.1 (alias address) then
> the response will have 1.1.1.1 with no need to SNAT.

Box C is sending responses out the correct interface, with the correct
destination address, but the source address is 172.17.0.3.  This is why I
thought I needed an SNAT (although it's probably more likely that I just
need to beat the application and make it only bind to 1.1.1.1, then it
should only use that for replies).

What I'm using to test, right now, is sshd.  However, by default, sshd
listens on *, so, that may be a factor.  I'm going to go find this out.
However, in the meantime, I just wanted to pick the brains of someone more
knowledgeable in iptables/netfilter than I - I've never used iptables,
beyond some very very simple masquerading before.

Thanks!

-j

