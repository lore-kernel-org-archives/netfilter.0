From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Could someone tell me the rules of port translation in SNAT ?
Date: Wed, 7 Jan 2004 10:08:45 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401071008.45376.Antony@Soft-Solutions.co.uk>
References: <BAY10-F100u8E4ej3vp0003a1c1@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY10-F100u8E4ej3vp0003a1c1@hotmail.com>
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
To: netfilter@lists.netfilter.org

On Wednesday 07 January 2004 9:49 am, ding dang wrote:

> From: "spoft" <spoft@sohu.com>
>
> >To: "ding dang" <jiadeip@hotmail.com>
> >Subject: Re: Could someone tell me the rules of port translation in SNAT ?
> >Date: Wed, 7 Jan 2004 16:19:53 +0800
> >
> > dst ip, dst port, and SNATed sport of the connections must be unique. So
> > the firewall can NATed correctly and enough.
>
> > So when:
> >    1) dst ip and dst port are same,then the SNATed sport must be
> > different between two connetions.
>
> >    2) dst ip or dst port is different, then the SNATed sport may be same
> > between two connections.
>
> Thanks.
>
> For 2) above:  when will the SNATed sport be different then?

Just because something is possible does not mean you have to do it.

Netfilter allow you to change the source port in a SNAT rule; however if you 
can't think of a good reason why you'd want to, then don't.

Changing the source port (in either SNAT or DNAT) is not commonly needed, and 
it is difficult to think of a good example when you would want to, however 
this did not stop the authors of netfilter from including as something you 
could do if you really wanted to.

Netfilter's internal rules regarding source ports are quite simple (I posted 
these to the list the other day):

1. If a packet going through netfilter has a source port & IP combination 
which is unique (ie not already being used by another connection) then the 
source port will not be changed.

2. If the combination is not unique (so the socket cannot be bound uniquely 
for this connection) then a new source port is chosen at "random" in just the 
same way as it is for any newly-initiated connection on a Linux system.

Therefore unless you specify the port to be used, it will not be changed 
unless necessary, and if it is changed you cannot predict what it will 
become.

Regards,

Antony.

-- 
If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

                                                     Please reply to the list;
                                                           please don't CC me.


