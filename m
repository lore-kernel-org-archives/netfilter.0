From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: "-m state -state NEW" or "--tcp-flags ALL SYN" for tcp?
Date: Thu, 30 Oct 2003 09:45:13 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031030144513.GA27650@cannon.eng.us.uu.net>
References: <20031029203922.3d8f47cf.netfilter@schuetter.org> <1067500316.893.13.camel@elendil.intranet.cartel-securite.net> <Pine.LNX.4.51.0310301150560.24537@dns.toxicfilms.tv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.51.0310301150560.24537@dns.toxicfilms.tv>
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
Content-Transfer-Encoding: 7bit
To: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Cc: Cedric Blancher <blancher@cartel-securite.fr>, =?iso-8859-1?Q?J=F6rg_Sch=FCtter?= <netfilter@schuetter.org>, netfilter@lists.netfilter.org

On Thu, Oct 30, 2003 at 11:53:25AM +0100, Maciej Soltysiak wrote:

> > If you're really paranoid, you can also enforce that TCP packets flagged
> > as ESTABLISHED should not be SYN ones :
> >
> > 	iptables -A FORWARD -m state --state ESTABLISHED -p tcp \
> > 		! --syn -j ACCEPT
> And If you're really really PARANOID try this for new TCP :-)
> 	iptables -A FORWARD -p tcp -m state --state NEW --syn -m length \
> 		--length 40:68 -j ACCEPT

I know that this assumption works for almost 100% of cases as the SYN
packet almost never carries payload (currently) but there is nothing in
the RFC prohibiting that, or is there? Just trying to comply with the
standards.

rfc793
-----
...
  Several examples of connection initiation follow.  Although these
  examples do not show connection synchronization using data-carrying
  segments, this is perfectly legitimate, so long as the receiving TCP
  doesn't deliver the data to the user until it is clear the data is
  valid (i.e., the data must be buffered at the receiver until the
  connection reaches the ESTABLISHED state).  The three-way handshake
  reduces the possibility of false connections.
...
-----

Ramin

> New SYN packets are 40 to 68 bytes (depending on IP options) - without
> payload.
> 
> Regards,
> Maciej
> 

