From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: DNAT/SNAT & existing connections
Date: Tue, 15 Jul 2003 10:04:25 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030715140425.GB24604@cannon.eng.us.uu.net>
References: <20030715100115.87255.qmail@web13101.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030715100115.87255.qmail@web13101.mail.yahoo.com>
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
To: Stephen Bylo <stephenbylo@yahoo.com.sg>
Cc: netfilter@lists.netfilter.org

On Tue, Jul 15, 2003 at 06:01:15PM +0800, Stephen Bylo wrote:

> Dear list,
> 
> I am looking into the use of a NAT "router" to change
> the destination (or source) IP addresses of packets in
> existing connections.  Maybe it sounds weird why I
> might want to do this, but I need to divert streams to
> other destinations!
> 
> I understand from the iptables docs that only the
> first packet of a connection is examined for NAT
> entries, subsequent packets do not need to be
> processed again.

They do get processed. There is a short circuit to identify these
packets and avoid traversing the whole nat table.

It's not clear to me what you precisely want to do.

Ramin

> I would like all packets to be
> examined OR I would like to be able to "reset" the
> particular entry in the table so that the existing
> connection will be "re-considered" again using the
> NAT.
> 
> Is this possible in some way with iptables?  If not,
> can you point me in the right direction to a solution,
> please?
> 
> Thanx,
> Steve
> 
> __________________________________________________
> Do You Yahoo!?
> Send free SMS from your PC!
> http://sg.sms.yahoo.com

