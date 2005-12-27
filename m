From: "Michael D. Berger" <m.d.berger@ieee.org>
Subject: RE: DROP TCP output to HTTP attackers?
Date: Tue, 27 Dec 2005 13:14:48 -0500
Message-ID: <000201c60b11$6e0ca5b0$2801a8c0@MBRC40>
References: <003801c60b05$72567ad0$1101a8c0@quebec>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <003801c60b05$72567ad0$1101a8c0@quebec>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: 'netfilter' <netfilter@lists.netfilter.org>

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org 
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of 
> Richard Pickett
> Sent: Tuesday, December 27, 2005 11:49 AM
> To: 'netfilter'
> Subject: RE: DROP TCP output to HTTP attackers?
> 
> 
> > My only comment would be that for proxy users (AOL, for 
> instance) you
> > may end up dropping legitimate traffic. The risk/reward of that is
> > something you'll have to determine for yourself.
> 
> My logic is like this, if AOL polices it's outbound traffic the way we
> police our inbound traffic AOL wouldn't ever send us illegal packets.
> 
> Oh, they've got these big adds on TV about how they are so 
> safe etc. I'm
> sure by now my systems have all their public IPs blocked.
> 
> An additional thought is friends don't let friends do AOL. If 
> they want
> to use the service they have to accept the lameness that comes along
> with it.
> 
> AOL has obviously compromised on security. Why should we compromise on
> security with them?
> 

I agree with you.  However, my small web site serves a function for
a group of people, some of whom are, >and will remain<, completely
computer illiterate.  In view of my observations mentioned in a another
e-mail, perhaps I should analyze packets after, perhaps, an hour of
silence.

Mike.
--
Michael D. Berger
m.d.berger@ieee.org 



