From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: SNAT of ICMP fragmentation-nee
Date: Mon, 10 Jun 2002 14:03:34 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020610180334.GA21405@cannon.eng.us.uu.net>
References: <Pine.LNX.4.44.0206101340570.30649-100000@albert.ha-vel.cz> <200206101218.g5ACIKU08127@vulcan.rissington.net> <0GXH0068QZEYYV@l-daemon>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <0GXH0068QZEYYV@l-daemon>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jack Bowling <jbinpg@shaw.ca>
Cc: netfilter@lists.samba.org

On Mon, Jun 10, 2002 at 09:06:41AM -0700, Jack Bowling wrote:

> ** Reply to message from Antony Stone <Antony@Soft-Solutions.co.uk> on Mon, 10 Jun 2002 13:18:12 +0100
> 
> 
> > On Monday 10 June 2002 12:45 pm, jakub@angel.cz wrote:
> > 
> > > :) this is really not the problem, now I am logging all packets, no adress
> > >
> > > specification ;)
> > >
> > > -A POSTROUTING -p icmp -m icmp --icmp-type 3/4 -j LOG --log-prefix "icmp
> > > SNAT POST "
> > 
> > Hmmm.   Okay - this is beyond my understanding of netfilter - can anyone else 
> > suggest why icmp packets going through the machine would get logged and 
> > processed by PREROUTING and FORWARD but not by POSTROUTING ?
> 
> Wouldn't hurt to add the interface(s).

Absolutely!! You omit the -i/-o switches only when you _really_
don't care about the direction of the packet flow.

Ramin

> jb
> 
> -- 
> Jack Bowling
> mailto: jbinpg@shaw.ca

