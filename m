From: Shawn <core@enodev.com>
Subject: Re: Two IP add
Date: 05 Jun 2003 12:50:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054835444.8856.2.camel@localhost>
References: <200306051156.45624.pandre@darkstar.nom.za>
	 <1054813152.1206.9.camel@india>
	 <1054819746.13885.39.camel@raylinux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1054819746.13885.39.camel@raylinux.internal>
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
To: Ray Leach <raymondl@knowledgefactory.co.za>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Thu, 2003-06-05 at 08:29, Ray Leach wrote:
> On Thu, 2003-06-05 at 13:38, Dharmendra.T wrote:
> > On Thu, 2003-06-05 at 15:26, Paulo Andre wrote: 
> >         I would like to do the following:
> >         iptables -t nat -A POSTROUTING -s x.x.x.x -d ! 'servers ip' -j MASQUERADE 
> >         now how would i put in two ip address's ?
> > iptables -t nat -A POSTROUTING -s 10.10.10.5 -d 'sever ip' -j DROP 
> > iptables -t nat -A POSTROUTING -s 10.10.10.8 -d 'sever ip' -j DROP 
> > Should work 
> No, that will drop the packets and they won't traverse any more
> tables/chains.
> 
> the -j return tells iptables to leave the POSTROUTING chain and
> continue, so no more POSTROUTING rules will be checked for that packet.
> 
> the nat table has these chains:
> 
> PREROUTING
> POSTROUTING
> OUTPUT
> 
> A target of -j return means leave this chain and continue to the next.

So what happens with
iptables -t nat -A POSTROUTING -s 10.x.x.5 -s 'server ip' -j POSTROUTING

;]

