From: Frans Luteijn <f.a.g.luteijn@knoware.nl>
Subject: Re: nat problem
Date: Mon, 19 Jul 2004 03:26:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40FB2338.4A084B9D@knoware.nl>
References: <40F448B2.AF1E21@knoware.nl> <200407140953.50466.Antony@Soft-Solutions.co.uk> <40F5C218.E57FEC60@knoware.nl> <200407150921.27116.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Antony Stone schreef:

> On Thursday 15 July 2004 12:30 am, Frans Luteijn wrote:
>
> > Antony Stone schreef:
> > >
> > > What happens if you try the same test as above, but with the port numbers
> > > you are interested in?   Do the connection tracking table and the log
> > > file suggest that packets are being forwarded?   If you can get it to
> > > "work" on port 138, I don't see why it shouldn't "work" on port 2071.
> >
> > Nothing happens, no logging or anything else
> >
> > So what is wrong here? I think, it is a bug, because it doesn't work as
> > expected.
>
> Well, I don't think it can be called a bug in netfilter (I may be wrong),
> because there's nothing about netfilter which should make NAT for one port
> any different from NAT for another port.
>
> I'm surprised you got the port 138 packets to be forwarded; I don't know why
> the two are behaving differently.

Maybe because in the 138-case the sport and the dport are the same and
in the
other case they are different? Or the sport and dport are above 1024? I
don't know
either. Who should I ask, any suggestion?

>

(snip)

>
>
>
> I hope someone else here can suggest whether (and if so, how) it's possible to
> do what you want - I didn't think it was, but you've obviously got more to
> work than I had expected possible.

What is a broadcastpacket different from any other packet, except that
every
computer on the network can respond to it? So it can be treated as any
other
packet.

>
>
> Regards,
>
> Antony.
>

P.S.
Sorry for the late response, for some strange reason I didn't receive
any mail from this list any more for two days. I had to look up the
answer in the archieves.

Regards,
--
Frans Luteijn
PGP PblKey fprnt=C4 87 CE AF BC B6 98 C1  EF 42 A1 9A E2 C0 42 5B
GPG PblKey fprnt=ED20 0F25 C233 DC59 3FFA  170E D0BF 15F5 0BA6 1355


