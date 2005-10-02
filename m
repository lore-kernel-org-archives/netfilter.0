From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Aren't these connections ESTABILISHED? (2nd take)
Date: Sun, 2 Oct 2005 22:38:11 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0510022225450.26361@blackhole.kfki.hu>
References: <dhmn38$hsk$1@sea.gmane.org> <200510011907.27026.rob0@gmx.co.uk>
	<Pine.LNX.4.61.0510020410200.21519@filer.marasystems.com>
	<200510021416.39103.rob0@gmx.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510021416.39103.rob0@gmx.co.uk>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org

On Sun, 2 Oct 2005, /dev/rob0 wrote:

> On Saturday 2005-October-01 21:16, Henrik Nordstrom wrote:
> > On Sat, 1 Oct 2005, /dev/rob0 wrote:
> > > Also, I'm not sure it would do anything at all, because there
> > > cannot be that many --state NEW connections in such a short time.
> > > Conntrack would call those "RELATED". I think you should try --syn,
> > > not --state NEW.
> >
> > The syn part is correct, but not RELATED.
>
> I know 2 things: RTFM and experience. From The Fine Manual: " ...
> RELATED meaning that the packet is starting a new connection, but is
> associated with an existing connection, such as an FTP data transfer,
> or an ICMP error."
>
> How is this association known to conntrack?

There are protocol-dependent helper modules, like ip_conntrack_ftp which
job is to figure out the data channel parameters (RELATED connections)
from the commands and messages issued/passed on the command channel.

> Experience tells me that my little ssh attack blocking ploy using -m
> limit did not work if a --state RELATED,ESTABLISHED -j ACCEPT rule
> preceded it, but it did/does work if the rule matches only --state
> ESTABLISHED.

Without knowing the exact rules one cannot explain why you found that.

> My inference therefrom was that the association is determined from the
> IP addresses. For example if my MTA makes an outbound connection to
> send mail to a remote site, and that site does an identd query, we have
> a RELATED connection.

No, there is no helper module for such a task.

> > each time a new connection is seen (unique source/destination/ports)
> > the first packet is NEW, simply by the fact that the connection is
> > not yet known to conntrack.
>
> TFM does appear to contradict this opinion. I'm unable to check the
> source code for the definite answer. (Unable to understand the source,
> I mean.) If you have done so please do clear up these issues for us.
>
> > conntrack calls syn retransmits on already accepted connections as
> > ESTABLISHED.
>
> Yes, since conntrack itself is protocol-agnostic it won't know or care
> about TCP flags.

Then we could eliminate ip_conntrack_proto_tcp.c, don't we? ;-)

> > RELATED is "NEW" on other traffic flows which forms a known related
> > connection to a already known connection. For example the data
> > channel in the FTP protocol.
>
> Here again conntrack is protocol-agnostic. You and I know that with FTP
> we talk to the server on its 21/tcp, and when we try to GET from it we
> will expect the server to connect back to our port 20/tcp.
>
> I do not believe that conntrack knows that. How it sees an FTP data
> connection is probably no different from my SMTP->out in<-identd
> example.

It *is* completely different. Building up an FTP data channel is well
defined in RFC 959 and supported by a helper module in netfilter.
SMTP/POP/IMAP/... and ident lookups form a much loose relationship, there
is no "ident" helper.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

