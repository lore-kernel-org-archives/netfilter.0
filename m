From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Weird TCP flags?
Date: Fri, 12 Dec 2003 09:41:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312120941.44245.JALaramie@Loudoun-Fairfax.com>
References: <003101c3c065$f61ad790$13fea8c0@melita.com> <200312120905.05053.JALaramie@Loudoun-Fairfax.com> <1071239162.1693.176.camel@kermit>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1071239162.1693.176.camel@kermit>
Content-Disposition: inline
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
To: Netfilter <netfilter@lists.netfilter.org>

On Friday 12 December 2003 09:26, Ralf Spenneberg wrote:
> Am Fre, 2003-12-12 um 15.05 schrieb Jeffrey Laramie:
> > On Friday 12 December 2003 08:13, Chris Brenton wrote:
> > > On Thu, 2003-12-11 at 23:11, Ian Hunter wrote:
> > > > Dec 11 22:58:52 lucy kernel: Fwd DMZ->Internet DROP: IN=eth1 OUT=ppp0
> > > > SRC=192.168.254.242 DST=204.157.6.223 LEN=60 TOS=0x00 PREC=0x00
> > > > TTL=63 ID=56169 DF PROTO=TCP SPT=80 DPT=56319 WINDOW=32476 RES=0x00
> > > > ACK SYN URGP=0
> > >
> > > My "guess" is, you are receiving a SYN packet from 204.157.6.223. This
> > > creates a state table entry with with a 60 second timer. Your system is
> > > taking longer than 60 seconds to respond, so iptables is removing the
> > > state table entry. Your system then responds causing the log entry
> > > shown above.
> >
> > Hey Chris,
> >
> > Is it normal for the server to send the ACK SYN to a high dport? I
> > wouldn't have expected that.
>
> Yes, of course:
>
> client:56319 -SYN->      server:80
> client:56319 <-ACK/SYN- server:80
> client:56319 -ACK->      server:80
> Connection established.
>
> Cheers,
>
> Ralf

Duh! Boy do I feel like an idiot. Last night I blamed it on sleeplessness. 
Today I'll blame it on coffee. Yup, that's it, I haven't had enough coffee 
yet.

Thanks Guys!

