From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: logging mac address
Date: Tue, 15 Jul 2003 19:03:59 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030715230359.GA25639@cannon.eng.us.uu.net>
References: <20030715205936.GO24604@cannon.eng.us.uu.net> <OFF04A0FDF.DA349A37-ON83256D64.007510CB-83256D64.0075AD29@LocalDomain>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <OFF04A0FDF.DA349A37-ON83256D64.007510CB-83256D64.0075AD29@LocalDomain>
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
To: Antonio Paulo Salgado Forster <aforster@br.ibm.com>
Cc: netfilter@lists.netfilter.org

On Tue, Jul 15, 2003 at 06:25:20PM -0300, Antonio Paulo Salgado Forster wrote:

>       Thanks for the response.  I'm using the same rule for logging on the
> input and forward  CHAINS ;-) but the behavior of the rule is different
> depending on what chain it's in.. for input, by default it shows the MAC
> addresses, but for forward, no MAC address is shown.

OK. I think I learned something today. It seems the only chains giving you
the MAC is INPUT in filter and PREROUTING in mangle.

It makes sense though that you don't get that in FORWARD since the routing
decision has not yet been made.

On the other hand it also makes sense that you don't get it for the outgoing
packets (POSTROUTING) as the MAC info belongs to another subsystem and is
"apparently" not available to netfilter...

Ramin

> 
>       For instance:
> 
> iptables -A INPUT -j LOG --log-level notice --log-prefix " INPUT BLOCK: "
> iptables -A FORWARD -j LOG --log-level info --log-prefix " FORWARD BLOCK: "
> 
> 
> Jul 15 17:51:25 fw kernel:  INPUT BLOCK: IN=eth0 OUT=
> MAC=00:xx:xx:xx:xx:xx:00:yy:yy:yy:yy:yy:yy:00 SRC=t.t.t.t DST=r.r.r.r
> LEN=64 TOS=0x00 PREC=0x00 TTL=128 ID=57828 PROTO=UDP SPT=1756 DPT=53 LEN=44
> 
> Jul 15 18:22:31 fw kernel:  FORWARD BLOCK: IN=eth0 OUT=eth1 SRC=x.x.x.x
> DST=y.y.y.y LEN=1492 TOS=0x00 PREC=0x00 TTL=253 ID=37603 DF PROTO=ICMP
> TYPE=8 CODE=0 ID=0 SEQ=2
> 
> Any hints? Thanks
> 
> Forster
> 
> 
> 
> 
> Ramin Dousti <ramin@cannon.eng.us.uu.net>@lists.netfilter.org on 07/15/2003
> 05:59:36 PM
> 
> Sent by:    netfilter-admin@lists.netfilter.org
> 
> 
> To:    aforster@br.ibm.com
> cc:    netfilter@lists.netfilter.org
> Subject:    Re: logging mac address
> 
> 
> 
> On Tue, Jul 15, 2003 at 05:06:04PM -0300, Antonio Paulo Salgado Forster
> wrote:
> 
> >
> >
> > Hello all,
> >
> >       Is there any known way to log the mac address for packets blocked
> on
> > the forward table just like in the input table? I've been searching the
> > archives and documentations but found nothing so far.
> 
> forward and input are chains and not tables. nat, mangle and filter are
> tables. But anyhow, you just use the same rule for logging that you
> used for INPUT logging and replace INPUT with FORWARD. You also need
> to make sure what and where you're logging so that you don't DoS yourself.
> 
> Ramin
> 
> >
> > Thanks in advance.
> >
> > Forster
> >
> >
> 
> 
> 

