From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ACK,RST getting dropped in the firewall.
Date: Thu, 24 Jun 2004 14:54:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406241454.28088.Antony@Soft-Solutions.co.uk>
References: <GHEILNONPACCGBGKBEKKKEAMCHAA.manikandan@manikandan.org> <200406241144.10450.Antony@Soft-Solutions.co.uk> <1088084177.2029.8.camel@grendel>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1088084177.2029.8.camel@grendel>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thursday 24 June 2004 2:36 pm, Chris Brenton wrote:

> On Thu, 2004-06-24 at 06:44, Antony Stone wrote:
> > The other thing you see logged quite often for similar reasons is FIN-ACK
> > packets - the reply FIN-ACK is regarded as optional by many systems, so
> > netfilter often ends up logging (and dropping) the second one to come
> > along.
>
> IMHO this is completely non-RFC. It is clearly defined (RFC 793 page 22)
> that both sides must issue a FIN/ACK and receive an ACK before the
> connection is closed.

Oh, I agree it's RFC incompliant.   I didn't say it was official behaviour - 
just something you see happening :(

> What OS does not issue the reciprocating FIN/ACK?

Don't know off the top of my head - will let you know if I can find out.

> > No harm done though, because the first one has done the job.
>
> Actually not quite true as both sides will enter a fin-wait state (RFC
> 793 page 20) till the second FIN/ACK-ACK exchange takes place.

Depends what you mean by "done the job".   I meant the phrase in the sense of 
"no more data is going to pass across the connection".

> This chews up a session on both ends till their timers expire. Add up enough
> of them and it can kill a busy server (seen it happen and have had to
> stop state tracking to fix it).

Indeed.   Not necessarily as bad as a SYN flood attack, but similar in nature 
and consequences.

> Also, if you check the log entry that was posted:
> > Jun 23 16:42:43 javagreen kernel: New not syn:IN=eth0 OUT=
> > MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=202.138.101.5
> > DST=202.138.22.218 LEN=1500 TOS=0x00 PREC=0x00 TTL=122 ID=51601 DF
> > PROTO=TCP SPT=80 DPT=2162 WINDOW=64574 RES=0x00 ACK URGP=0
>
> Its a 1500 byte ACK packet. So iptables is not just blocking the FIN/ACK
> exchange, it can sometimes end up blocking data transfer as well. :(

Oh - I didn't see that posting - I was replying to a question apparently about 
RST-ACK packets getting logged (and dropped).

Dropping a normal ACK packet is another matter altogether, and clearly a Bad 
Thing (or at least, Highly Undesirable).

Regards,

Antony.

-- 
"Reports that say that something hasn't happened are always interesting to me, 
because as we know, there are known knowns; there are things we know we know. 
We also know there are known unknowns; that is to say we know there are some 
things we do not know. But there are also unknown unknowns - the ones we 
don't know we don't know."

 - Donald Rumsfeld, US Secretary of Defence

                                                     Please reply to the list;
                                                           please don't CC me.


