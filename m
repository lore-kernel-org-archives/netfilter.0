From: "dravya" <dravya@magma.ca>
Subject: Re: packets going over wrong link: ROUTE target not doing its job 
 !!!!
Date: Thu, 26 Aug 2004 15:36:57 -0400 (EDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200408261936.i7QJavVI018800@webmail1.magma.ca>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter mailing list <netfilter@lists.netfilter.org>

> > Aug 26 11:56:29 localhost kernel: Mangle POST: IN= OUT=eth0
> > SRC=192.168.1.96
> > DST=192.168.1.229 LEN=106 TOS=0x00 PREC=0xC0 TTL=64 ID=55919 PROTO=ICMP
> > TYPE=3 CODE=3
> > [SRC=192.168.1.229 DST=192.168.1.96 LEN=78 TOS=0x00 PREC=0x00 TTL=64
> > ID=25106 PROTO=UDP
> > SPT=64696 DPT=137 LEN=58 ]
> >
> > According to the rule, shouldn't this be ppp0 ??? Using ethereal, I
> > captured on ppp0 and
> > the following is what I get:
> 
> According to the rule, this shouldn't be ppp0 because you are logging
> *before* the effective rule has been hit.

oops, sorry about that.

> >                                  |
> >                                  |
> >                                  v
> > 2004-08-26 10:31:28.721245 192.168.1.96 -> 192.168.1.229 ICMP Destination
> > unreachable
> > 2004-08-26 10:31:28.721245 192.168.1.96 -> 192.168.1.229 ICMP Destination
> > unreachable
> >
> > This means that from ppp0 there was a packet that had a src address of
> > eth0. Hence, I get
> > a change of ip address and I lose that connection.
> >
> > NOTE: I have tried MASQUERADING and it give me the same problem of packets
> > going over the
> > wrong link.
> >
> 
> As soon as the packet hits the ROUTE target (without --continue), it is
> immediately send over the link. This explains why you are not able to
> MASQUERADE it.

I guess I wasn't clear, but I used MASQUERADE separately (with no ROUTE target) and still
didn't work. I keep getting ICMP dest unreach. packets going over the wrong links :(((

 
> My suggestion is to add --continue to your ROUTE rule which will let the
> packet continues traversal.
> 
> Then, patch ipt_MASQUERADE.c with Patrick's one to avoid the annoying
> "MASQUERADE: Route sent us somewhere else."

I tried using --continue and yet no luck.


Any help is welcome. 

Thanx

Dravya

