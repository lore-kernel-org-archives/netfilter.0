From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Packets missing state ?
Date: Tue, 23 Dec 2003 12:13:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072199612.2184.467.camel@grendel>
References: <200312231828.59518.rajiv@theargoncompany.com>
	 <200312231354.36213.Antony@Soft-Solutions.co.uk>
	 <1072192881.2184.371.camel@grendel>
	 <200312231533.40728.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312231533.40728.Antony@Soft-Solutions.co.uk>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter <netfilter@lists.netfilter.org>

On Tue, 2003-12-23 at 10:33, Antony Stone wrote:
>
> > > Yes.   UDP port 53 means client-to-server DNS lookups.
> >
> > It could also be server to server queries as well as a load balancer.
> 
> I thought server to server queries were always TCP?

Nope. UDP is always used unless the "answer" will exceed a packet length
of 512 bytes. If this max is exceeded, as complete an answer as possible
is returned with the truncation bit turned on in the DNS header. After
that, you'll see the session switch over to TCP for a complete answer.

The other case is primary/master <--> secondary/slave communications for
the purpose of zone transfers. 

Dig and other tools will let you choose to use TCP, but the default is
UDP.

HTH,
C




