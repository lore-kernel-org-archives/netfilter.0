From: seberino@spawar.navy.mil
Subject: Re: valid INPUT/OUTPUT rule piece?--> '-p tcp --tcp-flags ACK,
	FIN FIN -j DROP', etc.
Date: Tue, 25 Jan 2005 21:26:58 -0800
Message-ID: <20050126052658.GA17112@spawar.navy.mil>
References: <20050126001855.GC15359@spawar.navy.mil>
	<41F6E665.6010000@lopsch.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <41F6E665.6010000@lopsch.com>
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
Content-Transfer-Encoding: 7bit
To: Lopsch <lopsch@lopsch.com>
Cc: netfilter@lists.netfilter.org

Lopsch

Thanks for your email.  I know a little about TCP flags.
IIRC, ACK means 'Acknowlegement'
and FIN means 'Finish Connection'.

Why would TCP want everyone to turn on ACK when they
want to finish a connection with FIN?

I assume that TCP was written to do 2 errands in one
TCP datagram?...1. acknowledge last datagram received
                2. terminate connection

It seems odd you can't terminate a connection (FIN)
without also acknowledging something to me.

Chris

On Wed, Jan 26, 2005 at 01:37:57AM +0100, Lopsch wrote:
> seberino@spawar.navy.mil schrieb:
> >Please explain these:
> >
> >$IPTABLES -t filter -A INPUT -p tcp --tcp-flags ACK,FIN FIN   -j DROP
> >$IPTABLES -t filter -A INPUT -p tcp --tcp-flags ACK,PSH PSH   -j DROP
> >$IPTABLES -t filter -A INPUT -p tcp --tcp-flags ACK,URG URG   -j DROP
> >$IPTABLES -t filter -A INPUT -p tcp --tcp-flags ALL     NONE  -j DROP
> >
> >Do first 3 imply you must send ACK when you send a FIN, PSH or URG?
> >
> >And does last mean you must set *some* TCP flag always?
> >
> >CS
> >
> >
> Exactly. The first 3 rules are used for dropping packets which have set
> FIN, PSH and URG but without a set ACK-flag. The last one prevents empty
> packets (none flag set) to enter your network.
> As often such packets are used by portscans it is useful to drop them.
> Jason posted a link some time ago with a list of rules to perform tcp
> checks http://www.stearns.org/modwall/sample/tcpchk-sample
>
> --
>
> PGP-ID 0xF8EAF138



--
_______________________________________

Christian Seberino, Ph.D.
SPAWAR Systems Center San Diego
Code 2872
49258 Mills Street, Room 158
San Diego, CA 92152-5385
U.S.A.

Phone: (619) 553-9973
Fax  : (619) 553-6521
Email: seberino@spawar.navy.mil
_______________________________________

