From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: FORWARDING and NAT chains
Date: Fri, 30 Jan 2004 10:23:14 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401301023.14772.Antony@Soft-Solutions.co.uk>
References: <001901c3e670$a4bd2250$3d40000a@wisdom> <1075441811.1999.116.camel@raylinux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1075441811.1999.116.camel@raylinux.internal>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Friday 30 January 2004 5:50 am, Ray Leach wrote:

> On Thu, 2004-01-29 at 16:02, Srinivasa Hebbar wrote:
> > Hello,
> >
> > I believe that the NAT PREROUTING and POSTROUTING will
> > always takes place for all the incoming/outgoing packets
> > irrespective of whether the packet is destined to the node or not.
> >
> > I have a situvation that if the dest. IP address of the packet is
> > for the local node, then apply NAT rule, otherwise it should simply
> > forward the packet according to the routing table.
> >
> > How can I achive the above?
>
> Use the INPUT chain of the nat table.

What does this mean?   nat can be done in PREROUTING or POSTROUTING (as 
Srinivasa correctly said).   You cannot do nat in INPUT.

Antony.

-- 
Anything that improbable is effectively impossible.

 - Murray Gell-Mann, Novel Prizewinner in Physics

                                                     Please reply to the list;
                                                           please don't CC me.


