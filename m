From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: tcp & udp timeout hardcoding
Date: Mon, 17 Nov 2003 13:09:25 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031117180925.GA15103@cannon.eng.us.uu.net>
References: <20031117144208.GA22431@nest.8d.com> <200311171630.hAHGU8j22270@agate.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200311171630.hAHGU8j22270@agate.rockstone.co.uk>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

On Mon, Nov 17, 2003 at 04:30:05PM +0000, Antony Stone wrote:

> On Monday 17 November 2003 2:42 pm, xavier wrote:
> 
> > Hello,
> >
> > I saw in the 2.4.22 kernel source :
> >
> > /usr/src/linux/net/ipv4/netfilter/ip_conntrack_proto_tcp.c
> > static unsigned long tcp_timeouts[]
> > = { 30 MINS,    /*      TCP_CONNTRACK_NONE,     */
> >     5 DAYS,     /*      TCP_CONNTRACK_ESTABLISHED,      */
> >     2 MINS,     /*      TCP_CONNTRACK_SYN_SENT, */
> >     60 SECS,    /*      TCP_CONNTRACK_SYN_RECV, */
> >     2 MINS,     /*      TCP_CONNTRACK_FIN_WAIT, */
> >     2 MINS,     /*      TCP_CONNTRACK_TIME_WAIT,        */
> >     10 SECS,    /*      TCP_CONNTRACK_CLOSE,    */
> >     60 SECS,    /*      TCP_CONNTRACK_CLOSE_WAIT,       */
> >     30 SECS,    /*      TCP_CONNTRACK_LAST_ACK, */
> >     2 MINS,     /*      TCP_CONNTRACK_LISTEN,   */
> > };
> >
> > Is there any plan to be able to set thoses values throught /proc ?
> >
> > in some cases a 5 days timeout on tcp connexions may be too long...
> 
> These are the standard values according to the TCP RFCs.

Which RFC talks about TCP_CONNTRACK_ESTABLISHED, again? I don't think
it's written yet ;-)

Ramin

