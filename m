From: Frans Luteijn <f.a.g.luteijn@knoware.nl>
Subject: Re: ip aliasing considered harmful?
Date: Thu, 13 Jan 2005 17:43:31 +0100
Message-ID: <41E6A532.4211B054@knoware.nl>
References: <BAY101-F28F59D9C013C228CBEAFC8DF970@phx.gbl>
	<1105364334.12623.5.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org



Jason Opperisano schreef:

> On Mon, 2005-01-10 at 01:46, Curby . wrote:
> > I've currently got two Internet-facing IP addresses on my gateway using a
> > single interface.  I have them configured as eth0:0 and eth0:1, but I've
> > read several times on this list that doing it this way (I think it's called
> > aliasing?) is not recommended.  IIRC the recommended alternative was to use
> > the ip command to handle it.
>
> that is correct.
>
> > Why is that alternative preferable?  The only thing I can see now is that
> > I'd have to double the number of iptables rules in some cases to take care
> > of eth0:0 and eth0:1 instead of just eth0.
>
> that's why 'ip addr add w.x.y.z dev eth0' is preferable--it doesn't
> delude you into thinking you have multiple interfaces, because you
> don't.  try and add a rule for eth0:0 and let us know how it goes.

I can think of two pro's:- Aliasing is the standard way of handling multiple
ip-addresses to one interface (at least for Sun).
- It's an easy  way of adding an ip-address via ifup and ifdown in the file (for
Debian) /etc/network/interfaces.

Greetings,
--
Frans Luteijn
PGP PblKey fprnt=C4 87 CE AF BC B6 98 C1  EF 42 A1 9A E2 C0 42 5B
GPG PblKey fprnt=ED20 0F25 C233 DC59 3FFA  170E D0BF 15F5 0BA6 1355




